package com.stomato.domain;

import java.util.Date;

import com.google.gson.Gson;

public class App {
	
	private int id;
	
	private int uid;
	
	private String key;
	
	private String name;
	
	private String pkg;
	
	private String icon;
	
	private int status;

	private Date lastUpdateTime;
	
	private Date createTime;
	
	private boolean allowPush;
	
	private boolean allowTrustee;
	
	private int delayPushInterval = -1;
	
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

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPkg() {
		return pkg;
	}

	public void setPkg(String pkg) {
		this.pkg = pkg;
	}

	public Date getLastUpdateTime() {
		return lastUpdateTime;
	}

	public void setLastUpdateTime(Date lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	public boolean isAllowPush() {
		return allowPush;
	}

	public void setAllowPush(boolean allowPush) {
		this.allowPush = allowPush;
	}

	public boolean isAllowTrustee() {
		return allowTrustee;
	}

	public void setAllowTrustee(boolean allowTrustee) {
		this.allowTrustee = allowTrustee;
	}

	public int getDelayPushInterval() {
		return delayPushInterval;
	}

	public void setDelayPushInterval(int delayPushInterval) {
		this.delayPushInterval = delayPushInterval;
	}

	@Override
	public String toString() {
		return new Gson().toJson(this);
	}
}
