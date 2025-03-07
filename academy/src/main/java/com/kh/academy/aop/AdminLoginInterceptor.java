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
			HttpSession session = request.getSession();
			String memberType = (String) session.getAttribute("memberType");
			
			if(memberType == null) {
				throw new NoPermissionException("로그인 필요");
			}
			if(memberType.equals("관리자") == false) {
				throw new NoPermissionException("권한 부족");
			}
			return true;
	}
}
