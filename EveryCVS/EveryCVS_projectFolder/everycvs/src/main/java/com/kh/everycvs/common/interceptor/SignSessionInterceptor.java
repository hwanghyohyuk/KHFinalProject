package com.kh.everycvs.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

// 로그인 페이지 및 회원가입 페이지로 강제 이동을 막는 인터셉터
public class SignSessionInterceptor extends HandlerInterceptorAdapter {

	// preHandle() : 컨트롤러보다 먼저 수행되는 메서드
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		// session 객체를 가져옴
		HttpSession session = request.getSession();
		
		Object obj = session.getAttribute("user");

		if (obj == null) { // 로그인된 세션이 없는 경우...
			return true;
		}else{
			response.sendRedirect("/everycvs/main/main.do");
			return false;
		}
		
	}

	// 컨트롤러가 수행되고 화면이 보여지기 직전에 수행되는 메서드
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}
	
}