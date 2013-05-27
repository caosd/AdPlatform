package com.stomato.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import com.stomato.form.UserImeiForm;

@Component
public class UserImeiValidation {
	public boolean supports(Class<?> klass) {
		return UserImeiForm.class.isAssignableFrom(klass);
	}

	public void validate(Object target, Errors errors) {
		UserImeiForm form = (UserImeiForm) target;
		Pattern p = Pattern.compile("^.{10,24}$");
		Matcher m = p.matcher(form.getImei());
		if (!m.find()) {
			errors.rejectValue("imei", "error.invalid_imei", "an invalid imei");
		}
		if (form.getStatus() < 1 || form.getStatus() > 2) {
			errors.rejectValue("status", "", "an invalid status");
		}
	}
}
