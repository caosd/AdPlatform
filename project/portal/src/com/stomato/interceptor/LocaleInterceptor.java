package com.stomato.interceptor;

import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LocaleInterceptor extends HandlerInterceptorAdapter {

	public static final String COOKIENAME_LOCALE = "org.springframework.web.servlet.i18n.CookieLocaleResolver.LOCALE";
	private final LocaleResolver localeResolver;
	
	@Autowired
	public LocaleInterceptor (LocaleResolver localeResolver) {
		this.localeResolver = localeResolver;
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		Cookie[] cookies = request.getCookies();
		boolean localeAlreadySetupInCookie = false;
		if (null != cookies) {
			Cookie cookie = null;
			for (int i=0; i<cookies.length; i++) {
				cookie = cookies[i];
				if ((null != cookie) && COOKIENAME_LOCALE.equals(cookie.getName())) {
					localeAlreadySetupInCookie = true;
					break;
				}
			}
		}
		if (!localeAlreadySetupInCookie) {
			//if locale not setup in cookie,means first-time to request.
			String acceptLanuage = request.getHeader("Accept-Language");
			if (null != acceptLanuage) {
				if (acceptLanuage.toLowerCase().indexOf("zh") >= 0) {
					localeResolver.setLocale(request, response, Locale.SIMPLIFIED_CHINESE);
				}
			}
		}
		return true;
	}
	
}
