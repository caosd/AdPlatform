package com.stomato.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.stomato.domain.User;
import com.stomato.exception.ParameterException;
import com.stomato.interceptor.LocaleInterceptor;
import com.stomato.utils.StringUtils;

public class UserController {
	
	Logger logger = Logger.getLogger(this.getClass().getName());

	protected User lookup(HttpServletRequest request) {
		User user = null;
		HttpSession session = request.getSession();
		if (session != null) {
			Object obj = session.getAttribute("user");
			if (obj != null) {
				user = (User) obj;
			}
		}
		return user;
	}
	
	protected void refreshUserSession(HttpServletRequest request, User user) {
		HttpSession session = request.getSession();
		if (session != null) {
			user.setPassword(null);
			session.setAttribute("user", user);
		}
	}
	
	protected void clearUserCookie(HttpServletRequest request, HttpServletResponse response) {
		try {
			Cookie[] cookies=request.getCookies();
			Cookie cookie = null;
			if (cookies != null) {
				for(int i=0;i<cookies.length;i++) {
					cookie = cookies[i];
					if (cookie != null) {
						if (!cookie.getName().equals("LoginName") ||
							!cookie.getName().equals(LocaleInterceptor.COOKIENAME_LOCALE)) {
							cookie.setMaxAge(0);
							cookie.setPath("/");
							response.addCookie(cookie);
						}
					}
				}
			}
		} catch(Exception ex) {  
			logger.error("clear cookie exception: " + ex.getMessage());
		}
	}
	
	protected void saveUserCookie(User user, HttpServletRequest request, HttpServletResponse response) {
		try {
			Cookie unameCookie = new Cookie("LoginName", user.getUserName());
			unameCookie.setPath("/");
			unameCookie.setMaxAge(1000000000);
			response.addCookie(unameCookie);
			
			Cookie tokenCookie = new Cookie("LoginToken", user.getLoginToken());
			tokenCookie.setPath("/");
			tokenCookie.setMaxAge(1000000000);
			response.addCookie(tokenCookie);
		} catch (Exception ex) {
			logger.error("write cookie exception: " + ex.getMessage());
		}
	}
	/**
	 * 取得整型参数的值
	 * 
	 * @param parameter
	 *            参数
	 * @return int 当前类别
	 */
	protected int getIntParameter(HttpServletRequest request,String name) {
		String value = request.getParameter(name);
		if (value != null) {
			try {
				return Integer.parseInt(value);
			} catch (Exception e) {
				return 0;
			}
		}
		return 0;
	}
	/**
	 * 取得boolean参数的值
	 * 
	 * @param parameter
	 *            参数
	 * @return boolean 当前类别
	 */
	protected boolean getBooleanParameter(HttpServletRequest request,String name) {
		String value = request.getParameter(name);
		if (value != null) {
			try {
				return Boolean.parseBoolean(value);
			} catch (Exception e) {
				return false;
			}
		}
		return false;
	}
	/**
	 * 取得整型参数的值
	 * 
	 * @param parameter
	 *            参数
	 * @return int 当前类别
	 */
	protected Double getDoubleParameter(HttpServletRequest request,String name) {
		String value = request.getParameter(name);
		if (value != null) {
			try {
				return Double.parseDouble(value);
			} catch (Exception e) {
				return 0.0;
			}
		}
		return 0.0;
	}
	/**
	 * 取得request中parameter的值
	 * 
	 * @param parameter
	 *            参数
	 * @return string 参数的值
	 */
	protected String[] getParameterValues(HttpServletRequest request,String name) {
		String[] values = request.getParameterValues(name);
		if (values != null) {
			return values;
		}
		return new String[] {};
	}
	/**
	 * 从request中获取String类型
	 * 
	 * @param parameter
	 * @param isNull
	 * @return
	 * @throws ParameterException
	 */
	public String getStringParameter(HttpServletRequest request,String parameter, boolean isNull)
			throws ParameterException {
		String value = request.getParameter(parameter);
		if (StringUtils.isEmpty(value)) {
			if (!isNull) {
				throw new ParameterException(parameter + " 参数不能为空");
			} else {
				return "";
			}
		} else {
			return value;
		}
	}
}
