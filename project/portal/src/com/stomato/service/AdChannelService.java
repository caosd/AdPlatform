package com.stomato.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stomato.dao.AdChannelDao;
import com.stomato.domain.AdChannel;
import com.stomato.domain.BaseParam;

@Service
public class AdChannelService {

	@Autowired
	private AdChannelDao adChannelDao;

	public void addAdChannel(AdChannel adChannel) {
		adChannelDao.addAdChannel(adChannel);
	}

	public void updateAdChannel(AdChannel adChannel) {
		adChannelDao.updateAdChannel(adChannel);
	}
	public void deleteAdChannel(int id) {
		adChannelDao.deleteAdChannel(id);
	}
	public List<AdChannel> listAdChannel(BaseParam param) {
		return adChannelDao.listAdChannel(param);
	}

	public int listTotal(AdChannel adChannel) {
		return adChannelDao.listTotal(adChannel);
	}

	public AdChannel getAdChannel(int id) {
		return adChannelDao.getAdChannel(id);
	}
}
