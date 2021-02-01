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
		
		User dbUser = userService.getLoginUser(user.getUserId());
		
		Map<String, String> returnMap = new HashMap<String, String>();
		
		
		if ( dbUser == null ) { 
			returnMap.put("result", "NoSearchId");
		}else {
		
			if(!dbUser.getUserPwd().equals(user.getUserPwd())) {
				returnMap.put("result", "NoSearchPwd");
			}else {

				session.setAttribute("user", dbUser);
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
		User user = userService.getUserAdmin(userName);
		System.out.println("user媛� ���몄� ����==>"+user);
		Map<String, Object> map = new HashMap<String, Object>();
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
		User user = userService.getUserAdmin(userName);
		System.out.println("updatePositionLeader ==>" +user);
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
		userService.deleteAllLeaderName(userName);
		User user = userService.getUserAdmin(userName);
		System.out.println("deletePositionLeader ==>" +user);
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
		User confirmUser = userService.getUserAdmin(user.getUserName());
		if(confirmUser == null){
			userService.addUserAdmin(user);
			user = userService.getUserAdmin(user.getUserName());
			System.out.println("addUserAdmin �� User ��踰�源� =>"+user);
			map.put("message", "addOk");
		}else {
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
		//view�� 由щ��蹂대�� map ����..
		Map<String, Object> map = new HashMap<String, Object>();
		if( userId != null ) {
			userService.deleteUser(userId);
			map.put("message", "deleteOk");
		}else {
			map.put("messgae", "deleteFail");
		}
		
		return map;
	}
	
	@RequestMapping(value="json/comeBackUser/{comebackId}", method=RequestMethod.GET)
	public Map<String, Object> comeBackUser(@PathVariable String comebackId) throws Exception {
		
		//debugging
		System.out.println("UserRestController comeBackUser");
		Map<String, Object> map = new HashMap<String, Object>();
		if( comebackId != null ) {
			userService.comeBackUser(comebackId);
			User user = userService.getUser(comebackId);
			System.out.println("user ==>"+user);
			map.put("message", "comeBackOk");
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
		Map<String, Object> map = new HashMap<String, Object>();
		User confirmUser = userService.getUserAdmin(user.getUserName());
		if( confirmUser != null ) {
			if( !user.getPhone().equals( confirmUser.getPhone() ) ) {
				map.put("message", "confirmPhoneFail");
			}else if( user.getPhone().equals( confirmUser.getPhone() ) ) {
				if( confirmUser.getSignupFlag().equals("1") ) {
					map.put("message", "alreadysignUp");
				}else {
					map.put("message", "confirmOk");
				}//end of else
			}//end of else if
		}else {
			map.put("message", "confirmFail");
		}//end of else
		return map;
	}
	
	@RequestMapping(value="json/sendSms", method=RequestMethod.POST) 
	public Map<String, Object> sendSms(@RequestBody User user) throws Exception { 
		
		//debugging
		System.out.println("UserRestController sendSms");
		//debugging
		System.out.println("phone ==>" +user.getPhone());
		Map<String, Object> map = new HashMap<String, Object>();
		
		int rand = (int) (Math.random() * 899999) + 100000; 
		String hostname = "api.bluehouselab.com"; 
		String url = "https://" + hostname + "/smscenter/v1.0/sendsms"; 
		
		//debugging
		System.out.println("�몄�踰��� ���� ==>" + rand);
		
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
            Map<String, Object> smsMap = new HashMap<String, Object>();
            smsMap.put("sender", Config.sender);
            smsMap.put("content", Config.content+rand);
            List<String> receivers = new ArrayList<String>();
            receivers.add(user.getPhone());
            smsMap.put("receivers", receivers);
            
            //Json�� string�쇰� �쎄린����? ���깊��嫄곌���..
            ObjectMapper objectMapper = new ObjectMapper();
            String jsonbefore = objectMapper.writeValueAsString(smsMap);
            //debugging
            System.out.println("-----------jsonbefore ==> " + jsonbefore);
            StringEntity se = new StringEntity(jsonbefore, "UTF-8");
            httpPost.setEntity(se);
            HttpResponse httpResponse = client.execute(httpPost, context);
            System.out.println(httpResponse.getStatusLine().getStatusCode());
            InputStream inputStream = httpResponse.getEntity().getContent();
            if(inputStream != null) {
                BufferedReader bufferedReader = new BufferedReader( new InputStreamReader(inputStream));
                String line = "";
                //.readLine�� 臾몄��瑜� ��以��� �쎌���� ����..
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
		Map<String, Object> map = new HashMap<String, Object>();
		User userConfirm = userService.getUser(user.getUserId());
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
		//view濡� 由ы�대낫�닿린 ���� 留듭����..
		Map<String, Object> map = new HashMap<String, Object>();
		User userConfirm = userService.getNickNameCheck(user.getNickName());
		//debugging
		System.out.println("userconfirm ==>" + userConfirm);
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
		//view�� 由ы�대낫�� 留듭����
		Map<String, Object> map = new HashMap<String, Object>();
		//view���� 媛��몄�� �곗�댄�곕�� db�� insert
		userService.addUser(user);
		userService.updateSignUpFlag(user.getUserName());
		User userConfirm = userService.getUser(user.getUserId());
		if( userConfirm != null ) {
			map.put("message", "insertOk");
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
		//view�� 由ы�대낫�� 留듭����
		Map<String, Object> map = new HashMap<String, Object>();
		User confirmUser = userService.getUserConfirm(user.getUserName());
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
		
		Map<String, Object> map = new HashMap<String, Object>();
		User confirmUser = userService.getUserConfirm(user.getUserName());
		System.out.println("confirmUserId ==>");
		
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
		userService.updatePwd(user);
		Map<String, Object> map = new HashMap<String, Object>();
		User userConfirm = userService.getUser(user.getUserId());
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
		Map<String, Object> map = new HashMap<String, Object>();
		userService.updatePhone(user);
		User confirmUser = userService.getUserAdmin(user.getUserName());
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
		Map<String, Object> map = new HashMap<String, Object>();
		userService.updateNickName(user);
		User confirmUser = userService.getUser(user.getUserId());
		if( confirmUser.getNickName().equals(user.getNickName()) ) {
			map.put("message", "updateOk");
		}else {
			map.put("message", "updateFail");
		}
		return map;
	}	
}// end of class