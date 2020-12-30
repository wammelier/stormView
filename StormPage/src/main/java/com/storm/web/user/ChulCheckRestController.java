package com.storm.web.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.storm.service.chulcheck.ChulCheckService;
import com.storm.service.domain.ChulCheck;

@RestController
@RequestMapping("/chulCheck/*")
public class ChulCheckRestController {

	@Autowired
	@Qualifier("chulCheckServiceImpl")
	private ChulCheckService chulCheckService;
	
//	@Autowired
//	private JavaMailSender mailSender;	
	
	public ChulCheckRestController() {
		System.out.println(this.getClass() + "default Constructor");
	}
	
	@Value("#{commonProperties['postPageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['postPageSize']}")
	int pageSize;

	@RequestMapping(value="json/chulCheck", method=RequestMethod.GET)
	public void addChulCheck(@RequestBody ChulCheck chulCheck) throws Exception {
		//debugging
		System.out.println("chulCheck ==>" + chulCheck);
		//가져온 날짜의 시간을 제거하기위한 parsing
		String parseDate = chulCheck.getChulCheckDate().substring(0,10);
		//해당날짜가 주일인지 아닌지를 판별하기위해..
		String dayOfWeek = chulCheck.getSunday(parseDate);
		chulCheckService.insertChulCheck(chulCheck);
		//해당요일이 주일이 아니면 DB에 값을 넣지않음..
//		if(dayOfWeek != "Sun") {
//			chulCheckService.insertChulCheck(chulCheck);
//		}
	}	
}// end of class