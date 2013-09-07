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
			if( !form.getApkFile().getOriginalFilename().endsWith("."+Constant.FileSuffixs.apk) ){
				errors.rejectValue("apkFile", "side.adresoure.apk.suffix.err", "Apk file format is incorrect.");
			}
		}
		if( form.getAdIconFile() != null && !form.getAdIconFile().isEmpty()){
			if( !Constant.FileSuffixs.IMG_SUFFIXS.containsKey(form.getAdIconFile().getContentType()) ){
				errors.rejectValue("adIconFile", "side.adresoure.adicon.suffix.err", "Img format is incorrect.");
			}
		}
		if( form.getAdBannerFile() != null && !form.getAdBannerFile().isEmpty()){
			if( !Constant.FileSuffixs.IMG_SUFFIXS.containsKey(form.getAdBannerFile().getContentType()) ){
				errors.rejectValue("adBannerFile", "side.adresoure.adbanner.suffix.err", "Img format is incorrect.");
			}
		}
		if( form.getDesktopIconFile() != null && !form.getDesktopIconFile().isEmpty()){
			if( !Constant.FileSuffixs.IMG_SUFFIXS.containsKey(form.getDesktopIconFile().getContentType()) ){
				errors.rejectValue("desktopIconFile", "side.adresoure.desktopicon.suffix.err", "Img format is incorrect.");
			}
		}
		if( form.getAdImagea() != null && !form.getAdImagea().isEmpty()){
			if( !Constant.FileSuffixs.IMG_SUFFIXS.containsKey(form.getAdImagea().getContentType()) ){
				errors.rejectValue("adImagea", "side.adresoure.adImagea.suffix.err", "Img format is incorrect.");
			}
		}
		if( form.getAdImageb() != null && !form.getAdImageb().isEmpty()){
			if( !Constant.FileSuffixs.IMG_SUFFIXS.containsKey(form.getAdImageb().getContentType()) ){
				errors.rejectValue("adImageb", "side.adresoure.adimageb.suffix.err", "Img format is incorrect.");
			}
		}
		if( form.getAdImagec() != null && !form.getAdImagec().isEmpty()){
			if( !Constant.FileSuffixs.IMG_SUFFIXS.containsKey(form.getAdImagec().getContentType()) ){
				errors.rejectValue("adImagec", "side.adresoure.adimagec.suffix.err", "Img format is incorrect.");
			}
		}
		if( form.getAdImaged() != null && !form.getAdImaged().isEmpty()){
			if( !Constant.FileSuffixs.IMG_SUFFIXS.containsKey(form.getAdImaged().getContentType()) ){
				errors.rejectValue("adImaged", "side.adresoure.adimagec.suffix.err", "Img format is incorrect.");
			}
		}
	}
}
