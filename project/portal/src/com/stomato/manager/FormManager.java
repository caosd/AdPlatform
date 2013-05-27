package com.stomato.manager;

import javax.servlet.http.HttpServletRequest;  

import com.stomato.domain.Form;

/** 
 * 表单管理器，负责管理Session中的表单
 */
public interface FormManager {
	/** 
	 * 生成一个新的表单 
	 */  
	public Form newForm(HttpServletRequest request);
	/** 
	 * 判断表单是否存在。 
	 */  
	public boolean hasForm(HttpServletRequest request, String token);
	/** 
	 * 访问参数中是否存在表单Token。 
	 */  
	public boolean hasFormToken(HttpServletRequest request);
	/** 
	 * 销毁一个表单 
	 */  
	public void destroyToken(HttpServletRequest request, String token);
	/** 
	 * 打印表单信息。 
	 */  
	public String dumpForm(HttpServletRequest request, String token);
}  