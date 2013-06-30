package com.stomato.dao;

import java.util.List;

import com.stomato.domain.Role;
import com.stomato.domain.RoleParam;

public interface RoleDao {
	
	int addRole(Role role);
	
	Role getRole(int id);
	
	List<Role> listRole(RoleParam param);
	
	int listTotal(RoleParam param);
	
	void updateRole(Role role);
	
	void deleteRole(Role role);
}
