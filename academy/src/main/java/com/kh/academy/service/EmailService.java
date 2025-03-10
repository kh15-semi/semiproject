package com.kh.academy.service;

import java.io.File;
import java.io.IOException;
import java.util.Scanner;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.kh.academy.dao.CertDao;
import com.kh.academy.dto.CertDto;
import com.kh.academy.dto.MemberDto;
import com.kh.academy.util.RandomGenerator;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
public class EmailService {

	@Autowired
	private JavaMailSender sender;
	
	@Autowired
	private RandomGenerator randomGenerator;
	
	@Autowired
	private CertDao certDao;

	// 환영메일 전송
	public void sendWelcomeMail(MemberDto memberDto) throws MessagingException, IOException {

		// sender에게 기본 마임메세지 인스턴스를 생성하도록 지시
		MimeMessage message = sender.createMimeMessage();

		// 복잡한 설정과정을 도와주는 도우미를 생성
		MimeMessageHelper helper = new MimeMessageHelper(message, false, "UTF-8");

		// 도우미를 통해서 메세지에 정보를 설정
		helper.setTo(memberDto.getMemberEmail()); // 1개
		// helper.setTo(new String[] {"sanghunlee1333@gmail.com"}); //여러 개
		helper.setSubject("[KH 정보교육원] 가입을 환영합니다!");

		// 외부에 존재하는 템플릿 HTML을 불러와서 전송
		// - classpath - src 내부에 존재하는 위치
		// - filepath - 프로젝트 상의 위치
		ClassPathResource resource = new ClassPathResource("templates/welcome.html");
		File target = resource.getFile(); // 파일추출
		Scanner sc = new Scanner(target); // 입력도구
		StringBuffer buffer = new StringBuffer(); // 저장도구생성
		while (sc.hasNextLine()) { // 남아있는 줄이 있다면
			buffer.append(sc.nextLine()); // 읽어서 버퍼에 추가
		}
		sc.close(); // 도구 정리

		// buffer의 내용을 HTML로 해석해서 원하는 값을 교체
		String html = buffer.toString();
		Document document = Jsoup.parse(html); // pom.xml에 의존성 추가 후 Maven업데이트 필요
		Elements elements = document.select(".username");
		for (Element element : elements) {
			// element.text(memberDto.getMemberId());
			element.text(memberDto.getMemberName());
		}

		// (+추가) .mylink의 href에 계산된 프로젝트의 전체주소를 추가
		String contextPath = ServletUriComponentsBuilder.fromCurrentContextPath()
				// .path("추가경로")
				// .queryParam("key", "value")
				.build().toUriString(); // currentPath -> http:// localhost:8080 path - > /board/list
		Elements links = document.select(".mylink");
		for (Element element : links) {
			String href = element.attr("href"); // 기존에 작성된 href를 추출
			String newHref = contextPath + href; // 신규 href를 계산
			element.attr("href", newHref); // 신규 href를 태그에 설정
		}

		helper.setText(document.toString(), true); // HTML 사용

		// 전송
		sender.send(message);

	}

	public void sendResetMail(MemberDto memberDto) throws MessagingException, IOException {
		// sender에게 기본 마임메세지 인스턴스를 생성하도록 지시
		MimeMessage message = sender.createMimeMessage();

		// 복잡한 설정과정을 도와주는 도우미를 생성
		MimeMessageHelper helper = new MimeMessageHelper(message, false, "UTF-8");

		// 도우미를 통해서 메세지에 정보를 설정
		helper.setTo(memberDto.getMemberEmail()); // 1개
		// helper.setTo(new String[] {"sanghunlee1333@gmail.com"}); //여러 개
		helper.setSubject("[KH 정보교육원] 비밀번호 재설정 안내");

		// 외부에 존재하는 템플릿 HTML을 불러와서 전송
		// - classpath - src 내부에 존재하는 위치
		// - filepath - 프로젝트 상의 위치
		ClassPathResource resource = new ClassPathResource("templates/reset.html");
		File target = resource.getFile(); // 파일추출
		Scanner sc = new Scanner(target); // 입력도구
		StringBuffer buffer = new StringBuffer(); // 저장도구생성
		while (sc.hasNextLine()) { // 남아있는 줄이 있다면
			buffer.append(sc.nextLine()); // 읽어서 버퍼에 추가
		}
		sc.close(); // 도구 정리

		//인증번호 생성
		String number = randomGenerator.randomNumber(8);
		
		// buffer의 내용을 HTML로 해석해서 원하는 값을 교체
		String html = buffer.toString();
		Document document = Jsoup.parse(html); // pom.xml에 의존성 추가 후 Maven업데이트 필요
		// 필요한 문서 내용을 수정
		Element link = document.selectFirst(".reset-link");
		link.attr("href", ServletUriComponentsBuilder
							.fromCurrentContextPath()
							.path("/member/reset")
							.queryParam("memberId", memberDto.getMemberId())
							.queryParam("certEmail", memberDto.getMemberEmail())
							.queryParam("certNumber", number)
						.build().toUriString());
		
		helper.setText(document.toString(), true); // HTML 사용

		// 전송
		sender.send(message);
		
		//DB에 인증번호 내역을 저장
		certDao.insertOrUpdate(CertDto.builder()
				.certEmail(memberDto.getMemberEmail())
				.certNumber(number)
			.build());

	}

}
