package com.stomato.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.stomato.controller.UserController;
import com.stomato.domain.Remittance;
import com.stomato.form.RemittanceParamForm;
import com.stomato.service.RemittanceService;

@Controller
@RequestMapping("/admin/financial")
public class AdminFinancialController extends UserController{

	@Autowired
	private RemittanceService remittanceService;

	@RequestMapping(value="/udpate_remittance")
	public String updateRemittanceStatus(@ModelAttribute("remittanceParamForm") RemittanceParamForm paramForm,HttpServletRequest request, HttpServletResponse response, Model model) {
		return "admin/financial/remittance_list";
	}
	
	@RequestMapping("/remittance_list")
	public String remittance_history(@ModelAttribute("remittanceParamForm") RemittanceParamForm paramForm,HttpServletRequest request, Model model) {
		List<Remittance> remittanceList = this.remittanceService.getRemittanceList(paramForm.asPojo());
		model.addAttribute("remittanceList", remittanceList);
		return "admin/financial/remittance_list";
	}
}
