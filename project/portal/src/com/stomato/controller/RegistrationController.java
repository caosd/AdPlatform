package com.stomato.controller;

import javax.validation.Valid;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.stomato.domain.User;
import com.stomato.form.RegistrationForm;
import com.stomato.service.AccountsService;
import com.stomato.validator.RegistrationValidation;

@Controller
@RequestMapping("/accounts/sign-up")
public class RegistrationController {
	
	Logger logger = Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private RegistrationValidation registrationValidation;
	
	@Autowired
	private AccountsService accountsService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String showRegistration(@ModelAttribute("regForm") RegistrationForm form) {
		return "backend/accounts/sign_up";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String processRegistration(@Valid @ModelAttribute("regForm") RegistrationForm form, BindingResult result) {
		registrationValidation.validate(form, result);
		if (result.hasErrors()) {
			return "backend/accounts/sign_up";
		}
		
		User verifier = new User();
		verifier.setEmail(form.getEmail());
		verifier.setUserName(form.getUserName());
		User dbUser = accountsService.verify(verifier);
		if (dbUser != null) {
			if (form.getEmail().equals(dbUser.getEmail())) {
				result.rejectValue("email", "error.email_is_exist", "This email address has been registered.");
				return "backend/accounts/sign_up";
			}
			if (form.getUserName().equals(dbUser.getUserName())) {
				result.rejectValue("userName", "error.username_is_exist", "This username has been registered.");
				return "backend/accounts/sign_up";
			}
		}
		
		User user = form.asPojo();
		accountsService.addUser(user);
		
		form = null;
		return "redirect:/accounts/sign-up?sm=stomato&success=true";
	}
}
