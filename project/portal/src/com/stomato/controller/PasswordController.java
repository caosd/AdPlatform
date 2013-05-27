package com.stomato.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.stomato.domain.Password;
import com.stomato.domain.User;
import com.stomato.form.ResetByEmailForm;
import com.stomato.form.ResetPasswordForm;
import com.stomato.helper.MailHelper;
import com.stomato.service.AccountsService;
import com.stomato.service.PasswordService;
import com.stomato.utils.StringUtils;
import com.stomato.validator.ResetPasswordValidation;

@Controller
@RequestMapping("/recover")
public class PasswordController {
	
	@Autowired
	private AccountsService accountService;
	
	@Autowired
	private PasswordService passwordService;
	
	@Autowired
	private ResetPasswordValidation resetPasswordValidation;
	
	@RequestMapping(value="/password/reset", method=RequestMethod.GET)
	public String showResetPwd(@ModelAttribute("resetForm") ResetByEmailForm form) {
		return "backend/recover/reset_pwd";
	}
	
	@RequestMapping(value="/password/reset", method=RequestMethod.POST)
	public String processResetPwd(@Valid @ModelAttribute("resetForm") ResetByEmailForm form, BindingResult result, Model model) {
		if (result.hasErrors()) {
			if (StringUtils.isEmpty(form.getEmail())) {
				model.addAttribute("emailEmpty", true);
			} else {
				model.addAttribute("emailFormatErr", true);
			}
			return "backend/recover/reset_pwd";
		}
		
		String email = form.getEmail();
		User user = accountService.getUserByEmail(email);
		if (user == null) {
			model.addAttribute("emailNotFound", true);
			return "backend/recover/reset_pwd";
		}
		
		String token = StringUtils.getRandomChars(3) + "-" + StringUtils.getRandomChars(3) + "-" + StringUtils.toMD5(StringUtils.getUUID() + user.getUserName()).substring(2, 22);
		Password pwd = new Password();
		pwd.setEmail(email);
		pwd.setToken(token);
		passwordService.setToken(pwd);
		
		String link = "/recover/password/reset/confirm/" + token;
		MailHelper.sendResetPwdEmail(email, user.getUserName(), link, form.getLang());
		
		return "backend/recover/reset_pwd_done";
	}
	
	@RequestMapping(value="/password/reset/confirm/{token}", method=RequestMethod.GET)
	public String showResetPwdCofirm(@ModelAttribute("confirmForm") ResetPasswordForm form, @PathVariable String token) {
		if (StringUtils.isEmpty(token)) {
			return "backend/recover/reset_pwd_unsuccess";
		}
		Password password = passwordService.getToken(token);
		if (password == null) {
			return "backend/recover/reset_pwd_unsuccess";
		}
		return "backend/recover/reset_pwd_confirm";
	}
	
	@RequestMapping(value="/password/reset/confirm/{token}", method=RequestMethod.POST)
	public String processResetPwdCofirm(@Valid @ModelAttribute("confirmForm") ResetPasswordForm form, BindingResult result, @PathVariable String token) {
		if (StringUtils.isEmpty(token)) {
			return "backend/recover/reset_pwd_unsuccess";
		}
		resetPasswordValidation.validate(form, result);
		if (result.hasErrors()) {
			return "backend/recover/reset_pwd_confirm";
		}
		
		Password password = passwordService.getToken(token);
		if (password == null) {
			return "backend/recover/reset_pwd_unsuccess";
		}
		
		User user = accountService.getUserByEmail(password.getEmail());
		user.setPassword(form.getNew_password1());
		passwordService.removeToken(password.getEmail());
		accountService.updatePassword(user);
		
		return "backend/recover/reset_pwd_success";
	}
	
}
