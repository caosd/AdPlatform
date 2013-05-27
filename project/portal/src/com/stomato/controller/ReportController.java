package com.stomato.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/report")
public class ReportController {
	
	@RequestMapping("/incoming/daily")
	public String daily_incoming(HttpServletRequest request, HttpServletResponse response) {
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
