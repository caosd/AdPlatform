package com.stomato.form;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.beans.BeanUtils;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.stomato.domain.Credentials;

public class CredentialForm {
	private Long id;

	private Long uid;

	private Integer credentialsType;
	@NotEmpty
	private String credentialsNo;
	
	private MultipartFile file1;

	private MultipartFile file2;
	
	private String bankName;
	@NotEmpty
	private String bankCard;
	@NotEmpty
	private String bankAccount;
	@NotEmpty
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

	public MultipartFile getFile1() {
		return file1;
	}

	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}

	public MultipartFile getFile2() {
		return file2;
	}

	public void setFile2(MultipartFile file2) {
		this.file2 = file2;
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
