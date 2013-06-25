package com.stomato.dao;

import java.util.List;

import com.stomato.domain.PublicModel;
import com.stomato.domain.Role;

public interface RoleDao {
	
	int addRole(Role role);
	
	Role getRole(int id);
	
	List<Role> listRole(PublicModel param);
	
	int listTotal(PublicModel param);
	
	void updateRole(Role role);
	
	void deleteRole(Role role);
}
