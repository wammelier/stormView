package com.storm.web.user;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.storm.common.Page;
import com.storm.common.Search;
//import com.ksy.common.MailUtils;
import com.storm.service.domain.User;
import com.storm.service.user.UserService;

@RestController
@RequestMapping("/user/*")
public class UserRestController {

	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
//	@Autowired
//	private JavaMailSender mailSender;	
	
	public UserRestController() {
		System.out.println(this.getClass() + "default Constructor");
	}
	
	@Value("#{commonProperties['postPageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['postPageSize']}")
	int pageSize;

	@RequestMapping(value = "json/login" , method = RequestMethod.POST )
	public Map<String, String> login(@RequestBody User user , HttpSession session )throws Exception {
		
		//debugging
		System.out.println("restController login");
		
		//client로 부터 작성된 id 를 통해 db에서 유저정보GET
		User dbUser = userService.getLoginUser(user.getUserId());
		
		Map<String, String> returnMap = new HashMap<String, String>();
		
		//db에서 GET할 정보가 없을경우 해당하는 아이디는 존재하지 않는 에러메세지를 맵에 담는다.
		if ( dbUser == null ) { 
			returnMap.put("result", "NoSearchId");
		}else {
			//GET할 유저장보는 있지만 패스워드가 다를경우 에러메세지를 맵에 담는다.
			//view에선 json형태로 해당하는 메세지를 통해 플래그 처리를함.
			if(!dbUser.getUserPwd().equals(user.getUserPwd())) {
				returnMap.put("result", "NoSearchPwd");
			}else {
				//ID 정보도 있고 PWD정보도 있을경우 해당 도메인의 값을 Session에 저장한다.
				session.setAttribute("user", dbUser);
				//view에서 플래그처리에 사용될 메세지를 맵에담아 view에 전달
				returnMap.put("result", "ok");
			}// end of else
		}// end of else
		return returnMap;
	}
	
	@RequestMapping(value="json/getUserList", method = RequestMethod.POST)
	public Map<String, Object> getUserList(@RequestBody Search search) throws Exception {
		
		//debugging
		System.out.println("UserRestContoller getUserList");
		
		User user = new User();
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = userService.getUserList(search);
		
		Page resultPage = new Page(search.getCurrentPage(), 
				((Integer)map.get("totalCount")).intValue(), pageSize, pageUnit);
		System.out.println("resultPage==>"+resultPage);
		
		map.put("resultPage", resultPage);
		map.put("search", search);
		System.out.println("map ==>"+map);
		
		return map;
	}
	
	@RequestMapping(value="json/getFenceList", method = RequestMethod.POST)
	public Map<String, Object> getFenceList(@RequestBody Search search) throws Exception {
		
		//debugging
		System.out.println("UserRestContoller getFenceList");
		
		User user = new User();
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = userService.getFenceList(search);
		Map<String, Object> leaderNameMap = userService.getLeaderNameList();
		
		Page resultPage = new Page(search.getCurrentPage(), 
				((Integer)map.get("totalCount")).intValue(), pageSize, pageUnit);
		System.out.println("resultPage==>"+resultPage);
		
		map.put("resultPage", resultPage);
		map.put("search", search);
		System.out.println("map ==>"+map);
		
		return map;
	}
	
	@RequestMapping(value="json/deleteNamePhone/{userName}", method = RequestMethod.GET)
	public Map<String, Object> deleteNamePhone(@PathVariable String userName) throws Exception {
		
		System.out.println("UserRestController deleteNamePhone");
		System.out.println("userName ==> "+userName);
		
		userService.deleteNamePhone(userName);
		// 해당하는 회원의 정보가 삭제되었는지 확인하기 위해 겟 해옴
		User user = userService.getUserAdmin(userName);
		System.out.println("user가 널인지 확인==>"+user);
		Map<String, Object> map = new HashMap<String, Object>();
		// 해당하는 유저 정보가 없을경우 메세지를 view로 보냄..
		if(user == null) {
			map.put("message", "deleteOk");
		}else {
			map.put("message", "deleteFail");
		}
		
		return map;
	}
	
	@RequestMapping(value="json/getAddUserAdminList", method = RequestMethod.POST)
	public Map<String, Object> getAddUserAdminList(@RequestBody Search search) throws Exception {
		
		//debugging
		System.out.println("UserRestContoller getAddUserAdminList");
		
		User user = new User();
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = userService.getAddUserAdminList(search);
		
		Page resultPage = new Page(search.getCurrentPage(), 
				((Integer)map.get("totalCount")).intValue(), pageSize, pageUnit);
		
		System.out.println("resultPage==>"+resultPage);
		
		map.put("resultPage", resultPage);
		map.put("search", search);
		System.out.println("map ==>"+map);
		
		return map;
	}
	
	@RequestMapping(value="json/updatePositionLeader/{userName}", method=RequestMethod.GET)
	public Map<String, Object> updatePositionLeader(@PathVariable String userName) throws Exception {
		
		System.out.println("userRestController updateLeaderPostion");
		
		userService.updatePositionLeader(userName);
		//해당하는 회원의 정보에서 userPositoin이 1로 바뀌었는지 확인하기 위해 정보를 불러옴.
		User user = userService.getUserAdmin(userName);
		System.out.println("updatePositionLeader ==>" +user);
		//map에 정보를 담기위해 인스턴스
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(user.getUserPosition().equals("1")) {
			map.put("message", "updateOk");
		}else {
			map.put("message", "updateFail");
		}
		
		return map;
	}
	
	@RequestMapping(value="json/deleteLeaderPostion/{userName}", method=RequestMethod.GET)
	public Map<String, Object> deleteLeaderPostion(@PathVariable String userName) throws Exception {
		
		System.out.println("userRestController updateLeaderPostion");
		
		userService.deleteLeaderPostion(userName);
		//원래는 리더이름을 넣어야 하지만 삭제하려는 유저이름의 울타리를 지우는 작업이기때문에 상관없음.
		userService.deleteAllLeaderName(userName);
		//해당하는 회원의 정보에서 userPositoin이 0으로 바뀌었는지 확인하기 위해 정보를 불러옴.
		User user = userService.getUserAdmin(userName);
		System.out.println("deletePositionLeader ==>" +user);
		//map에 정보를 담기위해 인스턴스
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(user.getUserPosition().equals("0")) {
			map.put("message", "deleteOk");
		}else {
			map.put("message", "deleteFail");
		}
		
		return map;
	}
	@RequestMapping(value="json/addUserAdmin", method=RequestMethod.POST)
	public Map<String, Object> addUserAdmin(@RequestBody User user) throws Exception {
		//debugging
		System.out.println("UserRestController addUserAdmin");
		
		Map<String, Object> map = new HashMap<String, Object>();
		//view에서 전달된 유저정보를 확인하기 위해 디비에 정보를 불러옴.
		User confirmUser = userService.getUserAdmin(user.getUserName());
		//디비에 불러올 정보가 없는경우(회원이름 : pk).
		if(confirmUser == null){
			//view에서 전달된 데이터가 신규등록인 경우 db에 추가..
			userService.addUserAdmin(user);
			user = userService.getUserAdmin(user.getUserName());
			System.out.println("addUserAdmin 의 User 디버깅 =>"+user);
			//ok메세지를 view로 전달.
			map.put("message", "addOk");
		}else {
			//view에서 전달받은 유저의네임이 디비에 존재하는경우 해당 오류메세지를 보냄.
			map.put("message", "addFailName");
		}
		return map;
	}// end of addUserAdmin()
	@RequestMapping(value="json/updateLeaderName", method=RequestMethod.POST)
	public Map<String, Object> updateLeaderName(@RequestBody User user) throws Exception {
		//debugging
		System.out.println("UserRestController updateLeaderName");
		
		Map<String, Object> map = new HashMap<String, Object>();
		if(user != null) {
			userService.updateLeaderName(user);
			map.put("message", "updateOk");
		}else {
			map.put("message", "updateFail");
		}
		return map;
	}
	
	@RequestMapping(value="json/getDeletedUserList", method=RequestMethod.POST)
	public Map<String, Object> getDeletedUserList(@RequestBody Search search) throws Exception {
		
		//debugging
		System.out.println("UserRestContoller getUserList");
		
		User user = new User();
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = userService.getDeletedUserList(search);
		
		Page resultPage = new Page(search.getCurrentPage(), 
				((Integer)map.get("totalCount")).intValue(), pageSize, pageUnit);
		System.out.println("resultPage==>"+resultPage);
		
		map.put("resultPage", resultPage);
		map.put("search", search);
		System.out.println("map ==>"+map);
		
		return map;
	}
	
	@RequestMapping(value="json/deletedUser/{userId}", method=RequestMethod.GET)
	public Map<String, Object> deletedUser(@PathVariable String userId) throws Exception {
		
		//debugging
		System.out.println("UserRestController deleteUser");
		//view에 리던보낼 map 생성..
		Map<String, Object> map = new HashMap<String, Object>();
		//view로부터 넘어온 데이터값이 있을경우 해당하는 아이디 재명..
		if( userId != null ) {
			userService.deleteUser(userId);
			map.put("message", "deleteOk");
		//data가 없을경우 실패메시지 보냄..
		}else {
			map.put("messgae", "deleteFail");
		}
		
		return map;
	}
	
	@RequestMapping(value="json/comeBackUser/{comebackId}", method=RequestMethod.GET)
	public Map<String, Object> comeBackUser(@PathVariable String comebackId) throws Exception {
		
		//debugging
		System.out.println("UserRestController comeBackUser");
		//view에 리던보낼 map 생성..
		Map<String, Object> map = new HashMap<String, Object>();
		//view로부터 넘어온 데이터값이 있을경우 해당하는 아이디 재명..
		if( comebackId != null ) {
			userService.comeBackUser(comebackId);
			User user = userService.getUser(comebackId);
			System.out.println("user ==>"+user);
			map.put("message", "comeBackOk");
		//data가 없을경우 실패메시지 보냄..
		}else {
			map.put("messgae", "comeBackFail");
		}
		return map;
	}
}// end of class