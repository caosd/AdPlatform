package com.stomato.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.stomato.constant.Constant;
import com.stomato.domain.Credentials;
import com.stomato.domain.User;
import com.stomato.domain.UserAccount;
import com.stomato.enums.AccountTypeEnum;
import com.stomato.form.RegistrationForm;
import com.stomato.service.AccountsService;
import com.stomato.service.ConfigService;
import com.stomato.service.CredentialsService;
import com.stomato.service.UserAccountsService;
import com.stomato.validator.RegistrationValidation;

@Controller
@RequestMapping("/")
public class RegistrationController {
	
	Logger logger = Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private RegistrationValidation registrationValidation;
	
	@Autowired
	private AccountsService accountsService;
	
	@Autowired
	private UserAccountsService userAccountService;
	
	@Autowired
	private CredentialsService credentialsService;
	
	@Autowired
	private ConfigService configService;
	
	@RequestMapping(value="/register.html", method = RequestMethod.GET)
	public String showRegistration(@ModelAttribute("regForm") RegistrationForm form) {
		return "portal/register";
	}

	@RequestMapping(value="/register.html", method = RequestMethod.POST)
	public String processRegistration(@Valid @ModelAttribute("regForm") RegistrationForm form,
											 BindingResult result,
											 @RequestParam("file1") MultipartFile file1,
											 @RequestParam("file2") MultipartFile file2,
											 Model model,
											 HttpServletRequest request) {
		registrationValidation.validate(form, result);
		if (result.hasErrors()) {
			model.addAttribute("type", form.getType());
			return "portal/register";
		}
		
		User verifier = new User();
		verifier.setEmail(form.getEmail());
		verifier.setUserName(form.getUserName());
		verifier = accountsService.verify(verifier);
		if (verifier != null) {
			if (form.getEmail().equals(verifier.getEmail())) {
				model.addAttribute("type", form.getType());
				result.rejectValue("email", "error.email_is_exist", "This email address has been registered.");
				return "portal/register";
			}
			if (form.getUserName().equals(verifier.getUserName())) {
				model.addAttribute("type", form.getType());
				result.rejectValue("userName", "error.username_is_exist", "This username has been registered.");
				return "portal/register";
			}
		}
		
		User user = form.asPojo();
		user.setStatus(Constant.UserStatus.newRegist);
		accountsService.addUser(user);
		
		UserAccount userAccount = new UserAccount();
		userAccount.setUid(user.getUid());
		userAccount.setBalance(0d);
		userAccountService.addUserAccount(userAccount);
		if (user.getType() == AccountTypeEnum.Company.value()) {
			String credentialsNo = request.getParameter("credentialsNo");
			Credentials credentials = new Credentials();
			credentials.setUid(user.getUid());
			credentials.setCredentialsType(Constant.CredentialsType.businessLicense);
			credentials.setCredentialsNo(credentialsNo);
			try{
				if (file1.getSize() > 0) {
					String surfix = Constant.FileSuffixs.IMG_SUFFIXS.get(file1.getContentType());
					if (null != surfix) {
						String savefilepath = String.format("/%s/%s/%s_%s_%s.%s", user.getUid(),Constant.Configs.credentialsDirPath,credentials.getCredentialsType(),credentialsNo,"photo1",surfix);
						File targetFile = new File((configService.loadConfig(Constant.Configs.filesDirPath) + savefilepath).replace("/", Constant.fileSeparator));
						if (!targetFile.exists()) {
							boolean made = targetFile.mkdirs();
							logger.info("result[" + made + "] create dirs:" + targetFile.getPath());
						}
						file1.transferTo(targetFile);
						credentials.setCredentialsPhoto1(String.format("%s_%s_%s.%s", credentials.getCredentialsType(),credentialsNo,"photo1",surfix));
					}
				}
				if (file2.getSize() > 0) {
					String surfix = Constant.FileSuffixs.IMG_SUFFIXS.get(file2.getContentType());
					if (null != surfix) {
						String savefilepath = String.format("/%s/%s/%s_%s_%s.%s", user.getUid(),Constant.Configs.credentialsDirPath,credentials.getCredentialsType(),credentialsNo,"photo2",surfix);
						File targetFile = new File((configService.loadConfig(Constant.Configs.filesDirPath) + savefilepath).replace("/", Constant.fileSeparator));
						if (!targetFile.exists()) {
							boolean made = targetFile.mkdirs();
							logger.info("result[" + made + "] create dirs:" + targetFile.getPath());
						}
						file2.transferTo(targetFile);
						credentials.setCredentialsPhoto2(String.format("%s_%s_%s.%s", credentials.getCredentialsType(),credentialsNo,"photo2",surfix));
					}
				}
			}catch(Exception error){
				logger.error("[Upload Error] " + error.getMessage());
			}
			this.credentialsService.addCredentials(credentials);
		}
		
		return "redirect:/notify2.html";
	}
	
	@ResponseBody
	@RequestMapping("/checkreg.html")
	public Object checkreg(HttpServletRequest request) {
		String email = request.getParameter("email");
		String userName = request.getParameter("userName");
		User verifier = new User();
		verifier.setEmail(email);
		verifier.setUserName(userName);
		verifier = accountsService.verify(verifier);
		return verifier != null;
	}
}
