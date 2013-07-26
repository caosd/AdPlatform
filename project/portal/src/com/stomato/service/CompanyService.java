package com.stomato.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stomato.dao.CompanyDao;
import com.stomato.domain.Company;
import com.stomato.form.CompanyFormParam;

@Service
public class CompanyService {

	@Autowired
	private CompanyDao companyDao;

	public void addCompany(Company Company) {
		companyDao.addCompany(Company);
	}

	public void updateCompany(Company Company) {
		companyDao.updateCompany(Company);
	}
	public void deleteCompany(int id) {
		companyDao.deleteCompany(id);
	}
	public List<Company> listCompany(CompanyFormParam formParam) {
		return companyDao.listCompany(formParam);
	}
	/**
	 * 获取所有有效的厂商列表
	 * @return
	 */
	public List<Company> getCompanyListByActive(){
		CompanyFormParam param = new CompanyFormParam();
		param.setStatus(1);
		return companyDao.listCompany(param);
	}
	
	public int listTotal(CompanyFormParam formParam) {
		return companyDao.listTotal(formParam);
	}

	public Company getCompany(int id) {
		return companyDao.getCompany(id);
	}
}
