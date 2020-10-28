package com.storm.service.chulcheck;

import java.util.List;
import java.util.Map;

import com.storm.common.Search;
import com.storm.service.domain.ChulCheck;
import com.storm.service.domain.User;

public interface ChulCheckDao {
	
	public void insertChulCheck(ChulCheck chulCheck) throws Exception;
	
	public ChulCheck getChulCheck() throws Exception;

	}
