package com.stomato.dao;

import java.util.List;

public interface RoleMenuDao {
	
	void deleteRoleMenu(int role_id);
	
	void addRoleMenu(int role_id,int menu_id);
	
	List<Integer> listRoleMenu(int role_id);
}
