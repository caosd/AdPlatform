package com.stomato.validator;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;

import com.stomato.form.CredentialForm;

@Component
public class CredentialValidation {
	
	public static final Map<String,String> IMG_SUFFIXS = new HashMap<String, String>();
	static{
        IMG_SUFFIXS.put("image/gif", "gif");
        IMG_SUFFIXS.put("image/jpg", "jpg");
        IMG_SUFFIXS.put("image/jpeg", "jpeg");
        IMG_SUFFIXS.put("image/png", "png");
        IMG_SUFFIXS.put("image/bmp", "bmp");
	}
	
	public boolean supports(Class<?> klass) {
		return CredentialForm.class.isAssignableFrom(klass);
	}

	public void validate(Object target, Errors errors) {
		CredentialForm form = (CredentialForm) target;
		if (errors.getFieldError("file1") == null) {
			if (!IMG_SUFFIXS.containsKey(form.getFile1().getContentType())) {
				errors.rejectValue("file1", "side.financial.error_photo1_suffix", "Image format is incorrect.");
			}
		}
		if (errors.getFieldError("file1") == null) {
			if (!IMG_SUFFIXS.containsKey(form.getFile1().getContentType())) {
				errors.rejectValue("file1", "side.financial.error_photo2_suffix", "Image format is incorrect.");
			}
		}
	}
}
