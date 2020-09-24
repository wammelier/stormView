package com.storm.service.user.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.storm.common.Search;
import com.storm.service.domain.User;
import com.storm.service.user.UserDao;
import com.storm.service.user.UserService;


@Service("userServiceImpl")
public class UserServiceImpl implements UserService {
	
	@Autowired
	@Qualifier("userDaoImpl")
	private UserDao userDao;
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	//Constructor
	public UserServiceImpl() {
		super();
	}
	
	@Override
	public Map<String, Object> getUserList(Search search) throws Exception {
		//debugging
		System.out.println("userServiceImpl getUserList");
		
		List<User> list = userDao.getUserList(search);
		int totalCount = userDao.getTotalCount(search);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	@Override
	public User getUser(String userId) throws Exception {
		//debuging
		System.out.println("userServiceImpl getUser");
		return userDao.getUser(userId);
	}

	@Override
	public Map<String, Object> getDeletedUserList(Search search) throws Exception {
		//debugging
		System.out.println("userServiceImpl getUserList");
		
		List<User> list = userDao.getDeletedUserList(search);
		int totalCount = userDao.getTotalCount(search);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	@Override
	public User getUserAdmin(String userName) throws Exception {
		//debugging
		System.out.println("UserServiceImpl getUserAdmin");
		return userDao.getUserAdmin(userName);
	}

	@Override
	public void addUserAdmin(User user) throws Exception {
		//debugging
		System.out.println("UserServiceImpl addUserAdmin");
		userDao.addUserAdmin(user);
	}

	@Override
	public void addUser(User user) throws Exception {
		//debugging
		System.out.println("UserServiceImpl addUser");
		userDao.addUser(user);
	}

	@Override
	public void updateUser(User user) throws Exception {
		//debugging
		System.out.println("UserServiceImpl updateUser");
		userDao.updateUser(user);
	}

	@Override
	public void updatePwd(User user) throws Exception {
		//debugging
		System.out.println("UserServiceImpl updatePwd");
		userDao.updatePwd(user);
	}

	@Override
	public void updatePhone(User user) throws Exception {
		//debugging
		System.out.println("UserServiceImpl updatePhone");
		userDao.updatePhone(user);
	}

	@Override
	public void updatePositionLeader(String userName) throws Exception {
		//debugging
		System.out.println("UserServiceImpl updatePositionLeader");
		userDao.updatePositionLeader(userName);
	}

	@Override
	public void updateLeaderName(User user) throws Exception {
		//debugging
		System.out.println("UserServiceImpl updateLeaderName");
		userDao.updateLeaderName(user);
	}

	@Override
	public void deleteUser(String userId) throws Exception {
		//debugging
		System.out.println("UserServiceImpl deleteUser");
		userDao.deleteUser(userId);
	}

	@Override
	public Map<String, Object> getAddUserAdminList(Search search) throws Exception {
		// debugging
		System.out.println("UserServiceImpl getAddUserAdminList");
		
		List<User> list = userDao.getAddUserAdminList(search);
		int totalCount = userDao.getTotalCount(search);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	@Override
	public void updateUserAdmin(User user) throws Exception {
		// debugging
		System.out.println("UserServiceImpl updateUserAdmin");
		userDao.updateUserAdmin(user);
	}

	@Override
	public void comeBackUser(String comebackId) throws Exception {
		// debugging
		System.out.println("UserServiceImpl combackUser");
		System.out.println("userId ==>" +comebackId);
		userDao.comeBackUser(comebackId);
		
		
		
	}

	@Override
	public User getUserConfirm(User user) throws Exception {
		// debugging
		System.out.println("UserServiceImpl getUseronfirm");
		
		return userDao.getUserConfirm(user);
	}
	
	@Override
	public User getLoginUser(String userId) throws Exception {
		
		//debugging
		System.out.println("UserServiceImpl getLoginUser");
		
		return userDao.getLoginUser(userId);
	}

	@Override
	public Map<String, Object> getLeaderNameList() throws Exception {
		// debugging
		System.out.println("UserServiceImpl getLeaderName");
		
		List<User> list = userDao.getLeaderNameList();
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("leaderList", list);
		
		return map;
	}

	@Override
	public void deleteLeaderPostion(String userName) throws Exception {
		// debugging
		System.out.println("UserServiceImpl deleteLeaderPosition");
		
		userDao.deleteLeaderPostion(userName);
	}

	@Override
	public void updateSignUpFlag(String userName) throws Exception {
		// debugging
		System.out.println("UserServiceImpl updateSignUpFlag");
		
		userDao.updateSignUpFlag(userName);
		
	}

	@Override
	public void deleteNamePhone(String userName) throws Exception {
		// debugging
		System.out.println("UserServiceImpl deleteNamePhone");
		
		userDao.deleteNamePhone(userName);
		
	}

	@Override
	public Map<String, Object> getFenceList(Search search) throws Exception {
		// debugging
		System.out.println("UserServiceImpl getFenceList");
		
		List<User> list = userDao.getFenceList(search);
		int totalCount = userDao.getTotalCount(search);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	@Override
	public void deleteAllLeaderName(String leaderName) throws Exception {
		// debugging
		System.out.println("UserServiceImpl deleteAllLeaderName");
		
		userDao.deleteAllLeaderName(leaderName);
		
	}
	
}// end of class
