package com.stomato.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.stomato.controller.UserController;
import com.stomato.domain.Remittance;
import com.stomato.domain.RemittanceParam;
import com.stomato.domain.UserAccount;
import com.stomato.form.RemittanceParamForm;
import com.stomato.service.RemittanceService;
import com.stomato.service.UserAccountsService;
import com.stomato.utils.Pager;

@Controller
@RequestMapping("/admin/financial")
public class AdminFinancialController extends UserController{

	@Autowired
	private RemittanceService remittanceService;
	@Autowired
	private UserAccountsService accountsService;

	@RequestMapping(value="/udpate_remittance")
	public String updateRemittanceStatus(@ModelAttribute("remittanceParamForm") RemittanceParamForm form,HttpServletRequest request, Model model) {
		int id = super.getIntParameter(request, "id");
		Remittance remittance = new Remittance();
		remittance.setId(id);
		remittance = this.remittanceService.getRemittance(remittance);
		UserAccount userAccount = this.accountsService.getUserAccountByUser(this.lookup(request));
		double balance = userAccount.getBalance()-remittance.getMoney();
		if( balance < 0){
			model.addAttribute("error","");
		}else{
			if(remittance.getStatus().intValue() == 0){
				remittance.setStatus(1);
			}else{
				remittance.setStatus(0);
			}
			userAccount.setBalance(balance);
			this.accountsService.updateUserAccount(userAccount);
			this.remittanceService.updateRemittanceStatus(remittance);
		}
		
		return this.remittance_history(form, request, model);
	}
	
	@RequestMapping("/remittance_list")
	public String remittance_history(@ModelAttribute("remittanceParamForm") RemittanceParamForm form,HttpServletRequest request, Model model) {
		RemittanceParam remittanceParam= form.asPojo();
		int records = this.remittanceService.getRemittanceCount(remittanceParam);
		int curPage = this.getIntParameter(request, "p");
		if( curPage < 1) curPage = 1;
		remittanceParam.setRows(3);
		remittanceParam.setSlimt((curPage-1) * 3);
		//分页
		Pager pager = new Pager(remittanceParam.getRows(), curPage, records);
		model.addAttribute("pager", pager);
		List<Remittance> remittanceList = this.remittanceService.getRemittanceList(remittanceParam);
		model.addAttribute("remittanceList", remittanceList);
		return "admin/financial/remittance_list";
	}
}
