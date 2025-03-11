package com.kh.academy.dto;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import lombok.Data;

//oracle의 board_list_view와 연결될 DTO
@Data
public class ReviewListViewDto { //자바 입장에서는 view가 실제로 테이블이 아니더라도, 테이블처럼 받아들여지므로 DTO 필요
	
	//ReviewDto의 내용
	private int reviewNo; //리뷰번호
	private String reviewWriter;//아이디
	private int reviewCompanyNo; //회사번호
	private int reviewScore;//리뷰평점
	private String reviewComment;//리뷰한줄평
	private int reviewLike;//리뷰좋아요
	private Timestamp reviewWtime;//작성일
	private Timestamp reviewEtime;//수정일
	private String reviewStrength;//기업 장점
	private String reviewWeakness;//기업 단점
	private int reviewSalary;//급여 만족도(별점)
	private int reviewWorkAndLife;//워라벨 만족도(별점)
	private int reviewPromotion;//승진기회 만족도(별점)
	private int reviewCulture;//사내문화 만족도(별점)
	private int reviewDirector;//경영진 만족도(별점)
	
	private int reviewReply;	
	//답변형 게시판을 위해 추가한 데이터
	
	//MemberDto의 내용
	private String memberId; //아이디 
	private String memberPw; //비밀번호
	private String memberType; //회원유형
	private String memberName; //이름
	private String memberIdCardNum; //주민등록번호(일반회원만)
	private String memberContact;//연락처
	private String memberEmail;//이메일
	private String memberPost;//우편번호
	private String memberAddress1;//기본주소
	private String memberAddress2;//상세주소
	private Timestamp memberJoin;//가입일시 //LocalDateTime도 가능
	private Timestamp memberLogin;//최종로그인일시
	private Timestamp memberChange;//최종비밀번호변경일시
	private String memberIndustry; //산업 (일반회원은 선택, 기업회원은 필수)
	private String memberJob; //직종 (일반회원은 선택, 기업회원은 필수)
	private String memberPosition; //직책 (기업회원만)
	private String memberCrNumber; //사업자등록번호 (외래키-기업회원만) 
	private int memberCompanyNo; //소속회사 번호 (기업회원만)
	
	public String getReviewWtimeString() {
		LocalDate today = LocalDate.now();
		LocalDateTime wtime = reviewWtime.toLocalDateTime();
		reviewWtime.toLocalDateTime();
		//wtime의 날짜와 today를 비교하여 어떤 값을 내보낼지 결정
		LocalDate wdate = wtime.toLocalDate();
		
		//if(today.isAfter(wdate)) {
		if(wdate.isBefore(today)){ //wdate가 이전 날짜라면
		 	return wdate.toString();
		}
		else {
			return wtime.toLocalTime().format(DateTimeFormatter.ofPattern("HH:mm"));
		}
	}
	
}
