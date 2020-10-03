package com.storm.web.user;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.mongodb.core.query.Field;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.mongodb.diagnostics.logging.Logger;
import com.storm.common.Page;
import com.storm.common.Search;
import com.storm.service.domain.User;
import com.storm.service.user.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {

	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	private static final String uploadPath = "/Users/iseunghwan/git/StormPage/StormPage/WebContent/resources/userImg";

	public UserController() {
		System.out.println(this.getClass());
	}

	@Value("#{commonProperties['postPageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['postPageSize']}")
	int pageSize;

	@RequestMapping(value = "mainPage")
	public String mainPage(HttpSession session, Model model, User user) throws Exception {

		// debugging
		System.out.println("UserController mainPage");

		if (session.getAttribute("user") == null) {
			return "redirect:/user/login";
		}

		user = (User) session.getAttribute("user");

		model.addAttribute(user);

		return "forward:/main.jsp";
	}

	@RequestMapping(value = "login")
	public String login() throws Exception {

		// debugging
		System.out.println("UserController login");

		return "forward:/index.jsp";
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		System.out.println(this.getClass() + "logout");
		session.removeAttribute("user");
		session.invalidate();
		return "redirect:/user/login";
	}

	@RequestMapping(value = "getUser", method = RequestMethod.GET)
	public String getUser(HttpSession session, Model model) throws Exception {

		// debugging
		System.out.println("UserController getUser");

		if (session.getAttribute("user") == null) {
			return "redirect:/user/login";
		}
		User user = (User) session.getAttribute("user");
		user = userService.getUser(user.getUserId());

		model.addAttribute(user);

		return "forward:/view/user/getUser.jsp";
	}

	// admin용 getUser ==> UseList에서 회원 이름 클릭시 이동하는 화면
	@RequestMapping(value = "getAdminUser", method = RequestMethod.GET)
	public String getAdminUser(@RequestParam String userId, HttpSession session, Model model) throws Exception {

		// debugging
		System.out.println("UserController getUser");

		if (session.getAttribute("user") == null) {
			return "redirect:/user/login";
		}
		User user = userService.getUser(userId);

		model.addAttribute(user);

		return "forward:/view/admin/getUser.jsp";
	}

	@RequestMapping(value = "getUserList")
	public String getUserList(HttpSession session, Model model, Search search) throws Exception {

		// debugging
		System.out.println("UserController getUserList");

		if (session.getAttribute("user") == null) {
			return "redirect:/user/login";
		}

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		Map<String, Object> map = userService.getUserList(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);

		System.out.println("map.get ==>" + map.get("list"));

		// view에 데이터 전달
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);

		return "forward:/view/admin/getUserList.jsp";
	}

	@RequestMapping(value = "getFenceList", method = RequestMethod.GET)
	public String getFenceList(HttpSession session, Model model, Search search) throws Exception {

		System.out.println("UserController getFenceList");

		// 서버에서 timeout으로 로그아웃시 loginpage로 이동
		if (session.getAttribute("user") == null) {
			return "redirect:/user/login";
		}
		// 페이지번호가 0일경우 1로 세팅하는 코드
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		Map<String, Object> map = userService.getFenceList(search);
		Map<String, Object> leaderNameMap = userService.getLeaderNameList();

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);

		System.out.println("map.get ==>" + map.get("list"));

		// view에 데이터 전달
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("leaderList", leaderNameMap.get("leaderList"));

		return "forward:/view/admin/getFenceList.jsp";
	}

	@RequestMapping(value = "getUserAdmin", method = RequestMethod.GET)
	public String getUserAdmin(@RequestParam String userName, HttpSession session, Model model) throws Exception {

		System.out.println("UserController getUserAdmin");

		// tomcat 자동 로그아웃시 loginpage로 보냄
		if (session.getAttribute("user") == null) {
			return "redirect:/user/login";
		}
		System.out.println("userName ==>" + userName);

		User user = userService.getUserAdmin(userName);

		model.addAttribute(user);

		return "forward:/view/admin/getUserAdmin.jsp";
	}

	@RequestMapping(value = "getAddUserAdminList")
	public String getAddUserAdminList(HttpSession session, Model model, Search search) throws Exception {

		System.out.println("UserController getAddUserAdminList");

		if (session.getAttribute("user") == null) {
			return "redirect:/user/login";
		}

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		Map<String, Object> map = userService.getAddUserAdminList(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);

		System.out.println("map.get ==>" + map.get("list"));

		// view에 데이터 전달
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);

		return "forward:/view/admin/getAdminAddUser.jsp";
	}

	@RequestMapping(value = "updateUserAdmin", method = RequestMethod.POST)
	public String updateUserAdmin(@ModelAttribute("user") User user, HttpSession session, Model model)
			throws Exception {

		System.out.println("UserController updateUserAdmin");

		if (session.getAttribute("user") == null) {
			return "redirect:/user/login";
		}
		user.setAddress(user.getAddress());
		user.setGender(user.getGender());
		user.setBirth(user.getBirth());
		user.setBaptismName(user.getBaptismName());
		System.out.println("user 확인 ==>" + user);

		userService.updateUserAdmin(user);

		return "redirect:/user/getAddUserAdminList";
	}

	@RequestMapping(value = "updateUser", method = RequestMethod.POST)
	public String updateUser(@ModelAttribute("user") User user, HttpSession session, Model model) throws Exception {

		System.out.println("UserController updateUser");

		if (session.getAttribute("user") == null) {
			return "redirect:/user/login";
		}

		user.setEmail(user.getEmail());
		user.setAddress(user.getAddress());
		user.setBirth(user.getBirth());

		System.out.println("updateUser debugging ==> " + user);

		userService.updateUser(user);

		return "forward:/user/mainPage";
	}

	@RequestMapping(value = "signUp")
	public String signUp() throws Exception {

		System.out.println("UserController signUp");

		return "forward:/view/user/signUp.jsp";
	}

	@RequestMapping(value = "searchUserId")
	public String searchUserId() throws Exception {

		System.out.println("UserController searchUserId");

		return "forward:/view/user/searchPageId.jsp";
	}

	@RequestMapping(value = "searchUserPwd")
	public String searchUserPwd() throws Exception {

		System.out.println("UserController searchUserPwd");

		return "forward:/view/user/searchPagePw.jsp";
	}

	// 파일업로드
	@RequestMapping(value = "fileUpLoad")
	public String upLoad(MultipartFile upLoadFile, Model model) throws Exception {
		System.out.println("upload() POST 호출");
		System.out.println("파일 이름 : {}" + upLoadFile.getOriginalFilename());
		System.out.println("파일 크기 : {}" + upLoadFile.getSize());
		
		String result = saveFile(upLoadFile);
		if( result != null ) {
			model.addAttribute("result", result);
		}else {
			model.addAttribute("result", "fail");
		}
		
		return "forward:/view/user/getUser.jsp";
	}

	public String saveFile(MultipartFile file) {

		//파일 이름 변경
		UUID uuid = UUID.randomUUID();
		String saveName = uuid + "_" + file.getOriginalFilename();
		
		System.out.println("saveName: {}" + saveName);
		
		// 저장할 file 객체를 생성(껍데기 파일 no)
		File saveFile = new File(uploadPath, saveName);
		
		try {
			file.transferTo(saveFile);
		} catch(IOException e) {
			e.printStackTrace();
			return null;
		}
		
		return saveName;
	}

//	@RequestMapping(value="dbTest")
//	public void dbTest() throws Exception {
//		
//		Search search = new Search();
//		//���� �������� null�� ��� ����Ʈ 1�� ����
//		if(search.getCurrentPage() == 0) {
//			search.setCurrentPage(1);
//		}
//		search.setPageSize(10);
//		
//		//map��  getUserList ���
//		Map<String, Object> map = userService.getUserList(search);
//		
//		
//		
//		
//		System.out.println(map.get("list"));
//		
//	}
//	
//	@RequestMapping(value="autoLogout")
//	public String autoLogout() {
//		System.out.println(this.getClass()+"AutoLogin");
//		return "redirect:/view/user/autoLogout.jsp";
//	}
//	
//	

}