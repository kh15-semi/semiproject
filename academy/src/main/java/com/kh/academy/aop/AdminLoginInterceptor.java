package com.kh.academy.aop;

import javax.naming.NoPermissionException;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Service
public class AdminLoginInterceptor implements HandlerInterceptor{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
		throws Exception {
		//비회원이나 관리자가 아닌 회원이 통과하는 것을 차단
		HttpSession session = request.getSession();
		String userType = (String) session.getAttribute("userType");
			
		if(userType == null) {
			throw new NoPermissionException("로그인 필요");
		}
		if(userType.equals("관리자") == false) {
			throw new NoPermissionException("관리자 이외에는 들어갈 수 없는 페이지입니다.");
		}
		return true;
	}
}
