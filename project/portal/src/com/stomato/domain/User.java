package com.stomato.domain;

import java.io.Serializable;
import java.util.Date;
import com.google.gson.Gson;

public class User implements Serializable {
	
	private static final long serialVersionUID = -1486031757640904209L;
	
	private int id;

	private String userName;
	
	private String password;
	
	private String email;
	
	private Integer accountType;
	
	private String companyName;
	
	private String country;

	private String address;
	
	private String firstName;
	
	private String lastName;
	
	private Date regDate;
	
	private String loginToken;
	
	private Date loginTokenTime;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getAccountType() {
		return accountType;
	}

	public void setAccountType(Integer accountType) {
		this.accountType = accountType;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	
	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
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
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	@Override
	public String toString() {
		return new Gson().toJson(this);
	}
}
