package com.kh.academy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.academy.dto.CompanyDto;
import com.kh.academy.service.CompanyService;

@RestController
public class CompanyController {

    @Autowired
    private CompanyService companyService;

    // 기업회원 가입 화면
    @GetMapping("/company/joinCompany") // 경로를 joinCompany로 변경
    public String joinCompany() {
        return "/WEB-INF/views/company/join.jsp";
    }
    
    // 사업자 번호로 회사 정보 조회
    @GetMapping("/company")
    public CompanyDto getCompany(@RequestParam String crNumber) {
        return companyService.getCompanyDetails(crNumber);  // 서비스 메서드 호출
    }
}
