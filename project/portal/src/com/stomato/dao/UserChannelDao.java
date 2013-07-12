package com.stomato.dao;

import java.util.List;

import com.stomato.domain.BaseParam;
import com.stomato.domain.UserChannel;

public interface UserChannelDao {

	public void addUserChannel(UserChannel userChannel );

	public void updateUserChannel(UserChannel userChannel);
	
	public void deleteUserChannel(int id);

	public List<UserChannel> listUserChannel(BaseParam param);

	public int listTotal(UserChannel userChannel);

	public UserChannel getUserChannel(int id);
}
