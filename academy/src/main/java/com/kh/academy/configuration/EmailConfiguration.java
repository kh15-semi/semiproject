package com.kh.academy.configuration;

import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class EmailConfiguration {
	//자주 사용하는 도구를 미리 등록시킬수있다
	//@Bean을 메소드에 붙여서 원하는 도구를 생성하도록 구현
	//JavaMailSenderImpl sender = new JavaMailSenderImpl();
	
	@Autowired
	private EmailProperties emailProperties;
	
	@Bean
	public JavaMailSenderImpl sender() { // 1,2 대체
				//1.
				JavaMailSenderImpl sender = new JavaMailSenderImpl();
				
				//2.
				sender.setHost("smtp.gmail.com");//이용할 업체의 별칭또는 ip
				sender.setPort(587);//이용할 업체의 서비스 실행번호
				sender.setUsername(emailProperties.getUsername()); //이용할 업체 사용자 계정이름
				sender.setPassword(emailProperties.getPassword()); //이용할 업체 사용자 계정 비번
				
				Properties props = new Properties();//추가정보 저장소 생성
				props.setProperty("mail.smtp.auth","true"); //인증후 이용설정
				props.setProperty("mail.smtp.debmg","true"); //디버깅 허용 설정 
				props.setProperty("mail.smtp.starttls.enable","true"); //TLS 사용 설정
				props.setProperty("mail.smtp.ssl.protocols","TLSv1.2"); //TLS 버전 설정
				props.setProperty("mail.smtp.ssl.trust","smtp.gmail.com");//신뢰할 수 있는 
				sender.setJavaMailProperties(props);//추가정보 설정
				
				return sender;
	}
	
}
