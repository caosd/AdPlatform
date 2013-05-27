package com.stomato.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import com.stomato.form.RegistrationForm;

@Component
public class RegistrationValidation {
	public boolean supports(Class<?> klass) {
		return RegistrationForm.class.isAssignableFrom(klass);
	}

	public void validate(Object target, Errors errors) {
		RegistrationForm form = (RegistrationForm) target;
		if (!(form.getPassword()).equals(form.getConfirmPassword())) {
			errors.rejectValue("confirmPassword", "error.password_twice_not_match", "Password and Confirm Password Not match.");
		}
		Pattern p = Pattern.compile("^[_0-9a-zA-Z]{5,}$");
		Matcher m = p.matcher(form.getUserName());
		if (!m.find()) {
			errors.rejectValue("userName", "error.username_with_specials", "不允许特殊字符，只能使用字母、数字、下划线的组合。");
		}
		
		if (form.getPassword().indexOf(" ") >= 0) {
			errors.rejectValue("password", "error.password_with_space", "Not allow space characters.");
		}
	}
	
}
