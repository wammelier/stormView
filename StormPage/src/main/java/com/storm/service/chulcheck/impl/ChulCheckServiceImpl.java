package com.storm.service.chulcheck.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.storm.common.Search;
import com.storm.service.chulcheck.ChulCheckDao;
import com.storm.service.chulcheck.ChulCheckService;
import com.storm.service.domain.ChulCheck;
import com.storm.service.domain.User;
import com.storm.service.user.UserDao;
import com.storm.service.user.UserService;


@Service("chulCheckServiceImpl")
public class ChulCheckServiceImpl implements ChulCheckService {
	
	@Autowired
	@Qualifier("chulCheckDaoImpl")
	private ChulCheckDao chulCheckDao;
	public void setUserDao(ChulCheckDao chulCheckDao) {
		this.chulCheckDao = chulCheckDao;
	}
	
	//Constructor
	public ChulCheckServiceImpl() {
		super();
	}
	
	public void insertChulCheck(ChulCheck chulCheck) throws Exception {
		System.out.println("ChulCheckServiceImpl insertChulCheck");
		chulCheckDao.insertChulCheck(chulCheck);
	}

	@Override
	public ChulCheck getChulCheck() throws Exception {
		// TODO Auto-generated method stub
		return chulCheckDao.getChulCheck();
	}
	
	
	
	
}// end of class
