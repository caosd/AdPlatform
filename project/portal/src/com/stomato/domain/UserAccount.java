package com.stomato.domain;

import java.sql.Timestamp;

import com.google.gson.Gson;

/*
 * 用户帐单
 */
public class UserAccount {
	
	private Integer id;
	
	private Integer uid;
	
	private Double balance;
	
	private Timestamp lastUpdateTime;
	
	
	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


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
	


	public Timestamp getLastUpdateTime() {
		return lastUpdateTime;
	}


	public void setLastUpdateTime(Timestamp lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}


	@Override
	public String toString() {
		return new Gson().toJson(this);
	}
}
