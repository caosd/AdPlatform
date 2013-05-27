package com.stomato.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import com.stomato.form.AppForm;
import com.stomato.utils.StringUtils;

@Component
public class AppValidation {
	public boolean supports(Class<?> klass) {
		return AppForm.class.isAssignableFrom(klass);
	}

	public void validate(Object target, Errors errors) {
		AppForm form = (AppForm) target;
		if (StringUtils.isEmpty(form.getPkg())) {
			errors.rejectValue("pkg", "error.field_required", "not allow empty package");
		}
	}
}
