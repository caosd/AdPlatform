package com.stomato.form;

import javax.validation.constraints.*;

import org.springframework.beans.BeanUtils;

import com.google.gson.Gson;
import com.stomato.domain.User;

public class ProfileForm {
	
	private int id;
	
	@Min(1)
	@Max(2)
	private Integer type;
	
	private String company;
	
	private String contactName;

	private String contactTel;
	
	private String qq;
	
	private String website;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getContactName() {
		return contactName;
	}

	public void setContactName(String contactName) {
		this.contactName = contactName;
	}

	public String getContactTel() {
		return contactTel;
	}

	public void setContactTel(String contactTel) {
		this.contactTel = contactTel;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	@Override
	public String toString() {
		return new Gson().toJson(this);
	}
	
	public User asPojo() {
		User user = new User();
		BeanUtils.copyProperties(this, user);
		return user;
	}
}
