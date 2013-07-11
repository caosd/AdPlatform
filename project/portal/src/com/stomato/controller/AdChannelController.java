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

import com.stomato.domain.AdChannel;
import com.stomato.domain.BaseParam;
import com.stomato.form.AdChannelForm;
import com.stomato.service.AdChannelService;

@Controller
@RequestMapping(value="/adchannel")
public class AdChannelController {

	//private Logger logger = Logger.getLogger(AdChannelController.class);
	@Autowired
	private AdChannelService adChannelService ;
	/**
	 * goto 进入天津渠道页面
	 * @return
	 */
	@RequestMapping(value="/formpage.html",method=RequestMethod.GET)
	public String fromPage(@ModelAttribute("adChannelForm") AdChannelForm adChannelForm){
		return "portal/adchannel/adChannelForm";
	}

	/**
	 * 添加渠道
	 * @param AdChannel
	 * @param request
	 * @return
	 * @throws IOException
	 * @throws ParseException
	 */
	@RequestMapping(value="/formpage.html",method=RequestMethod.POST)
	public String addAdChannel(@Valid @ModelAttribute("adChannelForm")AdChannelForm AdChannelForm, BindingResult result,HttpServletRequest request,Model model) throws IOException, ParseException{
		
		if(result.hasErrors()){
			return "portal/adchannel/adChannelForm";
		}
		AdChannel adChannel = AdChannelForm.asPojo();
		adChannelService.addAdChannel(adChannel);
		model.addAttribute("success", true);
		return "portal/adchannel/adChannelForm";
	}
	
	/**
	 * 展示渠道信息
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/showAdChannel.html")
	public String showAdChannel(int id,HttpServletRequest request){
		AdChannel AdChannel = adChannelService.getAdChannel(id);
		request.setAttribute("adChannel", AdChannel);
		return "portal/adchannel/adChannelShow";
	}
	
	/**
	 * 渠道列表
	 * @param AdChannel
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(value="/adChannelList.html")
	public String adChannelList(@ModelAttribute("adChannel")AdChannel adChannel,BindingResult result,HttpServletRequest request,Model model){
		
		int total = adChannelService.listTotal(adChannel);
		BaseParam baseParam = new BaseParam(request,total);
		baseParam.setParam(adChannel);
		List<AdChannel> AdChannelList = adChannelService.listAdChannel(baseParam);
		model.addAttribute("pageBean", baseParam);
		model.addAttribute("adChannelList", AdChannelList);
		return "portal/adchannel/adChannelList";
	}

	@RequestMapping(value="/updateAdChannel.html",method=RequestMethod.GET)
	public String adChannelUpdate(@ModelAttribute("adChannelForm")AdChannelForm form,int id,Model model) throws ParseException, IOException{

		AdChannel adChannel = adChannelService.getAdChannel(id);
		model.addAttribute("adChannel",adChannel);
		return "portal/adchannel/adChannelUpdate";
	}
	/**
	 * 修改渠道
	 * @param AdChannel
	 * @param request
	 * @return
	 * @throws ParseException
	 * @throws IOException
	 */
	@RequestMapping(value="/updateAdChannel.html",method=RequestMethod.POST)
	public String adChannelUpdate(@Valid @ModelAttribute("adChannelForm")AdChannelForm form, BindingResult result,HttpServletRequest request,Model model) throws ParseException, IOException{
		if( result.hasErrors()){
			return "portal/adchannel/adChannelUpdate";
		}
		AdChannel adChannel = form.asPojo();
		adChannelService.updateAdChannel(adChannel);
		model.addAttribute("success", true);
		return "portal/adchannel/adChannelUpdate";
	}
	/**
	 * 删除渠道，数据库标识删除
	 * @param id
	 * @return
	 */
	 @RequestMapping(value="/deleteAdChannel.html")
	public String adChanelDelete(@ModelAttribute("adChannel")AdChannel adChannel,int id,BindingResult result,HttpServletRequest request,Model model){
		adChannelService.deleteAdChannel(id);
		model.addAttribute("success", "del");
		model.addAttribute("goto", "/adchannel/adChannelList.html");
		return "redirect:/portal/result/success";
	}
}