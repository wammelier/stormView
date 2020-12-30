package com.storm.web.user;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.storm.service.chulcheck.ChulCheckService;

@Controller
@RequestMapping("/chulCheck/*")
public class ChulCheckController extends HttpServlet {

	@Autowired
	@Qualifier("chulCheckServiceImpl")
	private ChulCheckService chulCheckService;

	public ChulCheckController() {
		System.out.println(this.getClass());
	}

	@RequestMapping(value = "json/chulCheck")
	public String mainPage(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// debugging
		System.out.println("UserController chulCheck");
		
		String userId = request.getParameter("userId");
		String chulCheckDate = request.getParameter("chulCheckDate");
		
		System.out.println("넘어오는 데이터 확인 " + userId + chulCheckDate);
		

		return "forward:/view/chulCheck/chulCheck.jsp";
	}

}