package com.stomato.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.stomato.domain.AppType;
import com.stomato.form.AppTypeForm;
import com.stomato.form.AppTypeFormParam;
import com.stomato.service.AppTypeService;

@Controller
@RequestMapping(value="/apps")
public class AppTypeController {

	//private Logger logger = Logger.getLogger(AppTypeController.class);
	@Autowired
	private AppTypeService appTypeService ;
	/**
	 * goto 进入天津渠道页面
	 * @return
	 */
	@RequestMapping(value="/formpage.html",method=RequestMethod.GET)
	public String fromPage(@ModelAttribute("appTypeForm") AppTypeForm appTypeForm,Model model){
		List<AppType> resultList = appTypeService.getListByParent();
		model.addAttribute("appTypeList", resultList);
		return "portal/apps/appTypeForm";
	}

	/**
	 * 添加渠道
	 * @param AppType
	 * @param request
	 * @return
	 * @throws IOException
	 * @throws ParseException
	 */
	@RequestMapping(value="/formpage.html",method=RequestMethod.POST)
	public String addAppType(@Valid @ModelAttribute("appTypeForm")AppTypeForm appTypeForm, BindingResult result,HttpServletRequest request,Model model){
		
		if(result.hasErrors()){
			return "portal/apps/appTypeForm";
		}
		AppType appType = appTypeForm.asPojo();
		appTypeService.addAppType(appType);
		//清空表单
		BeanUtils.copyProperties(new AppTypeForm(), appTypeForm);
		model.addAttribute("success", true);
		return fromPage(appTypeForm, model);
	}
	
	/**
	 * 展示渠道信息
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/showAppType.html")
	public String showAppType(int id,HttpServletRequest request){
		AppType appType = appTypeService.getAppType(id);
		request.setAttribute("appType", appType);
		return "portal/apps/appTypeShow";
	}
	
	/**
	 * 渠道列表
	 * @param AppType
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(value="/appTypeList.html")
	public String AppTypeList(@ModelAttribute("formParam")AppTypeFormParam formParam,BindingResult result,HttpServletRequest request,Model model){
		int total = appTypeService.listTotal(formParam);
		formParam.setTotalCount(total);
System.out.println(formParam.getOffset());
		List<AppType> appTypeList = appTypeService.listAppType(formParam);
		model.addAttribute("appTypeList", appTypeList);
		return "portal/apps/appTypeList";
	}

	@RequestMapping(value="/{id}/updateAppType.html",method=RequestMethod.GET)
	public String AppTypeUpdate(@PathVariable int id,@ModelAttribute("appTypeForm")AppTypeForm form,BindingResult result) throws ParseException, IOException{
		AppType appType = appTypeService.getAppType(id);
		BeanUtils.copyProperties(appType, form);
		return "portal/apps/appTypeUpdate";
	}
	/**
	 * 修改渠道
	 * @param AppType
	 * @param request
	 * @return
	 * @throws ParseException
	 * @throws IOException
	 */
	@RequestMapping(value="/{id}/updateAppType.html",method=RequestMethod.POST)
	public String AppTypeUpdate(@PathVariable int id,@Valid @ModelAttribute("appTypeForm")AppTypeForm form, BindingResult result,HttpServletRequest request,Model model) throws ParseException, IOException{
		if( result.hasErrors()){
			return "portal/apps/appTypeUpdate";
		}
		form.setId(id);
		AppType appType = form.asPojo();
		appTypeService.updateAppType(appType);
		model.addAttribute("success", true);
		return AppTypeUpdate(id, form, result);
	}
	/**
	 * 删除渠道，数据库标识删除
	 * @param id
	 * @return
	 */
	 @RequestMapping(value="/{id}/deleteAppType.html")
	public String adChanelDelete(@PathVariable int id,@ModelAttribute("appType")AppType appType,BindingResult result,HttpServletRequest request,Model model){
		appTypeService.deleteAppType(id);
		model.addAttribute("success", "del");
		model.addAttribute("_goto", "/apps/appTypeList.html");
		return "redirect:/result/success";
	}
}