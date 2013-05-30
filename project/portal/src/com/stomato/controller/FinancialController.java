package com.stomato.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.stomato.domain.Credentials;
import com.stomato.domain.Remittance;
import com.stomato.domain.User;
import com.stomato.domain.UserAccount;
import com.stomato.form.CredentialForm;
import com.stomato.service.CredentialsService;
import com.stomato.service.RemittanceService;
import com.stomato.service.UserAccountsService;
import com.stomato.validator.CredentialValidation;

@Controller
@RequestMapping("/financial")
public class FinancialController extends UserController{
	
	@Autowired
	private CredentialsService credentialsService;
	@Autowired
	private CredentialValidation credentialValidation;
	@Autowired
	private UserAccountsService userAccountsService;
	@Autowired
	private RemittanceService remittanceService;
	
	private static final String uploadsDir = "F:/project/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/AdPlatform/";
	private static final String fileSeparator = System.getProperty("file.separator");
	
	@RequestMapping(value="/overview",method=RequestMethod.GET)
	public String overview(@ModelAttribute("credentialForm") CredentialForm form,HttpServletRequest request, Model model) {
		User user = this.lookup(request);
		Credentials credentials = this.credentialsService.getCredentialsByUser(user);
		if(	credentials != null ){
			model.addAttribute("credentials", credentials);
		}
		return "backend/financial/overview";
	}
	
	@RequestMapping(value="/overview", method=RequestMethod.POST)
	public String updateCredentials(@Valid @ModelAttribute("credentialForm") CredentialForm form, BindingResult result, HttpServletRequest request, Model model) {

		if (result.hasErrors()) {
			Credentials credentials = this.credentialsService.getCredentialsByUser(this.lookup(request));
			if(	credentials != null ){
				model.addAttribute("credentials", credentials);
			}
			return "backend/financial/overview";
		}
		//这里验证图片，如果图片验证失败不影响处理表单
		credentialValidation.validate(form, result);
		
		String file1path = "";
		String file2path = "";
		MultipartFile file1 = form.getFile1();
		MultipartFile file2 = form.getFile2();		
		User user = this.lookup(request);
		if( file1.getSize() > 0 ){
			file1path = savePhoto(file1, model, user.getUid(), form.getCredentialsType(), form.getCredentialsNo(), "photo1");
		}
		if( file2.getSize() > 0){
			file2path = savePhoto(file2, model, user.getUid(), form.getCredentialsType(), form.getCredentialsNo(), "photo2");
		}
		Credentials credentials = this.credentialsService.getCredentialsByUser(user);
		if( credentials == null ){
			credentials = form.asPojo();
			credentials.setUid(user.getUid());
			credentials.setCredentialsPhoto1(file1path);
			credentials.setCredentialsPhoto2(file2path);
			this.credentialsService.addCredentials(credentials);
		}else{
			if( file1path.equals("") )file1path = credentials.getCredentialsPhoto1();
			if( file2path.equals("") )file2path = credentials.getCredentialsPhoto2();

			credentials = form.asPojo();
			credentials.setUid(user.getUid());
			credentials.setCredentialsPhoto1(file1path);
			credentials.setCredentialsPhoto2(file2path);
			this.credentialsService.updateCredentials(credentials);
		}
		model.addAttribute("credentials", credentials);
		return "backend/financial/overview";
	}
	private String savePhoto(MultipartFile file,Model model,Integer uid,Integer credentialsType,String credentialsNo,String photoname){
		try{
			String suffix = CredentialValidation.IMG_SUFFIXS.get(file.getContentType());
			String savefilepath = String.format("/files/%s/credentials/%s_%s_%s.%s", uid,credentialsType,credentialsNo,photoname,suffix);
			File targetFile = new File((uploadsDir+savefilepath).replace("/", fileSeparator));
			if (!targetFile.exists()) {
				boolean made = targetFile.mkdirs();
				logger.info("result[" + made + "] create dirs:" + targetFile.getPath());
			}
			file.transferTo(targetFile);
			return savefilepath;
		}catch(Exception error){
			logger.error("[Upload Error] " + error.getMessage());
		}
		return "";
	}
	
	@RequestMapping("/accounts")
	public String accounts(HttpServletRequest request, HttpServletResponse response) {
		return "backend/financial/accounts";
	}
	
	@RequestMapping(value="/remittance",method=RequestMethod.GET)
	public String remittance(HttpServletRequest request, Model model) {
		Credentials credentials = this.credentialsService.getCredentialsByUser(this.lookup(request));
		if(	credentials != null ){
			model.addAttribute("credentials", credentials);
		}
		UserAccount userAccount = this.userAccountsService.getUserAccountByUser(this.lookup(request));
		if(	userAccount != null ){
			model.addAttribute("userAccount", userAccount);
		}
		return "backend/financial/remittance";
	}
	@RequestMapping(value="/remittance",method=RequestMethod.POST)
	public String remittance(HttpServletRequest request, HttpServletResponse response, Model model) {

		User user = this.lookup(request);
		Credentials credentials = this.credentialsService.getCredentialsByUser(this.lookup(request));
		if(	credentials != null ){
			model.addAttribute("credentials", credentials);
		}
		UserAccount userAccount = this.userAccountsService.getUserAccountByUser(this.lookup(request));
		if(	userAccount != null ){
			model.addAttribute("userAccount", userAccount);
		}
		
		double money = super.getDoubleParameter(request,"money");
		if(money <= 0){
			model.addAttribute("money","Amount shall not be less than 0.");
			return "backend/financial/remittance"; 
		}
		Remittance remittance = new Remittance();
		remittance.setUid(user.getUid());
		remittance.setBankAccount(credentials.getBankAccount());
		remittance.setBankCard(credentials.getBankCard());
		remittance.setBankName(credentials.getBankName());
		remittance.setMoney(money);
		
		remittanceService.addRemittance(remittance);
		return "backend/financial/remittance";
	}
	
	@RequestMapping("/remittance_history")
	public String remittance_history(HttpServletRequest request, Model model) {
		
		User user = this.lookup(request);
		List<Remittance> remittanceList = this.remittanceService.getRemittanceList(user.getUid());
		model.addAttribute("remittanceList", remittanceList);
		return "backend/financial/remittance_history";
	}
}
