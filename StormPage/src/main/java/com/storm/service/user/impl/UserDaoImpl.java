package com.storm.service.user.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.storm.common.Search;
import com.storm.service.domain.User;
import com.storm.service.user.UserDao;


@Repository("userDaoImpl")
public class UserDaoImpl implements UserDao {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlsession) {
		this.sqlSession = sqlsession;
	}
	
	public UserDaoImpl() {
		super();
		System.out.println(this.getClass());
	}

	@Override
	public List<User> getUserList(Search search) throws Exception {
		//debugging
		System.out.println("UserDaoImpl getUserList");
		return sqlSession.selectList("UserMapper.getUserList", search);
	}
	
	@Override
	public int getTotalCount(Search search) throws Exception {
		//debugging
		System.out.println("UserDaoImpl getTotalCount");
		return sqlSession.selectOne("UserMapper.getTotalCount", search);
	}

	@Override
	public User getUser(String userId) throws Exception {
		//debugging
		System.out.println("UserDaoImpl getUser");
		return sqlSession.selectOne("UserMapper.getUser", userId);
	}

	@Override
	public List<User> getDeletedUserList(Search search) throws Exception {
		//debugging
		System.out.println("UserDaoImpl getDeletedUserList");
		return sqlSession.selectList("UserMapper.getDeletedUserList", search);
	}

	@Override
	public User getUserAdmin(String userName) throws Exception {
		//debugging
		System.out.println("UserDaoImpl getUserAdmin");
		return sqlSession.selectOne("UserMapper.getUserAdmin", userName);
	}

	@Override
	public void addUserAdmin(User user) throws Exception {
		//debugging
		System.out.println("UserDaoImpl addUserAdmin");
		sqlSession.insert("UserMapper.addUserAdmin", user);
	}

	@Override
	public void addUser(User user) throws Exception {
		// debugging
		System.out.println("UserDaoImpl addUser");
		sqlSession.insert("UserMapper.addUser", user);
	}

	@Override
	public void updateUser(User user) throws Exception {
		// debugging
		System.out.println("UserDaoImpl updateUser");
		sqlSession.update("UserMapper.updateUser", user);
	}

	@Override
	public void updatePwd(User user) throws Exception {
		// debugging
		System.out.println("UserDaoImpl updatePwd");
		sqlSession.update("UserMapper.updatePwd", user);
	}

	@Override
	public void updatePhone(User user) throws Exception {
		// debugging
		System.out.println("UserDaoImpl updatePhone");
		sqlSession.update("UserMapper.updatePhone", user);
	}

	@Override
	public void updatePositionLeader(String userName) throws Exception {
		// debugging
		System.out.println("UserDaoImpl updatePositionLeader");
		sqlSession.update("UserMapper.updatePositionLeader", userName);
	}

	@Override
	public void updateLeaderName(User user) throws Exception {
		// debugging
		System.out.println("UserDaoImpl updateLeaderName");
		sqlSession.update("UserMapper.updateLeaderName", user);
	}

	@Override
	public void deleteUser(String userId) throws Exception {
		// debugging
		System.out.println("UserDaoImpl deleteUser");
		sqlSession.update("UserMapper.deleteUser", userId);
	}

	@Override
	public List<User> getAddUserAdminList(Search search) throws Exception {
		// debugging
		System.out.println("UserDaoImpl getUserAdminList");
		return sqlSession.selectList("UserMapper.getAddUserAdminList", search);
	}

	@Override
	public void updateUserAdmin(User user) throws Exception {
		// debugging
		System.out.println("UserDaoImpl updateUserAdmin");
		sqlSession.update("UserMapper.updateUserAdmin", user);
	}

	@Override
	public User getCombackUser(String userId) throws Exception {
		// debugging
		System.out.println("UserDaoImpl getCombackUser");
		
		return sqlSession.selectOne("UserMapper.combackUser", userId);
	}

	@Override
	public User getUserConfirm(User user) throws Exception {
		// debugging
		System.out.println("UserDaoImpl getUserconfirm");
		
		return sqlSession.selectOne("UserMapper.userConfirm", user);
	}
	
	@Override
	public User getLoginUser(String userId) throws Exception {
		//debugging
		System.out.println("UserDaoImpl getLoginUser");
		
		return sqlSession.selectOne("UserMapper.loginUser", userId);
	}
	
}// end of class
