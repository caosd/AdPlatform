package com.stomato.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import com.stomato.domain.AdPush;
import com.stomato.form.AdPushForm;
import com.stomato.form.AdPushFormParam;
import com.stomato.service.AdPushService;
import com.stomato.utils.ExcelUtils;

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
	public String adPushList(@ModelAttribute("formParam") AdPushFormParam formParam,BindingResult result,HttpServletRequest request,Model model){
		int total = adPushService.listTotal(formParam);
		formParam.setTotalCount(total);
		List<Map<String,Object>> adPushList = adPushService.getListMap(formParam);
		model.addAttribute("adPushList", adPushList);
		return "portal/adpush/pushList";
	}

	@RequestMapping(value="/{id}/update.html",method=RequestMethod.GET)
	public String update(@PathVariable int id,@ModelAttribute("adPushForm")AdPushForm adPushForm,BindingResult result) throws ParseException, IOException{
		AdPush adPush = adPushService.get(id);
		BeanUtils.copyProperties(adPush, adPushForm);
		return "portal/adpush/pushUpdate";
	}
	@RequestMapping(value="/{id}/update.html",method=RequestMethod.POST)
	public String update(@PathVariable int id,@Valid @ModelAttribute("adPushForm")AdPushForm adPushForm,BindingResult result,Model model) throws ParseException, IOException{
		if( result.hasErrors()){
			return "portal/adpush/pushUpdate";
		}
		adPushForm.setId(id);
		adPushService.update(adPushForm.asPojo());
		model.addAttribute("success", true);
		return update(id, adPushForm, result);
	}
	/*@RequestMapping(value="/{id}/delete.html")
	public String delete(@PathVariable int id,Model model) throws ParseException, IOException{
		adPushService.delete(id);
		model.addAttribute("success", "del");
		model.addAttribute("_goto", "/adpush/pushList.html");
		return "redirect:/result/success";
	}*/
	
	@RequestMapping(value="/export-excel")
	public void exportExcel(@ModelAttribute("formParam") AdPushFormParam formParam,BindingResult result,HttpServletRequest request,HttpServletResponse response){
		int total = adPushService.listTotal(formParam);
		formParam.setTotalCount(total);
		List<Map<String,Object>> adPushList = adPushService.getListMap(formParam);
		
		Map<String,Object> beans = new HashMap<String,Object>();
		beans.put("adPushList", adPushList);
		beans.put("formParam", formParam);
		String tempFile = request.getSession().getServletContext().getRealPath("/")+"WEB-INF/report/template/adpush_report.xls";
		ExcelUtils.export2Excel("广告推送管理报表",tempFile, beans, response);
	}
}