package com.stomato.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stomato.dao.AdChannelDao;
import com.stomato.dao.AdChannelParam;
import com.stomato.domain.AdChannel;

@Service
public class AdChannelService {

	@Autowired
	private AdChannelDao AdChannelDao;

	public void addAdChannel(AdChannel adChannel) {
		AdChannelDao.addAdChannel(adChannel);
	}

	public void updateAdChannel(AdChannel adChannel) {
		AdChannelDao.updateAdChannel(adChannel);
	}

	public List<AdChannel> listAdChannel(AdChannelParam params) {
		return AdChannelDao.listAdChannel(params);
	}

	public int listTotal(AdChannelParam params) {
		return AdChannelDao.listTotal(params);
	}

	public AdChannel getAdChannel(int id) {
		return AdChannelDao.getAdChannel(id);
	}
}
