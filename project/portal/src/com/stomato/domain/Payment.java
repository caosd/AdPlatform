package com.stomato.domain;

import java.util.Date;

import com.google.gson.Gson;

public class Payment {
	
	private int uid;
	
	private int payType;
	
	private String paypalLogin;
	
	private String beneficiaryName;
	
	private String bankName;
	
	private String bankAddress;
	
	private String iban;
	
	private String swiftCode;
	
	private boolean isIntermediary;
	
	private Date createDate;
	
	private Date lastUpdateDate;

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}
	
	public int getPayType() {
		return payType;
	}

	public void setPayType(int payType) {
		this.payType = payType;
	}

	public String getPaypalLogin() {
		return paypalLogin;
	}

	public void setPaypalLogin(String paypalLogin) {
		this.paypalLogin = paypalLogin;
	}

	public String getBeneficiaryName() {
		return beneficiaryName;
	}

	public void setBeneficiaryName(String beneficiaryName) {
		this.beneficiaryName = beneficiaryName;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getBankAddress() {
		return bankAddress;
	}

	public void setBankAddress(String bankAddress) {
		this.bankAddress = bankAddress;
	}

	public String getIban() {
		return iban;
	}

	public void setIban(String iban) {
		this.iban = iban;
	}

	public String getSwiftCode() {
		return swiftCode;
	}

	public void setSwiftCode(String swiftCode) {
		this.swiftCode = swiftCode;
	}

	public boolean getIsIntermediary() {
		return isIntermediary;
	}

	public void setIsIntermediary(boolean isIntermediary) {
		this.isIntermediary = isIntermediary;
	}
	
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	public Date getLastUpdateDate() {
		return lastUpdateDate;
	}

	public void setLastUpdateDate(Date lastUpdateDate) {
		this.lastUpdateDate = lastUpdateDate;
	}
	
	@Override
	public String toString() {
		return new Gson().toJson(this);
	}
	
}
