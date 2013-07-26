package com.stomato.form;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.beans.BeanUtils;

import com.google.gson.Gson;
import com.stomato.domain.AdChannel;

public class AdChannelForm{
	
	private int id; 
	@NotEmpty
	private String channelName;
	@NotEmpty
	private String contactTel;
	private String qq;
	@NotEmpty
	private String contactName;
	
	private String description;
	
	private Boolean enable;
	
	private Date createTime;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getChannelName() {
		return channelName;
	}

	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}
	
	public String getContactTel() {
		return contactTel;
	}

	public void setContactTel(String contactTel) {
		this.contactTel = contactTel;
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

	public Boolean getEnable() {
		return enable;
	}

	public void setEnable(Boolean enable) {
		this.enable = enable;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Override
	public String toString() {
		return new Gson().toJson(this);
	}

	public AdChannel asPojo() {
		AdChannel param = new AdChannel();
		BeanUtils.copyProperties(this, param);
		return param;
	}
}
