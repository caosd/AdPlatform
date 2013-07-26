package com.stomato.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stomato.dao.UserChannelDao;
import com.stomato.domain.UserChannel;
import com.stomato.form.UserChannelFormParam;

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
	public List<UserChannel> listUserChannel(UserChannelFormParam formParam) {
		return userChannelDao.listUserChannel(formParam);
	}

	public int listTotal(UserChannelFormParam formParam) {
		return userChannelDao.listTotal(formParam);
	}

	public UserChannel getUserChannel(int id) {
		return userChannelDao.getUserChannel(id);
	}
}
