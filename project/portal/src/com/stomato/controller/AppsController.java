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
import com.stomato.domain.BaseParam;
import com.stomato.domain.PushTest;
import com.stomato.domain.ReportParam;
import com.stomato.domain.TempApp;
import com.stomato.domain.User;
import com.stomato.domain.UserImei;
import com.stomato.enums.ReportTypeEnum;
import com.stomato.exception.ParameterException;
import com.stomato.form.AppForm;
import com.stomato.helper.AirHelper;
import com.stomato.helper.AppHelper;
import com.stomato.helper.BuildExampleHelper;
import com.stomato.helper.FileHelper;
import com.stomato.service.AppBusinessService;
import com.stomato.service.AppService;
import com.stomato.service.AppTypeService;
import com.stomato.service.ConfigService;
import com.stomato.service.PushTestService;
import com.stomato.service.TempAppService;
import com.stomato.service.UserImeiService;
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
	private UserImeiService userImeiService;
	
	@Autowired
	private ConfigService configService;
	
	@Autowired
	private PushTestService pushTestService;
	
	@Autowired
	private AppTypeService appTypeService;
	
	@Autowired
	private AppBusinessService appBusinessService;
	
	
	@RequestMapping(value="")
	public String main(@ModelAttribute("app") App app,BindingResult result,HttpServletRequest request, Model model) {
		User user = this.lookup(request);
		app.setUid(user.getUid());
		int total = appService.listTotal(app);
		BaseParam baseParam = new BaseParam(request,total);
		baseParam.setParam(app);
		List<App> applist  = appService.listApps(baseParam);
		model.addAttribute("pageBean", baseParam);
		model.addAttribute("applist", applist);
		return "portal/apps/applist";
	}
	@RequestMapping(value="/list")
	public String list(@ModelAttribute("app") App app,BindingResult result,HttpServletRequest request, Model model) {
		int total = appService.listTotal(app);
		BaseParam baseParam = new BaseParam(request,total);
		baseParam.setParam(app);
		List<App> applist  = appService.listApps(baseParam);
		model.addAttribute("pageBean", baseParam);
		model.addAttribute("applist", applist);
		return "portal/apps/applist";
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
		return "portal/apps/editForm";
	}
	
	@RequestMapping(value="/{appKey}/edit", method=RequestMethod.POST)
	public String updateApp(@Valid AppForm form, BindingResult result, @PathVariable String appKey, HttpServletRequest request) {
		if (result.hasErrors()) {
			return "portal/apps/editForm";
		}
		App app = (App)request.getAttribute("app");
		if (app.getName().equals(form.getName())) {
			return "redirect:/apps/" + appKey + "/detail";
		}
		app.setName(form.getName());
		app.setPkg(null);//不允许修改包名
		appService.updateApp(app);
		form = null;
		return "redirect:detail";
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
	
	@RequestMapping(value="/{appKey}/reports", method=RequestMethod.GET)
	public String showReports(@PathVariable String appKey, Model model, HttpServletRequest request) {
		return "portal/apps/reports/reports";
	}
	
	@ResponseBody
	@RequestMapping(value="/{appKey}/reports/data", method=RequestMethod.GET)
	public Object processData(@PathVariable String appKey, @RequestParam String url, @RequestParam String start, @RequestParam String end, @RequestParam int precision, HttpServletRequest request) {
		User user = this.lookup(request);
		App app = (App)request.getAttribute("app");
		
		Map<String, Object> data = new HashMap<String, Object>();
		Date startDate = null;//DateUtils.parseDate(start + " 00:00:00", "yyyy-MM-dd HH:mm:ss");
		Date endDate = null;//DateUtils.parseDate(end + " 00:00:00", "yyyy-MM-dd HH:mm:ss");
		
		if (startDate == null || endDate == null) {
			return null;
		}
		
		data.put("app", appKey);
		data.put("start", startDate);
		data.put("end", endDate);
		
		ReportParam rptParam = new ReportParam();
		rptParam.setUid(user.getUid());
		rptParam.setAppId(app.getId());
		rptParam.set_startDate(startDate);
		rptParam.set_endDate(endDate);
		rptParam.setReportType(ReportTypeEnum.from(precision));//must set after date
		
		List<long[]> rptData = new ArrayList<long[]>();
		if ("/apps/new/".equals(url)) {
			rptParam.setCode("sm_user_new");
		} else if ("/apps/active/".equals(url)) {
			rptParam.setCode("sm_user_active");
		} else if ("/apps/online/".equals(url)) {
			rptParam.setCode("sm_user_online");
		} else if ("/apps/earnings/".equals(url)) {
			rptParam.setCode("sm_earnings");
		}
		//rptData = ReportUtils.convert(appService.getReportData(rptParam));
		data.put(rptParam.getCode(), rptData);
		return data;
	}
	
	@RequestMapping(value="/{appKey}/reports/earnings", method=RequestMethod.GET)
	public String earngins(@PathVariable String appKey, Model model) {
		return "portal/apps/reports/earnings";
	}
	
	@RequestMapping(value="/{appKey}/push", method=RequestMethod.GET)
	public String push(Model model, HttpServletRequest request) {
		User user = this.lookup(request);
		App app = (App) request.getAttribute("app");
		UserImei userImei = new UserImei(user.getUid(), app.getId());
		
		List<UserImei> list = userImeiService.getAllUserImei(userImei);
		model.addAttribute("userImeiList", list);
		
		return "portal/apps/push";
	}
	
	@ResponseBody
	@RequestMapping(value="/ajax_summary", method=RequestMethod.GET)
	public Object summary(HttpServletRequest request) {
		User user = this.lookup(request);
		return null;//appService.getSummaryReport(user.getUid());
	}
	
	@RequestMapping(value="/{appKey}/uploads", method=RequestMethod.GET)
	public String showUploadApp() {
		return "portal/apps/uploads";
	}
	
	@RequestMapping(value="/create", method=RequestMethod.GET)
	public String create1(HttpServletRequest request) {
		return "portal/apps/new_step1";
	}
	
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public String _create1(@RequestParam MultipartFile file, HttpServletRequest request, Model model) {
		User user = this.lookup(request);
		String appName = request.getParameter("appName");
		
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
				logger.error("[Upload Error] " + e.getMessage());
			}
			model.addAttribute("unpackError", true);
		} else {
			model.addAttribute("emptyFile", true);
		}
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
	
	@RequestMapping(value="/{appKey}/push/test", method=RequestMethod.GET)
	public String showPushtest(@PathVariable String appKey, HttpServletRequest request,Model model) {
		int uid = this.lookup(request).getUid();
		PushTest pushTest = this.pushTestService.getPushTest(uid, appKey);
		model.addAttribute("pushTest", pushTest);
		return "portal/apps/pushtest";
	}
	
	@RequestMapping(value="/{appKey}/push/test", method=RequestMethod.POST)
	public String processPushtest(@PathVariable String appKey, HttpServletRequest request,Model model) {
		int uid = this.lookup(request).getUid();
		PushTest pushTest = this.pushTestService.getPushTest(uid, appKey);
		try{
			String testKey = this.getStringParameter(request, "testKey", false);
			String desc = this.getStringParameter(request, "desc", true);
			
			if(pushTest == null){
				pushTest = new PushTest();
				pushTest.setAppKey(appKey);
				pushTest.setUid(uid);
				pushTest.setDesc(desc);
				pushTest.setTestKey(testKey);
				this.pushTestService.addPushTest(pushTest);
			}else{
				pushTest.setDesc(desc);
				pushTest.setTestKey(testKey);
				this.pushTestService.updatePushTest(pushTest);
			}
		}catch (ParameterException error) {
			model.addAttribute("error", error.getMessage());
			logger.error(error.getMessage());
		}
		model.addAttribute("pushTest", pushTest);
		return "portal/apps/pushtest";
	}
	
	@RequestMapping(value="/{appKey}/push/setting", method=RequestMethod.GET)
	public String pushsetting(@PathVariable String appKey, HttpServletRequest request) {
		return "portal/apps/pushsetting";
	}
	
	@RequestMapping(value="/{appKey}/rich-push", method=RequestMethod.GET)
	public String richpush(@PathVariable String appKey, HttpServletRequest request) {
		return "portal/apps/richpush";
	}
	
	@RequestMapping(value="/{appKey}/rich-push", method=RequestMethod.POST)
	public String _richpush(@PathVariable String appKey, HttpServletRequest request, Model model) {
		model.addAttribute("success", true);
		return "portal/apps/richpush";
	}
	
	@RequestMapping(value="/{appKey}/preview", method=RequestMethod.GET)
	public String preview(@PathVariable String appKey, HttpServletRequest request) {
		return "redirect:/html/previews/rich.html";
	}
	@RequestMapping(value="/export-excel", method=RequestMethod.GET)
	public String exportExcel(){
		return null;
	}
	
}