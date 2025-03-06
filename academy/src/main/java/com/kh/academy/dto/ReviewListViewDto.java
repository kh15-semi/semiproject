package com.kh.academy.dto;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import lombok.Data;

@Data
public class ReviewListViewDto {
	//리뷰 dto
	private int reviewNo; //리뷰번호
	private String reviewWriter;//아이디
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
	private String reviewCeoEvalulation;//ceo에 대한 견해
	private String reviewPrediction;//기업전망
	private String reviewRecommend;//기업추천
	//상위글정보
	private int targetNo;
	private String targetTitle;
	//멤버 dto
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
	private String memberIndustry; //산업 (일반회원은 선택, 기업회원은 필수)
	private String memberJob; //직종 (일반회원은 선택, 기업회원은 필수)
	private String memberPosition; //직책 (기업회원만)
	private String memberCrNumber; //사업자등록번호 (외래키-기업회원만) 
	private int memberCompanyNo; //소속회사 번호 (기업회원만)
	
	//날짜를 출력하기 위한 가상의 메소드
	//- boardWtime과 현재날짜를 비교
	public String getBoardWtimeString() {
		LocalDate today = LocalDate.now();
		LocalDateTime wtime = reviewWtime.toLocalDateTime();
		//wtime의 날짜와 today를 비교하여 어떤 값을 내보낼지 결정
		LocalDate wdate = wtime.toLocalDate();
		if(wdate.isBefore(today)) {
			return wdate.toString();
		}
		else {
			return wtime.toLocalTime()
						.format(DateTimeFormatter.ofPattern("HH:mm"));
		}
	}	
	
}
