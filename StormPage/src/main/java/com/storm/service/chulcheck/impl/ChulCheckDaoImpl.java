package com.storm.service.chulcheck.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.storm.common.Search;
import com.storm.service.chulcheck.ChulCheckDao;
import com.storm.service.domain.ChulCheck;
import com.storm.service.domain.User;
import com.storm.service.user.UserDao;


@Repository("chulCheckDaoImpl")
public class ChulCheckDaoImpl implements ChulCheckDao {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlsession) {
		this.sqlSession = sqlsession;
	}
	
	public ChulCheckDaoImpl() {
		super();
		System.out.println(this.getClass());
	}
	
	public ChulCheck getChulCheck() throws Exception {
		
		return sqlSession.selectOne("ChulCheckMapper.getChulCheck");
	}

	public void insertChulCheck(ChulCheck chulCheck) throws Exception {
		
		System.out.println("ChulCheckDaoImpl insertChulCheck");
		sqlSession.insert("ChulCheckMapper.addChulCheckDate", chulCheck);
	}
	
}// end of class
