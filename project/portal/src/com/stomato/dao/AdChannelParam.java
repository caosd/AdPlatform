package com.stomato.dao;

import com.stomato.domain.BaseParam;

public class AdChannelParam extends BaseParam {
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
}
