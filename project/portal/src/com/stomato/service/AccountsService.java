package com.stomato.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stomato.dao.PaymentDao;
import com.stomato.dao.TransferDao;
import com.stomato.dao.UserDao;
import com.stomato.domain.Payment;
import com.stomato.domain.Transfer;
import com.stomato.domain.User;
import com.stomato.form.UserFormParam;

@Service
public class AccountsService {
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private PaymentDao paymentDao;
 
	@Autowired
	private TransferDao transferDao;
	
	public int listTotal(UserFormParam param){
		return userDao.listTotal(param);
	}
	
	public List<User> listUser(UserFormParam param ){
		return userDao.listUser(param);
	}
	
	public void addUser(User user) {
		userDao.addUser(user);
	}

	public void updateUser(User user) {
		userDao.updateUser(user);
	}

	public User getUser(User user) {
		return userDao.getUser(user);
	}
	public User getUserByUid(int uid) {
		return userDao.getUserByUid(uid);
	}
	public int updatePassword(User user) {
		return userDao.updatePassword(user);
	}
	
	public void uploadLoginToken(User user) {
		userDao.updateLoginToken(user);
	}
	
	public void savePayment(Payment payment) {
		if (getPayment(payment.getUid()) != null) {
			paymentDao.update(payment);
		} else {
			paymentDao.insert(payment);
		}
	}
	
	public Payment getPayment(int uid) {
		return paymentDao.select(uid);
	}
	
	public void addStatement(Transfer transfer) {
		transferDao.insert(transfer);
	}
	
	public Transfer selectStatement(String transferNo) {
		return transferDao.select(transferNo);
	}
	
	public List<Transfer> selectAllStatements(int uid) {
		return transferDao.selectAll(uid);
	}
	
	public User getUserByEmail(String email) {
		return userDao.getUserByEmail(email);
	}
	
	public int updateEmail(User user) {
		return userDao.updateEmail(user);
	}
	
	public User verify(User user) {
		return userDao.verify(user);
	}
	
}
