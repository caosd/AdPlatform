package com.stomato.dao;

import java.util.List;

import com.stomato.domain.RoleMenu;

public interface RoleMenuDao {
	
	void deleteRoleMenu(int role_id);
	
	void addRoleMenu(RoleMenu roleMenu);
	
	List<Integer> listRoleMenu(int role_id);
}
