package com.stomato.domain;

import java.util.Date;

import com.google.gson.Gson;

public class UserImei {
	
	private int id;
	
	private int uid;
	
	private int appId;
	
	private String imei;
	
	private int status;
	
	private long pushUid;

	private String description;
	
	private Date createTime;
	
	public UserImei() {
		
	}
	
	public UserImei(int uid, int appId) {
		this.uid = uid;
		this.appId = appId;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getAppId() {
		return appId;
	}

	public void setAppId(int appId) {
		this.appId = appId;
	}

	public String getImei() {
		return imei;
	}

	public void setImei(String imei) {
		this.imei = imei;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	public long getPushUid() {
		return pushUid;
	}

	public void setPushUid(long pushUid) {
		this.pushUid = pushUid;
	}
	
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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
}
