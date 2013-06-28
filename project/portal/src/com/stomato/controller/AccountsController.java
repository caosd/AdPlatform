package com.stomato.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.stomato.domain.Payment;
import com.stomato.domain.Transfer;
import com.stomato.domain.User;
import com.stomato.enums.PaymentEnum;
import com.stomato.form.EmailForm;
import com.stomato.form.PasswordForm;
import com.stomato.form.PaymentForm;
import com.stomato.form.ProfileForm;
import com.stomato.service.AccountsService;
import com.stomato.validator.PasswordValidation;
import com.stomato.validator.PaymentValidation;

@Controller
@RequestMapping("/accounts")
public class AccountsController extends UserController {
	
	@Autowired
	private PasswordValidation passwordValidation;
	
	@Autowired
	private AccountsService accountsService;
	
	@Autowired
	private PaymentValidation paymentValidation;
	
	@RequestMapping("")
	public String rootPath() {
		return "forward:/accounts/overview";
	}
	
	@RequestMapping("/overview")
	public String main() {
		return "backend/accounts/overview";
	}
	
	@RequestMapping(value="/change_pwd", method=RequestMethod.GET)
	public String updatePwd(@ModelAttribute("pwdForm") PasswordForm form) {
		return "backend/accounts/change_pwd";
	}
	
	@RequestMapping(value="/change_pwd", method=RequestMethod.POST)
	public String updatePwd(@Valid @ModelAttribute("pwdForm") PasswordForm form, BindingResult result, HttpServletRequest request, Model model) {
		passwordValidation.validate(form, result);
		if (!result.hasErrors()) {
			User sessionUser = this.lookup(request);
			User user = new User();
			user.setUid(sessionUser.getUid());
			user.setUserName(sessionUser.getUserName());
			user.setPassword(form.getPassword());
			user = accountsService.getUser(user);
			if (user != null) {
				user.setPassword(form.getNewpassword());
				int count = accountsService.updatePassword(user);
				if (count > 0) {
					model.addAttribute("updated", true);
				}
			} else {
				model.addAttribute("passwordError", true);
			}
		}
		form = null;
		
		return "backend/accounts/change_pwd";
	}
	
	@RequestMapping(value="/change_profile", method=RequestMethod.GET)
	public String updateProfile(@ModelAttribute("profileForm") ProfileForm form, HttpServletRequest request, Model model) {
		User user = this.lookup(request);
		model.addAttribute(user);
		
		return "backend/accounts/change_profile";
	}
	
	@RequestMapping(value="/change_profile", method=RequestMethod.POST)
	public String updateProfile(@Valid @ModelAttribute("profileForm") ProfileForm form, BindingResult result, HttpServletRequest request, Model model) {
		if (result.hasErrors()) {
			return "backend/accounts/change_profile";
		}
		User user = this.lookup(request);
		User formUser = form.asPojo();
		form = null;
		if (formUser.getType() == 1) {
			formUser.setCompany(null);
		} else if (formUser.getType() == 2) {
			formUser.setContactName(null);
		}
		user.setType(formUser.getType());
		user.setCompany(formUser.getCompany());
		
		accountsService.updateUser(user);
		this.refreshUserSession(request, user);
		
		return "redirect:/accounts/overview";
	}
	
	@RequestMapping("/statements")
	public String showTransferRecords(HttpServletRequest request, Model model) {
		User user = this.lookup(request);
		List<Transfer> transfers = accountsService.selectAllStatements(user.getUid());
		model.addAttribute("statements", transfers);

		return "backend/accounts/statements";
	}
	
	@RequestMapping(value="/payment", method=RequestMethod.GET)
	public String showForm(@ModelAttribute PaymentForm form, HttpServletRequest request) {
		User user = this.lookup(request);
		Payment payment = accountsService.getPayment(user.getUid());
		if (payment != null) {
			try {
				BeanUtils.copyProperties(form, payment);
			} catch (Exception ex) {
				logger.error(ex.getMessage());
			}
		}
		if (form.getPayType() == 0) {
			//default to via wire
			form.setPayType(PaymentEnum.Wire.value());
		}
		return "backend/accounts/paymentForm";
	}
	
	@RequestMapping(value="/payment", method=RequestMethod.POST)
	public String processForm(@Valid @ModelAttribute PaymentForm form, BindingResult result, Model model, HttpServletRequest request) {
		paymentValidation.validate(form, result);
		if (result.hasErrors()) {
			return "backend/accounts/paymentForm";
		}
		User user = this.lookup(request);
		Payment payment = form.asPojo();
		payment.setUid(user.getUid());
		accountsService.savePayment(payment);
		model.addAttribute("updated", true);
		form = null;
		return "redirect:/accounts/payment";
	}
	
	@RequestMapping(value="/change_email", method=RequestMethod.GET)
	public String changeEmail(@ModelAttribute("emailForm") EmailForm emailForm) {
		return "backend/accounts/change_email";
	}
	
	@RequestMapping(value="/change_email", method=RequestMethod.POST)
	public String changeEmail(@Valid @ModelAttribute("emailForm") EmailForm emailForm, BindingResult results, Model model, HttpServletRequest request) {
		if (results.hasErrors()) {
			return "backend/accounts/change_email";
		}
		
		User user = this.lookup(request);
		if (emailForm.getEmail().equals(user.getEmail())) {
			results.rejectValue("email", "error.email_is_currently", "This email address is you are using now.");
			return "backend/accounts/change_email";
		}
		
		if (accountsService.getUserByEmail(emailForm.getEmail()) != null) {
			results.rejectValue("email", "error.email_is_exist", "This email address has been registered.");
			return "backend/accounts/change_email";
		}
		
		user.setEmail(emailForm.getEmail());
		accountsService.updateEmail(user);
		this.refreshUserSession(request, user);
		
		return "redirect:/accounts/overview";
	}
	
}