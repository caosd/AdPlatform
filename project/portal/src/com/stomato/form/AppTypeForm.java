package com.stomato.form;

import org.springframework.beans.BeanUtils;

import com.google.gson.Gson;
import com.stomato.domain.AppType;

public class AppTypeForm{

	private Integer id;

	private String typeName;

	private String description;

	private Integer parent;

	private Boolean visible;

	private Integer orderNo;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getParent() {
		return parent;
	}

	public void setParent(Integer parent) {
		this.parent = parent;
	}

	public Boolean getVisible() {
		return visible;
	}

	public void setVisible(Boolean visible) {
		this.visible = visible;
	}

	public Integer getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}

	@Override
	public String toString() {
		return new Gson().toJson(this);
	}

	public AppType asPojo() {
		AppType param = new AppType();
		BeanUtils.copyProperties(this, param);
		return param;
	}
}
