package com.stomato.domain;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * 财务信息表 
 * @author Jiandong
 *
 */
public class Credentials implements Serializable {
	
	/**  */
	private static final long serialVersionUID = -4177203006923019466L;

	private Integer id;

	private Integer uid;

	private Integer credentialsType;

	private String credentialsNo;

	private String credentialsPhoto1="";

	private String credentialsPhoto2="";

	private String bankName;

	private String bankCard;

	private String bankAccount;

	private String bankAddress;

	private Timestamp lastUpdateTime;

	private Timestamp createTime;

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

	public String getCredentialsPhoto1() {
		return credentialsPhoto1;
	}

	public void setCredentialsPhoto1(String credentialsPhoto1) {
		this.credentialsPhoto1 = credentialsPhoto1;
	}

	public String getCredentialsPhoto2() {
		return credentialsPhoto2;
	}

	public void setCredentialsPhoto2(String credentialsPhoto2) {
		this.credentialsPhoto2 = credentialsPhoto2;
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

	public Timestamp getLastUpdateTime() {
		return lastUpdateTime;
	}

	public void setLastUpdateTime(Timestamp lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}

	public Timestamp getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}
	
}

