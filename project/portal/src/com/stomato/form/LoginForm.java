package com.stomato.form;

import javax.validation.constraints.Size;

import org.springframework.beans.BeanUtils;

import com.google.gson.Gson;
import com.stomato.domain.User;

public class LoginForm {

	@Size(min = 5, max = 20)
	private String userName;

	@Size(min = 6, max = 20)
	private String password;
	
	private String nextUrl;

	private String vcode;
	
	private boolean remember;
	
	private String formToken;

	public String getFormToken() {
		return formToken;
	}

	public void setFormToken(String formToken) {
		this.formToken = formToken;
	}

	public String getVcode() {
		return vcode;
	}

	public void setVcode(String vcode) {
		this.vcode = vcode;
	}

	public String getNextUrl() {
		return nextUrl;
	}

	public void setNextUrl(String nextUrl) {
		this.nextUrl = nextUrl;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserName() {
		return userName;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword() {
		return password;
	}
	
	public boolean getRemember() {
		return remember;
	}

	public void setRemember(boolean remember) {
		this.remember = remember;
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
