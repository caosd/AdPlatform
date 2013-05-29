package com.stomato.form;

import org.springframework.beans.BeanUtils;

import com.google.gson.Gson;
import com.stomato.domain.Credentials;

public class CredentialForm {
	private Long id;

	private Long uid;

	private Integer credentialsType;

	private String credentialsNo;

	private String bankName;

	private String bankCard;

	private String bankAccount;

	private String bankAddress;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getUid() {
		return uid;
	}

	public void setUid(Long uid) {
		this.uid = uid;
	}

	public Integer getCredentialsType() {
		return credentialsType;
	}

	public void setCredentialsType(Integer credentialsType) {
		this.credentialsType = credentialsType;
	}

	public String getCredentialsNo() {
		return credentialsNo;
	}

	public void setCredentialsNo(String credentialsNo) {
		this.credentialsNo = credentialsNo;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getBankCard() {
		return bankCard;
	}

	public void setBankCard(String bankCard) {
		this.bankCard = bankCard;
	}

	public String getBankAccount() {
		return bankAccount;
	}

	public void setBankAccount(String bankAccount) {
		this.bankAccount = bankAccount;
	}

	public String getBankAddress() {
		return bankAddress;
	}

	public void setBankAddress(String bankAddress) {
		this.bankAddress = bankAddress;
	}
	
	@Override
	public String toString() {
		return new Gson().toJson(this);
	}
	
	public Credentials asPojo() {
		Credentials credentials = new Credentials();
		BeanUtils.copyProperties(this, credentials);
		return credentials;
	}
}
