package com.stomato.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.stomato.domain.BaseParam;
import com.stomato.domain.Company;
import com.stomato.domain.UserChannel;
import com.stomato.form.UserChannelForm;
import com.stomato.service.CompanyService;
import com.stomato.service.UserChannelService;

@Controller
@RequestMapping(value="/userchannel")
public class UserChannelController {

	//private Logger logger = Logger.getLogger(UserChannelController.class);
	@Autowired
	private UserChannelService userChannelService ;
	@Autowired
	private CompanyService companyService;
	/**
	 * goto 进入天津渠道页面
	 * @return
	 */
	@RequestMapping(value="/formpage.html",method=RequestMethod.GET)
	public String fromPage(@ModelAttribute("userChannelForm") UserChannelForm userChannelForm,BindingResult result,Model model){
		List<Company> companyList = companyService.getCompanyListByActive();
		model.addAttribute("companyList", companyList);
		return "portal/userchannel/userChannelForm";
	}

	/**
	 * 添加渠道
	 * @param UserChannel
	 * @param request
	 * @return
	 * @throws IOException
	 * @throws ParseException
	 */
	@RequestMapping(value="/formpage.html",method=RequestMethod.POST)
	public String addUserChannel(@Valid @ModelAttribute("userChannelForm")UserChannelForm userChannelForm, BindingResult result,HttpServletRequest request,Model model) throws IOException, ParseException{
		
		if(result.hasErrors()){
			return "portal/userchannel/userChannelForm";
		}
		UserChannel userChannel = userChannelForm.asPojo();
		Company company = companyService.getCompany(userChannel.getCompanyId());
		if( company == null ){
			model.addAttribute("success", false);
			return "portal/userchannel/userChannelForm";
		}
		userChannel.setCompanyName(company.getName());
		userChannelService.addUserChannel(userChannel);
		model.addAttribute("success", true);
		return fromPage(userChannelForm,result, model);
	}
	
	/**
	 * 展示渠道信息
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/showUserChannel.html")
	public String showUserChannel(int id,HttpServletRequest request){
		UserChannel userChannel = userChannelService.getUserChannel(id);
		request.setAttribute("userChannel", userChannel);
		return "portal/userchannel/userChannelShow";
	}
	
	/**
	 * 渠道列表
	 * @param UserChannel
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(value="/userChannelList.html")
	public String UserChannelList(@ModelAttribute("userChannel")UserChannel userChannel,BindingResult result,HttpServletRequest request,Model model){
		
		int total = userChannelService.listTotal(userChannel);
		BaseParam baseParam = new BaseParam(request,total);
		baseParam.setParam(userChannel);
		List<UserChannel> userChannelList = userChannelService.listUserChannel(baseParam);
		model.addAttribute("pageBean", baseParam);
		model.addAttribute("userChannelList", userChannelList);
		return "portal/userchannel/userChannelList";
	}

	@RequestMapping(value="/updateUserChannel.html",method=RequestMethod.GET)
	public String UserChannelUpdate(@ModelAttribute("userChannelForm")UserChannelForm form,int id,Model model) throws ParseException, IOException{

		UserChannel userChannel = userChannelService.getUserChannel(id);
		model.addAttribute("userChannel",userChannel);
		return "portal/userchannel/userChannelUpdate";
	}
	/**
	 * 修改渠道
	 * @param UserChannel
	 * @param request
	 * @return
	 * @throws ParseException
	 * @throws IOException
	 */
	@RequestMapping(value="/updateUserChannel.html",method=RequestMethod.POST)
	public String UserChannelUpdate(@Valid @ModelAttribute("UserChannelForm")UserChannelForm form, BindingResult result,HttpServletRequest request,Model model) throws ParseException, IOException{
		if( result.hasErrors()){
			return "portal/userchannel/userChannelUpdate";
		}
		UserChannel userChannel = form.asPojo();
		userChannelService.updateUserChannel(userChannel);
		model.addAttribute("success", true);
		return "portal/userchannel/userChannelUpdate";
	}
	/**
	 * 删除渠道，数据库标识删除
	 * @param id
	 * @return
	 */
	 @RequestMapping(value="/deleteUserChannel.html")
	public String adChanelDelete(@ModelAttribute("UserChannel")UserChannel userChannel,int id,BindingResult result,HttpServletRequest request,Model model){
		userChannelService.deleteUserChannel(id);
		model.addAttribute("success", "del");
		model.addAttribute("goto", "/userchannel/userChannelList.html");
		return "redirect:/portal/result/success";
	}
}