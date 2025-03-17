package com.kh.academy.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class ReplyDto {
	private int replyNo;//댓글번호
	private String replyWriter;//댓글작성자(기업)
	private int replyOrigin;//소속리뷰번호
	private String replyContent;//댓글내용
	private Timestamp replyWtime;//댓글작성시각
	private Timestamp replyEtime;//댓글수정시각
	
	private int replyCompanyNo; //회사번호	
	
}

