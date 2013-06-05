package com.stomato.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
import com.stomato.domain.ReportParam;
import com.stomato.domain.TempApp;
import com.stomato.domain.User;
import com.stomato.domain.UserImei;
import com.stomato.enums.ReportTypeEnum;
import com.stomato.form.AppForm;
import com.stomato.helper.AirHelper;
import com.stomato.helper.AppHelper;
import com.stomato.helper.BuildExampleHelper;
import com.stomato.helper.FileHelper;
import com.stomato.service.AppService;
import com.stomato.service.ConfigService;
import com.stomato.service.TempAppService;
import com.stomato.service.UserImeiService;
import com.stomato.utils.FileUtils;
import com.stomato.utils.NumberUtils;
import com.stomato.utils.StringUtils;
import com.stomato.validator.AppValidation;

@Controller
@RequestMapping("/apps")
public class AppsController extends UserController {
	
	private final Logger logger = Logger.getLogger(this.getClass().getName());
	
	private final Pattern imeiPattern = Pattern.compile("^.{10,24}$");
	
	private final String fileSeparator = System.getProperty("file.separator");
	
	private static final String uploadsDir = "/dev/null";
	
	private static final String apkSuffix = ".apk";
	
	@Autowired
	private AppService appService;
	
	@Autowired
	private TempAppService tempAppService;
	
	@Autowired
	private UserImeiService userImeiService;
	
	@Autowired
	private AppValidation appValidation;
	
	@Autowired
	private ConfigService configService;
	
	@RequestMapping(value="", method=RequestMethod.GET)
	public String main(HttpServletRequest request, Model model) {
		User user = this.lookup(request);
		List<App> applist = appService.getAppList(user.getUid());
		model.addAttribute("applist", applist);
		
		return "backend/apps/applist";
	}
	
	@RequestMapping(value="/new", method=RequestMethod.GET)
	public String showNewAppForm(@ModelAttribute("appForm") AppForm form) {
		return "backend/apps/createForm";
	}
	
	@RequestMapping(value="/new", method=RequestMethod.POST)
	public String addApp(@Valid @ModelAttribute("appForm") AppForm form, BindingResult result, HttpServletRequest request, Model model) {
		appValidation.validate(form, result);
		if (result.hasErrors()) {
			return "backend/apps/createForm";
		}
		
		User user = this.lookup(request);
		boolean ready = true;//AppHelper.syncPackage(user.getUid(), form.getPkg());
		if (!ready) {
			model.addAttribute("failedWithDuplicatePackage", true);
			return "backend/apps/createForm";
		}
		
		String appKey = AppHelper.generateAppKey(user.getUserName());
		App app = form.asPojo();
		app.setUid(user.getUid());
		app.setKey(appKey);
		int appId = new Random().nextInt(1000);//AppHelper.syncApp(app);
		
		if (appId > 0) {
			app.setId(appId);
			int c = appService.addApp(app);
			if (c == 1) {
				form = null;
				return "redirect:/apps/" + appKey + "/detail";
			}
		}
		
		model.addAttribute("failed", true);
		return "backend/apps/createForm";
	}
	
	@ResponseBody
	@RequestMapping(value="/validation", method=RequestMethod.GET)
	public Object addApp(@RequestParam String pkg, HttpServletRequest request) {
		//User user = this.lookup(request);
		//return AppHelper.syncPackage(user.getUid(), pkg);
		return true;
	}

	@RequestMapping(value="/{appKey}/detail", method=RequestMethod.GET)
	public String getApp(@PathVariable String appKey, HttpServletRequest request, Model model) {
		return "backend/apps/detail";
	}
	
	@RequestMapping(value="/{appKey}/edit", method=RequestMethod.GET)
	public String showEditAppForm(@ModelAttribute("appForm") AppForm form, @PathVariable String appKey, Model model, HttpServletRequest request) {
		return "backend/apps/editForm";
	}
	
	@RequestMapping(value="/{appKey}/edit", method=RequestMethod.POST)
	public String updateApp(@Valid AppForm form, BindingResult result, @PathVariable String appKey, HttpServletRequest request) {
		if (result.hasErrors()) {
			return "backend/apps/editForm";
		}
		App app = (App)request.getAttribute("app");
		if (app.getName().equals(form.getName())) {
			return "redirect:/apps/" + appKey + "/detail";
		}
		app.setName(form.getName());
		int appId = AppHelper.syncApp(app);
		if (appId > 0) {
			app.setPkg(null);//不允许修改包名
			appService.updateApp(app);
			form = null;
			return "redirect:detail";
		}
		request.setAttribute("failed", true);
		return "backend/apps/editForm";
	}
	
	@RequestMapping(value="/{appKey}/delete", method=RequestMethod.GET)
	public String showEditAppForm(@PathVariable String appKey, HttpServletRequest request) {
		User user = this.lookup(request);
		App app = new App();
		app.setKey(appKey);
		app.setUid(user.getUid());
		appService.deleteApp(app);
		
		return "redirect:/apps";
	}
	
	@RequestMapping(value="/{appKey}/reports", method=RequestMethod.GET)
	public String showReports(@PathVariable String appKey, Model model, HttpServletRequest request) {
		return "backend/apps/reports/reports";
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
		rptParam.setStartDate(startDate);
		rptParam.setEndDate(endDate);
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
		return "backend/apps/reports/earnings";
	}
	
	@RequestMapping(value="/{appKey}/push", method=RequestMethod.GET)
	public String push(Model model, HttpServletRequest request) {
		User user = this.lookup(request);
		App app = (App) request.getAttribute("app");
		UserImei userImei = new UserImei(user.getUid(), app.getId());
		
		List<UserImei> list = userImeiService.getAllUserImei(userImei);
		model.addAttribute("userImeiList", list);
		
		return "backend/apps/push";
	}
	
	@ResponseBody
	@RequestMapping(value="/{appKey}/ajax_update_user_imei", method=RequestMethod.POST)
	public Object updateUserImei(@RequestParam int id, @RequestParam String imei, @RequestParam String description, HttpServletRequest request) {
		User user = this.lookup(request);
		App app = (App) request.getAttribute("app");
		UserImei userImei = new UserImei(user.getUid(), app.getId());
		userImei.setImei(imei);
		userImei.setDescription(description);
		
		return userImeiService.updateUserImei(userImei) == 1;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/{appKey}/ajax_delete_user_imei", method=RequestMethod.POST)
	public Object deleteUserImei(@RequestParam int id, HttpServletRequest request) {
		User user = this.lookup(request);
		App app = (App) request.getAttribute("app");
		UserImei userImei = new UserImei(user.getUid(), app.getId());
		userImei.setId(id);
		
		return userImeiService.deleteUserImei(userImei) == 1;
	}
	
	@ResponseBody
	@RequestMapping(value="/{appKey}/ajax_add_user_imei", method=RequestMethod.POST)
	public Object addUserImei(@RequestParam String imei, @RequestParam String description, Model model, HttpServletRequest request) {
		Matcher m = imeiPattern.matcher(imei);
		if (!m.find()) {
			return false;
		}
		User user = this.lookup(request);
		App app = (App) request.getAttribute("app");
		UserImei userImei = new UserImei(user.getUid(), app.getId());
		userImei.setImei(imei);
		userImei.setDescription(description);
		try {
			userImeiService.addUserImei(userImei);
			return userImei.getId();
		} catch(Exception ex) {
			//数据库设置了uid+appId+imei的唯一组合键，捕获该异常。
			logger.error(ex.getMessage());
			return false;
		}
	}
	
	/*
	N = 0    成功
	  = 100  缺少参数
	  = 101  包名错误，不允许推广告
	  = 102  设置的uid 不存在
	  = 103  sdk 版本 不允许推广告
	 */
	@ResponseBody
	@RequestMapping(value="/{appKey}/ajax_start_user_imei", method=RequestMethod.POST)
	public Object startUserImei(@RequestParam int id, Model model, HttpServletRequest request) {
		int errCode = -1;
		User user = this.lookup(request);
		App app = (App) request.getAttribute("app");
		UserImei userImei = new UserImei(user.getUid(), app.getId());
		userImei.setId(id);
		
		userImei = userImeiService.getUserImei(userImei);
		if (userImei != null) {
			AppHelper appHelper = new AppHelper();
			long pushUid = appHelper.getPushUidByImei(userImei.getImei(), app.getPkg());
			if (pushUid > 0) {
				errCode = appHelper.startPush(pushUid, app.getPkg());
				if (errCode == 0) {
					userImei.setStatus(errCode);
					userImei.setPushUid(pushUid);
					userImeiService.updateUserImei(userImei);
				}
			} else if (pushUid == 0) {
				errCode = 102; 
			}
		}
		return errCode;
	}
	
	@ResponseBody
	@RequestMapping(value="/{appKey}/ajax_stop_user_imei", method=RequestMethod.POST)
	public Object stopUserImei(@RequestParam int id, Model model, HttpServletRequest request) {
		int errCode = -1;
		User user = this.lookup(request);
		App app = (App) request.getAttribute("app");
		UserImei userImei = new UserImei(user.getUid(), app.getId());
		userImei.setId(id);
		
		userImei = userImeiService.getUserImei(userImei);
		if (userImei != null) {
			AppHelper appHelper = new AppHelper();
			long pushUid = userImei.getPushUid();
			if (pushUid > 0) {
				errCode = appHelper.stopPush(pushUid);
				if (errCode == 0) {
					errCode = 1;
					userImei.setStatus(1);
					userImei.setPushUid(0);
					userImeiService.updateUserImei(userImei);
				}
			} else {
				errCode = 102;
			}
		}
		return errCode;
	}
	
	@ResponseBody
	@RequestMapping(value="/ajax_summary", method=RequestMethod.GET)
	public Object summary(HttpServletRequest request) {
		User user = this.lookup(request);
		return null;//appService.getSummaryReport(user.getUid());
	}
	
	@RequestMapping(value="/{appKey}/uploads", method=RequestMethod.GET)
	public String showUploadApp() {
		return "backend/apps/uploads";
	}
	
	@RequestMapping(value="/create", method=RequestMethod.GET)
	public String create1(HttpServletRequest request) {
		return "backend/apps/new_step1";
	}
	
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public String _create1(@RequestParam MultipartFile file, HttpServletRequest request, Model model) {
		User user = this.lookup(request);
		
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
				
				String packageName = AirHelper.air(request.getServletContext().getRealPath("/"), tf);
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
				
				String appName = request.getParameter("appName");
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
		
		String diroot = configService.loadConfig(Constant.Configs.filesDirPath) + fileSeparator + user.getUid() + fileSeparator + Constant.Configs.tmpsDirPath + fileSeparator + appKey + fileSeparator;
		List<String> icons = new ArrayList<String>();
		try {
			icons = FileHelper.readFiles(diroot + appKey + Constant.Configs.appIconDirSuffix + fileSeparator + tempApp.getPkg());
			model.addAttribute("icons", icons);
		} catch (IOException e) {
			logger.error(e);
		}
		
		model.addAttribute("app", tempApp);
		return "backend/apps/new_step2";
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
		
		String icon = request.getParameter("appIcon");
		if (StringUtils.isEmpty(icon)) {
			logger.info("[APP ICON] No icon " + appKey);
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
		}

		String appName = request.getParameter("appName");
		App app = new App();
		app.setPkg(tempApp.getPkg());
		app.setName(appName);
		app.setUid(user.getUid());
		app.setKey(appKey);
		app.setStatus(Constant.AppStatus.infoCompleted);
		app.setIcon(icon);
		app.setCreateTime(new Date());
		appService.addApp(app);
		
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
		return "backend/apps/new_step3";
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
		return "backend/apps/new_step4";
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
				model.addAttribute("success", true);
			} catch (Exception e) {
				logger.error("[Upload Error] " + e.getMessage());
			}
		}
		if (!model.containsAttribute("success")) {
			model.addAttribute("failed", true);
		}
		return "redirect:/apps/" + appKey + "/upload_app";
	}
	
	@RequestMapping(value="/{appKey}/push/test", method=RequestMethod.GET)
	public String pushtest(@PathVariable String appKey, HttpServletRequest request) {
		return "backend/apps/pushtest";
	}
	
	@RequestMapping(value="/{appKey}/push/setting", method=RequestMethod.GET)
	public String pushsetting(@PathVariable String appKey, HttpServletRequest request) {
		return "backend/apps/pushsetting";
	}
	
	@RequestMapping(value="/{appKey}/push/setting", method=RequestMethod.POST)
	public String _pushsetting(@PathVariable String appKey,
							   @RequestParam("allow-push") boolean allowPush,
							   @RequestParam("allow-trustee") boolean allowTrustee, 
							   HttpServletRequest request,
							   Model model) {
		User user = this.lookup(request);
		
		App app = new App();
		app.setUid(user.getUid());
		app.setKey(appKey);
		app.setAllowPush(allowPush);
		app.setAllowTrustee(allowTrustee);
		
		String delayPushInterval = request.getParameter("delay_push_interval");
		if (NumberUtils.isNumberic(delayPushInterval)) {
			app.setDelayPushInterval(Integer.parseInt(delayPushInterval));
		}
		
		appService.updateApp(app);
		return "redirect:/apps/"+appKey+"/push/setting";
	}
	
	@RequestMapping(value="/{appKey}/push/composer", method=RequestMethod.GET)
	public String pushcomposer(@PathVariable String appKey, HttpServletRequest request) {
		return "backend/apps/pushcomposer";
	}
	
}