package com.stomato.domain;

public class FormParam {
	
	//查询起始日期
	private String startDate;
	
	//查询结束日期
	private String endDate;
	
	//每页展示数量
	private int pageSize = 1;
	
	//总数
	private int pageTotal;
	
	//当前页数，1开始
	private int pageNum = 1;
	
	//数据库查询偏移量
	private int offset;
	
	private int uid;
	
	private String name;
	
	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		if(pageSize == 15 || pageSize == 30 || pageSize == 50) { 
			this.pageSize = pageSize;
		}
	}

	public int getPageTotal() {
		return pageTotal;
	}

	public void setPageTotal(int pageTotal) {
		this.pageTotal = pageTotal;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		if (pageNum <= 0) {
			pageNum = 1;
		}
		this.pageNum = pageNum;
	}

	public int getOffset() {
		this.setOffset((this.getPageNum() - 1) * this.getPageSize());
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}
	
	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}