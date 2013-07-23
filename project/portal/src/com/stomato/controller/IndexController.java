package com.stomato.controller;

import java.util.List;
import java.util.Locale;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ModelAndView;

import com.stomato.domain.ExtraApp;
import com.stomato.service.ExtraAppService;
import com.stomato.service.IndexService;

@Controller
public class IndexController {
	
	@Autowired
	private LocaleResolver localeResolver;
	
	@Autowired
	private IndexService indexService;
	
	@Autowired
	private ExtraAppService extraAppService;
	
	@RequestMapping("/")
	public String index(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		return "redirect:/login.html";
	}
	
	@RequestMapping("/aboutus")
	public ModelAndView aboutus() {
		return new ModelAndView("aboutus/aboutus");
	}
	
	@RequestMapping("/partner")
	public ModelAndView partner() {
		return new ModelAndView("partner/partner");
	}
	
	@RequestMapping("/helpcenter")
	public ModelAndView helpcenter() {
		return new ModelAndView("helpcenter/helpcenter");
	}
	
	@RequestMapping("/news")
	public ModelAndView news() {
		return new ModelAndView("news/news");
	}
	
	@RequestMapping("/news/{articleId}")
	public ModelAndView newsArticle(@PathVariable long articleId) {
		return new ModelAndView("news/news_"+articleId);
	}
	
	@RequestMapping("/zh")
	public ModelAndView switchToZH(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		Locale locale = Locale.SIMPLIFIED_CHINESE;
		localeResolver.setLocale(request, response, locale);
		model.put("pushAdsDisplay", indexService.getIndexCount());
		return new ModelAndView("index", model);
	}
	
	@RequestMapping("/en")
	public ModelAndView switchToEN(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		Locale locale = Locale.US;
		localeResolver.setLocale(request, response, locale);
		model.put("pushAdsDisplay", indexService.getIndexCount());
		return new ModelAndView("index", model);
	}
	
	@RequestMapping("/applist")
	public String showApplist(Model model) {
		List<ExtraApp> list = extraAppService.getAppList();
		model.addAttribute("applist", list);
		
		return "webapp/applist";
	}
	
	@RequestMapping("/app/{id}")
	public String showApp(@PathVariable int id, Model model) {
		ExtraApp extraApp = extraAppService.getApp(id);
		model.addAttribute("app", extraApp);
		
		return "webapp/app_info";
	}
}