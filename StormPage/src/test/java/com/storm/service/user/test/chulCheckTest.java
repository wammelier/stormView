package com.storm.service.user.test;

import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.storm.common.Search;
import com.storm.service.chulcheck.ChulCheckService;
import com.storm.service.domain.ChulCheck;
import com.storm.service.domain.User;
import com.storm.service.user.UserService;


@RunWith(SpringJUnit4ClassRunner.class)

@ContextConfiguration(locations = { "classpath:config/context-*.xml" })
//@ContextConfiguration(locations = { "classpath:config/context-common.xml", 
//									"classpath:config/context-aspect.xml",
//									"classpath:config/context-mybatis.xml", 
//									"classpath:config/context-transaction.xml" })
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = true)
@Transactional
public class chulCheckTest {

	@Autowired
	@Qualifier("chulCheckServiceImpl")
	private ChulCheckService service;
	

	@Test
	public void addChulCheck() throws Exception {
		
		ChulCheck chulCheck = new ChulCheck();
		chulCheck.setUserId("sw4417");
		chulCheck.setChulCheckDate("2020-09-09");
		service.insertChulCheck(null);
		
		Assert.assertEquals(chulCheck.getUserId(), "sw4417");
		Assert.assertEquals(chulCheck.getChulCheckDate(), "2020-09-09");
		
		
		
		
	}

}













