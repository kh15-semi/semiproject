package com.kh.academy.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class CompanyDto {
	private int companyNo; //기업번호
	private String companyName; //기업명(상호명)
	private int companyCrNumber;//사업자번호
	private String companyUrl;//기업 홈페이지 주소
	private String companyContact;//기업 전화번호(대표)
	private String companyIndustry;//기업 산업
	private String companyJop;//(기업 소유 직종)
	private String companyPost;//우편번호
	private String companyAddress1;//기본주소
	private String companyAddress2;//상세주소
}
