package com.kh.academy.controller;

import java.io.IOException;

import javax.naming.NoPermissionException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.academy.dao.MemberDao;
import com.kh.academy.dto.MemberDto;

import jakarta.mail.MessagingException;

@Controller
public class MemberController {

	@Autowired
	private MemberDao memberDao;

	// 회원가입 매핑
	@GetMapping("/member/join") // GET방식만 처리하는 매핑
	public String join() {
		return "/WEB-INF/views/member/join.jsp";
	}

	// 입력 처리
	@PostMapping("/member/join") // POST방식만 처리하는 매핑
	public String joinMember(@ModelAttribute MemberDto memberDto) {

		memberDao.insertMember(memberDto); // 회원가입

		return "redirect:joinFinish"; // joinFinish으로 쫓아내는 코드(상대경로)
	}

	// 입력 처리
	@PostMapping("/company/join") // POST방식만 처리하는 매핑
	public String joinCompanyMember(@ModelAttribute MemberDto memberDto) {

		memberDao.insertCompanyMember(memberDto); // 회원가입

		return "redirect:joinFinish"; // joinFinish으로 쫓아내는 코드(상대경로)
	}

	// 완료 안내
	@RequestMapping("/member/joinFinish") // join-finish도 가능. 다만 주소에는 대문자를 쓸수 있는곳이 있고 안되는 곳이 있음. http://localhost:8080 //
									// 여기에는 대소문자 구분이 안됨을 알아야함!
	public String joinFinish() {
		return "/WEB-INF/views/member/joinFinish.jsp";
	}

}
