package com.stomato.dao;

import java.util.List;

import com.stomato.domain.AdChannel;
import com.stomato.domain.FormParam;

public interface AdChannelDao {

	public void addAdChannel(AdChannel adChannel );

	public void updateAdChannel(AdChannel adChannel);
	
	public void deleteAdChannel(int id);

	public List<AdChannel> listAdChannel(FormParam param);

	public int listTotal(FormParam param);

	public AdChannel getAdChannel(int id);
}
