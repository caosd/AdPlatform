package com.stomato.domain;

import java.util.Date;

import com.google.gson.Gson;

/*
 * 用户帐单
 */
public class UserAccount {
	
	private Integer uid;
	
	private Double balance;
	
	private Date lastUpdateTime;
	
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
	
	public Date getLastUpdateTime() {
		return lastUpdateTime;
	}

	public void setLastUpdateTime(Date lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}

	@Override
	public String toString() {
		return new Gson().toJson(this);
	}
}
