package com.kh.academy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.kh.academy.configuration.CertProperties;
import com.kh.academy.dao.CertDao;
import com.kh.academy.dto.CertDto;
import com.kh.academy.util.RandomGenerator;

@Service // Service는 2가지 이상의 Component(작업 1개)를 묶은 것
public class CertService {

	@Autowired
	private JavaMailSender sender;

	@Autowired
	private CertDao certDao;

	@Autowired
	private RandomGenerator randomGenerator;
	
	@Autowired
	private CertProperties certProperties;

	public void sendCertEmail(String email) {
		// 인증번호 생성
		String number = randomGenerator.randomNumber(8);

		// 메세지 생성
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(email); // 수신인(여러 개 가능) 설정
		message.setSubject("[KH정보교육원] 인증번호 안내"); // 제목 설정
		message.setText("인증번호는 [" + number + "]입니다."); // 내용 설정
		sender.send(message); //전송

		// (+추가)DB등록
		certDao.insertOrUpdate(CertDto.builder()
				.certEmail(email)
				.certNumber(number)
			.build());

	}
	
	//정기적으로 인증정보 중 사용할 수 없는 것들을 제거하는 메소드
	//@Scheduled(cron = "0 30 9,18 * * *")
	//@Scheduled(cron = "0 30 9,18 * * 1-5")
	//@Scheduled(cron = "0 30 9,18 * * MON-FRI") //콤마하고 띄어쓰기 하면 안됨
	//@Scheduled(cron = "0 0 13 25 * ?")//매월 25일 오후 1시.
	//@Scheduled(cron = "0 0 9 ? * WED#1") //매월 첫번째 수요일 9시
	@Scheduled(cron = "0 0 9 ? * 3L") //매월 마지막 수요일 9시 
	
	//@Scheduled(cron = "0 0 * * * *")
	public void work() {
		//System.out.println(LocalDateTime.now());
		certDao.clean(certProperties.getExpireMinutes(), certProperties.getExpireAccept());
	}
}
