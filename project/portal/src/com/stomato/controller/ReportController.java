package com.stomato.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.stomato.domain.App;
import com.stomato.domain.ReportParam;
import com.stomato.domain.User;
import com.stomato.form.ReportParamForm;
import com.stomato.service.AppService;
import com.stomato.service.ReportService;
import com.stomato.utils.DateUtils;

@Controller
@RequestMapping("/report")
public class ReportController extends UserController{
	
	@Autowired
	private ReportService reportService;
	@Autowired
	private AppService appService;
	
	private void responseDaily(ReportParam reportParam,HttpServletRequest request, Model model){
		User user = this.lookup(request);
		List<App> appList = this.appService.getAppList(user.getUid());
		if( appList.size() > 0 ){
			reportParam.setUid(user.getUid());
			List<Map<String,Object>>  dailyList = this.reportService.getDailyReport(reportParam);
			List<Map<String,Object>>  todayList = new ArrayList<Map<String,Object>>();
			if( dailyList != null && dailyList.size() > 0){
				String todayDate = DateUtils.getInstance().dateToString(new Date(), DateUtils.patternA);
				for (Map<String, Object> item : dailyList) {
					String strDate = DateUtils.getInstance().dateToString((Date)item.get("idate"), DateUtils.patternA);
					//如果是今天的报表，加入todalylist
					if(todayDate.equals(strDate)){
						todayList.add(item);
					}
				}
				model.addAttribute("todayList", todayList);
				model.addAttribute("dailyList", dailyList);
				model.addAttribute("reportParam", reportParam);
			}
			model.addAttribute("appList", appList);
		}
	}
	private void responseMonthly(ReportParam reportParam,HttpServletRequest request,Model model){
		User user = this.lookup(request);
		List<App> appList = this.appService.getAppList(user.getUid());
		if( appList.size() > 0 ){
			reportParam.setUid(user.getUid());
			List<Map<String,Object>>  reportList = this.reportService.getMonthlyReport(reportParam);
			model.addAttribute("monthlyList", reportList);
			model.addAttribute("appList", appList);
			model.addAttribute("reportParam", reportParam);
		}
	}
	
	@RequestMapping(value="/incoming/daily")
	public String daily_incoming(@ModelAttribute("reportParamForm") ReportParamForm form,HttpServletRequest request, Model model) {
		this.responseDaily(form.asPojo(), request, model);
		return "backend/report/incoming/daily";
	}
	
	@RequestMapping(value="/incoming/monthly")
	public String monthly_incoming(@ModelAttribute("reportParamForm") ReportParamForm form,HttpServletRequest request, HttpServletResponse response,Model model) {
		this.responseMonthly(form.asPojo(), request, model);
		return "backend/report/incoming/monthly";
	}

	@RequestMapping(value="/advert/pushes")
	public String daily_pushes_advert(@ModelAttribute("reportParamForm") ReportParamForm form,HttpServletRequest request, HttpServletResponse response,Model model) {
		this.responseDaily(form.asPojo(), request, model);
		return "backend/report/advert/pushes";
	}
	
	@RequestMapping(value="/advert/advertising")
	public String advertising(@Valid @ModelAttribute("reportParamForm") ReportParamForm form, BindingResult result, HttpServletRequest request, Model model) {
		this.responseDaily(form.asPojo(), request, model);
		return "backend/report/advert/advertising";
	}
}
