package com.storm.web.user;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.AuthCache;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.auth.BasicScheme;
import org.apache.http.impl.client.BasicAuthCache;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.apache.http.impl.client.DefaultHttpClient;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.storm.common.Config;
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
	
	@RequestMapping(value="json/authentic", method=RequestMethod.POST)
	public Map<String, Object> authentic(@RequestBody User user) throws Exception {
		
		//debugging
		System.out.println("UserRestContoller authentic");
		//debugging
		System.out.println("user ==>" + user);
		//view에 리턴보낼 맵생성
		Map<String, Object> map = new HashMap<String, Object>();
		//view에서 넘어온 회원의 이름과 휴대폰번호가 디비에 등록되어 있어야만 가입이 가능함.
		//디비에 정보를 확인하기 위해 만든 도메인임.
		User confirmUser = userService.getUserAdmin(user.getUserName());
		//해당하는 회원의 이름이 디비에 있을경우 해당도메인은 값이 존재한다.
		if( confirmUser != null ) {
			//전달받은 데이터중 네임은 존재하지만 핸드폰이 불일치 하는 경우. 
			if( !user.getPhone().equals( confirmUser.getPhone() ) ) {
				map.put("message", "confirmPhoneFail");
			//전달받은 데이터가 모두 일치하는경우.
			}else if( user.getPhone().equals( confirmUser.getPhone() ) ) {
				//이미 가입된 회원인 경우..
				if( confirmUser.getSignupFlag().equals("1") ) {
					map.put("message", "alreadysignUp");
				}else {
					map.put("message", "confirmOk");
				}//end of else
			}//end of else if
		//해당하는 회원의 이름이 디비에 존재하지 않는경우.
		}else {
			map.put("message", "confirmFail");
		}//end of else
		return map;
	}
	
	//인증번호 발송하는 RestController
	@RequestMapping(value="json/sendSms", method=RequestMethod.POST) 
	public Map<String, Object> sendSms(@RequestBody User user) throws Exception { 
		
		//debugging
		System.out.println("UserRestController sendSms");
		//debugging
		System.out.println("phone ==>" +user.getPhone());
		//view에 메세지를 전달하기 위해 map 생성..
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 6자리 인증 코드 생성 
		int rand = (int) (Math.random() * 899999) + 100000; 
		// 문자 보내기 
		String hostname = "api.bluehouselab.com"; 
		String url = "https://" + hostname + "/smscenter/v1.0/sendsms"; 
		
		//debugging
		System.out.println("인증번호 확인 ==>" + rand);
		
		//청기와랩의 사용권한을 설정하기위해 세팅하는거같음 .. 자세히는 잘 모르겠음..
		CredentialsProvider credsProvider = new BasicCredentialsProvider();
        credsProvider.setCredentials(
            new AuthScope(hostname, 443, AuthScope.ANY_REALM),
            new UsernamePasswordCredentials(Config.appid, Config.apikey)
        );

        // Create AuthCache instance
        AuthCache authCache = new BasicAuthCache();
        authCache.put(new HttpHost(hostname, 443, "https"), new BasicScheme());

        // Add AuthCache to the execution context
        HttpClientContext context = HttpClientContext.create();
        context.setCredentialsProvider(credsProvider);
        context.setAuthCache(authCache);
        
        DefaultHttpClient client = new DefaultHttpClient();
        try {
            HttpPost httpPost = new HttpPost(url);
            httpPost.setHeader("Content-type", "application/json; charset=utf-8");
            
//            String json = "{\"sender\":\""+Config.sender+"\",\"receivers\":[\""+Config.receiver+"\"],\"content\":\""+Config.content+rand+"\"}";
            //보내는 사람 받는사람 문자내용을 json형태로 만들기 위해 Map생성
            Map<String, Object> smsMap = new HashMap<String, Object>();
            //common에 config도메인 메소드중 보내는사람을 json화 시키기 위해 맵에 담음..
            smsMap.put("sender", Config.sender);
            //common에 config도메인 메소드중 메세지내용을 json화 시키기 위해 맵에 담음..
            smsMap.put("content", Config.content+rand);
            //받는사람의 휴대폰번호는 listArray형태이므로 list에 구현..
            List<String> receivers = new ArrayList<String>();
            //받는사람의 휴대폰 번호를 list 에 담기..
            receivers.add(user.getPhone());
            //list 를 다시 맵에 담아서 json화 시키기..
            smsMap.put("receivers", receivers);
            
            //Json을 string으로 읽기위해? 생성한거같음..
            ObjectMapper objectMapper = new ObjectMapper();
            String jsonbefore = objectMapper.writeValueAsString(smsMap);
            //debugging
            System.out.println("-----------jsonbefore ==> " + jsonbefore);
            //서버로 string을 보낼경우 한글깨짐의 문제가 발생할수 있어서 인코딩..
            StringEntity se = new StringEntity(jsonbefore, "UTF-8");
            //post body에 문자를 세팅..
            httpPost.setEntity(se);
            //클라이언트 실행..
            HttpResponse httpResponse = client.execute(httpPost, context);
            System.out.println(httpResponse.getStatusLine().getStatusCode());
            //서버로부터 받은 reponse의 내용을 inputStream에 담기..
            InputStream inputStream = httpResponse.getEntity().getContent();
            //받은 데이터가 널이 아닌경우..
            if(inputStream != null) {
                BufferedReader bufferedReader = new BufferedReader( new InputStreamReader(inputStream));
                String line = "";
                //.readLine은 문자를 한줄씩 읽을수 있음..
                while((line = bufferedReader.readLine()) != null)
                    System.out.println(line);
                inputStream.close();
                
                map.put("message", "done");
                map.put("checkNo", rand);
            }
        } catch (Exception e) {
            System.err.println("Error: "+e.getLocalizedMessage());
            map.put("message", "fail");
        } finally {
            client.getConnectionManager().shutdown();
        }
        
        return map;

    }
	
	@RequestMapping(value="json/idCehck", method=RequestMethod.POST)
	public Map<String, Object> idCheck(@RequestBody User user) throws Exception {
		
		//debugging
		System.out.println("UserRestController idCheck");
		//view로 리턴보내기 위해 맵생성..
		Map<String, Object> map = new HashMap<String, Object>();
		//회원가입을 시도중인 회원이 작성한 아이디로 db에 검색해본다. 중복체크를위해서..
		User userConfirm = userService.getUser(user.getUserId());
		//회원이 작성한 id가 db에 없는경우 성공 메세지를 view로 전달한다.
		if( userConfirm == null ) {
			map.put("message", "checkOk");
		}else {
			map.put("message", "checkFail");
		}
		return map;
	}
	
	@RequestMapping(value="json/nickNameCheck", method=RequestMethod.POST)
	public Map<String, Object> nickNameCehck(@RequestBody User user) throws Exception {
		
		//debugging
		System.out.println("UserRestController nickNameCehck");
		//view로 리턴보내기 위해 맵생성..
		Map<String, Object> map = new HashMap<String, Object>();
		//회원가입을 시도중인 회원이 작성한 아이디로 db에 검색해본다. 중복체크를위해서..
		User userConfirm = userService.getNickNameCheck(user.getNickName());
		//debugging
		System.out.println("userconfirm ==>" + userConfirm);
		//회원이 작성한 id가 db에 없는경우 성공 메세지를 view로 전달한다.
		if( userConfirm == null ) {
			map.put("message", "checkOk");
		}else {
			map.put("message", "checkFail");
		}
		return map;
	}
	
	@RequestMapping(value="json/signUp", method=RequestMethod.POST)
	public Map<String, Object> signUp(@RequestBody User user) throws Exception {
		
		//debugging
		System.out.println("UserRestContoller signUp");
		//debugging
		System.out.println("user ==>" + user);
		//view에 리턴보낼 맵생성
		Map<String, Object> map = new HashMap<String, Object>();
		//view에서 가져온 데이터를 db에 insert
		userService.addUser(user);
		//회원의 signUpFalg 콜룸을 가입됨으로 바꿈..
		userService.updateSignUpFlag(user.getUserName());
		//제대로 정보가 insert되었는지 확인하기 위해 생성..
		User userConfirm = userService.getUser(user.getUserId());
		//회원의 도메인 정보가 널이 아닌경우 제대로 insert되었다는 메세지 전송..
		if( userConfirm != null ) {
			map.put("message", "insertOk");
		//insert 실패시..
		}else {
			map.put("message", "insertFail");
		}
		return map;
	}
	
	@RequestMapping(value="json/userConfirm", method=RequestMethod.POST)
	public Map<String, Object> userConfirm(@RequestBody User user) throws Exception {
		
		//debugging
		System.out.println("UserRestContoller userConfirm");
		//debugging
		System.out.println("user ==>" + user);
		//view에 리턴보낼 맵생성
		Map<String, Object> map = new HashMap<String, Object>();
		//view에서 가져온 데이터를 db에서 검색해보기..
		User confirmUser = userService.getUserConfirm(user.getUserName());
		//회원의 도메인 정보가 널이 아닌경우
		if( confirmUser != null ) {
			if ( !confirmUser.getPhone().equals( user.getPhone() ) ) {
				map.put("message", "phoneConfirmfail");
			}else {
				map.put("message", "confirmOk");
				map.put("user", confirmUser);
			}//end of else
		}else {
			map.put("message", "confirmFail");
		}// end of else
		return map;
	}
	
	@RequestMapping(value="json/userConfirmPwd", method=RequestMethod.POST)
	public Map<String, Object> userConfirmPwd(@RequestBody User user) throws Exception {
		
		//debugging
		System.out.println("UserRestContoller userConfirm");
		//debugging
		System.out.println("user ==>" + user);
		//view에 리턴보낼 맵생성
		Map<String, Object> map = new HashMap<String, Object>();
		//view에서 가져온 데이터를 db에서 검색해보기..
		User confirmUser = userService.getUserConfirm(user.getUserName());
		System.out.println("confirmUserId ==>");
		//회원의 도메인 정보가 널이 아닌경우
		if( confirmUser != null ) {
			if( !confirmUser.getUserId().equals( user.getUserId() ) ) {
				map.put("message", "idConfirmfail");
			}else if ( !confirmUser.getPhone().equals( user.getPhone() ) ) {
				map.put("message", "phoneConfirmfail");
			}else {
				map.put("message", "confirmOk");
				map.put("user", confirmUser);
			}
		}else {
			map.put("message", "confirmFail");
		}
		return map;
	}
	
	@RequestMapping(value="json/updatePwd", method=RequestMethod.POST)
	public Map<String, Object> updatePwd(@RequestBody User user) throws Exception {
		
		//debugigng
		System.out.println("UserRestController updatePwd");
		//debugging
		System.out.println("user==>"+user);
		//view에서 전달받은 정보로 user의 비밀번호를 update 한다. userId, userPwd 필요함.
		userService.updatePwd(user);
		//view로 리턴보낼 Map 생성
		Map<String, Object> map = new HashMap<String, Object>();
		//유저의 정보가 정확하게 바뀌었는지 보기위해 도메인 생성..
		User userConfirm = userService.getUser(user.getUserId());
		//view로부터 넘어온 비밀번호와 db로 부터 전달받은 비밀번호가 같을경우 ok 메세지 전송..
		if( userConfirm.getUserPwd().equals(user.getUserPwd() ) ) {
			map.put("message", "updateOk");
		}else {
			map.put("message", "updateFail");
		}
		return map;
	}
	
	@RequestMapping(value="json/updatePhone", method=RequestMethod.POST)
	public Map<String, Object> updatePhone(@RequestBody User user) throws Exception {
		
		//debugging
		System.out.println("UserRestController updatePhone");
		//debugging
		System.out.println("user ==>" + user);
		//view로 리턴보낼 Map 생성
		Map<String, Object> map = new HashMap<String, Object>();
		//view에서 전달받은 데이터로 phone정보를 업데이트함..
		userService.updatePhone(user);
		//유저의 정보가 정확하게 바뀌었는지 보기위해 도메인 생성..
		User confirmUser = userService.getUserAdmin(user.getUserName());
		//view로부터 넘어온 폰번호와 db로 부터 전달받은 폰번호가 같을경우 ok 메세지 전송..
		if( confirmUser.getPhone().equals(user.getPhone() ) ) {
			map.put("message", "updateOk");
		}else {
			map.put("message", "updateFail");
		}
		return map;
	}	
	
	@RequestMapping(value="json/updateNickName", method=RequestMethod.POST)
	public Map<String, Object> updateNickName(@RequestBody User user) throws Exception {
		//debugging
		//debugging
		System.out.println("user ==>" + user);
		//view로 리턴보낼 Map 생성
		Map<String, Object> map = new HashMap<String, Object>();
		//view에서 전달받은 데이터로 phone정보를 업데이트함..
		userService.updateNickName(user);
		//유저의 정보가 정확하게 바뀌었는지 보기위해 도메인 생성..
		User confirmUser = userService.getUser(user.getUserId());
		//view로부터 넘어온 폰번호와 db로 부터 전달받은 폰번호가 같을경우 ok 메세지 전송..
		if( confirmUser.getNickName().equals(user.getNickName()) ) {
			map.put("message", "updateOk");
		}else {
			map.put("message", "updateFail");
		}
		return map;
	}	
}// end of class