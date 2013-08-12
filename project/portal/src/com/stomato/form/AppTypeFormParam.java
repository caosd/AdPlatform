package com.stomato.form;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.stomato.utils.DateUtils;
import com.stomato.vo.SysConfig;

public class AppTypeFormParam{

	private String typeName;

	private Boolean visible;

	private Integer Parent;

	//查询起始日期
	private String startDate;
	
	//查询结束日期
	private String endDate;
	
	//每页展示数量
	private int pageSize = 15;
	
	//总数
	private int pageTotal;
	
	//总行数
	private int totalCount = 0;
	
	//当前页数，1开始
	private int pageNum = 1;
	
	//数据库查询偏移量
	private Integer offset;
	
	private Integer uid;
	
	public String getStartDate() {
		if (null == startDate) {
			startDate = new SimpleDateFormat("yyyy-MM-dd").format(DateUtils.getInstance().getSomeDaysBeforeAfter(new Date(), -29));
		}
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		if (null == endDate) {
			endDate = DateUtils.getDateStr("yyyy-MM-dd");
		}
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

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getPageTotal() {
		pageTotal = SysConfig.getPageTotal(totalCount, getPageSize());
		return pageTotal;
	}

	public void setPageTotal(int pageTotal) {
		this.pageTotal = pageTotal;
	}

	public int getPageNum() {
		if(getPageTotal()<pageNum){ pageNum = 1;} 
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
	
	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}
	
	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public Boolean getVisible() {
		return visible;
	}

	public void setVisible(Boolean visible) {
		this.visible = visible;
	}

	public Integer getParent() {
		return Parent;
	}

	public void setParent(Integer parent) {
		Parent = parent;
	}

}
