package com.stomato.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.stomato.domain.App;
import com.stomato.domain.User;
import com.stomato.form.ReportFormParam;
import com.stomato.service.AppService;
import com.stomato.service.ReportService;

@Controller
@RequestMapping("/report")
public class ReportController extends UserController{
	
	@Autowired
	private ReportService reportService;
	@Autowired
	private AppService appService;
	
	private void responseDaily(ReportFormParam reportParam,HttpServletRequest request, Model model){
		User user = this.lookup(request);
		reportParam.setUid(user.getUid());
		
		List<App> appList = this.appService.getAppList(user.getUid());
		if( appList.size() > 0 ){
			int total = this.reportService.getDailyReportCount(reportParam);
			reportParam.setTotalCount(total);
			model.addAttribute("dailyList", this.reportService.getDailyReport(reportParam));
		}
		model.addAttribute("appList", appList);

	}
	private void responseMonthly(ReportFormParam reportParam,HttpServletRequest request,Model model){
		User user = this.lookup(request);
		reportParam.setUid(user.getUid());
		List<App> appList = this.appService.getAppList(user.getUid());
		if( appList.size() > 0 ){
			int total = this.reportService.getMonthlyReportCount(reportParam);
			reportParam.setTotalCount(total);
			model.addAttribute("monthlyList", this.reportService.getMonthlyReport(reportParam));
		}
		model.addAttribute("appList", appList);
	}
	
	@RequestMapping(value="/incoming/daily")
	public String daily_incoming(@ModelAttribute("formParam") ReportFormParam form,BindingResult result,HttpServletRequest request, Model model) {
		this.responseDaily(form, request, model);
		return "portal/report/incoming/daily";
	}
	
	@RequestMapping(value="/incoming/monthly")
	public String monthly_incoming(@ModelAttribute("formParam") ReportFormParam form,BindingResult result,HttpServletRequest request, HttpServletResponse response,Model model) {
		this.responseMonthly(form, request, model);
		return "portal/report/incoming/monthly";
	}

	@RequestMapping(value="/advert/pushes")
	public String pushes_advert(@ModelAttribute("formParam") ReportFormParam form,BindingResult result,HttpServletRequest request, HttpServletResponse response,Model model) {
		this.responseDaily(form, request, model);
		return "portal/report/advert/pushes";
	}
	
	@RequestMapping(value="/advert/advertising")
	public String advertising(@Valid @ModelAttribute("formParam") ReportFormParam form,BindingResult result, HttpServletRequest request, Model model) {
		this.responseDaily(form, request, model);
		return "portal/report/advert/advertising";
	}
}
