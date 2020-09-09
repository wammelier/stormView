package com.storm.service.user;

import java.util.Map;

import com.storm.common.Search;
import com.storm.service.domain.User;

public interface UserService {

	public Map<String,Object> getUserList(Search search) throws Exception;

	public User getUser(String userId) throws Exception;
	
	public Map<String,Object> getDeletedUserList(Search search) throws Exception;
	
	public User getUserAdmin(String userId) throws Exception;
	
	public void addUserAdmin(User user) throws Exception;
		
	public void addUser(User user) throws Exception;
	
	public void updateUser(User user) throws Exception;
	
	public void updatePwd(User user) throws Exception;
	
	public void updatePhone(User user) throws Exception;
	
	public void updateBaptismName(User user) throws Exception;
	
	public void updatePositionLeader(String userId) throws Exception;
	
	public void updateLeaderName(User user) throws Exception;
	
	public void deleteUser(String userId) throws Exception;
	
	
}
