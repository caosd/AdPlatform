package com.stomato.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.stomato.domain.Menu;
import com.stomato.domain.MenuParam;
import com.stomato.domain.Role;
import com.stomato.domain.RoleParam;
import com.stomato.form.RoleForm;
import com.stomato.form.RoleParamForm;
import com.stomato.service.MenuService;
import com.stomato.service.RoleMenuService;
import com.stomato.service.RoleService;
import com.stomato.utils.StringUtils;
import com.stomato.vo.SysConfig;

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
	public String addRole(@ModelAttribute("roleForm") RoleForm roleForm,HttpServletRequest request){
		roleService.addRole(roleForm.asPojo());
		request.setAttribute("content", "添加角色信息成功");
		return "portal/role/roleForm";
	}
	
	/**
	 * 角色列表
	 * @param role
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/listRole.html")
	public String listRole(@ModelAttribute("roleParamForm") RoleParamForm paramForm,HttpServletRequest request){
		RoleParam roleForm = paramForm.asPojo();
		int total = roleService.listTotal(roleForm);
		int pageTotal = SysConfig.getPageTotal(total, roleForm.getPageSize());
		if(pageTotal<roleForm.getPageNum()){
			roleForm.setPageNum(1);
		}
		int start = (roleForm.getPageNum()-1)*roleForm.getPageSize();
		roleForm.setSlimt(start);
		List<Role> list = roleService.listRole(roleForm);
		
		request.setAttribute("pageTotal", pageTotal);
		request.setAttribute("totalcount", total);
		request.setAttribute("pageNum", roleForm.getPageNum());
		request.setAttribute("roleList", list);
		
		return "portal/role/roleList";
	}
	
	/**
	 * goto roleMenu page
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/roleFormpage.html")
	public String roleMenuPage(int id,HttpServletRequest request){
		Role role = roleService.getRole(id);
		if(role == null || StringUtils.isEmpty(role.getRoleName())){
			request.setAttribute("content", "角色不存在！");
			logger.error("角色不存在！id="+id);
			return "msg/error";
		}
		
		List<Integer> roleMenuIdList = roleMenuService.listRoleMenu(role.getId());
		List<Menu> menuList = menuService.listParentMenu();
		if(menuList != null){
			for (Menu menu : menuList) {
				MenuParam parent = new MenuParam();
				parent.setParent(menu.getId());
				List<Menu> sunMenuList = menuService.listMenu(parent);
				menu.setSunMenu(sunMenuList);
			}
		}
		request.setAttribute("roleMenuIdList", roleMenuIdList);
		request.setAttribute("menuList", menuList);
		request.setAttribute("role", role);
		return "portal/role/roleMenu" ;
	}
	
	/**
	 * 设置角色权限
	 * @param id 角色ID
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/setRoleMenu.html")
	public String setRoleMenu(int id,Integer[] menuIdArr,HttpServletRequest request){
		roleMenuService.editRoleMenu(id, menuIdArr);
		request.setAttribute("content", "修改角色权限成功");
		return "msg/success";
	}
}
