package com.stomato.controller;

import java.io.File;

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
import com.stomato.validator.CredentialValidation;
import com.stomato.validator.RegistrationValidation;

@Controller
@RequestMapping("/signup")
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
	
	@RequestMapping(method = RequestMethod.GET)
	public String showRegistration(@ModelAttribute("regForm") RegistrationForm form) {
		return "backend/accounts/sign_up";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String processRegistration(@Valid @ModelAttribute("regForm") RegistrationForm form,
											 BindingResult result,
											 @RequestParam("credentialsPhoto") MultipartFile credentialsPhoto,
											 @RequestParam("credentialsNo") String credentialsNo,
											 Model model) {
		registrationValidation.validate(form, result);
		model.addAttribute("userType", form.getType());
		if (result.hasErrors()) {
			return "backend/accounts/sign_up";
		}
		
		User verifier = new User();
		verifier.setEmail(form.getEmail());
		verifier.setUserName(form.getUserName());
		verifier = accountsService.verify(verifier);
		if (verifier != null) {
			if (form.getEmail().equals(verifier.getEmail())) {
				result.rejectValue("email", "error.email_is_exist", "This email address has been registered.");
				return "backend/accounts/sign_up";
			}
			if (form.getUserName().equals(verifier.getUserName())) {
				result.rejectValue("userName", "error.username_is_exist", "This username has been registered.");
				return "backend/accounts/sign_up";
			}
		}
		
		User user = form.asPojo();
		accountsService.addUser(user);
		
		user = accountsService.getUser(user);
		UserAccount userAccount = new UserAccount();
		userAccount.setUid(user.getUid());
		userAccount.setBalance(0d);
		userAccountService.addUserAccount(userAccount);
		if (user.getType() == AccountTypeEnum.Company.value()) {
			Credentials credentials = new Credentials();
			credentials.setUid(user.getUid());
			credentials.setCredentialsType(Constant.CredentialsType.businessLicense);
			credentials.setCredentialsNo(credentialsNo);
			try{
				String suffix = CredentialValidation.IMG_SUFFIXS.get(credentialsPhoto.getContentType());
				String savefilepath = String.format("/%s/%s/%s_%s_%s.%s", user.getUid(),Constant.Configs.credentialsDirPath,credentials.getCredentialsType(),credentialsNo,"photo1",suffix);
				File targetFile = new File((configService.loadConfig(Constant.Configs.filesDirPath) + savefilepath).replace("/", Constant.fileSeparator));
				if (!targetFile.exists()) {
					boolean made = targetFile.mkdirs();
					logger.info("result[" + made + "] create dirs:" + targetFile.getPath());
				}
				credentialsPhoto.transferTo(targetFile);
				credentials.setCredentialsPhoto1(String.format("%s_%s_%s.%s", credentials.getCredentialsType(),credentialsNo,"photo1",suffix));
			}catch(Exception error){
				logger.error("[Upload Error] " + error.getMessage());
			}
			this.credentialsService.addCredentials(credentials);
		}
		
		return "redirect:/accounts/sign-up?success=true";
	}
}
