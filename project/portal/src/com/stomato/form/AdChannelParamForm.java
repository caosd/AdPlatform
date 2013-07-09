package com.stomato.form;

import org.springframework.beans.BeanUtils;

import com.google.gson.Gson;
import com.stomato.dao.AdChannelParam;
import com.stomato.domain.BaseParam;

public class AdChannelParamForm extends BaseParam {
 
	private String channelName;
	
	private String chantactTel;
	
	private String qq;
	
	private String contactName;
	
	private String description;
	
	private Integer enable;
	
	
	public String getChannelName() {
		return channelName;
	}

	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}

	public String getChantactTel() {
		return chantactTel;
	}

	public void setChantactTel(String chantactTel) {
		this.chantactTel = chantactTel;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getContactName() {
		return contactName;
	}

	public void setContactName(String contactName) {
		this.contactName = contactName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getEnable() {
		return enable;
	}

	public void setEnable(Integer enable) {
		this.enable = enable;
	}

	@Override
	public String toString() {
		return new Gson().toJson(this);
	}

	public AdChannelParam asPojo() {
		AdChannelParam param = new AdChannelParam();
		BeanUtils.copyProperties(this, param);
		return param;
	}
}
