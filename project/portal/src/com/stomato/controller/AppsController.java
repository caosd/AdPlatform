package com.stomato.controller;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.stomato.constant.Constant;
import com.stomato.domain.App;
import com.stomato.domain.AppBusiness;
import com.stomato.domain.AppType;
import com.stomato.domain.FormParam;
import com.stomato.domain.TempApp;
import com.stomato.domain.User;
import com.stomato.form.AppForm;
import com.stomato.helper.AirHelper;
import com.stomato.helper.AppHelper;
import com.stomato.helper.BuildExampleHelper;
import com.stomato.helper.FileHelper;
import com.stomato.service.AppBusinessService;
import com.stomato.service.AppService;
import com.stomato.service.AppTypeService;
import com.stomato.service.ConfigService;
import com.stomato.service.TempAppService;
import com.stomato.utils.ExcelUtils;
import com.stomato.utils.FileUtils;
import com.stomato.utils.NumberUtils;
import com.stomato.utils.StringUtils;

@Controller
@RequestMapping("/apps")
public class AppsController extends UserController {
	
	private final Logger logger = Logger.getLogger(this.getClass().getName());
	
	private final String fileSeparator = System.getProperty("file.separator");
	
	private static final String apkSuffix = ".apk";
	
	@Autowired
	private AppService appService;
	
	@Autowired
	private TempAppService tempAppService;
	
	@Autowired
	private ConfigService configService;
	
	@Autowired
	private AppTypeService appTypeService;
	
	@Autowired
	private AppBusinessService appBusinessService;
	
	@RequestMapping(value="")
	public String myapplist(@ModelAttribute("formParam") FormParam formParam,BindingResult result,HttpServletRequest request, Model model) {
		User user = this.lookup(request);
		formParam.setUid(user.getUid());
		formParam.setTotalCount(appService.listTotal(formParam));
		List<Map<String,Object>> applist  = appService.getAppListForMap(formParam);
		model.addAttribute("applist", applist);
		return "portal/apps/applist";
	}
	
	@RequestMapping(value="/listAll.html")
	public String listAll(@ModelAttribute("formParam") FormParam formParam,BindingResult result,HttpServletRequest request, Model model) {
		formParam.setTotalCount(appService.listTotal(formParam));
		List<Map<String,Object>> applist  = appService.getAppListForMap(formParam);
		model.addAttribute("applist", applist);
		return "portal/apps/allapplist";
	}
	
	@RequestMapping(value="/{appKey}/detail", method=RequestMethod.GET)
	public String getApp(@PathVariable String appKey, HttpServletRequest request, Model model) {
		App app = (App) request.getAttribute("app");
		User user = this.lookup(request);
		if (app.getIcon() != null) {
			String dir = configService.loadConfig(Constant.Configs.filesDirPath) + fileSeparator + user.getUid() + fileSeparator 
					+ Constant.Configs.appsDirPath + fileSeparator + appKey + fileSeparator + Constant.Configs.appIconDir + fileSeparator;
			app.setIcon(dir + app.getIcon().replace("#", "%23"));
		}
		return "portal/apps/detail";
	}
	
	@RequestMapping(value="/{appKey}/edit", method=RequestMethod.GET)
	public String showEditAppForm(@ModelAttribute("appForm") AppForm form, @PathVariable String appKey, Model model, HttpServletRequest request) {
		return "portal/apps/appUpdate";
	}
	
	@RequestMapping(value="/{appKey}/edit", method=RequestMethod.POST)
	public String updateApp(@Valid AppForm form, BindingResult result, @PathVariable String appKey, HttpServletRequest request,Model model) {
		if (result.hasErrors()) {
			return "portal/apps/appUpdate";
		}
		//boolean allowPush, boolean allowRichPush, boolean allowLBS,
		boolean allowPush = getBooleanParameter(request, "allowPush");
		boolean allowRichPush = getBooleanParameter(request, "allowRichPush");
		boolean allowLBS = getBooleanParameter(request, "allowLBS");
		
		App app = (App)request.getAttribute("app");
		AppBusiness appBusiness = (AppBusiness)request.getAttribute("appBusiness");
		appBusiness.setAllowPush(allowPush);
		appBusiness.setAllowRichPush(allowRichPush);
		appBusiness.setAllowLBS(allowLBS);
		
		app.setName(form.getName());
		app.setPkg(null);//不允许修改包名
		appService.updateApp(app);
		appBusinessService.update(appBusiness);
		model.addAttribute("success", true);
		return "portal/apps/appUpdate";
	}
	
	@RequestMapping(value="/{appKey}/delete", method=RequestMethod.GET)
	public String showEditAppForm(@PathVariable String appKey, HttpServletRequest request) {
		User user = this.lookup(request);
		App app = new App();
		app.setKey(appKey);
		app.setUid(user.getUid());
		appService.deleteApp(app);
		
		return "redirect:/apps/";
	}
	
	@RequestMapping(value="/create", method=RequestMethod.GET)
	public String create1(HttpServletRequest request) {
		return "portal/apps/new_step1";
	}
	
	@ResponseBody
	@RequestMapping(value="/create_upload", method=RequestMethod.POST)
	public Object createUpload(@RequestParam MultipartFile file, HttpServletRequest request) {
		User user = this.lookup(request);
		Map<String, Object> returns = new HashMap<String, Object>();
		
		if (file.getSize() > 0) {
			String appKey = AppHelper.generateAppKey(user.getUserName());
			
			String diroot = configService.loadConfig(Constant.Configs.filesDirPath) + fileSeparator + user.getUid() + fileSeparator + Constant.Configs.tmpsDirPath + fileSeparator + appKey + fileSeparator;
			String tf = diroot + appKey + apkSuffix;
			File targetFile = new File(tf);
			if (!targetFile.exists()) {
				boolean made = targetFile.mkdirs();
				logger.info("result[" + made + "] create path:" + targetFile.getPath());
			}
			try {
				file.transferTo(targetFile);
				
				returns.put("status", 1);
				returns.put("key", appKey);
			} catch (Exception e) {
				logger.error("[Upload Error] " + e.getMessage());
				returns.put("status", 0);
				returns.put("message", "上传失败");
			}
			
		} else {
			returns.put("status", 0);
			returns.put("message", "文件错误");
		}
		
		return returns;
	}
	
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public String _create1(HttpServletRequest request, Model model) {
		User user = this.lookup(request);
		String appName = request.getParameter("appName");
		String appKey = request.getParameter("appKey");
		
		String diroot = configService.loadConfig(Constant.Configs.filesDirPath) + fileSeparator + user.getUid() + fileSeparator + Constant.Configs.tmpsDirPath + fileSeparator + appKey + fileSeparator;
		String tf = diroot + appKey + apkSuffix;
		try {
			String packageName = AirHelper.air(request.getSession().getServletContext().getRealPath("/"), tf);
			if (null == packageName) {
				model.addAttribute("unpackError", true);
				return "redirect:/apps/create";
			}
			
			App app = new App();
			app.setUid(user.getUid());
			app.setPkg(packageName);
			boolean packageExisted = appService.checkAppPackage(app);
			
			if (packageExisted) {
				model.addAttribute("packageExisted", true);
				return "redirect:/apps/create";
			}
			
			TempApp tempApp = new TempApp();
			tempApp.setUid(user.getUid());
			tempApp.setKey(appKey);
			tempApp.setPkg(packageName);
			tempApp.setName(appName);
			tempAppService.addApp(tempApp);
			
			return "redirect:/apps/create/" + appKey;
		} catch (Exception e) {
			logger.error("[UnPack Error] " + e.getMessage());
		}
		model.addAttribute("unpackError", true);
		return "redirect:/apps/create";
	}
	
	@RequestMapping(value="/create/{appKey}", method=RequestMethod.GET)
	public String create2(@PathVariable String appKey, HttpServletRequest request, Model model) {
		User user = this.lookup(request);
		TempApp tempApp = new TempApp();
		tempApp.setUid(user.getUid());
		tempApp.setKey(appKey);
		tempApp = tempAppService.getApp(tempApp);
		
		if (null == tempApp) {
			return "redirect:/apps/create";
		}
		
		String diroot = configService.loadConfig(Constant.Configs.filesDirPath) + fileSeparator + user.getUid() + fileSeparator 
						+ Constant.Configs.tmpsDirPath + fileSeparator + appKey + fileSeparator;
		List<String> icons = new ArrayList<String>();
		try {
			icons = FileHelper.readFiles(diroot + appKey + Constant.Configs.appIconDirSuffix + fileSeparator + tempApp.getPkg());
			//从最高分辨率选起
			String[] tempArr = new String[6];
			for (String path : icons) {
				if (null != path) {
					if (path.indexOf("drawable-xxhdpi") > 0) {
						tempArr[0] = path;
					} else if (path.indexOf("drawable-xhdpi") > 0) {
						tempArr[1] = path;
					} else if (path.indexOf("drawable-hdpi") > 0) {
						tempArr[2] = path;
					} else if (path.indexOf("drawable-mdpi") > 0) {
						tempArr[3] = path;
					} else if (path.indexOf("drawable-ldpi") > 0) {
						tempArr[4] = path;
					} else {
						tempArr[5] = path;
					}
				}
			}
			String icon = null;
			for (String s : tempArr) {
				if (null != s) {
					icon = s;
					break;
				}
			}
			model.addAttribute("icon", icon);
			
			List<AppType> appTypeList = appTypeService.getListFillSun();
			model.addAttribute("appTypeList", appTypeList);
		} catch (IOException e) {
			logger.error(e);
		}
		
		model.addAttribute("app", tempApp);
		return "portal/apps/new_step2";
	}
	
	@RequestMapping(value="/create/{appKey}", method=RequestMethod.POST)
	public String _create2(@PathVariable String appKey, HttpServletRequest request, Model model) {
		User user = this.lookup(request);
		TempApp tempApp = new TempApp();
		tempApp.setUid(user.getUid());
		tempApp.setKey(appKey);
		tempApp = tempAppService.getApp(tempApp);
		
		if (null == tempApp) {
			model.addAttribute("appKeyError", true);
			return "redirect:/apps/create";
		}
		
		String appName = request.getParameter("appName");
		String typeStr = request.getParameter("type");
		if (StringUtils.isEmpty(appName)) {
			model.addAttribute("app", tempApp);
			model.addAttribute("icon", request.getParameter("appIcon"));
			model.addAttribute("appTypeList", appTypeService.getListFillSun());
			model.addAttribute("appNameEmpty", true);
			return "portal/apps/new_step2";
		}
		if (StringUtils.isEmpty(typeStr) || !NumberUtils.isNumberic(typeStr)) {
			model.addAttribute("app", tempApp);
			model.addAttribute("icon", request.getParameter("appIcon"));
			model.addAttribute("appTypeList", appTypeService.getListFillSun());
			model.addAttribute("appTypeError", true);
			return "portal/apps/new_step2";
		}
		
		String icon = request.getParameter("appIcon");
		if (StringUtils.isEmpty(icon)) {
			logger.info("[APP ICON] No icon " + appKey);
			icon = "";
		}
		icon = icon.replace("%23", "#");
		File iconFile = new File(icon);
		if (iconFile.exists() && iconFile.isFile()) {
			icon = icon.substring(icon.lastIndexOf(fileSeparator) + 1, icon.length());
			String targetFile = configService.loadConfig(Constant.Configs.filesDirPath) + fileSeparator + user.getUid() + fileSeparator
								+ Constant.Configs.appsDirPath + fileSeparator + appKey + fileSeparator + Constant.Configs.appIconDir
								+ fileSeparator + icon;
			FileUtils.copy(iconFile, new File(targetFile));
			
			logger.info("[APP ICON] Transfered " + appKey);
		} else {
			logger.info("[APP ICON] Not found " + appKey);
			model.addAttribute("app", tempApp);
			model.addAttribute("icon", request.getParameter("appIcon"));
			model.addAttribute("appTypeList", appTypeService.getListFillSun());
			model.addAttribute("iconError", true);
			return "portal/apps/new_step2";
		}

		App app = new App();
		app.setPkg(tempApp.getPkg());
		app.setName(appName);
		app.setUid(user.getUid());
		app.setKey(appKey);
		app.setStatus(Constant.AppStatus.infoCompleted);
		app.setIcon(icon);
		app.setCreateTime(new Date());
		app.setType(Integer.parseInt(typeStr));
		appService.addApp(app);
		
		AppBusiness appBusiness = new AppBusiness();
		appBusiness.setAppId(app.getId());
		appBusinessService.add(appBusiness);
		
		//删除反编译资源
		String rmFolder = configService.loadConfig(Constant.Configs.filesDirPath) + fileSeparator + user.getUid() + fileSeparator 
				+ Constant.Configs.tmpsDirPath + fileSeparator + appKey + fileSeparator;
		FileUtils.delete(new File(rmFolder));
		tempAppService.deleteApp(tempApp);
		
		return "redirect:/apps/" + appKey + "/download_sdk";
	}
	
	@RequestMapping(value="/{appKey}/download_sdk", method=RequestMethod.GET)
	public String create3(@PathVariable String appKey, HttpServletRequest request, Model model) {
		User user = this.lookup(request);
		
		App app = new App();
		app.setUid(user.getUid());
		app.setKey(appKey);
		app = appService.getApp(app);
		
		if (null == app) {
			return "redirect:/apps/create";
		}
		
		model.addAttribute("app", app);
		return "portal/apps/new_step3";
	}
	
	@RequestMapping(value="/{appKey}/download_sdk", method=RequestMethod.POST)
	public String post_create3(@PathVariable String appKey, 
			boolean allowPush, boolean allowRichPush, boolean allowLBS,
			HttpServletRequest request, Model model) {
		Object obj = request.getAttribute("app");
		
		if (null == obj) {
			return "redirect:/apps/create";
		}
		
		App app = (App) obj;
		AppBusiness appBusiness = new AppBusiness();
		appBusiness.setAppId(app.getId());
		appBusiness.setAllowPush(allowPush);
		appBusiness.setAllowRichPush(allowRichPush);
		appBusiness.setAllowLBS(allowLBS);
		appBusinessService.update(appBusiness);
		
		return "redirect:/apps/"+app.getKey()+"/create_done";
	}
	
	@RequestMapping(value="/{appKey}/build_sdk", method=RequestMethod.GET)
	public String _create3(@PathVariable String appKey, HttpServletRequest request, HttpServletResponse response) {
		App app = (App) request.getAttribute("app");
		Map<String, Object> responseMap = new HashMap<String, Object>();
		try {
			String contextPath = request.getSession().getServletContext().getRealPath(request.getContextPath()) ;
			if (!StringUtils.isEmpty(app.getPkg())) {
				String examplePackageName = "src/com/example/jpushdemo/";
				String examplePath = BuildExampleHelper.CreateExample(app, contextPath, false, examplePackageName);
				if (!response.isCommitted()) {
					return "redirect:" + examplePath;
				}
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
			responseMap.put("errmsg", "Build Example 异常");
		}
		return null;
	}
	
	@RequestMapping(value="/{appKey}/upload_app", method=RequestMethod.GET)
	public String _uploadApp() {
		return "portal/apps/new_step4";
	}
	
	@RequestMapping(value="/{appKey}/upload_app", method=RequestMethod.POST)
	public String _uploadApp(@RequestParam MultipartFile file, @PathVariable String appKey, Model model, HttpServletRequest request) {
		if (file.getSize() > 0) {
			User user = this.lookup(request);
			App app = (App)request.getAttribute("app");
			String diroot = configService.loadConfig(Constant.Configs.filesDirPath) + fileSeparator + user.getUid() + fileSeparator + Constant.Configs.appsDirPath + fileSeparator + appKey + fileSeparator;
			File targetFile = new File(diroot + app.getId() + apkSuffix);
			if (!targetFile.exists()) {
				boolean made = targetFile.mkdirs();
				logger.info("result[" + made + "] create dirs:" + targetFile.getPath());
			}
			try {
				file.transferTo(targetFile);
				return "redirect:/apps/"+appKey+"/create_done";
			} catch (Exception e) {
				logger.error("[Upload Error] " + e.getMessage());
			}
		}
		model.addAttribute("failed", true);
		return "redirect:/apps/" + appKey + "/upload_app";
	}
	@RequestMapping(value="/{appKey}/create_done", method=RequestMethod.GET)
	public String create_done(@PathVariable String appKey, Model model, HttpServletRequest request) {
		User user = this.lookup(request);
		String iconDir = configService.loadConfig(Constant.Configs.filesDirPath) + fileSeparator + user.getUid() + fileSeparator 
						+ Constant.Configs.appsDirPath + fileSeparator + appKey + fileSeparator + Constant.Configs.appIconDir 
						+ fileSeparator;
		model.addAttribute("iconDir", iconDir);
		return "portal/apps/new_step5";
	}
	@RequestMapping(value="/export-excel")
	public void myExportExcel(@ModelAttribute("formParam") FormParam formParam,BindingResult result,HttpServletRequest request,HttpServletResponse response){
		User user = this.lookup(request);
		formParam.setUid(user.getUid());
		exportExcel(formParam, request, response);
	}
	@RequestMapping(value="/all/export-excel")
	public void exportExcel(@ModelAttribute("formParam") FormParam formParam,BindingResult result,HttpServletRequest request,HttpServletResponse response){
	    exportExcel(formParam, request, response);
	}
	private void exportExcel(FormParam formParam,HttpServletRequest request,HttpServletResponse response){
		formParam.setTotalCount(appService.listTotal(formParam));
		List<Map<String,Object>> applist  = appService.getAppListForMap(formParam);
		Map<String,Object> beans = new HashMap<String,Object>();
		beans.put("applist", applist);
		beans.put("formParam", formParam);
		String tempFile = request.getSession().getServletContext().getRealPath("/")+"WEB-INF/report/template/app_report.xls";
		ExcelUtils.export2Excel("应用报表",tempFile, beans, response);
	}
}