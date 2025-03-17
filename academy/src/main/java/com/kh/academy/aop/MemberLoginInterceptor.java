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
                             Object handler) throws Exception {
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");

        // 로그인 여부 확인
        if (userId == null) {
            throw new NoPermissionException("로그인 후 이용 가능합니다");
        }

        // 로그인된 사용자가 일반회원일 경우, 특정 경로에 접근 불가
        String userType = (String) session.getAttribute("userType");

        // userType이 null일 경우 예외 처리
        if (userType == null) {
            throw new NoPermissionException("사용자 권한 정보가 없습니다.");
        }

        String requestUri = request.getRequestURI();

        if ("일반회원".equals(userType) && (requestUri.contains("/company/member/") || requestUri.startsWith("/company/edit"))) {
            throw new NoPermissionException("일반회원은 해당 경로에 접근할 수 없습니다.");
        }
        
        // 기업회원 차단 경로
        if ("기업회원".equals(userType) && 
            (requestUri.startsWith("/member/edit") || requestUri.startsWith("/member/mypage") || requestUri.startsWith("/company/review/write"))) {
            throw new NoPermissionException("기업회원은 해당 경로에 접근할 수 없습니다.");
        }
        // 로그인된 사용자는 모두 접근 가능
        return true;
    }
}
