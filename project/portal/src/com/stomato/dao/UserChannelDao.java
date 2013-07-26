package com.stomato.dao;

import java.util.List;

import com.stomato.domain.FormParam;
import com.stomato.domain.UserChannel;

public interface UserChannelDao {

	public void addUserChannel(UserChannel userChannel );

	public void updateUserChannel(UserChannel userChannel);
	
	public void deleteUserChannel(int id);

	public List<UserChannel> listUserChannel(FormParam formParam);

	public int listTotal(FormParam formParam);

	public UserChannel getUserChannel(int id);
}
