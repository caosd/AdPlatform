package com.stomato.form;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.springframework.beans.BeanUtils;

import com.google.gson.Gson;
import com.stomato.domain.RptPush;

public class RptPushForm {
	
	private Integer id;
	// 日期
	@NotNull
	private Integer idate;
	// 广告id
	@NotNull
	private Integer adId;
	// 收入
	@Min(0)
	private Double revenue;
 
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getIdate() {
		return idate;
	}

	public void setIdate(Integer idate) {
		this.idate = idate;
	}

	public Integer getAdId() {
		return adId;
	}

	public void setAdId(Integer adId) {
		this.adId = adId;
	}

	public Double getRevenue() {
		return revenue;
	}

	public void setRevenue(Double revenue) {
		this.revenue = revenue;
	}

	@Override
	public String toString() {
		return new Gson().toJson(this);
	}

	public RptPush asPojo() {
		RptPush param = new RptPush();
		BeanUtils.copyProperties(this, param);
		return param;
	}
}
