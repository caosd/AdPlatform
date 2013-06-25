package com.stomato.vo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.stomato.domain.PublicModel;
import com.stomato.domain.Menu;
import com.stomato.domain.Role;
import com.stomato.service.MenuService;
import com.stomato.service.RoleService;
import com.stomato.utils.SpringContextUtil;

public class SysConfig {
	
	private static Map<Integer,String> statusMap = new HashMap<Integer,String>();
	
	private static Map<Integer,String> adTypeMap = new HashMap<Integer,String>();
	
	/**
	 * 角色 id -- name map
	 */
	private static Map<Integer,String> roleMap = new HashMap<Integer,String>();
	
	/**
	 * 角色列表
	 */
	private static List<Role> roleList = new ArrayList<Role>();
	
	/**
	 * 菜单 列表
	 */
	private static List<Menu> menuSys = new ArrayList<Menu>();
	
	static{
		statusMap.put(0, "有效");
		statusMap.put(1, "无效");
		
		adTypeMap.put(0, "热门");
		adTypeMap.put(1, "应用");
		adTypeMap.put(2, "游戏");
	}
	
	public static String getStatus(int status){
		return statusMap.get(status);
	}
	
	public static String getAdType(int adType){
		return adTypeMap.get(adType);
	}
	
	public static int[] list2int(List<Integer> list){
		if(list != null){
			int []paramTypes = new int[list.size()];
			for(int i=0;i<list.size();i++){
				paramTypes[i] = list.get(i);
			}
			return paramTypes ;
		}
		return null;
	}
	
	public static int getPageTotal(int total , int pageSize){
		int pageTotal = total/pageSize;
		if(total%pageSize != 0){
			return pageTotal+1 ;
		}
		return pageTotal ;
	}
	
	
	public static void clearMenuSys(){
		menuSys.clear();
	}
	
	public static List<Menu> getMenuSys(){
		if(menuSys.isEmpty()){
			MenuService menuService = (MenuService)SpringContextUtil.getBean("menuService");
			menuSys = menuService.getMenuSys(); ;
		}
		return menuSys;
	}
	
	public static void clearRoleMap(){
		roleMap.clear();
	}
	
	public static Map<Integer,String> getRoleMap(){
		if(roleMap.isEmpty()){
			RoleService roleService = (RoleService)SpringContextUtil.getBean("roleService");
			putRoleMap(roleService.listRole(new PublicModel()));
		}
		return roleMap;
	}
	
	public static void clearRoleList(){
		roleList.clear();
	}

	public static List<Role> getRoleList(){
		if(roleList.isEmpty()){
			RoleService roleService = (RoleService)SpringContextUtil.getBean("roleService");
			roleList = roleService.listRole(new PublicModel());
		}
		return roleList;
	}
	
	private static void putRoleMap(List<Role> roleList){
		for(Role role:roleList){
			roleMap.put(role.getId(), role.getRoleName());
		}
	}
}
