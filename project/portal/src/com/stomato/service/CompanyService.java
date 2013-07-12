package com.stomato.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stomato.dao.CompanyDao;
import com.stomato.domain.BaseParam;
import com.stomato.domain.Company;

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
	public List<Company> listCompany(BaseParam param) {
		return companyDao.listCompany(param);
	}
	/**
	 * 获取所有有效的厂商列表
	 * @return
	 */
	public List<Company> getCompanyListByActive(){
		BaseParam param = new BaseParam();
		Company company = new Company();
		company.setStatus(1);
		param.setParam(company);
		return companyDao.listCompany(param);
	}
	
	public int listTotal(Company Company) {
		return companyDao.listTotal(Company);
	}

	public Company getCompany(int id) {
		return companyDao.getCompany(id);
	}
}
