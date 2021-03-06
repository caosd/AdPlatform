package com.stomato.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stomato.dao.PushTestDao;
import com.stomato.domain.PushTest;

@Service
public class PushTestService {

	@Autowired
	private PushTestDao pushTestDao;
	
	public PushTest getPushTest(int uid, String appKey) {
		return this.pushTestDao.getPushTest(uid, appKey);
	}

	public void updatePushTest(PushTest pushTest) {
		this.pushTestDao.updatePushTest(pushTest);
	}

	public void addPushTest(PushTest pushTest) {
		this.pushTestDao.addPushTest(pushTest);
	}
}
