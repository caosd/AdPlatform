package com.stomato.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stomato.dao.UserChannelDao;
import com.stomato.domain.UserChannel;
import com.stomato.domain.BaseParam;

@Service
public class UserChannelService {

	@Autowired
	private UserChannelDao userChannelDao;

	public void addUserChannel(UserChannel UserChannel) {
		userChannelDao.addUserChannel(UserChannel);
	}

	public void updateUserChannel(UserChannel UserChannel) {
		userChannelDao.updateUserChannel(UserChannel);
	}
	
	public void openPushChannel(UserChannel userChannel){
		if( userChannel != null ){
			userChannel.setStatus(1);
			userChannelDao.updateUserChannel(userChannel);
		}
	}
	public void closePushChannel(UserChannel userChannel){
		if( userChannel != null ){
			userChannel.setStatus(0);
			userChannelDao.updateUserChannel(userChannel);
		}
	}
	public void deleteUserChannel(int id) {
		userChannelDao.deleteUserChannel(id);
	}
	public List<UserChannel> listUserChannel(BaseParam param) {
		return userChannelDao.listUserChannel(param);
	}

	public int listTotal(UserChannel UserChannel) {
		return userChannelDao.listTotal(UserChannel);
	}

	public UserChannel getUserChannel(int id) {
		return userChannelDao.getUserChannel(id);
	}
}
