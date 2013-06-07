package com.stomato.dao;

import org.apache.ibatis.annotations.Param;

import com.stomato.domain.PushTest;

public interface PushTestDao {

	public PushTest getPushTest(@Param("uid") int uid,@Param("appid") int appid);
	
	public void updatePushTest(PushTest pushTest);
	
	public void addPushTest(PushTest pushTest);
}
