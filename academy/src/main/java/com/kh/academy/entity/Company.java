package com.kh.academy.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class Company {
    
    @Id
    private int companyNo; // 기업 번호
    private String companyName; // 기업명
    private String companyUrl; // 기업 홈페이지 주소
    private String companyContact; // 기업 담당자 번호
    private String companyIndustry; // 기업 산업
    private String companyJop; // 직종
    private String companyPost; // 우편번호
    private String companyAddress1; // 기본주소
    private String companyAddress2; // 상세주소
    private String companyCrNumber; // 사업자 등록 번호

    // Getter 메서드들
    public int getCompanyNo() {
        return companyNo;
    }

    public String getCompanyName() {
        return companyName;
    }

    public String getCompanyUrl() {
        return companyUrl;
    }

    public String getCompanyContact() {
        return companyContact;
    }

    public String getCompanyIndustry() {
        return companyIndustry;
    }

    public String getCompanyJop() {
        return companyJop;
    }

    public String getCompanyPost() {
        return companyPost;
    }

    public String getCompanyAddress1() {
        return companyAddress1;
    }

    public String getCompanyAddress2() {
        return companyAddress2;
    }

    public String getCompanyCrNumber() {
        return companyCrNumber;
    }

    // Setter 메서드들도 필요하면 추가해줘야 합니다.
}
