package com.stomato.controller;

import java.sql.Types;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.stomato.domain.BaseParam;
import com.stomato.domain.Role;
import com.stomato.service.RoleMenuService;
import com.stomato.service.RoleService;
import com.stomato.utils.StringUtils;

import freemarker.template.utility.StringUtil;

@Controller
@RequestMapping(value="/role")
public class RoleController {

	private Logger logger = Logger.getLogger(RoleController.class);
	@Autowired
	private RoleService roleService ;
	
	@Autowired
	private RoleMenuService roleMenuService;
	
	/**
	 * goto 添加角色页面
	 * @return
	 */
	@RequestMapping(value="/formpage.html")
	public String roleFormPage(){
		return "role/roleForm" ;
	}

	/**
	 * 添加角色
	 * @param role
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/addRole.html")
	public String addRole(Role role,HttpServletRequest request){
		if(StringUtils.isEmpty(role.getRoleName())){
			request.setAttribute("content", "角色名不能为空！");
			logger.error("角色名不能为空！");
			return "msg/error";
		}
		roleService.addRole(role);
		initRoleMsg();
		request.setAttribute("content", "添加角色信息成功！");
		return "/msg/success";
	}
	
	/**
	 * 角色列表
	 * @param role
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/listRole.html")
	public String listRole(Role role,HttpServletRequest request){
		BaseParam param = new BaseParam();
		int total = roleService.listTotal(param);
		int pageTotal = SysConfig.getPageTotal(total, role.getPageSize());
		if(pageTotal<role.getPageNum()){
			role.setPageNum(1);
		}
		int start = (role.getPageNum()-1)*role.getPageSize();
		List<Role> list = roleService.listRole(RoleDTO.listSql, new Object[]{start,role.getPageSize()}, new int[]{Types.INTEGER,Types.INTEGER}, start);
		
		request.setAttribute("pageTotal", pageTotal);
		request.setAttribute("role", role);
		request.setAttribute("roleList", list);
		
		return "/role/roleList";
	}
	
	/**
	 * goto roleMenu page
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/roleFormpage.html")
	public String roleMenuPage(int id,HttpServletRequest request){
		Role role = roleService.selectRole(RoleDTO.selectSql, new Object[]{id}, new int[]{Types.INTEGER});
		if(role == null || StringUtil.isEmpty(role.getRoleName())){
			request.setAttribute("content", "角色不存在！");
			logger.error("角色不存在！id="+id);
			return "msg/error";
		}
		
		List<Integer> roleMenuIdList = roleMenuService.listRoleMenu(RoleMenuDTO.listRoleMenuIdSql, new Object[]{id}, new int[]{Types.INTEGER});
		request.setAttribute("roleMenuIdList", roleMenuIdList);
		request.setAttribute("role", role);
		return "role/roleMenu" ;
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
	
	/**
	 * 初始化 角色信息
	 */
	private void initRoleMsg(){
		SysConfig.clearRoleList();
		SysConfig.getRoleList();
		
		SysConfig.clearRoleMap();
		SysConfig.getRoleMap();
	}
}
