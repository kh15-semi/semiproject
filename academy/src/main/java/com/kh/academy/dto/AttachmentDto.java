
package com.kh.academy.dto;

import lombok.Data;

//첨부파일 DTO
@Data
public class AttachmentDto {
	private int attachmentNo;//시퀀스번호
	private String attachmentName;//업로드한 파일명
	private String attachmentType;//업로드한 파일유형
	private long attachmentSize;//업로드한 파일크기
}
