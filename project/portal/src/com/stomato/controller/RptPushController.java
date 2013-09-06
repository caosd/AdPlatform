package com.stomato.controller;

import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.stomato.domain.AdResource;
import com.stomato.domain.RptPush;
import com.stomato.exception.DaoException;
import com.stomato.exception.ServiceException;
import com.stomato.form.RptPushForm;
import com.stomato.form.RptPushFormParam;
import com.stomato.service.AdResourceService;
import com.stomato.service.PublicService;

@Controller
@RequestMapping(value="/rptpush")
public class RptPushController {
	
	private static final Logger log = Logger.getLogger(RptPushController.class);
	@Autowired
	private PublicService publicService;
    @Autowired
    private AdResourceService adResourceService;
	/**
	 * 渠道列表
	 * @param AppType
	 * @param request
	 * @return
	 * @throws Exception 
	 * @throws DaoException 
	 * @throws ServiceException 
	 * @throws ParseException
	 */
	@RequestMapping(value="/list.html")
	public String list(@ModelAttribute("formParam") RptPushFormParam formParam,BindingResult result,HttpServletRequest request,Model model){
		int total;
		try {
			total = publicService.queryForEntity("com.stomato.dao.RptPushDao.totalRows",Integer.class,formParam);
			formParam.setTotalCount(total);
			List<?> rptPushList = publicService.queryForListEntity("com.stomato.dao.RptPushDao.queryPage",List.class,formParam);
			model.addAttribute("rptPushList", rptPushList);
			return "portal/rptpush/rptpush_list";
		} catch (Exception err) {
			log.error("查询广告收入异常", err);
		}
		return "portal/errors/500";
	}
	@RequestMapping(value="/{id}/edit.html",method=RequestMethod.GET)
	public String preEdit(@PathVariable int id,@ModelAttribute("rptPushForm") RptPushForm form,Model model){
		try{
			RptPush rptPush = publicService.queryById("com.stomato.dao.RptPushDao.get", id);
			List<AdResource> adresourceList = adResourceService.listAdResource(null);
			BeanUtils.copyProperties(rptPush, form);
			model.addAttribute("adresourceList", adresourceList);
			return "portal/rptpush/rptpush_edit";
		} catch (Exception err) {
			log.error("进入编辑广告收入页面异常", err);
		}
		return "portal/errors/500";
	}
	@RequestMapping(value="/{id}/edit.html",method=RequestMethod.POST)
	public String doEdit(@PathVariable int id,@Valid @ModelAttribute("rptPushForm") RptPushForm form,BindingResult result,Model model){
		try{
			boolean hasErrors = result.hasErrors();
			if( !hasErrors ){
				RptPush rptPush = new RptPush();
				rptPush.setIdate(form.getIdate());
				rptPush.setAdId(form.getAdId());
				rptPush = publicService.queryForEntity("com.stomato.dao.RptPushDao.queryByCondition", RptPush.class, rptPush);
				if( rptPush == null ){
					hasErrors = true;
					result.rejectValue("idate", "side.rptpush.idate.not_found", "The date of the income was not found.");
				}else{
					publicService.update("com.stomato.dao.RptPushDao.update", form.asPojo());
					model.addAttribute("success", true);
				}
			}
			return preEdit(id, form,model);
		} catch (Exception err) {
			log.error("编辑广告收入异常", err);
		}
		return "portal/errors/500";
	}
	@RequestMapping(value="/export-excel")
	public void exportExcel(@ModelAttribute("formParam") RptPushFormParam formParam,BindingResult result,HttpServletRequest request,HttpServletResponse response){
	}
}