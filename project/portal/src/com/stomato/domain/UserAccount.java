package com.stomato.domain;

import com.google.gson.Gson;

/*
 * 用户帐单
 */
public class UserAccount {
	
	private Integer uid;
	
	private Double balance;
	
	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public Double getBalance() {
		return balance;
	}

	public void setBalance(Double balance) {
		this.balance = balance;
	}
	
	@Override
	public String toString() {
		return new Gson().toJson(this);
	}
}
