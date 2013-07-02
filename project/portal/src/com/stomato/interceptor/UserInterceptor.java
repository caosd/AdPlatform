package com.stomato.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import com.stomato.domain.User;
import com.stomato.service.AccountsService;
import com.stomato.utils.StringUtils;

public class UserInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	private AccountsService userService;
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
		String servletPath = request.getServletPath();
		
		HttpSession session = request.getSession();
		if (session != null) {
			if (session.getAttribute("user") != null) {
				if (servletPath.indexOf("/login.html") >= 0) {
					response.sendRedirect("/dashboard.html");
				}
				return true;
			}
			Cookie[] cookies = request.getCookies();
			String loginName = null;
			String loginToken = null;
			if (cookies != null) {
				Cookie cookie = null;
				for (int i = 0; i < cookies.length; i++) {
					cookie = cookies[i];
					if (cookie != null) {
						if ("LoginName".equals(cookie.getName())) {
							loginName = cookie.getValue().trim();
						}
						if ("LoginToken".equals(cookie.getName())) {
							loginToken = cookie.getValue().trim();
						}
					}
				}
			}
			if (!StringUtils.isEmpty(loginName) && !StringUtils.isEmpty(loginToken)) {
				User user = new User();
				user.setUserName(loginName);
				user.setLoginToken(loginToken);
				
				user = userService.getUser(user);
				if (user != null) {
					session.setAttribute("user", user);
					if (servletPath.indexOf("/login.html") >= 0) {
						response.sendRedirect("/dashboard.html");
					}
					return true;
				}
			}
		}
		
		if (servletPath.indexOf("/login.html") >= 0 || 
				servletPath.indexOf("/logout.html") >= 0 || 
				servletPath.indexOf("/signup.html") >= 0) {
			return true;
		}
		
		String url = request.getRequestURI();
		response.sendRedirect("/login.html?nextUrl=" + url);
		return false;
	}
	
}
