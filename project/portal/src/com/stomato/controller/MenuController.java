package com.stomato.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.stomato.domain.Menu;
import com.stomato.domain.PublicModel;
import com.stomato.service.MenuService;
import com.stomato.utils.StringUtils;

@Controller
@RequestMapping(value="/menu")
public class MenuController {

	private Logger logger = Logger.getLogger(MenuController.class);

	@Autowired
	private MenuService menuService ;
	
	/**
	 * goto 添加菜单页面
	 * @return
	 */
	@RequestMapping(value="/formpage.html")
	public String formpage(HttpServletRequest request){
		request.setAttribute("menuSys",menuService.getMenuSys());
		return "menu/menuForm" ;
	}
	
	/**
	 * 添加菜单
	 * @param menu
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/addMenu.html")
	public String addMenu(Menu menu,HttpServletRequest request){
		if(StringUtils.isEmpty(menu.getName())){
			logger.debug("菜单名称不能为空！");
			request.setAttribute("content", "菜单名称不能为空！");
			return "msg/error";
		}
		
		menuService.addMenu(menu);
		
		request.setAttribute("content", "添加菜单项成功！");
		return "msg/success";
	}
	
	/**
	 * 查找菜单
	 * @param id 菜单ID
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/getMenu.html")
	public String getEditMenu(int id,HttpServletRequest request){
		Menu menu = menuService.getMenu(id);
		if(StringUtils.isEmpty(menu.getName())){
			logger.debug("菜单项不存在！");
			request.setAttribute("content", "菜单项不存在！");
			return "msg/error";
		}
		request.setAttribute("menu", menu);
		request.setAttribute("menuSys",menuService.getMenuSys());
		return "menu/menuUpdate" ;
	}
	
	/**
	 * 修改菜单信息
	 * @param menu
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/updateMenu.html")
	public String updateMenu(Menu menu,HttpServletRequest request){
		if(StringUtils.isEmpty(menu.getName())){
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
	 * @param menu
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/listMenu.html")
	public String listMenu(HttpServletRequest request){
		
		/*int total = menuService.listTotal(MenuDTO.listTotalSql, null, null);
		int pageTotal = SysConfig.getPageTotal(total, menu.getPageSize());
		if(pageTotal<menu.getPageNum()){
			menu.setPageNum(1);
		}
		int start = (menu.getPageNum()-1)*menu.getPageSize();*/
		
		List<Menu> list = menuService.listMenu(new PublicModel());
		
	//	request.setAttribute("pageTotal", pageTotal);
	//	request.setAttribute("menu", menu);
		request.setAttribute("menuList", list);
		
		return "menu/menuList" ;
	}
}
