package com.stomato.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.stomato.domain.Menu;
import com.stomato.domain.MenuParam;
import com.stomato.form.MenuForm;
import com.stomato.form.MenuParamForm;
import com.stomato.service.MenuService;
import com.stomato.utils.StringUtils;
import com.stomato.vo.SysConfig;

@Controller
@RequestMapping(value = "/menu")
public class MenuController {

	private Logger logger = Logger.getLogger(MenuController.class);

	@Autowired
	private MenuService menuService;

	/**
	 * goto 添加菜单页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/formpage.html",method=RequestMethod.GET)
	public String formpage(@ModelAttribute("menuForm") MenuForm menuForm,HttpServletRequest request) {
		request.setAttribute("parentMenus",menuService.listParentMenu());
		return "portal/menu/menuForm";
	}

	/**
	 * 添加菜单
	 * 
	 * @param menu
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/formpage.html",method=RequestMethod.POST)
	public String addMenu(@Valid @ModelAttribute("menuForm") MenuForm menuForm, BindingResult result, HttpServletRequest request) {
		menuService.addMenu(menuForm.asPojo());
		request.setAttribute("content", "添加菜单项成功！");
		request.setAttribute("parentMenus",menuService.listParentMenu());
		return "portal/menu/menuForm";
	}

	/**
	 * 查找菜单
	 * 
	 * @param id
	 *            菜单ID
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/getMenu.html")
	public String getEditMenu(int id, HttpServletRequest request) {
		Menu menu = menuService.getMenu(id);
		if (StringUtils.isEmpty(menu.getName())) {
			logger.debug("菜单项不存在！");
			request.setAttribute("content", "菜单项不存在！");
			return "msg/error";
		}
		request.setAttribute("menu", menu);
		// request.setAttribute("menuSys",menuService.getMenuSys());
		return "portal/menu/menuUpdate";
	}

	/**
	 * 修改菜单信息
	 * 
	 * @param menu
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/updateMenu.html")
	public String updateMenu(Menu menu, HttpServletRequest request) {
		if (StringUtils.isEmpty(menu.getName())) {
			logger.debug("菜单名称不能为空！");
			request.setAttribute("content", "菜单名称不能为空！");
			return "msg/error";
		}
		menuService.updateMenu(menu);
		request.setAttribute("content", "修改菜单信息成功！");
		return "msg/success";
	}

	/**
	 * 菜单列表
	 * 
	 * @param menu
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/listMenu.html")
	public String listMenu(@Valid @ModelAttribute("menuParamForm") MenuParamForm paramForm, BindingResult result,HttpServletRequest request) {
		MenuParam menuParam = paramForm.asPojo();
		int total = menuService.listTotal(menuParam);
		int pageTotal = SysConfig.getPageTotal(total, menuParam.getPageSize());
		if(pageTotal<menuParam.getPageNum()){ menuParam.setPageNum(1); } 
		int start = (menuParam.getPageNum()-1)*menuParam.getPageSize();
		menuParam.setSlimt(start);

		List<Menu> list = menuService.listMenu(menuParam);

		request.setAttribute("pageTotal", pageTotal);
		request.setAttribute("totalcount", total);
		request.setAttribute("pageNum", menuParam.getPageNum());
		request.setAttribute("menuList", list);
		return "portal/menu/menuList";
	}
}
