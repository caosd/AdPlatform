package com.stomato.form;


import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.beans.BeanUtils;

import com.google.gson.Gson;
import com.stomato.domain.UserChannel;

public class UserChannelForm{
	
	private Integer id;
	private Integer companyId;
	@NotEmpty
	private String channelNo;
	private String description;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}

	public String getChannelNo() {
		return channelNo;
	}

	public void setChannelNo(String channelNo) {
		this.channelNo = channelNo;
	}

	@Override
	public String toString() {
		return new Gson().toJson(this);
	}

	public UserChannel asPojo() {
		UserChannel param = new UserChannel();
		BeanUtils.copyProperties(this, param);
		return param;
	}
}
