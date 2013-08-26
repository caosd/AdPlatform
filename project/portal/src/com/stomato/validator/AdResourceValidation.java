package com.stomato.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;

import com.stomato.constant.Constant;
import com.stomato.form.AdResourceForm;

@Component
public class AdResourceValidation {
	public boolean supports(Class<?> klass) {
		return AdResourceForm.class.isAssignableFrom(klass);
	}

	public void validate(Object target, Errors errors) {
		AdResourceForm form = (AdResourceForm) target;
		if( form.getApkFile() != null && !form.getApkFile().isEmpty()){
			if( !Constant.FileSuffixs.apk.equals(form.getApkFile().getContentType()) ){
				errors.rejectValue("apkFile", "side.adresoure.apk.suffix.err", "Apk file format is incorrect.");
			}
		}
		if( form.getAdIconFile() != null || !form.getAdIconFile().isEmpty()){
			if( !Constant.FileSuffixs.IMG_SUFFIXS.containsKey(form.getAdIconFile().getContentType()) ){
				errors.rejectValue("adIconFile", "side.adresoure.adicon.suffix.err", "Img format is incorrect.");
			}
		}
		if( form.getAdBannerFile() != null || !form.getAdBannerFile().isEmpty()){
			if( !Constant.FileSuffixs.IMG_SUFFIXS.containsKey(form.getAdBannerFile().getContentType()) ){
				errors.rejectValue("adBannerFile", "side.adresoure.adbanner.suffix.err", "Img format is incorrect.");
			}
		}
		if( form.getDesktopIconFile() != null ){
			if( !Constant.FileSuffixs.IMG_SUFFIXS.containsKey(form.getDesktopIconFile().getContentType()) ){
				errors.rejectValue("desktopIconFile", "side.adresoure.desktopicon.suffix.err", "Img format is incorrect.");
			}
		}
		if( form.getAdImagea() != null ){
			if( !Constant.FileSuffixs.IMG_SUFFIXS.containsKey(form.getAdImagea().getContentType()) ){
				errors.rejectValue("adImagea", "side.adresoure.adImagea.suffix.err", "Img format is incorrect.");
			}
		}
		if( form.getAdImageb() != null ){
			if( !Constant.FileSuffixs.IMG_SUFFIXS.containsKey(form.getAdImageb().getContentType()) ){
				errors.rejectValue("adimageb", "side.adresoure.adimageb.suffix.err", "Img format is incorrect.");
			}
		}
		if( form.getAdImagec() != null ){
			if( !Constant.FileSuffixs.IMG_SUFFIXS.containsKey(form.getApkFile().getContentType()) ){
				errors.rejectValue("adimagec", "side.adresoure.adimagec.suffix.err", "Img format is incorrect.");
			}
		}
		if( form.getAdImaged() != null ){
			if( !Constant.FileSuffixs.IMG_SUFFIXS.containsKey(form.getAdImaged().getContentType()) ){
				errors.rejectValue("adimaged", "side.adresoure.adimagec.suffix.err", "Img format is incorrect.");
			}
		}
	}
}
