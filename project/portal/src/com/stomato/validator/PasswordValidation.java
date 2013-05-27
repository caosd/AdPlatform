package com.stomato.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import com.stomato.form.PasswordForm;

@Component
public class PasswordValidation {
	public boolean supports(Class<?> klass) {
		return PasswordForm.class.isAssignableFrom(klass);
	}

	public void validate(Object target, Errors errors) {
		PasswordForm form = (PasswordForm) target;
		if (errors.getFieldError("cfmpassword") == null) {
			if (!(form.getNewpassword()).equals(form.getCfmpassword())) {
				errors.rejectValue("cfmpassword", "error.password_twice_not_match", "New password and Confirm Password Not match.");
			}
		}
		if (errors.getFieldError("newpassword") == null) {
			if (form.getNewpassword().equals(form.getPassword())) {
				errors.rejectValue("newpassword", "error.password_not_changed", "New password cannot same as origin password.");
			}
		}
	}
}
