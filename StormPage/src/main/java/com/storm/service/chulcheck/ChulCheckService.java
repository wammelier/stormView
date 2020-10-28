package com.storm.service.chulcheck;

import java.util.Map;

import com.storm.common.Search;
import com.storm.service.domain.ChulCheck;
import com.storm.service.domain.User;

public interface ChulCheckService {

	public void insertChulCheck(ChulCheck chulCheck) throws Exception;
	
	public ChulCheck getChulCheck() throws Exception;
	
}
