package com.stomato.form;

import java.util.Date;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;

import org.springframework.beans.BeanUtils;

import com.google.gson.Gson;
import com.stomato.domain.AdPush;
import com.stomato.utils.DateUtils;

public class AdPushForm {

	private Integer id;

	private Date pushDate;

	private Boolean firstPush;
	@Max(1000)
	@Min(1)
	private Integer maxPush;
	@Min(1)
	private Integer realPush;
	@Min(0)
	private Double money;

	private Boolean status;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getPushDate() {
		return pushDate;
	}
	public String getPushDateStr() {
		if( pushDate != null )
			return DateUtils.getInstance().formateDate(pushDate);
		return "";
	}
	public void setPushDateStr(String pushDateStr) {
		pushDate = DateUtils.getInstance().stringToDate(pushDateStr);
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

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return new Gson().toJson(this);
	}

	public AdPush asPojo() {
		AdPush param = new AdPush();
		BeanUtils.copyProperties(this, param);
		return param;
	}
}
