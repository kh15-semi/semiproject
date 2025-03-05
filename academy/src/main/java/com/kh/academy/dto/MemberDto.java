package com.kh.academy.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class MemberDto {

	private String memberId; //아이디 
	private String memberPw; //비밀번호
	private String memberType; //회원유형
	private String memberName; //이름
	private String memberContact;//연락처
	private String memberEmail;//이메일
	private String memberPost;//우편번호
	private String memberAddress1;//기본주소
	private String memberAddress2;//상세주소
	private Timestamp memberJoin;//가입일시 //LocalDateTime도 가능
	private Timestamp memberLogin;//최종로그인일시
	private Timestamp memberChange;//최종비밀번호변경일시
	private String memberIndustry; //관심산업 (일반회원만)
	private String memberJob; //관심직종 (일반회원만)
	private String memberPosition; //직책 (기업회원만)
	private int memberCompanyNo; //소속회사 번호 (기업회원만)

	
}
