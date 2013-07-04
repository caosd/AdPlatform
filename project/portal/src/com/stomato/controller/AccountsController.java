package com.stomato.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import com.stomato.domain.UserAccount;
import com.stomato.domain.UserParam;
import com.stomato.enums.PaymentEnum;
import com.stomato.form.EmailForm;
import com.stomato.form.PasswordForm;
import com.stomato.form.PaymentForm;
import com.stomato.form.ProfileForm;
import com.stomato.form.UserForm;
import com.stomato.form.UserParamForm;
import com.stomato.service.AccountsService;
import com.stomato.service.RoleService;
import com.stomato.service.UserAccountsService;
import com.stomato.validator.PasswordValidation;
import com.stomato.validator.PaymentValidation;
import com.stomato.vo.SysConfig;

@Controller
@RequestMapping("/accounts")
public class AccountsController extends UserController {
	
	@Autowired
	private PasswordValidation passwordValidation;
	
	@Autowired
	private AccountsService accountsService;
	
	@Autowired
	private UserAccountsService userAccountService;
	
	@Autowired
	private PaymentValidation paymentValidation;
	
	@Autowired
	private RoleService roleService;
	
	@RequestMapping("")
	public String rootPath() {
		return "forward:/accounts/overview";
	}
	
	@RequestMapping("/overview")
	public String main(@ModelAttribute("profileForm") ProfileForm form) {
		return "portal/accounts/overview";
	}
	
	@RequestMapping(value="/change_pwd", method=RequestMethod.GET)
	public String updatePwd(@ModelAttribute("pwdForm") PasswordForm form) {
		return "portal/accounts/change_pwd";
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
		
		return "portal/accounts/change_pwd";
	}
	
	@RequestMapping(value="/change_profile", method=RequestMethod.GET)
	public String updateProfile(@ModelAttribute("profileForm") ProfileForm form, HttpServletRequest request, Model model) {
		User user = this.lookup(request);
		model.addAttribute(user);
		
		return "portal/accounts/change_profile";
	}
	
	@RequestMapping(value="/change_profile", method=RequestMethod.POST)
	public String updateProfile(@Valid @ModelAttribute("profileForm") ProfileForm form, BindingResult result, HttpServletRequest request, Model model) {
		if (result.hasErrors()) {
			return "portal/accounts/change_profile";
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

		return "portal/accounts/statements";
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
		return "portal/accounts/paymentForm";
	}
	
	@RequestMapping(value="/payment", method=RequestMethod.POST)
	public String processForm(@Valid @ModelAttribute PaymentForm form, BindingResult result, Model model, HttpServletRequest request) {
		paymentValidation.validate(form, result);
		if (result.hasErrors()) {
			return "portal/accounts/paymentForm";
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
		return "portal/accounts/change_email";
	}
	
	@RequestMapping(value="/change_email", method=RequestMethod.POST)
	public String changeEmail(@Valid @ModelAttribute("emailForm") EmailForm emailForm, BindingResult results, Model model, HttpServletRequest request) {
		if (results.hasErrors()) {
			return "portal/accounts/change_email";
		}
		
		User user = this.lookup(request);
		if (emailForm.getEmail().equals(user.getEmail())) {
			results.rejectValue("email", "error.email_is_currently", "This email address is you are using now.");
			return "portal/accounts/change_email";
		}
		
		if (accountsService.getUserByEmail(emailForm.getEmail()) != null) {
			results.rejectValue("email", "error.email_is_exist", "This email address has been registered.");
			return "portal/accounts/change_email";
		}
		
		user.setEmail(emailForm.getEmail());
		accountsService.updateEmail(user);
		this.refreshUserSession(request, user);
		
		return "redirect:/accounts/overview";
	}
	
	/**
	 * goto 添加用户页面
	 * @return
	 */
	@RequestMapping(value="/formpage.html",method=RequestMethod.GET)
	public String userFormPage(@ModelAttribute("userForm")UserForm userForm,BindingResult result,Model model){
		model.addAttribute("roleList", roleService.listRole(null));
		return "portal/user/userForm";
	}
	
	/**
	 * 添加用户
	 * @param user
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/formpage.html",method=RequestMethod.POST)
	public String addUser(@Valid @ModelAttribute("userForm")UserForm userForm,BindingResult result,Model model){

		model.addAttribute("roleList", roleService.listRole(null));
		if( !userForm.getPassword().equals(userForm.getConfirmPassword()) ){
			result.rejectValue("confirmPassword", "error.password_not_match","Password and Confirm Password Not match.");
		}
		if( !result.hasErrors() ){
			User verifier = new User();
			verifier.setEmail(userForm.getEmail());
			verifier.setUserName(userForm.getUserName());
			verifier = accountsService.verify(verifier);
			if (verifier != null) {
				if (userForm.getEmail().equals(verifier.getEmail())) {
					result.rejectValue("email", "error.email_is_exist","This email address has been registered.");
					return "portal/user/userForm";
				}
				if (userForm.getUserName().equals(verifier.getUserName())) {
					result.rejectValue("username", "error.username_is_exist","This username has been registered.");
					return "portal/user/userForm";
				}
			}
			User user = userForm.asPojo();
			accountsService.addUser(user);
			user = accountsService.getUser(user);
			UserAccount userAccount = new UserAccount();
			userAccount.setUid(user.getUid());
			userAccount.setBalance(0d);
			userAccountService.addUserAccount(userAccount);
			model.addAttribute("content", "添加用户成功！");
		}
		return "portal/user/userForm";
	}
	@RequestMapping(value="/listUser.html")
	public String list(@ModelAttribute("userParamForm")UserParamForm paramForm,BindingResult result,Model model){
		/*if(flag == 1){
			user.setRoleId(5);
		}*/
		UserParam param = paramForm.asPojo();
		int total = accountsService.listTotal(param);
		
		int pageTotal = SysConfig.getPageTotal(total, param.getPageSize());
		
		if(pageTotal<param.getPageNum()){
			param.setPageNum(1);
		}
		int start = (param.getPageNum()-1)*param.getPageSize();
		param.setSlimt(start);
		List<User> userList = accountsService.listUser(param);
		
		logger.debug("userList size:"+userList.size());

		model.addAttribute("pageTotal", pageTotal);
		model.addAttribute("totalcount", total);
		model.addAttribute("pageNum", param.getPageNum());
		model.addAttribute("userList", userList);
		return "portal/user/userList";
	}
	@RequestMapping(value="/editUser.html",method=RequestMethod.GET)
	public String updateUser(@ModelAttribute("userForm")UserForm userForm,int id,Model model){
		User user = accountsService.getUserByUid(id);
		model.addAttribute("user", user);
		model.addAttribute("role", roleService.getRole(user.getType()));
		model.addAttribute("roleList", roleService.listRole(null));
		return "portal/user/userUpdate";
	}
	@RequestMapping(value="/editUser.html",method=RequestMethod.POST)
	public String updateUser(@Valid @ModelAttribute("userForm")UserForm userForm,BindingResult result,Model model){

		model.addAttribute("roleList", roleService.listRole(null));
		if(result.hasErrors()){
			return "portal/user/userUpdate"; 
		}
		/*User verifier = new User();
		verifier.setEmail(userForm.getEmail());
		verifier.setUserName(userForm.getUserName());
		verifier = accountsService.verify(verifier);
		if (verifier != null) {
			if (userForm.getEmail().equals(verifier.getEmail())) {
				result.rejectValue("email", "error.email_is_exist","This email address has been registered.");
				return "portal/user/userForm";
			}
			if (userForm.getUserName().equals(verifier.getUserName())) {
				result.rejectValue("username", "error.username_is_exist","This username has been registered.");
				return "portal/user/userForm";
			}
		}*/
		User user = userForm.asPojo();
		accountsService.updateUser(user);
		model.addAttribute("user", user);
		model.addAttribute("role", roleService.getRole(user.getType()));
		model.addAttribute("content", "编辑用户成功！");
		return "portal/user/userUpdate";
	}
}