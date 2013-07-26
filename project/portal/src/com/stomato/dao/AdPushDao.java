package com.stomato.dao;

import java.util.List;
import java.util.Map;

import com.stomato.domain.AdPush;
import com.stomato.domain.FormParam;

/**
 * 推送广告资源控制
 * 
 * @author jiandong
 */
public interface AdPushDao extends BaseDao<AdPush> {

	List<Map<String,Object>> getListMap(FormParam formParam);
}