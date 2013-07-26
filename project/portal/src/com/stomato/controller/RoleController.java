package com.stomato.controller;

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

import com.stomato.domain.Menu;
import com.stomato.domain.Role;
import com.stomato.form.MenuFormParam;
import com.stomato.form.RoleForm;
import com.stomato.form.RoleFormParam;
import com.stomato.service.MenuService;
import com.stomato.service.RoleMenuService;
import com.stomato.service.RoleService;
import com.stomato.utils.StringUtils;

@Controller
@RequestMapping(value="/role")
public class RoleController {

	private Logger logger = Logger.getLogger(RoleController.class);
	@Autowired
	private RoleService roleService ;
	
	@Autowired
	private RoleMenuService roleMenuService;
	@Autowired
	private MenuService menuService;
	
	/**
	 * goto 添加角色页面
	 * @return
	 */
	@RequestMapping(value="/formpage.html",method=RequestMethod.GET)
	public String formPage(@ModelAttribute("roleForm") RoleForm roleForm){
		return "portal/role/roleForm" ;
	}

	/**
	 * 添加角色
	 * @param role
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/formpage.html",method=RequestMethod.POST)
	public String addRole(@Valid @ModelAttribute("roleForm") RoleForm roleForm,BindingResult result,HttpServletRequest request){
		if (result.hasErrors()) {
			return "portal/role/roleForm";
		}
		if( roleService.getRoleByName( roleForm.getRoleName() ) != null ){
			request.setAttribute("msg", "角色名称已存在,添加失败!");
			return "portal/role/roleForm";
		}
		roleService.addRole(roleForm.asPojo());
		roleForm.setRoleName("");
		request.setAttribute("msg", "添加角色信息成功!");
		return "portal/role/roleForm";
	}
	
	/**
	 * 角色列表
	 * @param role
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/listRole.html")
	public String listRole(@ModelAttribute("formParam") RoleFormParam formParam,HttpServletRequest request){
		int total = roleService.listTotal(formParam);
		formParam.setTotalCount(total);
		List<Role> list = roleService.listRole(formParam);
		request.setAttribute("roleList", list);
		return "portal/role/roleList";
	}
	
	/**
	 * goto roleMenu page
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/roleFormpage.html",method=RequestMethod.GET)
	public String roleMenuPage(int id,HttpServletRequest request, Model model){
		Role role = roleService.getRole(id);
		if(role == null || StringUtils.isEmpty(role.getRoleName())){
			request.setAttribute("msg", "角色不存在！");
			logger.error("角色不存在！id="+id);
			return "msg/error";
		}
		
		List<Integer> roleMenuIdList = roleMenuService.listRoleMenu(role.getId());
		List<Menu> menuList = menuService.listParentMenu();
		if(menuList != null){
			for (Menu menu : menuList) {
				MenuFormParam parent = new MenuFormParam();
				parent.setParent(menu.getId());
				List<Menu> sunMenuList = menuService.listMenu(parent);
				menu.setSunMenu(sunMenuList);
			}
		}
		model.addAttribute("selected", roleMenuIdList);
		model.addAttribute("menuList", menuList);
		model.addAttribute("role", role);
		return "portal/role/roleMenu" ;
	}
	
	/**
	 * 设置角色权限
	 * @param id 角色ID
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/roleFormpage.html",method=RequestMethod.POST)
	public String setRoleMenu(int id,Integer[] menuIdArr,HttpServletRequest request, Model model){
		roleMenuService.editRoleMenu(id, menuIdArr);
		request.setAttribute("msg", "修改角色权限成功");
		return roleMenuPage(id, request, model);
	}
}
