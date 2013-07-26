package com.stomato.dao;

import java.util.List;

import com.stomato.domain.Company;
import com.stomato.form.CompanyFormParam;

public interface CompanyDao {

	public void addCompany(Company company );

	public void updateCompany(Company company);
	
	public void deleteCompany(int id);

	public List<Company> listCompany(CompanyFormParam formParam);

	public int listTotal(CompanyFormParam formParam);

	public Company getCompany(int id);
}
