package com.stomato.form;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.beans.BeanUtils;

import com.google.gson.Gson;
import com.stomato.domain.Company;

public class CompanyForm{

	private int id;
	@NotEmpty
	private String name;

	private String description;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return new Gson().toJson(this);
	}

	public Company asPojo() {
		Company company = new Company();
		BeanUtils.copyProperties(this, company);
		return company;
	}
}
