package com.storm.common;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class Calen {

	public static void main(String[] args) throws ParseException {
		// TODO Auto-generated method stub
		
		int yyyy = 2020;
		int mm = 11;
//		String saturday = "";
		Calendar cal = Calendar.getInstance();
		List<String> saturday = new ArrayList<String>();
		
		cal.set(yyyy, mm-1, 1);
		int maxDate = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		System.out.println("maxDate ==>" + maxDate);
		for(int i = 1; i<maxDate+1; i++) {
			cal.clear();
			
			cal.set(yyyy, mm-1, i);
			
			switch(cal.get(cal.DAY_OF_WEEK)) {
			case Calendar.SUNDAY:
			if(saturday != null) {
			}
			if(i<10) {
				saturday.add("11"+"-"+"0"+i);
			}else {
				saturday.add("11"+"-"+""+i);
			}
			cal.clear();
			}
			
		}
		System.out.println("saturday == " +saturday);
		
//		int tYear = 2020;
//        int tMonth = 10;
//        int tDate = 19;
//        String day = "2020-10-30 22:30";
//        String returnDay = "";
//        returnDay = day.substring(0,10);
//        System.out.println(returnDay);
        
//        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//        Date date = dateFormat.parse("2020-10-26");
//        Calendar cal = Calendar.getInstance();
//        cal.setTime(date);
//        int dayNum = cal.get(Calendar.DAY_OF_WEEK);
//        System.out.println(dayNum);
	        
//	      SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//	      Date date = dateFormat.parse("2021-10-26");
//	      Calendar cal = Calendar.getInstance();
//	      cal.setTime(date);
//	      int week = cal.get(Calendar.SUNDAY);
////	      int week = cal.get(Calendar.WEEK_OF_MONTH) -1;
//	      System.out.println(week);
        
       
        		
//        cal.set(tYear, tMonth-1, tDate);
//        System.out.println("입력된 날짜 : " + cal.getTime());
        cal.set(Calendar.DAY_OF_WEEK,Calendar.SUNDAY);
        
        System.out.println("입력된 날짜의 일요일  : " + cal.getTime());
//        
//        
//        SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//
//        String to = transFormat.format(cal.getTime());
//        System.out.println(to);
//
//
//        int week = cal.get(Calendar.WEEK_OF_MONTH)-1;
//        
//        System.out.println("입력된 날짜의 주차 : " + week);
//        cal.add(Calendar.DATE, -7);
//        cal.set(Calendar.DAY_OF_WEEK,Calendar.SUNDAY);
//        System.out.println("입력된 날짜의 이전주의 일요일 : " + cal	.getTime());
//       
//        // 입력된 날의 2주뒤 입력을 위해 14를 add
//        cal.add(Calendar.DATE, 14);
//        cal.set(Calendar.DAY_OF_WEEK,Calendar.SUNDAY);
//        System.out.println("입력된 날짜 다음주의 일요일: " + cal.getTime());
		
//		String day = "2020-10-30";
//		String returnDay = "";
//		returnDay = day.substring(0,4) + day.substring(5,7) + day.substring(8,10);
//		System.out.println(returnDay);
	}
	
}
