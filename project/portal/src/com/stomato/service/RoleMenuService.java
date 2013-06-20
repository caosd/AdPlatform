package com.stomato.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stomato.dao.RoleMenuDao;

@Service
public class RoleMenuService {

	@Autowired
	private RoleMenuDao roleMenuDao ;

	public void editRoleMenu(int role_id,Integer[] menuIdArr){
		roleMenuDao.deleteRoleMenu(role_id);
		if(menuIdArr != null){
			for(Integer menuId:menuIdArr){
				roleMenuDao.addRoleMenu(role_id,menuId);
			}
		}
	}
	
	public List<Integer> listRoleMenu(int role_id){
		return roleMenuDao.listRoleMenu(role_id);
	}
}
