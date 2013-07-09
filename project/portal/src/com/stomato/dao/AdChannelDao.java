package com.stomato.dao;

import java.util.List;

import com.stomato.domain.AdChannel;

public interface AdChannelDao {

	public void addAdChannel(AdChannel adChannel );

	public void updateAdChannel(AdChannel adChannel);

	public List<AdChannel> listAdChannel(AdChannelParam param);

	public int listTotal(AdChannelParam param);

	public AdChannel getAdChannel(int id);
}
