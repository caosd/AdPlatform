package com.stomato.dao;

import java.util.List;

import com.stomato.domain.BaseParam;
import com.stomato.domain.Company;

public interface CompanyDao {

	public void addCompany(Company company );

	public void updateCompany(Company company);
	
	public void deleteCompany(int id);

	public List<Company> listCompany(BaseParam param);

	public int listTotal(Company company);

	public Company getCompany(int id);
}
