package com.storm.web.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.storm.service.chulcheck.ChulCheckService;
import com.storm.service.domain.ChulCheck;

@Controller
@RequestMapping("/chulCheck/*")
public class ChulCheckController {

	@Autowired
	@Qualifier("chulCheckServiceImpl")
	private ChulCheckService chulCheckService;

	public ChulCheckController() {
		System.out.println(this.getClass());
	}

	@RequestMapping(value = "json/chulCheck")
	public String mainPage(Model model, ChulCheck chulCheck) throws Exception {

		// debugging
		System.out.println("UserController mainPage");

		

		return "forward:/view/chulCheck/chulCheck.jsp";
	}

}