package com.stomato.form;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.beans.BeanUtils;

import com.google.gson.Gson;
import com.stomato.domain.RoleParam;

public class RoleParamForm{
	
	private int id ;
	@NotEmpty
	private String roleName ;
	
	private int status;

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

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return new Gson().toJson(this);
	}
	
	public RoleParam asPojo() {
		RoleParam roleParam = new RoleParam();
		BeanUtils.copyProperties(this, roleParam);
		return roleParam;
	}
}
