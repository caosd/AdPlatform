package com.stomato.dao;

import java.util.List;

import com.stomato.domain.AdChannel;
import com.stomato.form.AdChannelFormParam;

public interface AdChannelDao {

	public void addAdChannel(AdChannel adChannel );

	public void updateAdChannel(AdChannel adChannel);
	
	public void deleteAdChannel(int id);

	public List<AdChannel> listAdChannel(AdChannelFormParam param);

	public int listTotal(AdChannelFormParam param);

	public AdChannel getAdChannel(int id);
}
