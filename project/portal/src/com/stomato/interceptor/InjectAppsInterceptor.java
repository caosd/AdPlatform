package com.stomato.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.stomato.domain.App;
import com.stomato.domain.User;
import com.stomato.service.AppService;

/*
 * 此AOP用于将AppList注入到request里
 */
public class InjectAppsInterceptor extends HandlerInterceptorAdapter {
	Logger logger = Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private AppService appService;

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		User user = this.lookup(request);
		if (user != null) {
			List<App> applist = appService.getLastedAppList(user.getId());
			request.setAttribute("lastedApps", applist);
		}
		return true;
	}
	
	private User lookup(HttpServletRequest request) {
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
	
}
