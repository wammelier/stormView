package com.storm.service.user;

import java.util.List;
import java.util.Map;

import com.storm.common.Search;
import com.storm.service.domain.User;

public interface UserDao {
	
	public List<User> getAddUserAdminList(Search search) throws Exception;

	public List<User> getUserList(Search search) throws Exception;
	
	public int getTotalCount(Search search) throws Exception;

	public User getUser(String userId) throws Exception;

	public List<User> getDeletedUserList(Search search) throws Exception;

	public User getUserAdmin(String userName) throws Exception;

	public void addUserAdmin(User user) throws Exception;

	public void addUser(User user) throws Exception;

	public void updateUser(User user) throws Exception;
	
	public void updateUserAdmin(User user) throws Exception;
	
	public void updatePwd(User user) throws Exception;
	
	public void updatePhone(User user) throws Exception;

	public void updatePositionLeader(String userName) throws Exception;

	public void updateLeaderName(User user) throws Exception;

	public void deleteUser(String userId) throws Exception;
	
	public User getCombackUser(String userId) throws Exception;
	
	public User getUserConfirm(User user) throws Exception;
	
	public User getLoginUser(String userId) throws Exception;
	
	public List<User> getLeaderNameList() throws Exception;
	
	public void deleteLeaderPostion(String userName) throws Exception;

}
