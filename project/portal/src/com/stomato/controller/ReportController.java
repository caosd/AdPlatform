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
import com.stomato.domain.ReportParam;
import com.stomato.domain.User;
import com.stomato.form.ReportParamForm;
import com.stomato.service.AppService;
import com.stomato.service.ReportService;
import com.stomato.utils.Pager;

@Controller
@RequestMapping("/report")
public class ReportController extends UserController{
	
	@Autowired
	private ReportService reportService;
	@Autowired
	private AppService appService;
	
	private void responseDaily(ReportParam reportParam,HttpServletRequest request, Model model){
		User user = this.lookup(request);
		reportParam.setUid(user.getUid());
		
		List<App> appList = this.appService.getAppList(user.getUid());
		int records = this.reportService.getDailyReportCount(reportParam);
		int curPage = this.getIntParameter(request, "p");
		if( curPage < 1) curPage = 1;
		reportParam.setSlimt((curPage-1) * reportParam.getRows());
		//分页
		Pager pager = new Pager(reportParam.getRows(), curPage, records);
		model.addAttribute("pager", pager);
		
		if( appList.size() > 0 ){
			model.addAttribute("dailyList", this.reportService.getDailyReport(reportParam));
		}
		model.addAttribute("appList", appList);
		model.addAttribute("reportParam", reportParam);
	}
	private void responseMonthly(ReportParam reportParam,HttpServletRequest request,Model model){
		User user = this.lookup(request);
		reportParam.setUid(user.getUid());
		int records = this.reportService.getMonthlyReportCount(reportParam);
		int curPage = this.getIntParameter(request, "p");
		if( curPage < 1) curPage = 1;
		reportParam.setRows(3);
		reportParam.setSlimt((curPage-1) * 3);
		//分页
		Pager pager = new Pager(reportParam.getRows(), curPage, records);
		
		List<App> appList = this.appService.getAppList(user.getUid());
		if( appList.size() > 0 ){
			model.addAttribute("monthlyList", this.reportService.getMonthlyReport(reportParam));
		}
		model.addAttribute("pager", pager);
		model.addAttribute("appList", appList);
		model.addAttribute("reportParam", reportParam);
	}
	
	@RequestMapping(value="/incoming/daily")
	public String daily_incoming(@ModelAttribute("reportParamForm") ReportParamForm form,HttpServletRequest request, Model model) {
		this.responseDaily(form.asPojo(), request, model);
		return "portal/report/incoming/daily";
	}
	
	@RequestMapping(value="/incoming/monthly")
	public String monthly_incoming(@ModelAttribute("reportParamForm") ReportParamForm form,HttpServletRequest request, HttpServletResponse response,Model model) {
		this.responseMonthly(form.asPojo(), request, model);
		return "portal/report/incoming/monthly";
	}

	@RequestMapping(value="/advert/pushes")
	public String pushes_advert(@ModelAttribute("reportParamForm") ReportParamForm form,HttpServletRequest request, HttpServletResponse response,Model model) {
		this.responseDaily(form.asPojo(), request, model);
		return "portal/report/advert/pushes";
	}
	
	@RequestMapping(value="/advert/advertising")
	public String advertising(@Valid @ModelAttribute("reportParamForm") ReportParamForm form, BindingResult result, HttpServletRequest request, Model model) {
		this.responseDaily(form.asPojo(), request, model);
		return "portal/report/advert/advertising";
	}
}
