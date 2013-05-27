package com.stomato.domain;

import java.util.Date;

import com.google.gson.Gson;

public class Password {
	
	private String email;
	
	private String token;
	
	private Date expireTime;
	
	private boolean enable;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public Date getExpireTime() {
		return expireTime;
	}

	public void setExpireTime(Date expireTime) {
		this.expireTime = expireTime;
	}

	public boolean isEnable() {
		return enable;
	}

	public void setEnable(boolean enable) {
		this.enable = enable;
	}
	
	@Override
	public String toString() {
		return new Gson().toJson(this);
	}
}
