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

import com.stomato.domain.ReportParam;
import com.stomato.form.ReportParamForm;
import com.stomato.service.ReportService;
import com.stomato.utils.DateUtils;

@Controller
@RequestMapping("/report")
public class ReportController extends UserController{
	
	@Autowired
	private ReportService reportService;
	
	private void responseDaily(ReportParam reportParam, Model model){
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
		}
	}
	
	@RequestMapping(value="/incoming/daily",method=RequestMethod.GET)
	public String daily_incoming(HttpServletRequest request, Model model) {
		ReportParam reportParam = new ReportParam();
		reportParam.setUid(super.lookup(request).getUid());
		responseDaily(reportParam, model);
		return "backend/report/incoming/daily";
	}
	
	@RequestMapping(value="/incoming/daily", method=RequestMethod.POST)
	public String daily_incoming(@Valid @ModelAttribute("reportParamForm") ReportParamForm form, BindingResult result, HttpServletRequest request, Model model) {
		ReportParam reportParam = form.asPojo();
		reportParam.setUid(super.lookup(request).getUid());
		responseDaily(reportParam, model);
		return "backend/report/incoming/daily";
	}
	
	@RequestMapping(value="/incoming/monthly",method=RequestMethod.GET)
	public String monthly_incoming(HttpServletRequest request, HttpServletResponse response,Model model) {
		ReportParam reportParam = new ReportParam();
		reportParam.setUid(super.lookup(request).getUid());
		List<Map<String,Object>>  monthlyList = this.reportService.getDailyReport(reportParam);
		model.addAttribute("monthlyList", monthlyList);
		return "backend/report/incoming/monthly";
	}
	@RequestMapping(value="/incoming/monthly",method=RequestMethod.POST)
	public String monthly_incoming(@Valid @ModelAttribute("reportParamForm") ReportParamForm form, BindingResult result, HttpServletRequest request, Model model) {
		ReportParam reportParam = new ReportParam();
		reportParam.setUid(super.lookup(request).getUid());
		List<Map<String,Object>>  monthlyList = this.reportService.getDailyReport(reportParam);
		model.addAttribute("monthlyList", monthlyList);
		return "backend/report/incoming/monthly";
	}
	@RequestMapping("/incoming/hourly")
	public String hourly_incoming(HttpServletRequest request, HttpServletResponse response) {
		return "backend/report/incoming/hourly";
	}
	
}
