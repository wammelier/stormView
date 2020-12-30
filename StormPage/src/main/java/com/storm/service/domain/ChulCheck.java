package com.storm.service.domain;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.apache.jasper.tagplugins.jstl.core.Otherwise;

public class ChulCheck {
	
	private String userId;
	private String chulCheckDate;
	private String time;
	private String userName;
	private Date date;
	private String dayOfWeek;
	private int weekNum;

	public ChulCheck() {
		// TODO Auto-generated constructor stub
	}
	
	//출석을 찍은 날짜가 주일인지 아닌지를 판별하기 위한 메서드..
	public String getSunday(String chulCheckDate) {
		//date의 형식을 설정함..
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		//DB로부터 날짜를 받아와서 파싱에서 필드에 넣는다.
		try {
			this.date = dateFormat.parse(chulCheckDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}// end of try/catch
		
		//Calendar 생성..
		Calendar cal = Calendar.getInstance();
		//calendar에 날짜를 setting
		cal.setTime(date);
		
		//해당날짜의 요일을 구하기위해 해당요일의 숫자를 가져옴 
		int dayNum = cal.get(Calendar.DAY_OF_WEEK);
		//(sun = 1 나머지는 null)
		switch(dayNum) {
			case 1 :
				this.dayOfWeek = "Sun";
				break;
			default :
				this.dayOfWeek = null;
				break;
		}// end of switch
		return dayOfWeek;
	}
	
	//들어온 날짜가 몇주차인지 알기 위한 메서드..
	public int getWeekNum(String chulCheckDate) {
		//date의 형식을 설정함..
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		//DB로부터 날짜를 받아와서 파싱에서 필드에 넣는다.
		try {
			this.date = dateFormat.parse(chulCheckDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}// end of try/catch
		//Calendar instance 생성.
		Calendar cal = Calendar.getInstance();
		//받은데이터를 세팅한다.
		cal.setTime(date);
		//가져오는 주차가 1씩크다.. 그래서 -1 빼줌..
		this.weekNum = cal.get(Calendar.WEEK_OF_MONTH) -1;
		
		return weekNum;
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

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	@Override
	public String toString() {
		return "ChulCheck [userId=" + userId + ", chulCheckDate=" + chulCheckDate + ", time=" + time + ", userName="
				+ userName + ", date=" + date + ", dayOfWeek=" + dayOfWeek + ", weekNum=" + weekNum + "]";
	}

}
