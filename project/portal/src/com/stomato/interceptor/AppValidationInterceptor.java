package com.stomato.interceptor;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.stomato.domain.App;
import com.stomato.domain.AppBusiness;
import com.stomato.domain.User;
import com.stomato.service.AppBusinessService;
import com.stomato.service.AppService;

/*
 * 用于验证/apps/{appKey}/*的请求的appKey合法性
 */
public class AppValidationInterceptor extends HandlerInterceptorAdapter {
	
	Logger logger = Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private AppService appService;
	@Autowired
	private AppBusinessService appBusinessService;

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		String path = request.getServletPath();
		String appKey = this.getAppkey(path);
		if (appKey != null) {
			if (validateAppKey(appKey)) {
				User user = this.lookup(request);
				App app = new App();
				app.setKey(appKey);
				//modify by jd, spadmin和开发者共用一个页面，暂不过滤spadmin用户
				/*if( user.getType() != 2 ){
				   app.setUid(user.getUid());
				}*/
				app.setUid(user.getUid());
				app = appService.getApp(app);
				if (app != null) {
					AppBusiness appBusiness = appBusinessService.getAppBusiness(app.getId());
					request.setAttribute("app", app);
					request.setAttribute("appBusiness", appBusiness);
					return true;
				}
			}
			response.sendRedirect("/errors/404");
			return false;
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
	
	private String getAppkey(String path) {
		Pattern p = Pattern.compile("(/apps/)([0-9a-z]{32}(?=/))");
		Matcher m = p.matcher(path);
		if (m.find()) {
			return m.group(2);
		}
		return null;
	}
	
	private boolean validateAppKey(String appKey) {
		Pattern p = Pattern.compile("^[0-9a-z]{32}$");
		Matcher m = p.matcher(appKey);
		
		return m.find();
	}
	
}
