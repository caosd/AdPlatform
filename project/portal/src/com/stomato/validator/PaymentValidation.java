package com.stomato.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;

import com.stomato.enums.PaymentEnum;
import com.stomato.form.PaymentForm;
import com.stomato.utils.StringUtils;

@Component
public class PaymentValidation {
	public boolean supports(Class<?> klass) {
		return PaymentForm.class.isAssignableFrom(klass);
	}

	public void validate(Object target, Errors errors) {
		PaymentForm form = (PaymentForm) target;
		if (form.getPayType() == PaymentEnum.Paypal.value()) {
			form.setBankAddress(null);
			form.setBankName(null);
			form.setBeneficiaryName(null);
			form.setIban(null);
			form.setIsIntermediary(false);
			form.setSwiftCode(null);
			if (StringUtils.isEmpty(form.getPaypalLogin())) {
				errors.rejectValue("paypalLogin", "error.field_required", "not allow empty");
			}
		} else if (form.getPayType() == PaymentEnum.Wire.value()) {
			form.setPaypalLogin(null);
			if (StringUtils.isEmpty(form.getBankAddress())) {
				errors.rejectValue("bankAddress", "error.field_required", "not allow empty");
			}
			if (StringUtils.isEmpty(form.getBankName())) {
				errors.rejectValue("bankName", "error.field_required", "not allow empty");
			}
			if (StringUtils.isEmpty(form.getBeneficiaryName())) {
				errors.rejectValue("beneficiaryName", "error.field_required", "not allow empty");
			}
			if (StringUtils.isEmpty(form.getIban())) {
				errors.rejectValue("iban", "error.field_required", "not allow empty");
			}
			if (StringUtils.isEmpty(form.getSwiftCode())) {
				errors.rejectValue("swiftCode", "error.field_required", "not allow empty");
			}
		}
	}
}
