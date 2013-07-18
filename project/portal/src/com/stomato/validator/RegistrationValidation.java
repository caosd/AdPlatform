package com.stomato.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import com.stomato.form.RegistrationForm;
import com.stomato.utils.StringUtils;

@Component
public class RegistrationValidation {

	public void validate(Object target, Errors errors) {
		RegistrationForm form = (RegistrationForm) target;
		
		if (form.getType() < 3 || form.getType() > 4) {
			errors.rejectValue("type", "error.register_role_typexxx", "角色类型不存在");
		}
		
		if (!(form.getPassword()).equals(form.getConfirmPassword())) {
			errors.rejectValue("confirmPassword", "error.password_twice_not_match", "Password and Confirm Password Not match.");
		}
		if (!errors.hasFieldErrors("userName")) {
			Pattern p = Pattern.compile("^[_0-9a-zA-Z]{5,}$");
			Matcher m = p.matcher(form.getUserName());
			if (!m.find()) {
				errors.rejectValue("userName", "error.username_with_specials", "不允许特殊字符，只能使用字母、数字、下划线的组合。");
			}
		}
		
		if (form.getPassword().indexOf(" ") >= 0) {
			errors.rejectValue("password", "error.password_with_space", "Not allow space characters.");
		}
		
		if (!StringUtils.isEmpty(form.getWebsite())) {
			Pattern p = Pattern.compile("^((http(s)?:\\/\\/)?[\\w-]+\\.)+[\\w-]+(\\/[\\w- .\\/?%&=]*)?");
			Matcher m = p.matcher("http://www.baidu.com");
			if (!m.find()) {
				errors.rejectValue("website", "error.url_formatxxx", "网站格式错误，例如http://www.google.com");
			}
		}
	}
	
}
