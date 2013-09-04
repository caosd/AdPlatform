package com.stomato.controller;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.stomato.form.RptPushFormParam;
import com.stomato.service.BaseService;

@Controller
@RequestMapping(value="/rptpush")
public class RptPushController {
	
	@Autowired
	private BaseService baseService;
 
	/**
	 * 渠道列表
	 * @param AppType
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(value="/list.html")
	public String adPushList(@ModelAttribute("formParam") RptPushFormParam formParam,BindingResult result,HttpServletRequest request,Model model){
		return null;
	}
	
	@RequestMapping(value="/export-excel")
	public void exportExcel(@ModelAttribute("formParam") RptPushFormParam formParam,BindingResult result,HttpServletRequest request,HttpServletResponse response){
		/*int total = adPushService.listTotal(formParam);
		formParam.setTotalCount(total);
		List<Map<String,Object>> adPushList = adPushService.getListMap(formParam);
		
		Map<String,Object> beans = new HashMap<String,Object>();
		beans.put("adPushList", adPushList);
		beans.put("formParam", formParam);
		String tempFile = request.getSession().getServletContext().getRealPath("/")+"WEB-INF/report/template/adpush_report.xls";
		ExcelUtils.export2Excel("广告推送管理报表",tempFile, beans, response);*/
		return;
	}
}