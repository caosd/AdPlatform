package com.stomato.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.stomato.domain.Menu;
import com.stomato.form.MenuForm;
import com.stomato.form.MenuFormParam;
import com.stomato.service.MenuService;
import com.stomato.utils.StringUtils;

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
		if (result.hasErrors()) {
			return "portal/menu/menuForm";
		}
		Menu menu = menuForm.asPojo();
		if( menu.getVisible() == null){
			menu.setVisible(0);
		}
		menuService.addMenu(menu);
		BeanUtils.copyProperties(new MenuForm(), menuForm);
		request.setAttribute("msg", "添加菜单项成功！");
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
	@RequestMapping(value = "/editMenu.html", method=RequestMethod.GET)
	public String getEditMenu(int id,@ModelAttribute("menuForm") MenuForm menuForm, HttpServletRequest request) {
		Menu menu = menuService.getMenu(id);
		if (StringUtils.isEmpty(menu.getName())) {
			logger.debug("菜单项不存在！");
			request.setAttribute("msg", "菜单项不存在！");
			return "portal/menu/menuUpdate";
		}
		request.setAttribute("parentMenus",menuService.listParentMenu());
		request.setAttribute("menu", menu);
		return "portal/menu/menuUpdate";
	}

	/**
	 * 修改菜单信息
	 * 
	 * @param menu
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/editMenu.html",method=RequestMethod.POST)
	public String updateMenu(@Valid @ModelAttribute("menuForm") MenuForm menuForm,BindingResult result, HttpServletRequest request) {
		if (result.hasErrors()) {
			return "portal/menu/menuUpdate";
		}
		Menu menu = menuForm.asPojo();
		if( menu.getVisible() == null){
			menu.setVisible(0);
		}
		menuService.updateMenu(menu);
		request.setAttribute("msg", "修改菜单信息成功！");
		request.setAttribute("parentMenus",menuService.listParentMenu());
		request.setAttribute("menu", menu);
		return "portal/menu/menuUpdate";
	}

	/**
	 * 菜单列表
	 * 
	 * @param menu
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/listMenu.html")
	public String listMenu(@Valid @ModelAttribute("formParam") MenuFormParam formParam, BindingResult result,HttpServletRequest request) {
		int total = menuService.listTotal(formParam);
		formParam.setTotalCount(total);
		List<Menu> list = menuService.listMenu(formParam);
		request.setAttribute("menuList", list);
		return "portal/menu/menuList";
	}
}
