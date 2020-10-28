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
		
		//client濡� 遺��� ���깅�� id 瑜� �듯�� db���� ������蹂�GET
		User dbUser = userService.getLoginUser(user.getUserId());
		
		Map<String, String> returnMap = new HashMap<String, String>();
		
		//db���� GET�� ��蹂닿� ����寃쎌�� �대�뱁���� ���대���� 議댁�ы��吏� ���� ���щ��몄�瑜� 留듭�� �대����.
		if ( dbUser == null ) { 
			returnMap.put("result", "NoSearchId");
		}else {
			//GET�� �����λ낫�� ��吏�留� �⑥�ㅼ����媛� �ㅻ�쇨꼍�� ���щ��몄�瑜� 留듭�� �대����.
			//view���� json����濡� �대�뱁���� 硫��몄�瑜� �듯�� ����洹� 泥�由щ�쇳��.
			if(!dbUser.getUserPwd().equals(user.getUserPwd())) {
				returnMap.put("result", "NoSearchPwd");
			}else {
				//ID ��蹂대�� ��怨� PWD��蹂대�� ����寃쎌�� �대�� ��硫��몄�� 媛��� Session�� ���ν����.
				session.setAttribute("user", dbUser);
				//view���� ����洹몄�由ъ�� �ъ�⑸�� 硫��몄�瑜� 留듭���댁�� view�� ����
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
		// �대�뱁���� ������ ��蹂닿� ����������吏� ���명��湲� ���� 寃� �댁��
		User user = userService.getUserAdmin(userName);
		System.out.println("user媛� ���몄� ����==>"+user);
		Map<String, Object> map = new HashMap<String, Object>();
		// �대�뱁���� ���� ��蹂닿� ����寃쎌�� 硫��몄�瑜� view濡� 蹂대��..
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
		//�대�뱁���� ������ ��蹂댁���� userPositoin�� 1濡� 諛�������吏� ���명��湲� ���� ��蹂대�� 遺��ъ��.
		User user = userService.getUserAdmin(userName);
		System.out.println("updatePositionLeader ==>" +user);
		//map�� ��蹂대�� �닿린���� �몄�ㅽ�댁��
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
		//������ 由щ���대��� �ｌ�댁�� ��吏�留� �������ㅻ�� �����대��� �명��由щ�� 吏��곕�� �����닿린��臾몄�� ��愿�����.
		userService.deleteAllLeaderName(userName);
		//�대�뱁���� ������ ��蹂댁���� userPositoin�� 0�쇰� 諛�������吏� ���명��湲� ���� ��蹂대�� 遺��ъ��.
		User user = userService.getUserAdmin(userName);
		System.out.println("deletePositionLeader ==>" +user);
		//map�� ��蹂대�� �닿린���� �몄�ㅽ�댁��
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
		//view���� ���щ�� ������蹂대�� ���명��湲� ���� ��鍮��� ��蹂대�� 遺��ъ��.
		User confirmUser = userService.getUserAdmin(user.getUserName());
		//��鍮��� 遺��ъ�� ��蹂닿� ����寃쎌��(�����대� : pk).
		if(confirmUser == null){
			//view���� ���щ�� �곗�댄�곌� ��洹��깅��� 寃쎌�� db�� 異�媛�..
			userService.addUserAdmin(user);
			user = userService.getUserAdmin(user.getUserName());
			System.out.println("addUserAdmin �� User ��踰�源� =>"+user);
			//ok硫��몄�瑜� view濡� ����.
			map.put("message", "addOk");
		}else {
			//view���� ���щ��� �������ㅼ���� ��鍮��� 議댁�ы����寃쎌�� �대�� �ㅻ�硫��몄�瑜� 蹂대��.
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
		//view濡�遺��� ���댁�� �곗�댄�곌��� ����寃쎌�� �대�뱁���� ���대�� �щ�..
		if( userId != null ) {
			userService.deleteUser(userId);
			map.put("message", "deleteOk");
		//data媛� ����寃쎌�� �ㅽ�⑤���吏� 蹂대��..
		}else {
			map.put("messgae", "deleteFail");
		}
		
		return map;
	}
	
	@RequestMapping(value="json/comeBackUser/{comebackId}", method=RequestMethod.GET)
	public Map<String, Object> comeBackUser(@PathVariable String comebackId) throws Exception {
		
		//debugging
		System.out.println("UserRestController comeBackUser");
		//view�� 由щ��蹂대�� map ����..
		Map<String, Object> map = new HashMap<String, Object>();
		//view濡�遺��� ���댁�� �곗�댄�곌��� ����寃쎌�� �대�뱁���� ���대�� �щ�..
		if( comebackId != null ) {
			userService.comeBackUser(comebackId);
			User user = userService.getUser(comebackId);
			System.out.println("user ==>"+user);
			map.put("message", "comeBackOk");
		//data媛� ����寃쎌�� �ㅽ�⑤���吏� 蹂대��..
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
		//view�� 由ы�대낫�� 留듭����
		Map<String, Object> map = new HashMap<String, Object>();
		//view���� ���댁�� ������ �대�怨� �대���곕��멸� ��鍮��� �깅����� ���댁�쇰� 媛����� 媛��ν��.
		//��鍮��� ��蹂대�� ���명��湲� ���� 留��� ��硫��몄��.
		User confirmUser = userService.getUserAdmin(user.getUserName());
		//�대�뱁���� ������ �대��� ��鍮��� ����寃쎌�� �대�밸��硫��몄�� 媛��� 議댁�ы����.
		if( confirmUser != null ) {
			//���щ��� �곗�댄�곗� �ㅼ���� 議댁�ы��吏�留� �몃���곗�� 遺��쇱� ���� 寃쎌��. 
			if( !user.getPhone().equals( confirmUser.getPhone() ) ) {
				map.put("message", "confirmPhoneFail");
			//���щ��� �곗�댄�곌� 紐⑤�� �쇱�����寃쎌��.
			}else if( user.getPhone().equals( confirmUser.getPhone() ) ) {
				//�대�� 媛����� ������ 寃쎌��..
				if( confirmUser.getSignupFlag().equals("1") ) {
					map.put("message", "alreadysignUp");
				}else {
					map.put("message", "confirmOk");
				}//end of else
			}//end of else if
		//�대�뱁���� ������ �대��� ��鍮��� 議댁�ы��吏� ����寃쎌��.
		}else {
			map.put("message", "confirmFail");
		}//end of else
		return map;
	}
	
	//�몄�踰��� 諛��≫���� RestController
	@RequestMapping(value="json/sendSms", method=RequestMethod.POST) 
	public Map<String, Object> sendSms(@RequestBody User user) throws Exception { 
		
		//debugging
		System.out.println("UserRestController sendSms");
		//debugging
		System.out.println("phone ==>" +user.getPhone());
		//view�� 硫��몄�瑜� ���ы��湲� ���� map ����..
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 6��由� �몄� 肄��� ���� 
		int rand = (int) (Math.random() * 899999) + 100000; 
		// 臾몄�� 蹂대�닿린 
		String hostname = "api.bluehouselab.com"; 
		String url = "https://" + hostname + "/smscenter/v1.0/sendsms"; 
		
		//debugging
		System.out.println("�몄�踰��� ���� ==>" + rand);
		
		//泥�湲곗���⑹�� �ъ�⑷����� �ㅼ����湲곗���� �명������嫄곌��� .. ���명���� �� 紐⑤Ⅴ寃���..
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
            //蹂대�대�� �щ�� 諛����щ�� 臾몄���댁�⑹�� json����濡� 留��ㅺ린 ���� Map����
            Map<String, Object> smsMap = new HashMap<String, Object>();
            //common�� config��硫��� 硫�����以� 蹂대�대���щ���� json�� ���ㅺ린 ���� 留듭�� �댁��..
            smsMap.put("sender", Config.sender);
            //common�� config��硫��� 硫�����以� 硫��몄��댁�⑹�� json�� ���ㅺ린 ���� 留듭�� �댁��..
            smsMap.put("content", Config.content+rand);
            //諛����щ���� �대���곕��몃�� listArray�����대��濡� list�� 援ы��..
            List<String> receivers = new ArrayList<String>();
            //諛����щ���� �대���� 踰��몃�� list �� �닿린..
            receivers.add(user.getPhone());
            //list 瑜� �ㅼ�� 留듭�� �댁���� json�� ���ㅺ린..
            smsMap.put("receivers", receivers);
            
            //Json�� string�쇰� �쎄린����? ���깊��嫄곌���..
            ObjectMapper objectMapper = new ObjectMapper();
            String jsonbefore = objectMapper.writeValueAsString(smsMap);
            //debugging
            System.out.println("-----------jsonbefore ==> " + jsonbefore);
            //��踰�濡� string�� 蹂대�쇨꼍�� ��湲�源⑥��� 臾몄��媛� 諛������� ���댁�� �몄���..
            StringEntity se = new StringEntity(jsonbefore, "UTF-8");
            //post body�� 臾몄��瑜� �명��..
            httpPost.setEntity(se);
            //�대�쇱�댁�명�� �ㅽ��..
            HttpResponse httpResponse = client.execute(httpPost, context);
            System.out.println(httpResponse.getStatusLine().getStatusCode());
            //��踰�濡�遺��� 諛��� reponse�� �댁�⑹�� inputStream�� �닿린..
            InputStream inputStream = httpResponse.getEntity().getContent();
            //諛��� �곗�댄�곌� ���� ����寃쎌��..
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
		//view濡� 由ы�대낫�닿린 ���� 留듭����..
		Map<String, Object> map = new HashMap<String, Object>();
		//����媛����� ����以��� ������ ���깊�� ���대��濡� db�� 寃����대낯��. 以�蹂듭껜�щ�쇱���댁��..
		User userConfirm = userService.getUser(user.getUserId());
		//������ ���깊�� id媛� db�� ����寃쎌�� �깃났 硫��몄�瑜� view濡� ���ы����.
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
		//����媛����� ����以��� ������ ���깊�� ���대��濡� db�� 寃����대낯��. 以�蹂듭껜�щ�쇱���댁��..
		User userConfirm = userService.getNickNameCheck(user.getNickName());
		//debugging
		System.out.println("userconfirm ==>" + userConfirm);
		//������ ���깊�� id媛� db�� ����寃쎌�� �깃났 硫��몄�瑜� view濡� ���ы����.
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
		//������ signUpFalg 肄�猷몄�� 媛����⑥�쇰� 諛�轅�..
		userService.updateSignUpFlag(user.getUserName());
		//����濡� ��蹂닿� insert������吏� ���명��湲� ���� ����..
		User userConfirm = userService.getUser(user.getUserId());
		//������ ��硫��� ��蹂닿� ���� ����寃쎌�� ����濡� insert�����ㅻ�� 硫��몄� ����..
		if( userConfirm != null ) {
			map.put("message", "insertOk");
		//insert �ㅽ�⑥��..
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
		//view���� 媛��몄�� �곗�댄�곕�� db���� 寃����대낫湲�..
		User confirmUser = userService.getUserConfirm(user.getUserName());
		//������ ��硫��� ��蹂닿� ���� ����寃쎌��
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
		//view�� 由ы�대낫�� 留듭����
		Map<String, Object> map = new HashMap<String, Object>();
		//view���� 媛��몄�� �곗�댄�곕�� db���� 寃����대낫湲�..
		User confirmUser = userService.getUserConfirm(user.getUserName());
		System.out.println("confirmUserId ==>");
		//������ ��硫��� ��蹂닿� ���� ����寃쎌��
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
		//view���� ���щ��� ��蹂대� user�� 鍮�諛�踰��몃�� update ����. userId, userPwd ������.
		userService.updatePwd(user);
		//view濡� 由ы�대낫�� Map ����
		Map<String, Object> map = new HashMap<String, Object>();
		//������ ��蹂닿� ������寃� 諛�������吏� 蹂닿린���� ��硫��� ����..
		User userConfirm = userService.getUser(user.getUserId());
		//view濡�遺��� ���댁�� 鍮�諛�踰��몄�� db濡� 遺��� ���щ��� 鍮�諛�踰��멸� 媛���寃쎌�� ok 硫��몄� ����..
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
		//view濡� 由ы�대낫�� Map ����
		Map<String, Object> map = new HashMap<String, Object>();
		//view���� ���щ��� �곗�댄�곕� phone��蹂대�� ���곗�댄�명��..
		userService.updatePhone(user);
		//������ ��蹂닿� ������寃� 諛�������吏� 蹂닿린���� ��硫��� ����..
		User confirmUser = userService.getUserAdmin(user.getUserName());
		//view濡�遺��� ���댁�� �곕��몄�� db濡� 遺��� ���щ��� �곕��멸� 媛���寃쎌�� ok 硫��몄� ����..
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
		//view濡� 由ы�대낫�� Map ����
		Map<String, Object> map = new HashMap<String, Object>();
		//view���� ���щ��� �곗�댄�곕� phone��蹂대�� ���곗�댄�명��..
		userService.updateNickName(user);
		//������ ��蹂닿� ������寃� 諛�������吏� 蹂닿린���� ��硫��� ����..
		User confirmUser = userService.getUser(user.getUserId());
		//view濡�遺��� ���댁�� �곕��몄�� db濡� 遺��� ���щ��� �곕��멸� 媛���寃쎌�� ok 硫��몄� ����..
		if( confirmUser.getNickName().equals(user.getNickName()) ) {
			map.put("message", "updateOk");
		}else {
			map.put("message", "updateFail");
		}
		return map;
	}	
}// end of class