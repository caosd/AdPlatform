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
import org.springframework.web.bind.annotation.RequestMethod;

import com.stomato.domain.ReportParam;
import com.stomato.domain.ReportResult;
import com.stomato.form.ReportParamForm;
import com.stomato.service.ReportService;

@Controller
@RequestMapping("/report")
public class ReportController {
	
	@Autowired
	private ReportService reportService;
	
	@RequestMapping(value="/incoming/daily",method=RequestMethod.GET)
	public String daily_incoming(HttpServletRequest request, Model model) {
		ReportParam reportParam = new ReportParam();
		List<ReportResult> reportResultList = this.reportService.getDailyReport(reportParam);
		model.addAttribute("reportResultList", reportResultList);
		return "backend/report/incoming/daily";
	}
	
	@RequestMapping(value="/incoming/daily", method=RequestMethod.POST)
	public String ReportParamForm(@Valid @ModelAttribute("reportParamForm") ReportParamForm form, BindingResult result, HttpServletRequest request, Model model) {
		return "backend/report/incoming/daily";
	}
	
	@RequestMapping("/incoming/monthly")
	public String monthly_incoming(HttpServletRequest request, HttpServletResponse response) {
		return "backend/report/incoming/monthly";
	}
	
	@RequestMapping("/incoming/hourly")
	public String hourly_incoming(HttpServletRequest request, HttpServletResponse response) {
		return "backend/report/incoming/hourly";
	}
	
}
