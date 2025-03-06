package com.kh.academy.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.academy.dao.CompanyDao;
import com.kh.academy.dao.MemberDao;
import com.kh.academy.dto.CompanyDto;
import com.kh.academy.dto.MemberDto;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private CompanyDao companyDao;

	// 회원가입 매핑(일반회원)
	@GetMapping("/member/join") // GET방식만 처리하는 매핑
	public String joinMember() {
		return "/WEB-INF/views/member/join.jsp";
	}

	// 입력 처리(일반회원)
	@PostMapping("/member/join") // POST방식만 처리하는 매핑
	public String joinMember(@ModelAttribute MemberDto memberDto) {
		memberDao.insertMember(memberDto); // 회원가입
		return "redirect:joinFinish"; // joinFinish으로 쫓아내는 코드(상대경로)
	}

	// 완료 안내(일반회원)
	@RequestMapping("/member/joinFinish") // join-finish도 가능. 다만 주소에는 대문자를 쓸수 있는곳이 있고 안되는 곳이 있음. http://localhost:8080
	// 여기에는 대소문자 구분이 안됨을 알아야함!
	public String joinMemberFinish() {
		return "/WEB-INF/views/member/joinFinish.jsp";
	}

	// 마이페이지(내정보) 매핑 (개인회원)
	// - HttpSession에 있는 아이디를 꺼내 회원의 모든 정보를 조회
	@RequestMapping("/member/mypage")
	public String mypageMember(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("userId"); // 내 아이디 추출
		MemberDto memberDto = memberDao.selectOne(userId); // 내 정보 획득
		model.addAttribute("memberDto", memberDto);

		return "/WEB-INF/views/member/mypage.jsp";
	}

	// 개인정보 변경 매핑(개인회원)
	// - 비밀번호는 검사용으로 사용
	// - 연락처, 이메일, 주소(우편, 기본, 상세), 관심 산업, 관심 직종 변경 가능
	@GetMapping("/member/edit")
	public String editMember(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("userId");
		MemberDto memberDto = memberDao.selectOne(userId);
		model.addAttribute("memberDto", memberDto);
		return "/WEB-INF/views/member/edit.jsp";
	}

	@PostMapping("/member/edit")
	public String editMember(@ModelAttribute MemberDto memberDto, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		MemberDto findDto = memberDao.selectOne(userId);
		boolean isValid = findDto.getMemberPw().equals(memberDto.getMemberPw()); // 사용자가 입력한 비밀번호가 데이터베이스 비밀번호와 일치하지 않을
																					// 경우
		if (!isValid) {
			return "redirect:edit?error";
		}

		// findDto에 원하는 항목을 교체한 뒤 수정 요청
		findDto.setMemberContact(memberDto.getMemberContact());
		findDto.setMemberEmail(memberDto.getMemberEmail());
		findDto.setMemberPost(memberDto.getMemberPost());
		findDto.setMemberAddress1(memberDto.getMemberAddress1());
		findDto.setMemberAddress2(memberDto.getMemberAddress2());
		findDto.setMemberAddress2(memberDto.getMemberIndustry());
		findDto.setMemberAddress2(memberDto.getMemberJob());

		memberDao.updateMember(findDto);
		return "redirect:mypage";
	}

	/*
	 * -----------------------------------------------------------------------------
	 * --------------------------------------------------
	 */

	// 회원가입 매핑(기업회원)
	@GetMapping("/company/member/join") // GET방식만 처리하는 매핑
	public String joinCompanyMember() {
		return "/WEB-INF/views/company/member/join.jsp";
	}

	// 기업명 조회
	@GetMapping("/company/member/getCompanyName")
	@ResponseBody // JSON 데이터를 반환
	public Map<String, String> getCompanyName(@RequestParam String crNumber) {
		Map<String, String> response = new HashMap<>();
		String companyName = memberDao.getCompanyNameByCrNumber(crNumber);
		response.put("companyName", companyName != null ? companyName : "");

		return response;
	}

	// 입력 처리(기업회원)
	@PostMapping("/company/member/join") // POST방식만 처리하는 매핑
	public String joinCompanyMember(@ModelAttribute MemberDto memberDto, Model model) {
		String crNumber = memberDto.getMemberCrNumber();
		String companyName = memberDao.getCompanyNameByCrNumber(crNumber);

		if (companyName == null) {
			model.addAttribute("errorMessage", "유효하지 않은 사업자 등록 번호입니다.");
			return "/WEB-INF/views/company/member/join.jsp"; // 기업 회원 가입 폼으로 다시 이동
		}

		// MemberDto에는 companyName이 없으므로, 모델에 직접 추가
		model.addAttribute("companyName", companyName);

		memberDao.insertCompanyMember(memberDto); // 회원가입
		memberDao.updateMemberCompanyNo();

		return "redirect:joinFinish"; // joinFinish으로 쫓아내는 코드(상대경로)
	}

	// 완료 안내(기업회원)
	@RequestMapping("/company/member/joinFinish") // join-finish도 가능. 다만 주소에는 대문자를 쓸수 있는곳이 있고 안되는 곳이 있음.
													// http://localhost:8080
	// 여기에는 대소문자 구분이 안됨을 알아야함!
	public String joinCompanyMemberFinish() {
		return "/WEB-INF/views/company/member/joinFinish.jsp";
	}

	// 마이페이지(내정보) 매핑 (기업회원)
	// - 현재 로그인한 회원의 모든 정보가 화면에 출력(단, 비밀번호 제외)
	// - HttpSession에 있는 아이디를 꺼내 회원의 모든 정보를 조회
	@RequestMapping("/company/member/mypage")
	public String mypageCompanyMember(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("userId"); // 내 아이디 추출
		
		MemberDto memberDto = memberDao.selectOne(userId); // 내 정보 획득
		System.out.println("memberDto.getMemberCompanyNo() = " + memberDto.getMemberCompanyNo());
		
		CompanyDto companyDto = companyDao.selectOne(memberDto.getMemberCompanyNo());
		
		model.addAttribute("memberDto", memberDto);
		model.addAttribute("companyDto", companyDto);

		return "/WEB-INF/views/company/member/mypage.jsp";
	}

	// 개인정보 변경 매핑(기업회원)
	// - 연락처, 이메일, 주소(우편, 기본, 상세), 산업, 직종, 직책, 사업자등록번호 변경 가능
	@GetMapping("/company/member/edit")
	public String editCompanyMember(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("userId");
		MemberDto memberDto = memberDao.selectOne(userId);
		model.addAttribute("memberDto", memberDto);
		return "/WEB-INF/views/company/member/edit.jsp";
	}

	@PostMapping("/company/member/edit")
	public String editCompanyMember(@ModelAttribute MemberDto memberDto, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		MemberDto findDto = memberDao.selectOne(userId);
		boolean isValid = findDto.getMemberPw().equals(memberDto.getMemberPw()); // 사용자가 입력한 비밀번호가 데이터베이스 비밀번호와 일치하지 않을 경유
		if (!isValid) {
			return "redirect:edit?error";
		}

		// findDto에 원하는 항목을 교체한 뒤 수정 요청
		findDto.setMemberContact(memberDto.getMemberContact());
		findDto.setMemberEmail(memberDto.getMemberEmail());
		findDto.setMemberPost(memberDto.getMemberPost());
		findDto.setMemberAddress1(memberDto.getMemberAddress1());
		findDto.setMemberAddress2(memberDto.getMemberAddress2());
		findDto.setMemberIndustry(memberDto.getMemberIndustry());
		findDto.setMemberJob(memberDto.getMemberJob());
		findDto.setMemberPosition(memberDto.getMemberPosition());
		findDto.setMemberCrNumber(memberDto.getMemberCrNumber());
		
		findDto.setMemberCompanyNo(memberDto.getMemberCompanyNo());
		memberDao.updateCompanyMember(findDto);
		
		return "redirect:mypage";
	}

	/*
	 * -----------------------------------------------------------------------------
	 * --------------------------------------------------
	 */

	//로그인 매핑 (통합)
	@GetMapping("/login")
	public String login() {
		return "/WEB-INF/views/share/login.jsp";
	}

	// HttpSession 추가
	// - 사용자 별로 무언가 다른 정보를 기록해야 할 필요가 있을 때 사용
	// - Model처럼 선언만 하면 자동으로 스프링이 제공해줌
	// - 데이터 추가 : session.setAttribute("key", value);
	// - 데이터 추출 : session.getAttribute("key");
	// - 데이터 제거 : session.removeAttribute("key");
	// - 목표 : 로그인 성공 시 이 회원의 정보를 세션에 저장 (PK)
	@PostMapping("/login")
	public String login(@ModelAttribute MemberDto memberDto, @RequestParam(required = false) String remember,
			HttpSession session, HttpServletResponse response) { // 사용자가 입력한 정보 //아이디와 비밀번호를 String으로 받을지, Dto로 받을지 선택의
																	// 문제
		MemberDto findDto = memberDao.selectOne(memberDto.getMemberId()); // 데이터베이스에 있는 정보 - findDto
		// 아이디가 없으면 findDto는 null이다
		if (findDto == null) {
			return "redirect:login?error"; // 로그인페이지로 쫒아낸다 //GET의 login으로 리다이렉트된다. 원래 리다이렉트는 get밖에 안되긴 함
		}
		// 아이디가 있으면 비밀번호 검사를 진행
//		System.out.println(memberDto);
//		System.out.println(findDto);
		boolean isValid = findDto.getMemberPw().equals(memberDto.getMemberPw());
		if (isValid) {// 로그인 성공 시

			// (+추가)세션에 userId란 이름으로 사용자의 ID를 저장
			session.setAttribute("userId", findDto.getMemberId());
			// (+추가)세션에 userLevel이란 이름으로 사용자의 등급을 저장
			session.setAttribute("userType", findDto.getMemberType());

			/*
			 * //(+추가)최종 로그인 시각을 갱신 처리 memberDao.updateMemberLogin(findDto.getMemberId());
			 * 
			 * //(+추가)아이디 저장하기에 대해 쿠키 생성/소멸 처리 if(remember == null) { //쿠키 소멸 -> 삭제 명령이 없어서
			 * 0초로 해둬야 함 Cookie cookie = new Cookie("saveId", memberDto.getMemberId());
			 * cookie.setMaxAge(0); response.addCookie(cookie); } else { Cookie cookie = new
			 * Cookie("saveId", memberDto.getMemberId()); cookie.setMaxAge(4 * 7 * 24 * 60 *
			 * 60); //4주 response.addCookie(cookie); }
			 */

			return "redirect:/";
		} else {// 비밀번호 다름
			return "redirect:login?error";// 로그인 페이지로 쫓아낸다
		}
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userId");
		session.removeAttribute("userType");
		// session.invalidate(); //세션 소멸 명령
		return "redirect:/";
	}

}