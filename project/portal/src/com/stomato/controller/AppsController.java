package com.stomato.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
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

import com.stomato.domain.App;
import com.stomato.domain.ReportParam;
import com.stomato.domain.User;
import com.stomato.domain.UserImei;
import com.stomato.enums.ReportTypeEnum;
import com.stomato.form.AppForm;
import com.stomato.helper.AppHelper;
import com.stomato.service.AppService;
import com.stomato.service.UserImeiService;
import com.stomato.utils.DateUtils;
import com.stomato.utils.ReportUtils;
import com.stomato.validator.AppValidation;

@Controller
@RequestMapping("/apps")
public class AppsController extends UserController {
	
	private final Logger logger = Logger.getLogger(this.getClass().getName());
	
	private final Pattern imeiPattern = Pattern.compile("^.{10,24}$");
	
	@Autowired
	private AppService appService;
	
	@Autowired
	private UserImeiService userImeiService;
	
	@Autowired
	private AppValidation appValidation;
	
	@RequestMapping(value="", method=RequestMethod.GET)
	public String main(HttpServletRequest request, Model model) {
		User user = this.lookup(request);
		List<App> applist = appService.getAppList(user.getId());
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
		boolean ready = AppHelper.syncPackage(user.getId(), form.getPkg());
		if (!ready) {
			model.addAttribute("failedWithDuplicatePackage", true);
			return "backend/apps/createForm";
		}
		
		String appKey = AppHelper.generateAppKey(user.getUserName());
		App app = form.asPojo();
		app.setUid(user.getId());
		app.setKey(appKey);
		int appId = AppHelper.syncApp(app);
		
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
		User user = this.lookup(request);
		return AppHelper.syncPackage(user.getId(), pkg);
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
		app.setUid(user.getId());
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
		Date startDate = DateUtils.parseDate(start + " 00:00:00", "yyyy-MM-dd HH:mm:ss");
		Date endDate = DateUtils.parseDate(end + " 00:00:00", "yyyy-MM-dd HH:mm:ss");
		
		if (startDate == null || endDate == null) {
			return null;
		}
		
		data.put("app", appKey);
		data.put("start", startDate);
		data.put("end", endDate);
		
		ReportParam rptParam = new ReportParam();
		rptParam.setUid(user.getId());
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
		rptData = ReportUtils.convert(appService.getReportData(rptParam));
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
		UserImei userImei = new UserImei(user.getId(), app.getId());
		
		List<UserImei> list = userImeiService.getAllUserImei(userImei);
		model.addAttribute("userImeiList", list);
		
		return "backend/apps/push";
	}
	
	@ResponseBody
	@RequestMapping(value="/{appKey}/ajax_update_user_imei", method=RequestMethod.POST)
	public Object updateUserImei(@RequestParam int id, @RequestParam String imei, @RequestParam String description, HttpServletRequest request) {
		User user = this.lookup(request);
		App app = (App) request.getAttribute("app");
		UserImei userImei = new UserImei(user.getId(), app.getId());
		userImei.setImei(imei);
		userImei.setDescription(description);
		
		return userImeiService.updateUserImei(userImei) == 1;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/{appKey}/ajax_delete_user_imei", method=RequestMethod.POST)
	public Object deleteUserImei(@RequestParam int id, HttpServletRequest request) {
		User user = this.lookup(request);
		App app = (App) request.getAttribute("app");
		UserImei userImei = new UserImei(user.getId(), app.getId());
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
		UserImei userImei = new UserImei(user.getId(), app.getId());
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
		UserImei userImei = new UserImei(user.getId(), app.getId());
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
		UserImei userImei = new UserImei(user.getId(), app.getId());
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
		return appService.getSummaryReport(user.getId());
	}
	
	private static final String uploadsDir = "/sm_uploads";
	private static final String fileSeparator = System.getProperty("file.separator");
	private static final String apkSuffix = ".apk";
	
	@RequestMapping(value="/{appKey}/uploads", method=RequestMethod.GET)
	public String showUploadApp() {
		return "backend/apps/uploads";
	}
	
	@RequestMapping(value="/{appKey}/uploads", method=RequestMethod.POST)
	public String uploadApp(@RequestParam MultipartFile file, @PathVariable String appKey, Model model, HttpServletRequest request) {
		if (file.getSize() > 0) {
			App app = (App)request.getAttribute("app");
			File targetFile = new File(uploadsDir + fileSeparator + appKey + fileSeparator + app.getId() + apkSuffix);
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
		return "redirect:/apps/" + appKey + "/uploads";
	}
	
}