package com.storm.web.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		
		Map<String, Object> map = userService.getUserList(search);
		
		Page resultPage = new Page(search.getCurrentPage(), 
				((Integer)map.get("totalCount")).intValue(), pageSize, pageUnit);
		System.out.println("resultPage==>"+resultPage);
		
		map.put("resultPage", resultPage);
		map.put("search", search);
		System.out.println("map ==>"+map);
		
		return map;
	}
	
}