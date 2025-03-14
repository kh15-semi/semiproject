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
import com.kh.academy.dao.CompanyHistoryDao;
import com.kh.academy.dao.MemberDao;
import com.kh.academy.dto.CompanyDto;
import com.kh.academy.dto.CompanyHistoryDto;
import com.kh.academy.dto.MemberDto;
import com.kh.academy.error.TargetNotFoundException;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private CompanyDao companyDao;

	@Autowired
	private CompanyHistoryDao companyHistoryDao;

	// ---------------------------------(일반회원)------------------------------------------
	
	// 회원가입 매핑 (일반회원)
	@GetMapping("/member/join") // GET방식만 처리하는 매핑
	public String joinMember() {
		return "/WEB-INF/views/member/join.jsp";
	}

	// 입력 처리 (일반회원)
	@PostMapping("/member/join") // POST방식만 처리하는 매핑
	public String joinMember(@ModelAttribute MemberDto memberDto, Model model) {
		// 필수 입력값 검증
	    if (memberDto.getMemberId() == null || memberDto.getMemberId().isEmpty() ||
	        memberDto.getMemberPw() == null || memberDto.getMemberPw().isEmpty() ||
	        memberDto.getMemberEmail() == null || memberDto.getMemberEmail().isEmpty() ||
	        memberDto.getMemberIdCardNum() == null || memberDto.getMemberIdCardNum().isEmpty()) {
	        
	        throw new TargetNotFoundException("회원정보를 입력하세요");
	    }
		
		// company_history 테이블 조회
        CompanyHistoryDto companyHistoryDto = companyHistoryDao.selectCompanyHistoryByMemberIdCardNum(memberDto.getMemberIdCardNum());

        // company_no 업데이트
        if (companyHistoryDto != null) {
            memberDao.insertMember(memberDto); // 회원가입
            memberDao.updateMemberCompanyNoForIndividual(memberDto.getMemberId(), companyHistoryDto.getCompanyNo());
        }
        
        return "redirect:/share/joinFinish"; // joinFinish으로 쫓아내는 코드(상대경로)
		
	}

	// 마이페이지(내정보) 매핑 (일반회원)
	// - HttpSession에 있는 아이디를 꺼내 회원의 모든 정보를 조회
	@RequestMapping("/member/mypage")
	public String mypageMember(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("userId"); // 내 아이디 추출
		MemberDto memberDto = memberDao.selectOne(userId); //내 정보 획득
		CompanyHistoryDto companyHistoryDto = companyHistoryDao.selectCompanyHistoryByMemberIdCardNum(memberDto.getMemberIdCardNum());
		CompanyDto companyDto = companyDao.selectOne(companyHistoryDto.getCompanyNo());
		
		model.addAttribute("memberDto", memberDto);
		model.addAttribute("companyHistoryDto", companyHistoryDto);
		model.addAttribute("companyName", companyDto.getCompanyName());

		return "/WEB-INF/views/member/mypage.jsp";
	}

	// 개인정보 변경 매핑 (일반회원)
	// - 비밀번호는 검사용으로 사용
	// - 연락처, 이메일, 주소, 관심 산업/관심 직종 변경 가능
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
		boolean isValid = findDto.getMemberPw().equals(memberDto.getMemberPw()); // 사용자가 입력한 비밀번호가 데이터베이스 비밀번호와 일치하지 않을 경우
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

		memberDao.updateMember(findDto);

		// 세션에 업데이트된 정보를 저장
		session.setAttribute("memberDto", findDto);

		return "redirect:/member/mypage";
	}
	
	// ---------------------------------(기업회원)------------------------------------------

	// 회원가입 매핑 (기업회원)
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

	// 입력 처리 (기업회원)
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
        model.addAttribute("memberName", memberDto.getMemberName());

		memberDao.insertCompanyMember(memberDto); // 회원가입
		memberDao.updateMemberCompanyNo(memberDto.getMemberId());

		return "redirect:/share/joinFinish"; // joinFinish으로 쫓아내는 코드(상대경로)
	}

	@RequestMapping("/company/member/mypage")
	public String mypageCompanyMember(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("userId"); // 내 아이디 추출
		MemberDto memberDto = memberDao.selectOne(userId);
		CompanyDto companyDto = companyDao.selectOne(memberDto.getMemberCompanyNo());

		model.addAttribute("memberDto", memberDto);
		model.addAttribute("companyDto", companyDto);

		return "/WEB-INF/views/company/member/mypage.jsp"; // JSP 경로
	}

	// 개인정보 변경 매핑 (기업회원)
	// - 연락처, 이메일, 직책 변경 가능
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
		boolean isValid = findDto.getMemberPw().equals(memberDto.getMemberPw()); // 사용자가 입력한 비밀번호가 데이터베이스 비밀번호와 일치하지 않을 경우
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
		session.setAttribute("memberDto", findDto); // 세션에 업데이트된 정보를 저장

		return "redirect:/company/member/mypage";
	}

	// ---------------------------------(공용)------------------------------------------

	// 완료 안내 (통합)
	@RequestMapping("/share/joinFinish") // join-finish도 가능. 다만 주소에는 대문자를 쓸수 있는곳이 있고 안되는 곳이 있음. -> http://localhost:8080
	// 여기에는 대소문자 구분이 안됨을 알아야함!
	public String joinFinish() {
		return "/WEB-INF/views/share/joinFinish.jsp";
	}

	// 로그인 매핑 (통합)
	@GetMapping("/share/login")
	public String login() {
		return "/WEB-INF/views/share/login.jsp";
	}

	@PostMapping("/share/login")
	public String login(@ModelAttribute MemberDto memberDto, @RequestParam(required = false) String remember, 
			HttpSession session, HttpServletResponse response) { // 사용자가 입력한 정보 //아이디와 비밀번호를 String으로 받을지, Dto로 받을지 선택의 문제
		
		MemberDto findDto = memberDao.selectOne(memberDto.getMemberId()); // 데이터베이스에 있는 정보 - findDto
		// 아이디가 없으면 findDto는 null이다
		if (findDto == null) {
			return "redirect:login?error"; // 로그인페이지로 쫒아낸다 //GET의 login으로 리다이렉트된다. 원래 리다이렉트는 get밖에 안되긴 함
		}
		// 아이디가 있으면 비밀번호 검사를 진행
		boolean isValid = findDto.getMemberPw().equals(memberDto.getMemberPw());
		if (isValid) {// 로그인 성공 시

			session.setAttribute("userId", findDto.getMemberId());
			session.setAttribute("userType", findDto.getMemberType());
			session.setAttribute("memberDto", findDto); // memberDto를 세션에 저장

			// 관리자인 경우 companyNo를 null로 설정
	        Integer companyNo = null;
	        if (!findDto.getMemberType().equals("관리자")) {
	            companyNo = memberDao.selectMemberCompanyNo(memberDto.getMemberId());
	        }
			session.setAttribute("userCompanyNo", companyNo);
			
			//(+추가)최종 로그인 시각을 갱신 처리
			memberDao.updateMemberLogin(findDto.getMemberId());
			
			//(+추가) 아이디 저장하기에 대해 쿠키 생성/소멸 처리
			if(remember == null) {//쿠키 소멸
				Cookie cookie = new Cookie("saveId", memberDto.getMemberId());
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
			else {//쿠키 생성
				Cookie cookie = new Cookie("saveId", memberDto.getMemberId());
				cookie.setMaxAge(4*7*24*60*60);//4주
				response.addCookie(cookie);
			}
		
			return "redirect:/";
		} else {// 비밀번호 다름
			return "redirect:login?error";// 로그인 페이지로 쫓아낸다
		}
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userId");
		session.removeAttribute("userType");
		session.removeAttribute("memberDto");
//		if (session != null) {
//	        session.invalidate(); // 세션 소멸 명령
//	    }
		return "redirect:/";
	}

	// 비밀번호 변경 매핑 (통합)
	@GetMapping("/share/password")
	public String password() {
		return "/WEB-INF/views/share/password.jsp"; // 포워드
	}

	@PostMapping("/share/password")
	public String password(@RequestParam String currentPw, @RequestParam String newPw, HttpSession session) { // 아이디를 꺼내야 됨
		String userId = (String) session.getAttribute("userId"); // 세션은 꺼낼 때 아무거나 꺼낼 수 있도록 Object형태로 꺼내기 때문에 다운캐스팅 필요함
		String userType = (String) session.getAttribute("userType");
		MemberDto memberDto = memberDao.selectOne(userId);
		boolean isValid = currentPw.equals(memberDto.getMemberPw());
		if (isValid == false) { // 비밀번호가 일치하지 않는 경우
			return "redirect:password?error=1";
		}

		// (+추가) 동일한 비밀번호를 변경할 수 없도록 차단 처리
		if (currentPw.equals(newPw)) {
			return "redirect:password?error=2"; // 위와 다른 에러이기 때문에 구분해야 함
		}

		memberDto.setMemberPw(newPw); // 비밀번호 변경
		memberDao.updateMemberPassword(memberDto);

		if (userType.equals("일반회원")) {
			return "redirect:/member/mypage";
		} 
		else if (userType.equals("기업회원")) {
			return "redirect:/company/member/mypage";
		} 
		else {
			// (+확인필요)관리자 마이페이지 = 개인회원 마이페이지로 설정되어있는 상태
			return "redirect:/member/mypage";
		}

	}

	// 회원 탈퇴 매핑
	@GetMapping("/share/exit")
	public String exit(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("userId");
		MemberDto memberDto = memberDao.selectOne(userId);
		model.addAttribute("memberDto", memberDto);
		return "/WEB-INF/views/share/exit.jsp";
	}

	@PostMapping("/share/exit")
	public String exit(@RequestParam String memberPw, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		MemberDto memberDto = memberDao.selectOne(userId);
		
		boolean isValidPw = memberPw.equals(memberDto.getMemberPw());
		if (isValidPw == false) {
			return "redirect:exit?error";
		}
		
		if(memberDto.getMemberType().equals("기업회원")) {
			companyDao.delete(memberDto.getMemberCompanyNo());
		}
		
		memberDao.delete(userId);
		
		session.removeAttribute("memberDto");
	    session.removeAttribute("userId");
	    session.removeAttribute("userType");
	    
		return "redirect:exitFinish";
	}

	@RequestMapping("/share/exitFinish")
	public String exitFinish() {
		return "/WEB-INF/views/share/exitFinish.jsp";
	}

}