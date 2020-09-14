package com.storm.common.listener;

import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.storm.service.domain.User;



//@WebListener
public class LoginSessionListener implements HttpSessionListener, HttpSessionAttributeListener {

	//Field
	//private static Map<String, TimerTask> checkMap = Collections.synchronizedMap(new HashMap<String, TimerTask>());
	private static Map<String, TimerTask> checkMap = new ConcurrentHashMap<String, TimerTask>();
	private static Map<String, User> userMap = new ConcurrentHashMap<String, User>();
	
	public LoginSessionListener() {
		System.out.println(this.getClass());
	}

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		System.out.println(">>>생성된 SESSIONID "+se.getSession().getId());
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		System.out.println(">>>제거된 SESSIONID "+se.getSession().getId());
		User sessionUser = (User)se.getSession().getAttribute("user");
		if( sessionUser != null ) {
			System.out.println("session에서 가져온 User : "+sessionUser);
			String userId = sessionUser.getUserId();
			
			for (Map.Entry<String, TimerTask> entry : checkMap.entrySet()) { 
				if (entry.getKey().equals(userId)) { 
					entry.getValue().cancel(); // TimerTask 종료
					checkMap.remove(userId); 
					System.out.println(userId + "님의 알림이 종료되었습니다."); 
				} 
			}
		}
	}

	@Override
	public void attributeAdded(HttpSessionBindingEvent se) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void attributeRemoved(HttpSessionBindingEvent se) {
		// TODO Auto-generated method stub
		User sessionUser = (User)se.getSession().getAttribute("user");
		if( sessionUser != null ) {
			System.out.println("session���� ������ User : "+sessionUser);
			String userId = sessionUser.getUserId();
			
			for (Map.Entry<String, TimerTask> entry : checkMap.entrySet()) { 
				if (entry.getKey().equals(userId)) { 
					entry.getValue().cancel(); // TimerTask ����
					checkMap.remove(userId); 
					System.out.println(userId + "���� �˸��� ����Ǿ����ϴ�."); 
				} 
			}
		}
		
	}

	@Override
	public void attributeReplaced(HttpSessionBindingEvent arg0) {
		// TODO Auto-generated method stub
		
	}

//	@Override
//	public void attributeAdded(HttpSessionBindingEvent se) {
//		System.out.println(">>>�߰��� SESSIONID "+se.getSession().getId());
//		if(se.getSession().getAttribute("user") != null) {
//			User sessionUser = (User)se.getSession().getAttribute("user");
//			String userId = sessionUser.getUserId();
//			userMap.put(se.getSession().getId(), sessionUser);
//			System.out.println("session���� ������ User : "+sessionUser+" || userId : "+userId);
//			
//			try {
//				PlanService planService = (PlanService)Util.getBean("planServiceImpl");
//				System.out.println("\n\ncount ::::: "+planService.getUndoneCount(userId)+"\n\n");
//				if ( planService.getUndoneCount(userId) > 0 ) { 
//				
//					List<Plan> planList = planService.getUndoneList(userId);
//					
//					// TimerTask
//					TimerTask runTask = checkMap.get(userId); // ���� userId�� TimerTask ȣ�� 
//					if (runTask == null) { // ���ٸ� ����
//						
//						UserSocket webSocket = new UserSocket();
//						runTask = new TimerTask() {
//							
//							@Override public void run() { 
//								Random rand = new Random();
//								int random = rand.nextInt(planList.size());
//								System.out.println("\nplanList.size() : "+planList.size() +" || "+random+"��° �÷�����Ʈ���� ");
//								List<Todo> todoList = planList.get(random).getTodoList();
//								random = rand.nextInt(todoList.size());
//								System.out.print("todoList.size() : "+todoList.size()+" || "+random+"��° todo ���� :: ");
//								Todo todo = todoList.get(random);
//								System.out.println(todo.getTodoName());
//								
//								Push push = new Push(); 
//								push.setPushType("P"); 
//								push.setRefId(todo.getPlanId());
//								push.setPushMsg(todo.getTodoName());
//								//=========================
////								push.setRefId("10027"); //���� ���� �뵵
////								push.setPushMsg("����ǥ �ۼ��ϱ�"); //���� ���� �뵵
//								//==========================
//								System.out.println("\n"+userId+"���� ������ PUSH ::: "+push); 
//								try {
//									//webSocket.sendPush(userId, push);
//									webSocket.sendPush(userId, push);
//								} catch (Exception e) {
//									e.printStackTrace();
//								}
//								
//							} };
//							
//							Timer timer = new Timer(true); 
//							//timer.scheduleAtFixedRate(runTask, 0, 3*10*1000); // 3*10�ʸ��� �� task 
//							//timer.scheduleAtFixedRate(runTask, 0, 3*6*10*1000);  // 3�и��� �� task 
//							timer.scheduleAtFixedRate(runTask, 0, 2*10*60*1000); //20�и��� �� task
//							//timer.scheduleAtFixedRate(runTask, 0, 24*60*60*1000); //1�ϸ��� �� task
//							
//					}
//					checkMap.put(userId, runTask);
//				}
//			} catch (Exception e1) {
//				e1.printStackTrace();
//			}
//			
//			
//		}	 
//		
//	}

//	@Override
//	public void attributeRemoved(HttpSessionBindingEvent se) {
//		User sessionUser = (User)se.getSession().getAttribute("user");
//		if( sessionUser != null ) {
//			System.out.println("session���� ������ User : "+sessionUser);
//			String userId = sessionUser.getUserId();
//			
//			for (Map.Entry<String, TimerTask> entry : checkMap.entrySet()) { 
//				if (entry.getKey().equals(userId)) { 
//					entry.getValue().cancel(); // TimerTask ����
//					checkMap.remove(userId); 
//					System.out.println(userId + "���� �˸��� ����Ǿ����ϴ�."); 
//				} 
//			}
//		}
//		
//	}

//	@Override
//	public void attributeReplaced(HttpSessionBindingEvent event) {
//		// TODO Auto-generated method stub
//		
//	}

}
