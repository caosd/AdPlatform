package com.stomato.form;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.beans.BeanUtils;

import com.google.gson.Gson;
import com.stomato.domain.Menu;

public class MenuForm{
	
private Integer id ;
	
	/**
	 * 菜单名称
	 */
	@NotEmpty
	private String name ;
	
	/**
	 * 描述
	 */
	private String desc ;
	
	/**
	 * 菜单路径
	 */
	private String path ;
	
	/**
	 * 父菜单ID 0表示没有父菜单
	 */
	private Integer parent ;
	
	/**
	 * 是否可见：0-不可见，1-可见
	 */
	private Integer visible ;

	/**
	 * 排序标识
	 */
	private String orderNo ;
	
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public Integer getParent() {
		return parent;
	}

	public void setParent(Integer parent) {
		this.parent = parent;
	}

	public Integer getVisible() {
		return visible;
	}

	public void setVisible(Integer visible) {
		this.visible = visible;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	@Override
	public String toString() {
		return new Gson().toJson(this);
	}
	
	public Menu asPojo() {
		Menu menu = new Menu();
		BeanUtils.copyProperties(this, menu);
		return menu;
	}

}
