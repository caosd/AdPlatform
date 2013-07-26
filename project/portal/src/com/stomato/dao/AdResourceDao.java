package com.stomato.dao;

import java.util.List;

import com.stomato.domain.AdResource;
import com.stomato.form.AdResourceFormParam;

public interface AdResourceDao {

	public int hasPackage(String _package);

	public void addAdResource(AdResource adResource);

	public void updateAdResource(AdResource adResource);

	public List<AdResource> listAdResource(AdResourceFormParam param);

	public int listTotal(AdResourceFormParam param);

	public AdResource getAdResource(int id);
}
