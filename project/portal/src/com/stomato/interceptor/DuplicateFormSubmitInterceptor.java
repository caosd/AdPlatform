package com.stomato.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.stomato.domain.Form;
import com.stomato.manager.FormManager;

/**
 * 禁止表单重复提交拦截器
 */
public class DuplicateFormSubmitInterceptor extends HandlerInterceptorAdapter {
	
	@Resource(name="formManager")
	private FormManager formManager;

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler) throws Exception {
		boolean flag = true;
		String token = request.getParameter(Form.FORM_UNIQ_ID_FIELD_NAME);
		if (token != null) {
			if (formManager.hasForm(request, token)) {
				formManager.destroyToken(request, token);
			} else {
				flag = false;
				throw new Exception("表单重复提交或过期，令牌[" + token + "]");
			}
		}
		return flag;
	}
}