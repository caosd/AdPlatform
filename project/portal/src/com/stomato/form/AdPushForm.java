package com.stomato.form;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;

import org.springframework.beans.BeanUtils;

import com.google.gson.Gson;
import com.stomato.domain.AdPush;

public class AdPushForm {

	private Integer id;

	private Boolean topPush;
	@Max(1000)
	@Min(1)
	private Integer maxPush;
	@Min(1)
	private Integer dailyPush;

	private Boolean status;

	public Integer getId() {
		return id;
	}

	public Boolean getTopPush() {
		return topPush;
	}

	public void setTopPush(Boolean topPush) {
		this.topPush = topPush;
	}

	public Integer getMaxPush() {
		return maxPush;
	}

	public void setMaxPush(Integer maxPush) {
		this.maxPush = maxPush;
	}

	public Integer getDailyPush() {
		return dailyPush;
	}

	public void setDailyPush(Integer dailyPush) {
		this.dailyPush = dailyPush;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	public void setId(Integer id) {
		this.id = id;
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
