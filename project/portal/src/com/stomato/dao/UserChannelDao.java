package com.stomato.dao;

import java.util.List;

import com.stomato.domain.UserChannel;
import com.stomato.form.UserChannelFormParam;

public interface UserChannelDao {

	public void addUserChannel(UserChannel userChannel );

	public void updateUserChannel(UserChannel userChannel);
	
	public void deleteUserChannel(int id);

	public List<UserChannel> listUserChannel(UserChannelFormParam formParam);

	public int listTotal(UserChannelFormParam formParam);

	public UserChannel getUserChannel(int id);
}
