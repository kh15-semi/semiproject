package com.kh.academy.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ReviewDto {
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

}
