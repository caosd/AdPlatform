package com.stomato.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stomato.dao.RoleDao;
import com.stomato.domain.BaseParam;
import com.stomato.domain.Role;

@Service
public class RoleService {

	@Autowired
	private RoleDao roleDao ;
	
	public void addRole(Role role){
		roleDao.addRole(role);
	}
	
	public Role getRole(int id){
		return roleDao.getRole(id);
	}
	
	public int listTotal(BaseParam param){
		return roleDao.listTotal(param);
	}
	
	public List<Role> listRole(BaseParam param){
		return roleDao.listRole(param);
	}
	
	
}
