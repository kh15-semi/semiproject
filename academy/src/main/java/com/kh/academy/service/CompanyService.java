package com.kh.academy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.academy.dao.CompanyDao.CompanyRepository;
import com.kh.academy.dto.CompanyDto;
import com.kh.academy.entity.Company;

@Service
public class CompanyService {
    @Autowired
    private CompanyRepository companyRepository;

    public CompanyDto findByCrNumber(String crNumber) {
        // DB에서 사업자 번호로 회사 조회 (여기서는 가정상 예시)
        Company company = companyRepository.findByCompanyCrNumber(crNumber);
        
        // CompanyDto로 변환하여 반환
        if (company != null) {
            return new CompanyDto(
                company.getCompanyNo(),
                company.getCompanyName(),
                company.getCompanyUrl(),
                company.getCompanyContact(),
                company.getCompanyIndustry(),
                company.getCompanyJop(),
                company.getCompanyPost(),
                company.getCompanyAddress1(),
                company.getCompanyAddress2(),
                company.getCompanyCrNumber()
            );
        }
        return null; // 찾을 수 없으면 null 반환
    }

}
