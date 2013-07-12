package com.stomato.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.stomato.domain.BaseParam;
import com.stomato.domain.Company;
import com.stomato.form.CompanyForm;
import com.stomato.service.CompanyService;

@Controller
@RequestMapping(value="/company")
public class CompanyController {

	private Logger logger = Logger.getLogger(CompanyController.class);
	@Autowired
	private CompanyService companyService ;
	/**
	 * goto 进入天津渠道页面
	 * @return
	 */
	@RequestMapping(value="/formpage.html",method=RequestMethod.GET)
	public String fromPage(@ModelAttribute("companyForm") CompanyForm companyForm){
		return "portal/company/companyForm";
	}

	/**
	 * 添加渠道
	 * @param company
	 * @param request
	 * @return
	 * @throws IOException
	 * @throws ParseException
	 */
	@RequestMapping(value="/formpage.html",method=RequestMethod.POST)
	public String addCompany(@Valid @ModelAttribute("companyForm")CompanyForm companyForm, BindingResult result,HttpServletRequest request,Model model) throws IOException, ParseException{
		logger.info(String.format("addCompany[%s]",companyForm.getName()));
		if(result.hasErrors()){
			return "portal/company/companyForm";
		}
		Company company = companyForm.asPojo();
		companyService.addCompany(company);
		model.addAttribute("success", true);
		return "portal/company/companyForm";
	}
	
	/**
	 * 展示渠道信息
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/showCompany.html")
	public String showcompany(int id,HttpServletRequest request){
		Company company = companyService.getCompany(id);
		request.setAttribute("company", company);
		return "portal/company/companyShow";
	}
	
	/**
	 * 渠道列表
	 * @param company
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(value="/companyList.html")
	public String companyList(@ModelAttribute("company")Company company,BindingResult result,HttpServletRequest request,Model model){
		
		int total = companyService.listTotal(company);
		BaseParam baseParam = new BaseParam(request,total);
		baseParam.setParam(company);
		List<Company> companyList = companyService.listCompany(baseParam);
		model.addAttribute("pageBean", baseParam);
		model.addAttribute("companyList", companyList);
		return "portal/company/companyList";
	}

	@RequestMapping(value="/updateCompany.html",method=RequestMethod.GET)
	public String companyUpdate(@ModelAttribute("companyForm")CompanyForm form,int id,Model model) throws ParseException, IOException{
		Company company = companyService.getCompany(id);
		model.addAttribute("company",company);
		return "portal/company/companyUpdate";
	}
	/**
	 * 修改渠道
	 * @param company
	 * @param request
	 * @return
	 * @throws ParseException
	 * @throws IOException
	 */
	@RequestMapping(value="/updateCompany.html",method=RequestMethod.POST)
	public String companyUpdate(@Valid @ModelAttribute("companyForm")CompanyForm form, BindingResult result,HttpServletRequest request,Model model) throws ParseException, IOException{
		if( result.hasErrors()){
			return "portal/company/companyUpdate";
		}
		Company company = form.asPojo();
		companyService.updateCompany(company);
		model.addAttribute("success", true);
		return "portal/company/companyUpdate";
	}
	/**
	 * 删除渠道，数据库标识删除
	 * @param id
	 * @return
	 */
	 @RequestMapping(value="/deleteCompany.html")
	public String adChanelDelete(@ModelAttribute("company")Company company,int id,BindingResult result,HttpServletRequest request,Model model){
		companyService.deleteCompany(id);
		model.addAttribute("success", "del");
		model.addAttribute("goto", "/company/companyList.html");
		return "redirect:/portal/result/success";
	}
}