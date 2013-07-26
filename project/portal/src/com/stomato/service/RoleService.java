package com.stomato.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stomato.dao.RoleDao;
import com.stomato.domain.Role;
import com.stomato.form.RoleFormParam;

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
	
	public int listTotal(RoleFormParam param){
		return roleDao.listTotal(param);
	}
	
	public List<Role> listRole(RoleFormParam param){
		return roleDao.listRole(param);
	}
	/**
	 * 根据角色名查询
	 * @param name
	 * @return
	 */
	public Role getRoleByName(String name){
		RoleFormParam param = new RoleFormParam();
		param.setRoleName(name);
		List<Role> resultList =  roleDao.listRole(param);
		if( null != resultList && resultList.size() > 0){
			return resultList.get(0);
		}
		return null;
	}
	
}
