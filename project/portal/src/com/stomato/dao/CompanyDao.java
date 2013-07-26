package com.stomato.dao;

import java.util.List;

import com.stomato.domain.Company;
import com.stomato.domain.FormParam;

public interface CompanyDao {

	public void addCompany(Company company );

	public void updateCompany(Company company);
	
	public void deleteCompany(int id);

	public List<Company> listCompany(FormParam formParam);

	public int listTotal(FormParam formParam);

	public Company getCompany(int id);
}
