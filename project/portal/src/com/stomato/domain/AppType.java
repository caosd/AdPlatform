package com.stomato.domain;

import java.util.ArrayList;
import java.util.List;

public class AppType {

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
	/**
	 * 非持久化对象
	 */
	private List<AppType> sunTypeList = new ArrayList<AppType>();

	public List<AppType> getSunTypeList() {
		return sunTypeList;
	}

	public void setSunTypeList(List<AppType> sunTypeList) {
		this.sunTypeList = sunTypeList;
	}
 
}
