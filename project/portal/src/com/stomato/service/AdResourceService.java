package com.stomato.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stomato.dao.AdResourceDao;
import com.stomato.domain.AdPush;
import com.stomato.domain.AdResource;
import com.stomato.form.AdResourceFormParam;

@Service
public class AdResourceService {

	@Autowired
	private AdResourceDao adResourceDao;
	@Autowired
	private AdPushService adPushService;
	
	public int hasPackage(String _package){
		return adResourceDao.hasPackage(_package);
	}
	
	public void addAdResource(AdResource adResource){
		adResourceDao.addAdResource(adResource);
		//插入推送控制
		AdPush adPush = new AdPush();
		adPush.setAdresourceId(adResource.getId());
		adPushService.add(adPush);
	}
	
	public void updateAdResource(AdResource adResource){
		adResourceDao.updateAdResource(adResource);
	}
	
	public List<AdResource> listAdResource(AdResourceFormParam param){
		return adResourceDao.listAdResource(param);
	}
	
	public int listTotal(AdResourceFormParam param){
		return adResourceDao.listTotal(param);
	}
	
	public AdResource getAdResource(int id){
		return  adResourceDao.getAdResource(id);
	}
	
	public List<AdResource> getRecycleList(AdResourceFormParam param){
		param.setIsDel(true);
		return adResourceDao.listAdResource(param);
	}
}
