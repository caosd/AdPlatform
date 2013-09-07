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

import com.stomato.domain.AppCategory;
import com.stomato.form.AppCategoryForm;
import com.stomato.form.AppCategoryFormParam;
import com.stomato.service.AppCategoryService;

@Controller
@RequestMapping(value="/apps/category")
public class AppCategoryController {

	//private Logger logger = Logger.getLogger(AppTypeController.class);
	@Autowired
	private AppCategoryService appTypeService ;
	/**
	 * goto 进入天津渠道页面
	 * @return
	 */
	@RequestMapping(value="/add.html",method=RequestMethod.GET)
	public String fromPage(@ModelAttribute("appTypeForm") AppCategoryForm appTypeForm,Model model){
		List<AppCategory> resultList = appTypeService.getListByParent();
		model.addAttribute("appTypeList", resultList);
		return "portal/apps/category_form";
	}

	/**
	 * 添加渠道
	 * @param AppCategory
	 * @param request
	 * @return
	 * @throws IOException
	 * @throws ParseException
	 */
	@RequestMapping(value="/add.html",method=RequestMethod.POST)
	public String addAppType(@Valid @ModelAttribute("appTypeForm")AppCategoryForm appTypeForm, BindingResult result,HttpServletRequest request,Model model){
		
		if(result.hasErrors()){
			return "portal/apps/category_form";
		}
		AppCategory appType = appTypeForm.asPojo();
		appTypeService.addAppType(appType);
		//清空表单
		BeanUtils.copyProperties(new AppCategoryForm(), appTypeForm);
		model.addAttribute("success", true);
		return fromPage(appTypeForm, model);
	}
	
	/**
	 * 渠道列表
	 * @param AppCategory
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(value="/list.html")
	public String AppTypeList(@ModelAttribute("formParam")AppCategoryFormParam formParam,BindingResult result,HttpServletRequest request,Model model){
		int total = appTypeService.listTotal(formParam);
		formParam.setTotalCount(total);
		List<AppCategory> appTypeList = appTypeService.listCategory(formParam);
		model.addAttribute("appTypeList", appTypeList);
		return "portal/apps/category_list";
	}

	@RequestMapping(value="/{id}/edit.html",method=RequestMethod.GET)
	public String preEdit(@PathVariable int id,@ModelAttribute("appTypeForm")AppCategoryForm form,BindingResult result,Model model) throws ParseException, IOException{
		AppCategory appType = appTypeService.getCategory(id);
		List<AppCategory> resultList = appTypeService.getListByParent();
		model.addAttribute("appTypeList", resultList);
		BeanUtils.copyProperties(appType, form);
		return "portal/apps/category_edit";
	}
	/**
	 * 修改渠道
	 * @param AppCategory
	 * @param request
	 * @return
	 * @throws ParseException
	 * @throws IOException
	 */
	@RequestMapping(value="/{id}/edit.html",method=RequestMethod.POST)
	public String doEdit(@PathVariable int id,@Valid @ModelAttribute("appTypeForm")AppCategoryForm form, BindingResult result,HttpServletRequest request,Model model) throws ParseException, IOException{
		if( result.hasErrors()){
			return "portal/apps/category_edit";
		}
		form.setId(id);
		AppCategory appType = form.asPojo();
		appTypeService.updateCategory(appType);
		model.addAttribute("success", true);
		return preEdit(id, form, result,model);
	}
	/**
	 * 删除渠道，数据库标识删除
	 * @param id
	 * @return
	 */
	 @RequestMapping(value="/{id}/delete.html")
	public String adChanelDelete(@PathVariable int id,@ModelAttribute("appType")AppCategory appType,BindingResult result,HttpServletRequest request,Model model){
		appTypeService.deleteCategory(id);
		return "redirect:/apps/category/list.html";
	}
}