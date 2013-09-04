package com.stomato.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;

import com.stomato.constant.Constant;
import com.stomato.form.CredentialForm;

@Component
public class CredentialValidation {
	
	public void validate(Object target, Errors errors) {
		CredentialForm form = (CredentialForm) target;
		if (errors.getFieldError("file1") != null 
				&& form.getFile1().getSize() > 0) {
			if (!Constant.FileSuffixs.IMG_SUFFIXS.containsKey(form.getFile1().getContentType())) {
				errors.rejectValue("file1", "side.financial.error_photo1_suffix", "Image format is incorrect.");
			}
		}
		if (errors.getFieldError("file2") != null
				&& form.getFile2().getSize() > 0) {
			if (!Constant.FileSuffixs.IMG_SUFFIXS.containsKey(form.getFile2().getContentType())) {
				errors.rejectValue("file2", "side.financial.error_photo2_suffix", "Image format is incorrect.");
			}
		}
	}
}
