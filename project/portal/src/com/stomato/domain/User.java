package com.stomato.domain;

import java.io.Serializable;
import java.util.Date;

import com.google.gson.Gson;

public class User implements Serializable {

	private static final long serialVersionUID = -1486031757640904209L;

	private Integer uid;

	private String userName;

	private String password;

	private String email;

	private Integer type;

	private String company;

	private String contactName;

	private String contactTel;

	private String qq;

	private String website;

	private Date createtime;

	private String loginToken;

	private Date loginTokenTime;
	
	private Integer status;

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public String getLoginToken() {
		return loginToken;
	}

	public void setLoginToken(String loginToken) {
		this.loginToken = loginToken;
	}

	public Date getLoginTokenTime() {
		return loginTokenTime;
	}

	public void setLoginTokenTime(Date loginTokenTime) {
		this.loginTokenTime = loginTokenTime;
	}

	@Override
	public String toString() {
		return new Gson().toJson(this);
	}
}
