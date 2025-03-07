package com.kh.academy.aop;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.academy.error.NoPermissionException;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Service
public class MemberLoginInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, 
											HttpServletResponse response, 
											Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");		
		
		if(userId != null) {//로그인 되어 있다면
			return true;//통과
		}
		else {
			throw new NoPermissionException("로그인 후 이용 가능합니다");
		}
	}
}
