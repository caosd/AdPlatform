package com.stomato.form;

import com.stomato.domain.FormParam;

public class CompanyFormParam extends FormParam {

	private String name;

	private Integer status;

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
