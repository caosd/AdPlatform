package com.stomato.domain;

import java.util.Date;

public class PushTest {

	private int id;
	
	private int uid;
	
	private String appKey;
	
	private String testKey;
	
	private String desc;
	
	private Date lastUpdateTime;

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
	public String getAppKey() {
		return appKey;
	}

	public void setAppKey(String appKey) {
		this.appKey = appKey;
	}

	public String getTestKey() {
		return testKey;
	}

	public void setTestKey(String testKey) {
		this.testKey = testKey;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public Date getLastUpdateTime() {
		return lastUpdateTime;
	}

	public void setLastUpdateTime(Date lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}
}
