package com.stomato.dao;

import java.util.List;

import com.stomato.domain.AdResource;
import com.stomato.domain.FormParam;

public interface AdResourceDao {

	public int hasPackage(String _package);

	public void addAdResource(AdResource adResource);

	public void updateAdResource(AdResource adResource);

	public List<AdResource> listAdResource(FormParam param);

	public int listTotal(FormParam param);

	public AdResource getAdResource(int id);
}
