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
	public void comeBackUser(String comebackId) throws Exception {
		// debugging
		System.out.println("UserDaoImpl getCombackUser");
		
		sqlSession.update("UserMapper.combackUser", comebackId);
	}

	@Override
	public User getUserConfirm(String userName) throws Exception {
		// debugging
		System.out.println("UserDaoImpl getUserconfirm");
		
		return sqlSession.selectOne("UserMapper.userConfirm", userName);
	}
	
	@Override
	public User getLoginUser(String userId) throws Exception {
		//debugging
		System.out.println("UserDaoImpl getLoginUser");
		
		return sqlSession.selectOne("UserMapper.loginUser", userId);
	}

	@Override
	public List<User> getLeaderNameList() throws Exception {
		// debugging
		System.out.println("UserDaoImpl getLeaderNameList");
		
		return sqlSession.selectList("UserMapper.getLeaderNameList");
	}

	@Override
	public void deleteLeaderPostion(String userName) throws Exception {
		// debugging
		System.out.println("UserDaoImpl deleteLeaderPosition");
		
		sqlSession.update("UserMapper.deleteLeaderPosition", userName);
	}

	@Override
	public void updateSignUpFlag(String userName) throws Exception {
		// debugging
		System.out.println("UserDaoImpl updateSignUpFlag");
		
		sqlSession.update("UserMapper.updateSignUpFlag", userName);
		
	}

	@Override
	public void deleteNamePhone(String userName) throws Exception {
		// debugging
		System.out.println("UserDaoImpl deleteNamePhone");
		
		sqlSession.delete("UserMapper.deletedNamePhone", userName);
		
	}

	@Override
	public List<User> getFenceList(Search search) throws Exception {
		// debugging
		System.out.println("UserDaoImpl getFenceList");
		
		return sqlSession.selectList("UserMapper.getFenceList", search);
		
	}

	@Override
	public void deleteAllLeaderName(String leaderName) throws Exception {
		// debugging
		System.out.println("UserDaoImpl deleteAllLeaderName");
		
		sqlSession.update("UserMapper.deleteAllLeaderName", leaderName);
		
	}

	@Override
	public User getNickNameCheck(String nickName) throws Exception {
		// debugging
		System.out.println("UserDaoImpl getNickNameCheck");
		
		return sqlSession.selectOne("UserMapper.nickNameCheck", nickName);
	}

	@Override
	public void updateNickName(User user) throws Exception {
		// debugging
		System.out.println("UserDaoImpl updateNickName");
		
		sqlSession.update("UserMapper.updateNickName", user);
		
	}
	
}// end of class
