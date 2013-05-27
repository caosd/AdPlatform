package com.stomato.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/financial")
public class FinancialController {
	
	@RequestMapping("/overview")
	public String overview(HttpServletRequest request, HttpServletResponse response) {
		return "backend/financial/overview";
	}
	
	@RequestMapping("/accounts")
	public String accounts(HttpServletRequest request, HttpServletResponse response) {
		return "backend/financial/accounts";
	}
	
	@RequestMapping("/remittance")
	public String remittance(HttpServletRequest request, HttpServletResponse response) {
		return "backend/financial/remittance";
	}
	
	@RequestMapping("/remittance_history")
	public String remittance_history(HttpServletRequest request, HttpServletResponse response) {
		return "backend/financial/remittance_history";
	}
	
}
