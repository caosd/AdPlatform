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
			StringBuffer sb = new StringBuffer();
			sb.append("<tr align='right' bgcolor='#EEF4EA'>");
			sb.append("<td height='36' colspan='12' align='right'>");
			sb.append("<div class='pageLabel'>");
			
			if(pageTotal == 0){
				sb.append("<span style='float: right;'>没有记录</span>");
			}else{
				sb.append("<span>第").append(pageNum).append("/").append(pageTotal).append("页</span>");
			    
				
				if(pageNum == 1){
			    	sb.append("<span style='color: #8D8D8D;'>[上一页]</span>");
			    }else{
			    	sb.append("[<a href='javascript:void(0);' onclick='perPage();'>上一页</a>]");
			    } 
				
				
				if(pageNum == pageTotal){
					sb.append("<span style='color: #8D8D8D;'>[下一页]</span>");
				}else{
					sb.append("[<a href='javascript:void(0);' onclick='nextPage();'>下一页</a>]");
				}
			}
			sb.append("</div>");
			sb.append("</td>");
			sb.append("</tr>");
			
			out.println(sb.toString());
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
