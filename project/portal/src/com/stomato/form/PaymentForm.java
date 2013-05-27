package com.stomato.form;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;

import org.springframework.beans.BeanUtils;

import com.google.gson.Gson;
import com.stomato.domain.Payment;

public class PaymentForm {
	
	@Min(1)
	@Max(2)
	private int payType;
	
	private String paypalLogin;
	
	private String beneficiaryName;

	private String bankName;

	private String bankAddress;

	private String iban;

	private String swiftCode;
	
	private boolean isIntermediary;

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
	
	@Override
	public String toString() {
		return new Gson().toJson(this);
	}
	
	public Payment asPojo() {
		Payment payment = new Payment();
		BeanUtils.copyProperties(this, payment);
		return payment;
	}
}
