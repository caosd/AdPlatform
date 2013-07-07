package com.stomato.dao;

import java.util.List;

import com.stomato.domain.AdResource;
import com.stomato.domain.AdResourceParam;

public interface AdResourceDao {

	public int hasPackage(String _package);

	public void addAdResource(AdResource adResource);

	public void updateAdResource(AdResource adResource);

	public List<AdResource> listAdResource(AdResourceParam param);

	public int listTotal(AdResourceParam param);

	public AdResource getAdResource(int id);
}