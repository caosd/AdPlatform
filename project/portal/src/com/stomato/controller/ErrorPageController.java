package com.stomato.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/errors")
public class ErrorPageController {
	
	@RequestMapping("/404")
	public String pageNotFound() {
		return "errors/404";
	}
	
	@RequestMapping("/500")
	public String serverError() {
		return "errors/500";
	}
}
