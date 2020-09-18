package com.storm.common.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.storm.service.domain.User;
import com.storm.service.user.UserService;

public class LogOnCheckInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
		///Constructor
		public LogOnCheckInterceptor(){
			System.out.println("\nCommon :: "+this.getClass()+"\n");		
		}
		
//		///Method
//		public boolean preHandle( HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
//			
//			//session 객체를 가져옴
//			HttpSession session = request.getSession(false);
//			
//			//로그인이 안되어 있는 상태임 따라서 다시 로그인 창으로 돌려보냄.
//			if(session != null) {
//				User user = (User)session.getAttribute("user");
//			}else{
//				return true;
//			}
//			
//			response.sendRedirect("/user/login");
//			return false;
//			
//		}//end of prehandle
		
		
//		@Override
//		public void postHandle(HttpServletRequest request, HttpServletResponse response,Object obj, ModelAndView mav)throws Exception {
//			System.out.println("postHandle");
//		}
//
//		// view���� ó���� ���� �Ŀ� ó����
//		@Override
//		public void afterCompletion(HttpServletRequest request, HttpServletResponse response,Object obj, Exception e)throws Exception {
//			System.out.println("afterCompletion");
//		
//		}
		
}
