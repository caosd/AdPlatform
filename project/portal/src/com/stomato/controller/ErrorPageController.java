package com.stomato.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/errors")
public class ErrorPageController {
	
	@RequestMapping("/404")
	public String pageNotFound() {
		return "redirect:/errors/404.html";
	}
	
	@RequestMapping("/404.html")
	public String pageNotFound2() {
		return "portal/errors/404";
	}
	
	@RequestMapping("/500")
	public String serverError() {
		return "portal/errors/500";
	}
	
	@RequestMapping("/500.html")
	public String serverError2() {
		return "redirect:/errors/500.html";
	}
}
