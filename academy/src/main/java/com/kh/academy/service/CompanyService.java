package com.kh.academy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.academy.dao.CompanyDao;
import com.kh.academy.dto.CompanyDto;

@Service
public class CompanyService {

    @Autowired
    private CompanyDao companyDao;  // Dao 의존성 주입

    // 사업자 번호로 회사 정보 조회
    public CompanyDto getCompanyDetails(String crNumber) {
        return companyDao.selectByCrNumber(crNumber);  // Dao 메서드 호출
    }
}
