package com.kh.academy.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class CertDto {
	
	private String certEmail; //이메일
	private String certNumber; //인증번호
	private Timestamp certTime; //보낸시간 
	private Timestamp certConfirm; //응답시간
	} 

