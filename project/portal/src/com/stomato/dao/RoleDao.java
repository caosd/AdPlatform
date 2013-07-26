package com.stomato.dao;

import java.util.List;

import com.stomato.domain.Role;
import com.stomato.form.RoleFormParam;

public interface RoleDao {
	
	int addRole(Role role);
	
	Role getRole(int id);
	
	List<Role> listRole(RoleFormParam param);
	
	int listTotal(RoleFormParam param);
	
	void updateRole(Role role);
	
	void deleteRole(Role role);
}
