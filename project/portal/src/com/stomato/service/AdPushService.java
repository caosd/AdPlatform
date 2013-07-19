package com.stomato.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stomato.constant.Constant;
import com.stomato.dao.AdPushDao;
import com.stomato.domain.AdPush;
import com.stomato.domain.BaseParam;

@Service
public class AdPushService {

	@Autowired
	private AdPushDao dao;

	/**
	 * 添加广告推送控制
	 * 
	 * @param adPush
	 * @return
	 */
	public int add(AdPush adPush) {
		return dao.add(adPush);
	}
	
	public AdPush get(int id){
		return dao.get(id);
	}

	/**
	 * 更新广告推送控制
	 * 
	 * @param adPush
	 * @return
	 */
	public boolean update(AdPush adPush) {
		return dao.update(adPush) > 0;
	}

	/**
	 * 打开广告推送业务
	 * 
	 * @param adPush
	 * @return
	 */
	public boolean openPush(AdPush adPush) {
		adPush.setStatus(Constant.AdPushStatus.open);
		return update(adPush);
	}

	/**
	 * 关闭广告推送业务
	 * 
	 * @param adPush
	 * @return
	 */
	public boolean closePush(AdPush adPush) {
		adPush.setStatus(Constant.AdPushStatus.close);
		return update(adPush);
	}

	/**
	 * 查询广告推送控制列表
	 * 
	 * @param baseParam
	 * @return
	 */
	public List<Map<String,Object>> getListMap(BaseParam baseParam) {
		return dao.getListMap(baseParam);
	}

	public int listTotal(AdPush adPush) {
		return dao.listTotal(adPush);
	}
}
