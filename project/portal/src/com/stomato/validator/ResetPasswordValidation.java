package com.stomato.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import com.stomato.form.ResetPasswordForm;

@Component
public class ResetPasswordValidation {
	public void validate(Object target, Errors errors) {
		ResetPasswordForm form = (ResetPasswordForm) target;
		if (!form.getNew_password1().equals(form.getNew_password2())) {
			errors.rejectValue("new_password2", "error.password_twice_not_match", "Password and Confirm Password Not match.");
		}
	}
}
