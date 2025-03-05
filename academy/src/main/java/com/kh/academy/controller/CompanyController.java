package com.kh.academy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.academy.dto.CompanyDto;
import com.kh.academy.service.CompanyService;
@Controller
public class CompanyController {
    @Autowired
    private CompanyService companyService;

    @GetMapping("/company/join")
    @ResponseBody
    public CompanyDto getCompanyNameByCrNumber(@RequestParam String crNumber) {
        // DB에서 사업자 번호로 회사 정보 조회
        CompanyDto companyDto = companyService.findByCrNumber(crNumber);
        return companyDto;  // DTO 반환
    }
}
