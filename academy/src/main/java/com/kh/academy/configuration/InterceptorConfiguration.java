package com.kh.academy.configuration;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.kh.academy.aop.AdminLoginInterceptor;
import com.kh.academy.aop.MemberLoginInterceptor;

@Configuration
public class InterceptorConfiguration implements WebMvcConfigurer {

	@Autowired
	private AdminLoginInterceptor adminLoginInterceptor;
	@Autowired
	private MemberLoginInterceptor memberLoginInterceptor;
	
	@Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 회원 전용 기능에 대해 인터셉터를 등록
        registry.addInterceptor(memberLoginInterceptor)
                .addPathPatterns(List.of(
                        "/member/**",            // 회원 관련 페이지
                        //"/company/member/**",    // 기업회원 관련 페이지
                        "/share/exit",           // 회원 탈퇴
                        "/share/password"        // 비밀번호 변경
                ))
                .excludePathPatterns(List.of(
                        "/member/login",         // 로그인
                        "/member/join",          // 회원가입
                        "/member/joinFinish"    // 회원가입 완료
//                        "/member/findPw",        // 비밀번호 찾기
//                        "/member/reset"          // 비밀번호 재설정
                ));

        // 관리자 전용 페이지에 대해 인터셉터를 등록
        registry.addInterceptor(adminLoginInterceptor)
                .addPathPatterns("/admin/**"); 

    }
}
