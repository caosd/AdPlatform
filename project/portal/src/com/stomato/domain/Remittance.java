package com.stomato.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * 申请汇款信息表
 * @author  jiandong
 */
public class Remittance implements Serializable {
	private static final long serialVersionUID = 1L;

	private Integer id;

	private Integer uid;

	private Double money;

	private String bankAccount;

	private String bankName;

	private String bankCard;

	private Integer status;

	private String remark;

	private Date remittanceTime;

	private Date createTime;

	private Date lastUpdateTime;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public Double getMoney() {
		return money;
	}

	public void setMoney(Double money) {
		this.money = money;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getBankAccount() {
		return bankAccount;
	}

	public void setBankAccount(String bankAccount) {
		this.bankAccount = bankAccount;
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

	public Date getRemittanceTime() {
		return remittanceTime;
	}

	public void setRemittanceTime(Date remittanceTime) {
		this.remittanceTime = remittanceTime;
	}

	public Date getLastUpdateTime() {
		return lastUpdateTime;
	}

	public void setLastUpdateTime(Date lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}
}

