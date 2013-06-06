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

import com.stomato.constant.Constant;
import com.stomato.domain.App;
import com.stomato.domain.Credentials;
import com.stomato.domain.Remittance;
import com.stomato.domain.RemittanceParam;
import com.stomato.domain.ReportParam;
import com.stomato.domain.User;
import com.stomato.domain.UserAccount;
import com.stomato.form.CredentialForm;
import com.stomato.form.RemittanceParamForm;
import com.stomato.form.ReportParamForm;
import com.stomato.service.AppService;
import com.stomato.service.ConfigService;
import com.stomato.service.CredentialsService;
import com.stomato.service.RemittanceService;
import com.stomato.service.ReportService;
import com.stomato.service.UserAccountsService;
import com.stomato.utils.Pager;
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
	@Autowired
	private ReportService reportService;
	@Autowired
	private AppService appService;
	@Autowired
	private ConfigService configService;
	
//	private static final String uploadsDir = "F:/project/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/AdPlatform/";
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
			String savefilepath = String.format("/%s/%s/%s_%s_%s.%s", uid,Constant.Configs.credentialsDirPath,credentialsType,credentialsNo,photoname,suffix);
			File targetFile = new File((configService.loadConfig(Constant.Configs.filesDirPath) + savefilepath).replace("/", fileSeparator));
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
	public String accounts(@ModelAttribute("reportParamForm") ReportParamForm reportParamForm,HttpServletRequest request,Model model) {
		ReportParam param = reportParamForm.asPojo();
		User user = this.lookup(request);
		param.setUid(user.getUid());
		
		List<App> appList = this.appService.getAppList(user.getUid());
		if( appList.size() > 0 ){
			int records = this.reportService.getDailyReportCount(param);
			int curPage = this.getIntParameter(request, "p");
			if( curPage < 1) curPage = 1;
			param.setRows(3);
			param.setSlimt((curPage-1) * 3);
			//分页
			Pager pager = new Pager(param.getRows(), curPage, records);
			model.addAttribute("pager", pager);
			model.addAttribute("dailyList", this.reportService.getAccountsReport(param));
		}
		model.addAttribute("appList", appList);
		model.addAttribute("reportParam", param);
		return "backend/financial/accounts";
	}
	
	@RequestMapping(value="/remittance",method=RequestMethod.GET)
	public String remittance(HttpServletRequest request, Model model) {
		User user = this.lookup(request);
		Credentials credentials = this.credentialsService.getCredentialsByUser(user);
		if(	credentials == null ){
			model.addAttribute("error", "side.financial.accounts_entry");
		}
		UserAccount userAccount = this.userAccountsService.getUserAccountByUser(user);
		model.addAttribute("userAccount", userAccount);
		model.addAttribute("credentials", credentials);
		return "backend/financial/remittance";
	}
	@RequestMapping(value="/remittance",method=RequestMethod.POST)
	public String remittance(HttpServletRequest request, HttpServletResponse response, Model model) {
		String retPath = "backend/financial/remittance";
		User user = this.lookup(request);
		Credentials credentials = this.credentialsService.getCredentialsByUser(user);
		if(	credentials == null ){
			model.addAttribute("error", "side.financial.accounts_entry");
			return retPath;
		}
		UserAccount userAccount = this.userAccountsService.getUserAccountByUser(user);
		if(	userAccount == null ){
			return retPath;
		}
		model.addAttribute("userAccount", userAccount);
		model.addAttribute("credentials", credentials);
		
		double money = super.getDoubleParameter(request,"money");
		if(money < 100){
			model.addAttribute("error","side.financial.remittance_money_error");
			return retPath; 
		}
		//验证金额是否足够
		if(money > userAccount.getBalance()){
			model.addAttribute("error","side.financial.accounts_balance_issu");
			return retPath;
		}
		
		Remittance remittance = new Remittance();
		remittance.setUid(user.getUid());
		remittance.setBankAccount(credentials.getBankAccount());
		remittance.setBankCard(credentials.getBankCard());
		remittance.setBankName(credentials.getBankName());
		remittance.setMoney(money);
		remittanceService.addRemittance(remittance);
		
		model.addAttribute("success", "side.financial.remittance_success");
		return retPath;
	}
	
	@RequestMapping("/remittance_history")
	public String remittance_history(@ModelAttribute("remittanceParamForm") RemittanceParamForm form,HttpServletRequest request, Model model) {
		RemittanceParam remittanceParam= form.asPojo();
		int records = this.remittanceService.getRemittanceCount(remittanceParam);
		int curPage = this.getIntParameter(request, "p");
		if( curPage < 1) curPage = 1;
		remittanceParam.setRows(3);
		remittanceParam.setSlimt((curPage-1) * 3);
		remittanceParam.setUid(this.lookup(request).getUid());
		//分页
		Pager pager = new Pager(remittanceParam.getRows(), curPage, records);
		model.addAttribute("pager", pager);
		List<Remittance> remittanceList = this.remittanceService.getRemittanceListByUser(remittanceParam);
		model.addAttribute("remittanceList", remittanceList);
		return "backend/financial/remittance_history";
	}
}
