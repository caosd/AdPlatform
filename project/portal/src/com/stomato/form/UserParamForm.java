package com.stomato.form;

import javax.validation.constraints.*;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.beans.BeanUtils;

import com.google.gson.Gson;
import com.stomato.domain.BaseParam;
import com.stomato.domain.User;
import com.stomato.domain.UserParam;

public class UserParamForm extends BaseParam{
	
	@Size (min=5, max=20)
	private String userName;
	
	@NotEmpty
	@Email
	private String email;
	
	private String company;
	
	private String contactName;

	private String contactTel;
	
	private String qq;
	
	private String website;
    

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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
	
	public UserParam asPojo() {
		UserParam user = new UserParam();
		BeanUtils.copyProperties(this, user);
		return user;
	}
}
