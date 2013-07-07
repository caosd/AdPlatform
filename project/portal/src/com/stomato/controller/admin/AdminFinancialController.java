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
import com.stomato.vo.SysConfig;

@Controller
@RequestMapping("/admin/financial")
public class AdminFinancialController extends UserController{

	@Autowired
	private RemittanceService remittanceService;
	@Autowired
	private UserAccountsService accountsService;

	@RequestMapping(value="/remittance_complete")
	public String remittanceComplete(@ModelAttribute("remittanceParamForm") RemittanceParamForm form,HttpServletRequest request, Model model) {
		int id = super.getIntParameter(request, "id");
		Remittance remittance = this.remittanceService.getRemittance(id);
		UserAccount userAccount = this.accountsService.getUserAccountByUser(this.lookup(request));
		double balance = userAccount.getBalance()-remittance.getMoney();
		if( balance < 0){
			model.addAttribute("error","side.admin.financial.accounts_balance_issu1");
		}else{
			userAccount.setBalance(balance);
			this.accountsService.updateUserAccount(userAccount);
			this.remittanceService.remittanceComplete(remittance.getId());
			model.addAttribute("success","side.admin.financial.remittance_success");
		}
		return this.remittance_history(form, request, model);
	}
	
	@RequestMapping("/remittance_list")
	public String remittance_history(@ModelAttribute("remittanceParamForm") RemittanceParamForm form,HttpServletRequest request, Model model) {
		RemittanceParam remittanceParam= form.asPojo();
		remittanceParam.setUid(super.lookup(request).getUid());
		int total = this.remittanceService.getRemittanceCount(remittanceParam);
		int pageTotal = SysConfig.getPageTotal(total, remittanceParam.getPageSize());
		if(pageTotal<remittanceParam.getPageNum()){ remittanceParam.setPageNum(1); } 
		int start = (remittanceParam.getPageNum()-1)*remittanceParam.getPageSize();
		remittanceParam.setSlimt(start);
		
		List<Remittance> remittanceList = this.remittanceService.getRemittanceList(remittanceParam);
		model.addAttribute("pageTotal", pageTotal);
		model.addAttribute("totalcount", total);
		model.addAttribute("pageNum", form.getPageNum());
		model.addAttribute("remittanceList", remittanceList);
		return "admin/financial/remittance_list";
	}
}
