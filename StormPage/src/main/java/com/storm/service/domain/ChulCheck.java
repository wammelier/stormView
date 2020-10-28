package com.storm.service.domain;

public class ChulCheck {
	
	private String userId;
	private String chulCheckDate;

	public ChulCheck() {
		// TODO Auto-generated constructor stub
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getChulCheckDate() {
		return chulCheckDate;
	}

	public void setChulCheckDate(String chulCheckDate) {
		this.chulCheckDate = chulCheckDate;
	}

	@Override
	public String toString() {
		return "ChulCheck [userId=" + userId + ", chulCheckDate=" + chulCheckDate + "]";
	}
	
	

}
