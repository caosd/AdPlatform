package com.stomato.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.stomato.dao.AdChannelParam;
import com.stomato.domain.AdChannel;
import com.stomato.form.AdChannelForm;
import com.stomato.form.AdChannelParamForm;
import com.stomato.service.AdChannelService;
import com.stomato.vo.SysConfig;

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
	public String addAdChannel(@Valid @ModelAttribute("adChannelForm")AdChannelForm AdChannelForm, BindingResult result,HttpServletRequest request) throws IOException, ParseException{
		
		if(result.hasErrors()){
			return "portal/adchannel/adChannelForm";
		}
		AdChannel adChannel = AdChannelForm.asPojo();
		adChannelService.addAdChannel(adChannel);
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
	public String AdChannelList(@ModelAttribute("adChannelParamForm")AdChannelParamForm paramForm,BindingResult result,HttpServletRequest request) throws ParseException{
		AdChannelParam param = paramForm.asPojo();
		int total = adChannelService.listTotal(param);
		int pageTotal = SysConfig.getPageTotal(total, param.getPageSize());
		if(pageTotal < param.getPageNum()){
			param.setPageNum(1);
		}
		int start = (param.getPageNum()-1) * param.getPageSize();
		param.setSlimt(start);
		List<AdChannel> AdChannelList = adChannelService.listAdChannel(param);
		request.setAttribute("pageTotal", pageTotal);
		request.setAttribute("AdChannelList", AdChannelList);
		request.setAttribute("totalcount", total);
		request.setAttribute("pageNum", param.getPageNum());
		return "portal/adchannel/adChannelList";
	}
	
	/**
	 * 修改渠道
	 * @param AdChannel
	 * @param request
	 * @return
	 * @throws ParseException
	 * @throws IOException
	 */
	@RequestMapping(value="/updateAdChannel.html")
	public String AdChannelUpdate(@Valid @ModelAttribute("adChannelForm")AdChannelForm form, BindingResult result,HttpServletRequest request) throws ParseException, IOException{
		if( result.hasErrors()){
			return "portal/adchannel/updateAdChannel";
		}
		AdChannel adChannel = form.asPojo();
		adChannelService.updateAdChannel(adChannel);
		return "portal/adchannel/updateAdChannel";
	}
}