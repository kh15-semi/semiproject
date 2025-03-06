package com.kh.academy.dto;

import java.sql.Timestamp;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class CompanyHistoryDto {

	private int companyHistoryNo; //히스토리 이력번호
    private String memberId; //회원ID
    private int companyNo; //기업번호
    
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Timestamp companyHistoryJoinDate; //입사일
    
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Timestamp companyHistoryLeaveDate; //퇴사일
	
}
