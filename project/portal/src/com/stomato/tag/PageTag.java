package com.stomato.tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

public class PageTag extends BodyTagSupport{

	private static final long serialVersionUID = 1534631196282367306L;
	
	/**
	 * 当前页
	 */
	private int pageNum = 1;
	
	/**
	 * 总页数
	 */
	private int pageTotal = 0;
	
	/**
	 * 总条数
	 */
	private int totalcount = 0;
	
	/**
	 * URL地址
	 */
	private String url = "";
	
	@Override
	public int doEndTag() throws JspException {
	    try {
	    	JspWriter out=pageContext.getOut();
			StringBuilder sb = new StringBuilder();
			if(pageTotal == 0){
				//sb.append("<span style='float: right;'>没有记录</span>");
			}else{
				sb.append("<div class='span6'><div class='dataTables_info' id='sample_1_info'><span>第").append(pageNum).append("/").append(pageTotal).append("页</span></div></div>");
				sb.append("<div class='span6'><div class='dataTables_paginate paging_bootstrap pagination'><ul>");
				
				if(pageNum == 1){
			    	sb.append("<li class='prev disabled'><a href='javascript:;'>← Prev</a></li>");
			    }else{
			    	sb.append("<li class='prev'><a href='javascript:;' onclick='prevPage();'>← Prev</a></li>");
			    } 
				
				if(pageNum == pageTotal){
					sb.append("<li class='next disabled'><a href='javascript:;'>Next → </a></li>");
				}else{
					sb.append("<li class='next'><a href='javascript:;' onclick='nextPage();'>Next → </a></li>");
				}
				sb.append("</ul></div></div>");
			}
			
			out.println(sb);
		} catch (IOException e) {
			e.printStackTrace();
		}
		this.release();
		return EVAL_PAGE;
	}
	
	@Override
	public int doStartTag() throws JspException {
		return EVAL_BODY_BUFFERED;
	}

	@Override
	public void release() {
		pageNum = 1;
		super.release();
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getPageTotal() {
		return pageTotal;
	}

	public void setPageTotal(int pageTotal) {
		this.pageTotal = pageTotal;
	}

	public int getTotalcount() {
		return totalcount;
	}

	public void setTotalcount(int totalcount) {
		this.totalcount = totalcount;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
}
