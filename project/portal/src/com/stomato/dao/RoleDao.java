package com.stomato.dao;

import java.util.List;

import com.stomato.domain.PublicParam;
import com.stomato.domain.Role;

public interface RoleDao {
	
	int addRole(Role role);
	
	Role getRole(int id);
	
	List<Role> listRole(PublicParam param);
	
	int listTotal(PublicParam param);
	
	void updateRole(Role role);
	
	void deleteRole(Role role);
}
