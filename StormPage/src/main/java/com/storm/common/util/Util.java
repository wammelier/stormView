package com.storm.common.util;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import com.ksy.service.domain.City;
import com.ksy.service.domain.Day;


public class Util {

	///Field
	
	///Constructor
		
	///Method
	public static List<Day> cityListToDayList(List<City> cityList, Timestamp startDateOrigin) {
		
		List<Day> dayList = new ArrayList<Day>();
		City[] cityArray = cityList.toArray(new City[cityList.size()]);		//����Ʈ�� ���� City ����� Array�� ��ȯ
		
		Timestamp startDate = (Timestamp)startDateOrigin.clone();
		System.out.println("\n\n\n\n   cityListToDayList Start => startDate = "+startDate);
		
		int dayNoo = 0;
		Day day = new Day();
		
		for(int i=0; i<cityArray.length; i++) {
			for(int j=0; j<cityArray[i].getCityDuration(); j++) {
				
				
				// �ش� ������ ù��° ü�������̸鼭 ü���ϼ��� 1���� ū ��� = ������ �ƴ� ���	
				if( j==0 && cityArray[i].getCityDuration() != 1 ) {	
					if( i==0 ) {	//ù��° ������ ��� 
						day.setCityNames(cityArray[i].getCityName());
					}else {		//ù��° ���ð� �ƴ� ���
						day.setCityNames(day.getCityNames()+", "+cityArray[i].getCityName());	
						
					}
					//���� cityList�� �������� ����
					cityList.get(i).setStartDateStr(startDate.toString().substring(0,10));
					
					day.setDate((Timestamp)startDate.clone());
					startDate.setTime(startDate.getTime() + (1000*60*60*24));
					dayNoo++;
					day.setDayNo(dayNoo);
					
					dayList.add(day);
					day = new Day();
					day.setCityNames(cityArray[i].getCityName());	//���� ���ÿ��� ���� �����̸� �Ѱ��ֱ� ����....����
				}
				
				// �ش� ������ ������ ü�������� ��� (ù��° ���� ����)
				else if(j == cityArray[i].getCityDuration()-1 ) {	
					
					//�ش絵���� ������ ü������ && ü���ϼ�=1  =>>  ������ ���(ù��°ü������=������ü������)
					if(cityArray[i].getCityDuration() == 1) {	//== if(j==0) 
						
						if( i==0 ) {	//ù��° ������ ���
							day.setCityNames(cityArray[i].getCityName());
						}else {			//ù��°�� �ƴ� ������ ù��° ü������ ��� = �տ� ���� �ϳ� �� ����!
							day.setCityNames(day.getCityNames()+", "+cityArray[i].getCityName());
							if( i==cityArray.length-1 ) {
								//day.setCityNameList(cityNames);
								day.setDate((Timestamp)startDate.clone());
								dayNoo++;
								//startDate.setTime(startDate.getTime() + (1000*60*60*24));
								day.setDayNo(dayNoo);
								dayList.add(day);
								day = new Day();
							}
						}
						
						//���� cityList�� �������� ����
						cityList.get(i).setStartDateStr(startDate.toString().substring(0,10));
						
					}else {		//�ش絵���� ������ ü������ && ü���ϼ�!=1  =>  ������ �ƴ� ���
						
						if(i+1 < cityArray.length) {	//�ڿ� ���ð� ���� ���
							day.setCityNames(cityArray[i].getCityName());
							
						}else if( i+1 == cityArray.length){	//���� ���� ���
							//day.setCityNameList(cityNames);
							day.setDate((Timestamp)startDate.clone());
							dayNoo++;
							//startDate.setTime(startDate.getTime() + (1000*60*60*24));
							day.setDayNo(dayNoo);
							dayList.add(day);
							day = new Day();
						}
					}
					//���� cityList�� �������� ���� :: fullCalendar�� ������ ���ڴ� �޷¿� ǥ�ð� �ȵż� ���� �������� + 1 �ؼ� ����!
					//cityList.get(i).setEndDateStr(  new Timestamp( ((Timestamp)startDate.clone()).getTime() + (1000*60*60*24) ).toString().substring(0,10) );
					cityList.get(i).setEndDateStr(  new Timestamp( ((Timestamp)startDate.clone()).getTime()  ).toString().substring(0,10) );
				}
				
				// �ش� ������ ������ ü���� ��.....�̸鼭 ù��° ü������ �ƴ� ���
				else if( j < cityArray[i].getCityDuration()-1 && j!=0 ) {	
					//cityNames = cityArray[i].getCityName();
					day.setCityNames(cityArray[i].getCityName());
					day.setDate((Timestamp)startDate.clone());
					dayNoo++;
					startDate.setTime(startDate.getTime() + (1000*60*60*24));
					day.setDayNo(dayNoo);
					dayList.add(day);
					day = new Day();
					day.setCityNames(cityArray[i].getCityName());	//���� ���ÿ��� ���� �����̸� �Ѱ��ֱ� ����....����
				}
			}
		}

		return dayList;
	}
	
	
//public static List<Day> cityListToDayList(List<City> cityList, Timestamp startDate) {
//		
//		List<Day> dayList = new ArrayList<Day>();
//		City[] cityArray = cityList.toArray(new City[cityList.size()]);		//����Ʈ�� ���� City ����� Array�� ��ȯ
//		
////		Date today = new Date();
////		Timestamp todayStamp = new Timestamp(today.getTime());
//		
//		int dayNoo = 0;
//		Day day = new Day();
//		
//		for(int i=0; i<cityArray.length; i++) {
//			for(int j=0; j<cityArray[i].getCityDuration(); j++) {
//				
//				if(j == cityArray[i].getCityDuration()-1 ) {	//�ش� ������ ������ ü�������� ��� (ù��° ���� ����)
//					if(cityArray[i].getCityDuration() == 1) {	//== if(j==0) //�ش絵���� ������ ü������ && ü���ϼ�=1  =>>  ������ ���(ù��°ü������=������ü������)
//						
//						if( i==0 ) {	//ù��° ������ ���
//							day.setCityNames(cityArray[i].getCityName());
//						}else {			//ù��°�� �ƴ� ������ ù��° ü������ ��� = �տ� ���� �ϳ� �� ����!
//							day.setCityNames(day.getCityNames()+", "+cityArray[i].getCityName());
//						}
//					}else {		//�ش絵���� ������ ü������ && ü���ϼ�!=1  =>  ������ �ƴ� ���
//						
//						if(i+1 < cityArray.length) {	//�ڿ� ���ð� ���� ���
//							day.setCityNames(cityArray[i].getCityName());
//							
//						}else if( i+1 == cityArray.length){	//���� ���� ���
//							//day.setCityNameList(cityNames);
//							day.setDate((Timestamp)todayStamp.clone());
//							dayNoo++;
//							todayStamp.setTime(todayStamp.getTime() + (1000*60*60*24));
//							day.setDayNo(dayNoo);
//							dayList.add(day);
//							day = new Day();
//						}
//					}
//					
//				}else if( j < cityArray[i].getCityDuration()-1 && j!=0 ) {	//�ش� ������ ������ ü���� ��.....�̸鼭 ù��° ü������ �ƴ� ���
//					//cityNames = cityArray[i].getCityName();
//					day.setCityNames(cityArray[i].getCityName());
//					day.setDate((Timestamp)todayStamp.clone());
//					dayNoo++;
//					todayStamp.setTime(todayStamp.getTime() + (1000*60*60*24));
//					day.setDayNo(dayNoo);
//					dayList.add(day);
//					day = new Day();
//					day.setCityNames(cityArray[i].getCityName());	//���� ���ÿ��� ���� �����̸� �Ѱ��ֱ� ����....����
//				
//					
//				}else if( j==0 && cityArray[i].getCityDuration() != 1 ) {	//�ش� ������ ù��° ü�������̸鼭 ü���ϼ��� 1���� ū ���=������ �ƴ� ���
//					if( i==0 ) {	//ù��° ������ ��� 
//						day.setCityNames(cityArray[i].getCityName());
//
//					}else {		//ù��° ���ð� �ƴ� ���
//						day.setCityNames(day.getCityNames()+", "+cityArray[i].getCityName());	
//						
//					}
//					day.setDate((Timestamp)todayStamp.clone());
//					dayNoo++;
//					todayStamp.setTime(todayStamp.getTime() + (1000*60*60*24));
//					day.setDayNo(dayNoo);
//					dayList.add(day);
//					day = new Day();
//					day.setCityNames(cityArray[i].getCityName());	//���� ���ÿ��� ���� �����̸� �Ѱ��ֱ� ����....����
//				}
//			}
//		}
//
//		return dayList;
//	}
	
	public static int getDday(Timestamp startDate) {
		
		Date today = new Date();

		long diff = startDate.getTime()/(1000*60*60*24) - today.getTime()/(1000*60*60*24);
		//diff = diff / (1000*60*60*24);
		
		int dday = (int)diff + 1;
		
//		Date datee  = new Date();
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		try {
//			datee = sdf.parse( today.toString().substring(0, 10) );
//		}catch (ParseException e) {
//			e.printStackTrace();
//		} 
		
		return dday;
	}
	
	public static String getEndDate(Timestamp startDate, int planTotalDays) {
		
		Timestamp endDate = (Timestamp)startDate.clone();
		endDate.setTime(startDate.getTime() + (1000*60*60*24*(planTotalDays-1)) );	//���� �������� = �����������  + (�ѿ����ϼ�-1)
		
		return toDateStr(endDate);
	}
	
	

	
	
	public static String toDateStr(Timestamp date) {
		if (date == null)
			return "";
		else {
			Date dateForDay = new Date(date.getTime());		//������ ���� dateForDay
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			return sdf.format( new Date(date.getTime()) ) + ", "+dateForDay.toString().substring(0,3);
		}
	}
	
	
//	Calendar calendar = Calendar.getInstance();
//	int year = calendar.get(calendar.YEAR);
//	int month = calendar.get(calendar.MONTH);
//	int day = calendar.get(calendar.DAY_OF_MONTH);
	
	
	/*		���ڸ� ������ �տ� 0�� �ٿ� ���ڸ� ���ڷ� ����� ���� �����... (��,�� �ش�)
	 * 		Timestamp�� toString�ϸ� yyyy-MM-dd ���·� ��µż� substring���� �ϴ� �ذ���
	 * 		if(date != null) {
				Date dateForDay = new Date(date.getTime());		//������ ���� dateForDay
				this.dateString = date.toString().substring(0,10) + " : "+dateForDay.toString().substring(0,3);
			}
	if(date != null) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		
		String month = ""+(cal.get(cal.MONTH)+1);
		if( cal.get(cal.MONTH) < 9) {
			month = "0"+month;
		}
		
		String day = ""+cal.get(cal.DAY_OF_MONTH);
		if( cal.get(cal.DAY_OF_MONTH) <10 ) {
			day = "0"+day;
		}
		
		this.dateString = cal.get(cal.YEAR)+"-"+month+"-"+day;
	}
	*/
	
	public static Object getBean(String beanName) {
        WebApplicationContext context = ContextLoader.getCurrentWebApplicationContext();
        return context.getBean(beanName);
    }
	
	
}