package com.stomato.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stomato.dao.AdResourceDao;
import com.stomato.domain.AdPush;
import com.stomato.domain.AdResource;
import com.stomato.domain.BaseParam;

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
	
	public List<AdResource> listAdResource(BaseParam param){
		return adResourceDao.listAdResource(param);
	}
	
	public int listTotal(AdResource adResource){
		return adResourceDao.listTotal(adResource);
	}
	
	public AdResource getAdResource(int id){
		return  adResourceDao.getAdResource(id);
	}
}
