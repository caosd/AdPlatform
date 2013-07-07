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
import com.stomato.vo.SysConfig;

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
		if( appList.size() > 0 ){
			int total = this.reportService.getDailyReportCount(reportParam);
			int pageTotal = SysConfig.getPageTotal(total, reportParam.getPageSize());
			if(pageTotal<reportParam.getPageNum()){ reportParam.setPageNum(1); } 
			int start = (reportParam.getPageNum()-1)*reportParam.getPageSize();
			reportParam.setSlimt(start);
			
			model.addAttribute("pageTotal", pageTotal);
			model.addAttribute("totalcount", total);
			model.addAttribute("pageNum", reportParam.getPageNum());
			model.addAttribute("dailyList", this.reportService.getDailyReport(reportParam));
		}
		model.addAttribute("appList", appList);

	}
	private void responseMonthly(ReportParam reportParam,HttpServletRequest request,Model model){
		User user = this.lookup(request);
		reportParam.setUid(user.getUid());
		List<App> appList = this.appService.getAppList(user.getUid());
		if( appList.size() > 0 ){
			int total = this.reportService.getMonthlyReportCount(reportParam);
			int pageTotal = SysConfig.getPageTotal(total, reportParam.getPageSize());
			if(pageTotal<reportParam.getPageNum()){ reportParam.setPageNum(1); } 
			int start = (reportParam.getPageNum()-1)*reportParam.getPageSize();
			reportParam.setSlimt(start);

			model.addAttribute("pageTotal", pageTotal);
			model.addAttribute("totalcount", total);
			model.addAttribute("pageNum", reportParam.getPageNum());
			model.addAttribute("monthlyList", this.reportService.getMonthlyReport(reportParam));
		}
		model.addAttribute("appList", appList);
	}
	
	@RequestMapping(value="/incoming/daily")
	public String daily_incoming(@ModelAttribute("reportParamForm") ReportParamForm form,BindingResult result,HttpServletRequest request, Model model) {
		this.responseDaily(form.asPojo(), request, model);
		return "portal/report/incoming/daily";
	}
	
	@RequestMapping(value="/incoming/monthly")
	public String monthly_incoming(@ModelAttribute("reportParamForm") ReportParamForm form,BindingResult result,HttpServletRequest request, HttpServletResponse response,Model model) {
		this.responseMonthly(form.asPojo(), request, model);
		return "portal/report/incoming/monthly";
	}

	@RequestMapping(value="/advert/pushes")
	public String pushes_advert(@ModelAttribute("reportParamForm") ReportParamForm form,BindingResult result,HttpServletRequest request, HttpServletResponse response,Model model) {
		this.responseDaily(form.asPojo(), request, model);
		return "portal/report/advert/pushes";
	}
	
	@RequestMapping(value="/advert/advertising")
	public String advertising(@Valid @ModelAttribute("reportParamForm") ReportParamForm form,BindingResult result, HttpServletRequest request, Model model) {
		this.responseDaily(form.asPojo(), request, model);
		return "portal/report/advert/advertising";
	}
}
