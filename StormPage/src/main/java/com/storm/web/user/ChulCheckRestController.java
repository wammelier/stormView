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

//	@RequestMapping(value="json/chulCheck", method=RequestMethod.GET)
//	public Map<String, Object> updateNickName(@PathVariable String userId) throws Exception {
//		//debugging
//		System.out.println("chulCheck ==>" + userId);
//		Map<String, Object> map = new HashMap<String, Object>();
//		chulCheckService.insertChulCheck(chulCheck);
//		ChulCheck confirmChulCheck = chulCheckService.getChulCheck();
//		if( confirmChulCheck.getUserId().equals(confirmChulCheck.getUserId()) ) {
//			map.put("ChulCheck",);
//			map.put("message", "selectOk");
//		}else {
//			map.put("message", "seelctFail");
//		}
//		return map;
//	}	
}// end of class