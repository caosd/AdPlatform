package com.stomato.domain;

import java.util.Date;
import java.util.List;

/**
 * 角色
 * @author zyf
 *
 */
public class Role extends PublicModel{

	private int id ;
	
	private String roleName ;
	
	private int status;
	
	private int isDel;
	
	private Date createDate ;
	
	public Role(){}
	
	public Role(String roleName){
		this.roleName = roleName ;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public int getIsDel() {
		return isDel;
	}

	public void setIsDel(int isDel) {
		this.isDel = isDel;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	
	/**
	 * 角色菜单权限 非持久化对象
	 */
	
	private List<RoleMenu> roleMenuList ;

	public List<RoleMenu> getRoleMenuList() {
		return roleMenuList;
	}

	public void setRoleMenuList(List<RoleMenu> roleMenuList) {
		this.roleMenuList = roleMenuList;
	}
	
	
}
