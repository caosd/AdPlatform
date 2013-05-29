package com.stomato.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.stomato.domain.Credentials;
import com.stomato.domain.User;
import com.stomato.form.CredentialForm;
import com.stomato.service.CredentialsService;
import com.stomato.service.RemittanceService;

@Controller
@RequestMapping("/financial")
public class FinancialController extends UserController{
	
	@Autowired
	private CredentialsService credentialsService;
	@Autowired
	private RemittanceService remittanceService;
	
	private static final String uploadsDir = "/files/%s/credentials/%s_%s_%s.%s";
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
	public String updateCredentials(@Valid @ModelAttribute("credentialForm") CredentialForm form, BindingResult result,@RequestParam("file1") MultipartFile file1,@RequestParam("file2") MultipartFile file2, HttpServletRequest request, Model model) {
		if (result.hasErrors()) {
			return "backend/financial/overview";
		}
		User user = this.lookup(request);
		String file1path = "";
		String file2path = "";
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
			credentials = form.asPojo();
			credentials.setCredentialsPhoto1(file1path);
			credentials.setCredentialsPhoto2(file2path);
			this.credentialsService.updateCredentials(credentials);
		}
		return "backend/financial/overview";
	}
	private static final Map<String,String> IMG_SUFFIXS = new HashMap<String,String>();
	static{
		IMG_SUFFIXS.put("image/gif","gif");
		IMG_SUFFIXS.put("image/jpg","jpg");
		IMG_SUFFIXS.put("image/jpeg","jpg");
		IMG_SUFFIXS.put("image/png","png");
		IMG_SUFFIXS.put("image/bmp","bmp");
	}
	private String savePhoto(MultipartFile file,Model model,Integer uid,Integer credentialsType,String credentialsNo,String photo){
		try{
			String imgsuffixs = IMG_SUFFIXS.get(file.getContentType());
			if(imgsuffixs == null ){
				model.addAttribute(photo,"图片上传失败，请选择图片文件!");
				return "";
			}
			File targetFile = new File(String.format(uploadsDir, uid,"credentials",credentialsType,credentialsNo,photo,imgsuffixs));
			if (!targetFile.exists()) {
				boolean made = targetFile.mkdirs();
				logger.info("result[" + made + "] create dirs:" + targetFile.getPath());
			}
			file.transferTo(targetFile);
			return targetFile.getPath();
		}catch(Exception error){
			logger.error("[Upload Error] " + error.getMessage());
		}
		return "";
	}
	
	@RequestMapping("/accounts")
	public String accounts(HttpServletRequest request, HttpServletResponse response) {
		return "backend/financial/accounts";
	}
	
	@RequestMapping("/remittance")
	public String remittance(HttpServletRequest request, HttpServletResponse response) {
		return "backend/financial/remittance";
	}
	
	@RequestMapping("/remittance_history")
	public String remittance_history(HttpServletRequest request, HttpServletResponse response) {
		return "backend/financial/remittance_history";
	}
}
