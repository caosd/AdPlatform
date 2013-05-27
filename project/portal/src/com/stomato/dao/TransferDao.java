package com.stomato.dao;

import java.util.List;

import com.stomato.domain.Transfer;

public interface TransferDao {
	
	void insert(Transfer transfer);
	
	Transfer select(String transferNo);
	
	List<Transfer> selectAll(int uid);
	
}
