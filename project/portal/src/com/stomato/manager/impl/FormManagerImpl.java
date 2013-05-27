package com.stomato.manager.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.stomato.domain.Form;
import com.stomato.manager.FormManager;
import com.stomato.utils.StringUtils;

/**
 * 表单管理器实现类
 */
@Resource(name="formManager")
public class FormManagerImpl implements FormManager {

	private static final String SESSION_KEY_OF_FROMS = "_forms_in_session";

	/** 表单最大个数 */
	private int maxFormNum  = 7;

	/**
	 * 销毁一个表单
	 */
	public void destroyToken(HttpServletRequest request, String token) {
		getForms(request).remove(token);
	}
	/**
	 * 打印表单信息。
	 */
	public String dumpForm(HttpServletRequest request, String token) {
		Form form = getForms(request).get(token);
		if (form == null) {
			return "null";
		}
		return form.toString();
	}
	/**
	 * 判断表单是否存在。如果token为null，直接返回false。
	 *
	 * @see #getForms(HttpServletRequest)
	 */
	public boolean hasForm(HttpServletRequest request, String token) {
		if (token == null) {
			return false;
		}
		return getForms(request).containsKey(token);
	}

	/**
	 * 访问参数中是否存在表单Token。
	 */
	public boolean hasFormToken(HttpServletRequest request) {
		String formToken = request.getParameter(Form.FORM_UNIQ_ID_FIELD_NAME);
		return !StringUtils.isEmpty(formToken);
	}
	
	/**
	 * 生成一个新的表单，如果目前表单个数大于设定的最大表单数则先删除最早的一个表单。<br>
	 * 新表单用RandomStringUtils.randomAlphanumeric(32)生成Token。
	 *
	 * @return 创建的新表单
	 */
	public Form newForm(HttpServletRequest request) {
		Form form = new Form(StringUtils.getUUID());
		Map<String, Form> forms = getForms(request);
		synchronized (forms) {
			// 如果目前表单个数大于等于最大表单数，那么删除最老的表单，添加新表单。
			if (forms.size() >= maxFormNum) {
				removeOldestForm(request);
			}
			forms.put(form.getToken(), form);
		}
		return form;
	}
	
	/**
	 * 获得目前session中的表单列表。
	 *
	 * @return 返回的Map中以表单的token为键，Form对象为值
	 */
	@SuppressWarnings("unchecked")
	protected Map<String, Form> getForms(HttpServletRequest request) {
		Map<String, Form> formsInSession = null;
		HttpSession session = request.getSession();
		synchronized (session) {
			formsInSession = (Map<String, Form>) session.getAttribute(SESSION_KEY_OF_FROMS);
			if (formsInSession == null) {
				formsInSession = new HashMap<String, Form>();
				session.setAttribute(SESSION_KEY_OF_FROMS, formsInSession);
			}
		}
		return formsInSession;
	}
	
	/**
	 * 删除最老的Form
	 *
	 * @see #destroyToken(HttpServletRequest, String)
	 */
	protected void removeOldestForm(HttpServletRequest request) {
		List<Form> forms = new ArrayList<Form>(getForms(request).values());
		if (!forms.isEmpty()) {
			Form oldestForm = forms.get(0);
			for (Form form : forms) {
				if (form.getCreateTime().before(oldestForm.getCreateTime())) {
					oldestForm = form;
				}
			}
			destroyToken(request, oldestForm.getToken());
		}
	}
	
	public void setMaxFormNum(int maxFormNum) {
		this.maxFormNum = maxFormNum;
	}
}