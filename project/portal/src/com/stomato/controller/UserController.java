package com.stomato.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.stomato.domain.User;
import com.stomato.interceptor.LocaleInterceptor;

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

}
