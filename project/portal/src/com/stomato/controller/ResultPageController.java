package com.stomato.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/result")
public class ResultPageController extends UserController{
	
	@RequestMapping(value="/success")
	public String toView(HttpServletRequest request, Model model) {
		return "/portal/result/success";
	}
}
