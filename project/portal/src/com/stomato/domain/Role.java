package com.stomato.domain;

import java.util.Date;
import java.util.List;

/**
 * 角色
 * @author zyf
 *
 */
public class Role{

	private Integer id ;
	
	private String roleName ;
	
	private Integer status;
	
	private Integer isDel;
	
	private Date createDate ;
	
	public Role(){}
	
	public Role(String roleName){
		this.roleName = roleName ;
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

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getIsDel() {
		return isDel;
	}

	public void setIsDel(Integer isDel) {
		this.isDel = isDel;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	
}
