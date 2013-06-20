package com.stomato.dao;

import java.util.List;

import com.stomato.domain.BaseParam;
import com.stomato.domain.Role;

public interface RoleDao {
	
	int addRole(Role role);
	
	Role getRole(int id);
	
	List<Role> listRole(BaseParam param);
	
	int listTotal(BaseParam param);
	
	void updateRole(Role role);
	
	void deleteRole(Role role);
}
