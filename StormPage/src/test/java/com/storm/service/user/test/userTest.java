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
public class userTest {

	@Autowired
	@Qualifier("userServiceImpl")
	private UserService service;
	

	@Test
	@Rollback(true)
	public void testGetUserList() throws Exception {

		System.out.println("getUserList Test start! !");
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		
		Map<String,Object> map = service.getUserList(search);
		
		List<Object> list = (List<Object>)map.get("list");
		Assert.assertEquals(3, list.size());
		
		Integer totalCount = (Integer)map.get("totalCount");
		System.out.println("totalCount ==> "+totalCount);
		
	}
	
	@Test
	public void testGetUser() throws Exception {
		
		System.out.println("getUser TEST START!!! ");
		
		User user = service.getUser("sw4417");
		
		Assert.assertEquals(user.getUserId(), "sw4417");
		Assert.assertEquals(user.getUserName(), "�댁�뱁��");
		Assert.assertEquals(user.getNickName(), "wammelier");
		Assert.assertEquals(user.getPhone(), "01043304417");
		Assert.assertEquals(user.getGender(), "1");
		Assert.assertEquals(user.getBirth(), "19930124");
		Assert.assertEquals(user.getAddress(), "寃쎄린�� 援고�ъ�� ��");
		
	}
	
	@Test
	public void testGetDeletedUserList() throws Exception{
		
		System.out.println("getDeletedUserList");
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		
		Map<String,Object> map = service.getDeletedUserList(search);
		
		List<Object> list = (List<Object>)map.get("list");
		Assert.assertEquals(0, list.size());
		
		Integer totalCount = (Integer)map.get("totalCount");
		System.out.println("totalCount == > " + totalCount);
		
	}
	
	@Test
	public void testGetUserAdmin() throws Exception{
		
		System.out.println("getUserAdmin");
		
		User user = service.getUserAdmin("�댁�뱁��");
		
		Assert.assertEquals(user.getUserName(), "�댁�뱁��");
		Assert.assertEquals(user.getPhone(), "01043304417");
		Assert.assertEquals(user.getLeaderName(), "�댁�뱁��");
	}
	
	@Test
	public void testAddUserAdmin() throws Exception{
		
		System.out.println("Test AddUserAdmin");
		
		User user = new User();
		user.setUserName("���밸��");
		user.setPhone("5739207492");
		
		service.addUserAdmin(user);
		
		user = service.getUserAdmin("���밸��");
		
		Assert.assertEquals(user.getUserName(), "���밸��");
		Assert.assertEquals(user.getPhone(), "5739207492");

	}
	
	@Test
	public void getAdduserAdminList() throws Exception{
		
		System.out.println("TEST getAddUserAdminList");
		
		Search search = new Search();
		search.setCurrentPage(3);
		search.setPageSize(3);
		
		Map<String,Object> map = service.getAddUserAdminList(search);
		
		List<Object> list = (List<Object>)map.get("list");
		Assert.assertEquals(3, list.size());
		
		Integer totalCount = (Integer)map.get("totalCount");
		System.out.println("totalCount ==> "+totalCount);
		
	}
	
	@Test
	public void updatePositionLeader() throws Exception{
		
		System.out.println("TEST updatePositionLeader");
		
		service.updatePositionLeader("諛���嫄�");
		
		User user = service.getUserAdmin("諛���嫄�");
		Assert.assertEquals(user.getUserName(), "諛���嫄�");
		Assert.assertEquals(user.getUserPosition(), "1");
		Assert.assertEquals(user.getLeaderName(), "諛���嫄�");
	
	}
	
	@Test
	public void updateUserAdmin() throws Exception{
		
		System.out.println("TEST updateUserAdmin");

		User user = service.getUserAdmin("�댁�뱁��");
		Assert.assertEquals(user.getUserName(), "�댁�뱁��");
		Assert.assertEquals(user.getPhone(), "01043304417");
		Assert.assertEquals(user.getAddress(), null);
		Assert.assertEquals(user.getBirth(), null);
		Assert.assertEquals(user.getBaptismName(), "0");
		
		user.setAddress("寃쎄린�� 援고�ъ�� �밸��");
		user.setBirth("19930124");
		user.setBaptismName("1");
		
		service.updateUserAdmin(user);
		user = service.getUserAdmin("�댁�뱁��");
		Assert.assertEquals(user.getUserName(), "�댁�뱁��");
		Assert.assertEquals(user.getPhone(), "01043304417");
		Assert.assertEquals(user.getAddress(), "寃쎄린�� 援고�ъ�� �밸��");
		Assert.assertEquals(user.getBirth(), "19930124");
		Assert.assertEquals(user.getBaptismName(), "1");
		
	}
	
	// deletedUser + getDeletedUserList 媛��댄���ㅽ��
	@Test
	public void getDeletedUserList() throws Exception{
		
		System.out.println("TEST getdeletedUserList");
		
		service.deleteUser("sw4417");
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		
		Map<String,Object> map = service.getDeletedUserList(search);
		
		List<Object> list = (List<Object>)map.get("list");
		Assert.assertEquals(1, list.size());
		
		Integer totalCount = (Integer)map.get("totalCount");
		System.out.println("totalCount ==> "+totalCount);
		
	}
	
	@Test
	public void updateLeaderName() throws Exception{
		
		System.out.println("TEST updateLeaderName");
		
		User user = service.getUserAdmin("�댁�뱁��");
		user.setLeaderName("��臾닿�");
		
		service.updateLeaderName(user);
		Assert.assertEquals(user.getUserName(), "�댁�뱁��");
		Assert.assertEquals(user.getLeaderName(), "��臾닿�");
		
	}
	
	@Test
	public void addUser() throws Exception{
		
		System.out.println("TEST AddUser");
		
		User user = new User();
		user.setUserId("abcd123");
		user.setUserPwd("12345678");
		user.setUserName("���대����");
		user.setNickName("����");
		user.setEmail("abc@naver.com");
		user.setGender("1");
		user.setBirth("19930101");
		user.setAddress("��援� �댁�援� ��姨�");
		
		service.addUser(user);
		user = service.getUser("abcd123");
		
		Assert.assertEquals(user.getUserId(), "abcd123");
		Assert.assertEquals(user.getUserPwd(), "12345678");
		Assert.assertEquals(user.getUserName(), "���대����");
		Assert.assertEquals(user.getNickName(), "����");
		Assert.assertEquals(user.getEmail(), "abc@naver.com");
		Assert.assertEquals(user.getGender(), "1");
		Assert.assertEquals(user.getBirth(), "19930101");
		Assert.assertEquals(user.getAddress(), "��援� �댁�援� ��姨�");
		Assert.assertEquals(user.getPhone(), "01009876543");
		Assert.assertEquals(user.getUserImg(), null);
	}
	
	@Test
	public void updateUser() throws Exception{
		
		System.out.println("TEST updateUser");
		
		User user = service.getUser("sw4417");
		user.setNickName("wammelier");
		user.setEmail("sw4417@daum.net");
		user.setAddress("誘멸뎅 ��遺� 濡��ㅼ���ㅻ����");
		user.setBirth("19920101");
		
		service.updateUser(user);
		
		user = service.getUser("sw4417");
		Assert.assertEquals(user.getUserId(), "sw4417");
		Assert.assertEquals(user.getNickName(), "wammelier");
		Assert.assertEquals(user.getEmail(), "sw4417@daum.net");
		Assert.assertEquals(user.getAddress(), "誘멸뎅 ��遺� 濡��ㅼ���ㅻ����");
		Assert.assertEquals(user.getBirth(), "19920101");
	}
	
	@Test
	public void updatePwd() throws Exception{
		
		System.out.println("TEST updatePwd");
		
		User user = service.getUser("sw4417");
		user.setUserPwd("43304417");
		
		service.updatePwd(user);
		
		user = service.getUser("sw4417");
		Assert.assertEquals(user.getUserId(), "sw4417");
		Assert.assertEquals(user.getUserPwd(), "43304417");
		
	}
	
	@Test
	public void updatePhone() throws Exception{
		
		System.out.println("TEST updatePhone");
		
		User user = service.getUser("sw4417");
		user.setPhone("01050493317");
		
		service.updatePhone(user);
		
		user = service.getUser("sw4417");
		Assert.assertEquals(user.getUserId(), "sw4417");
		Assert.assertEquals(user.getPhone(), "01050493317");
		
	}
	
	@Test
	public void userConfirm() throws Exception {
		
		System.out.println("TEST userConfirm");
		
		User user = service.getUser("sw4417");
		
		user = service.getUserConfirm(user.getUserName());
		
		Assert.assertEquals(user.getUserId(), "sw4417");
		Assert.assertEquals(user.getUserPwd(), "504944");
		
	}
	
	@Test
	public void loginUser() throws Exception {
		
		System.out.println("TEST loginUser");
		
		User user = service.getLoginUser("sw4417");

		Assert.assertEquals(user.getUserId(), "sw4417");
		Assert.assertEquals(user.getUserPwd(), "504944");
	}
	
	@Test
	public void getLeaderNameList() throws Exception {
		
		System.out.println("TEST getLeaderNameList");
		
		Map<String,Object> map = service.getLeaderNameList();
		
		List<User> list = (List<User>)map.get("leaderList");
		
		Assert.assertEquals(1, list.size());
		
	}
	
	@Test
	public void deleteLeaderPosition() throws Exception {
		
		System.out.println("TEST deleteLeaderPosition");
		
		User user = service.getUserAdmin("�댁�뱁��");
		System.out.println("user ==>"+user);
		
		service.deleteLeaderPostion(user.getUserName());
		user = service.getUserAdmin(user.getUserName());
		
		Assert.assertEquals("0", user.getUserPosition());
	}
	
	@Test
	public void UpdateSignUpFalg() throws Exception {
		
		System.out.println("TEST updateSignUpFlag");
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		
		Map<String,Object> map = service.getAddUserAdminList(search);
		
		List<Object> list = (List<Object>)map.get("list");
		Assert.assertEquals(3, list.size());
		
		User user = (User)list.get(0);
		System.out.println("list.get==? "+user);
		
		service.updateSignUpFlag(user.getUserName());
		map = service.getAddUserAdminList(search);
		list = (List<Object>)map.get("list");
		
		user = (User)list.get(0);
		
		Assert.assertEquals("1", user.getSignupFlag());
	}
	@Test
	public void deleteNamePhone() throws Exception {
		
		System.out.println("TEST deleteNamePhone");
		
		service.deleteNamePhone("源��대����");
		User user = service.getUserAdmin("源��대����");
		
		Assert.assertEquals(null, user.getUserName());
	}
	
	@Test
	public void getFenceList() throws Exception {
		
		System.out.println("TEST getFenceList");
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		search.setSearchKeyword(null);
		search.setSearchCondition("3");
		
		Map<String,Object> map = service.getFenceList(search);
		
		List<Object> list = (List<Object>)map.get("list");
		Assert.assertEquals(2, list.size());
		
		User user = (User)list.get(0);
		System.out.println("list.get==? "+user);
		
		Assert.assertEquals("����", user.getUserName());
	}
	
	@Test
	public void comebackUser() throws Exception {
		
		System.out.println("TEST comebackUser");
		
		service.comeBackUser("sw4417");
		User user = service.getUser("sw4417");
		
		Assert.assertEquals("sw4417", user.getUserId());
		Assert.assertEquals("0", user.getUserDeleted());
		
	}
	

}













