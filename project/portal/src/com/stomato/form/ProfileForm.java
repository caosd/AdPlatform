package com.stomato.form;

import javax.validation.constraints.*;

import org.springframework.beans.BeanUtils;

import com.google.gson.Gson;
import com.stomato.domain.User;

public class ProfileForm {
	
	private int id;
	
	@Min(1)
	@Max(2)
	private Integer accountType;
	
	private String companyName;
	
	private String country;

	private String address;
	
	private String firstName;
	
	private String lastName;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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
