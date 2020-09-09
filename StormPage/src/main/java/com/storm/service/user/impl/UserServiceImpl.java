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
		
		List<User> list = userDao.getUserList(search);
		int totalCount = userDao.getTotalCount(search);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	@Override
	public User getUserAdmin(String userId) throws Exception {
		//debugging
		System.out.println("UserServiceImpl getUserAdmin");
		return userDao.getUserAdmin(userId);
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
	public void updateBaptismName(User user) throws Exception {
		//debugging
		System.out.println("UserServiceImpl updateBaptismName");
		userDao.updateBaptismName(user);
	}

	@Override
	public void updatePositionLeader(String userId) throws Exception {
		//debugging
		System.out.println("UserServiceImpl updatePositionLeader");
		userDao.updatePositionLeader(userId);
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
	
}// end of class
