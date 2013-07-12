package com.stomato.domain;

import java.util.Date;

/**
 * Created with IntelliJ IDEA. User: Administrator Date: 13-6-28 Time: 上午7:36 To
 * change this template use File | Settings | File Templates.
 */
public class Company {
	private Integer id;

	private String name;

	private String description;

	private Date createDate;

	private Integer status;

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

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

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
}
