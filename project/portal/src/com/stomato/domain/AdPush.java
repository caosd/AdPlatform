package com.stomato.domain;

import java.util.Date;

public class AdPush {
	private Integer id;

	private Integer adresourceId;

	private Date pushDate;

	private Boolean firstPush;

	private Integer maxPush;

	private Integer realPush;

	private Double money;

	private Boolean status;

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getAdresourceId() {
		return adresourceId;
	}

	public void setAdresourceId(Integer adresourceId) {
		this.adresourceId = adresourceId;
	}

	public Date getPushDate() {
		return pushDate;
	}

	public void setPushDate(Date pushDate) {
		this.pushDate = pushDate;
	}

	public Boolean getFirstPush() {
		return firstPush;
	}

	public void setFirstPush(Boolean firstPush) {
		this.firstPush = firstPush;
	}

	public Integer getMaxPush() {
		return maxPush;
	}

	public void setMaxPush(Integer maxPush) {
		this.maxPush = maxPush;
	}

	public Integer getRealPush() {
		return realPush;
	}

	public void setRealPush(Integer realPush) {
		this.realPush = realPush;
	}

	public Double getMoney() {
		return money;
	}

	public void setMoney(Double money) {
		this.money = money;
	}
}
