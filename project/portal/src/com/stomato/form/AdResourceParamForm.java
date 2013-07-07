package com.stomato.form;

import java.util.Date;

import org.springframework.beans.BeanUtils;

import com.google.gson.Gson;
import com.stomato.domain.AdResourceParam;
import com.stomato.domain.BaseParam;

public class AdResourceParamForm extends BaseParam {

	private int id;

	/**
	 * 下载资源名称
	 */
	private String adName;

	/**
	 * 应用包名
	 */
	private String adPackage;

	/**
	 * 广告类型
	 */
	private int adType;

	/**
	 * 创建时间
	 */
	private Date itime;

	private Integer status;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAdName() {
		return adName;
	}

	public void setAdName(String adName) {
		this.adName = adName;
	}

	public String getAdPackage() {
		return adPackage;
	}

	public void setAdPackage(String adPackage) {
		this.adPackage = adPackage;
	}

	public int getAdType() {
		return adType;
	}

	public void setAdType(int adType) {
		this.adType = adType;
	}

	public Date getItime() {
		return itime;
	}

	public void setItime(Date itime) {
		this.itime = itime;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return new Gson().toJson(this);
	}

	public AdResourceParam asPojo() {
		AdResourceParam param = new AdResourceParam();
		BeanUtils.copyProperties(this, param);
		return param;
	}
}
