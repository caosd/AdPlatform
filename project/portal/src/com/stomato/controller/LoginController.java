package com.stomato.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import com.stomato.domain.User;
import com.stomato.form.LoginForm;
import com.stomato.service.AccountsService;
import com.stomato.utils.StringUtils;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

@Controller
@RequestMapping("/accounts/sign-in")
public class LoginController extends UserController {
	
	@Autowired
	private AccountsService accountsService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String showForm(@ModelAttribute LoginForm loginForm, Map<String, Object> model, HttpServletRequest request) {
		return "backend/accounts/sign_in";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String processForm(@Valid @ModelAttribute LoginForm loginForm, BindingResult result, Model model, HttpServletRequest request, HttpServletResponse response) {
		if (result.hasErrors()) {
			if (StringUtils.isEmpty(loginForm.getUserName())) {
				model.addAttribute("usernameEmpty", true);
			} else if (StringUtils.isEmpty(loginForm.getPassword())) {
				model.addAttribute("passwordEmpty", true);
			} else {
				model.addAttribute("accountErr", true);
			}
			return "backend/accounts/sign_in";
		}
		User user = loginForm.asPojo();
		user = accountsService.getUser(user);
		if (user == null) {
			model.addAttribute("accountErr", true);
			return "backend/accounts/sign_in";
		}
		
		if (loginForm.getRemember()) {
			user.setLoginToken(StringUtils.getUUID());
			accountsService.uploadLoginToken(user);
			this.saveUserCookie(user, request, response);
		}
		this.refreshUserSession(request, user);
		
		String nextUrl = request.getParameter("nextUrl");
		loginForm = null;
		if (!StringUtils.isEmpty(nextUrl)) {
			return "redirect:" + nextUrl;
		}
		return "redirect:/apps";
	}

}
