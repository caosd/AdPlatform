package com.stomato.form;

import org.hibernate.validator.constraints.NotEmpty;

import com.google.gson.Gson;

public class RoleFormParam extends PublicFormParam{

	private int id;
	@NotEmpty
	private String roleName;

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
}
