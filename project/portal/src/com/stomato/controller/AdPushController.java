package com.stomato.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.stomato.domain.AdPush;
import com.stomato.domain.BaseParam;
import com.stomato.service.AdPushService;

@Controller
@RequestMapping(value="/adpush")
public class AdPushController {

	@Autowired
	private AdPushService adPushService;
 
	/**
	 * 渠道列表
	 * @param AppType
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(value="/list.html")
	public String adPushList(@ModelAttribute("adPush")AdPush adPush,BindingResult result,HttpServletRequest request,Model model){
		
		int total = adPushService.listTotal(adPush);
		BaseParam baseParam = new BaseParam(request,total);
		baseParam.setParam(adPush);
		List<Map<String,Object>> adPushList = adPushService.getListMap(baseParam);
		model.addAttribute("pageBean", baseParam);
		model.addAttribute("adPushList", adPushList);
		return "portal/adpush/pushList";
	}

	@RequestMapping(value="/{id}/update.html",method=RequestMethod.GET)
	public String update(@PathVariable int id,Model model) throws ParseException, IOException{
		AdPush adPush = adPushService.get(id);
		model.addAttribute("adPush",adPush);
		return "portal/adpush/pushUpdate";
	}
	@RequestMapping(value="/{id}/update.html",method=RequestMethod.POST)
	public String update(@PathVariable int id,@Valid @ModelAttribute("adPush")AdPush adPush,BindingResult result,Model model) throws ParseException, IOException{
		if( result.hasErrors()){
			return "portal/adpush/pushUpdate";
		}
		adPushService.update(adPush);
		model.addAttribute("success", true);
		return update(id, model);
	}
}