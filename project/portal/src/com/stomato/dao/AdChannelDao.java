package com.stomato.dao;

import java.util.List;

import com.stomato.domain.AdChannel;
import com.stomato.domain.BaseParam;

public interface AdChannelDao {

	public void addAdChannel(AdChannel adChannel );

	public void updateAdChannel(AdChannel adChannel);
	
	public void deleteAdChannel(int id);

	public List<AdChannel> listAdChannel(BaseParam param);

	public int listTotal(AdChannel adChannel);

	public AdChannel getAdChannel(int id);
}
