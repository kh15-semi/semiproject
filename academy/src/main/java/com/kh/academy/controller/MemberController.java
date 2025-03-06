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

import com.kh.academy.dao.MemberDao;
import com.kh.academy.dto.MemberDto;

@Controller
public class MemberController {

	@Autowired
	private MemberDao memberDao;

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

	 
	// 회원가입 매핑(기업회원)
	@GetMapping("/company/join") // GET방식만 처리하는 매핑
	public String joinCompanyMember() {
		return "/WEB-INF/views/company/join.jsp";
	}
	
	// 기업명 조회
	@GetMapping("/company/getCompanyName")
	@ResponseBody // JSON 데이터를 반환
	public Map<String, String> getCompanyName(@RequestParam String crNumber) {
	    Map<String, String> response = new HashMap<>();
	    String companyName = memberDao.getCompanyNameByCrNumber(crNumber);
	    response.put("companyName", companyName != null ? companyName : "");
	    
	    return response;
	}

	// 입력 처리(기업회원)
	@PostMapping("/company/join") // POST방식만 처리하는 매핑
	public String joinCompanyMember(@ModelAttribute MemberDto memberDto, Model model) {
		String crNumber = memberDto.getMemberCrNumber();
        String companyName = memberDao.getCompanyNameByCrNumber(crNumber);
        
        if (companyName == null) {
            model.addAttribute("errorMessage", "유효하지 않은 사업자 등록 번호입니다.");
            return "/WEB-INF/views/company/join.jsp"; // 기업 회원 가입 폼으로 다시 이동
        }
        
        // MemberDto에는 companyName이 없으므로, 모델에 직접 추가
        model.addAttribute("companyName", companyName);
        
		memberDao.insertCompanyMember(memberDto); // 회원가입
		return "redirect:joinFinish"; // joinFinish으로 쫓아내는 코드(상대경로)
	}
	
	// 완료 안내(기업회원)
	@RequestMapping("/company/joinFinish") // join-finish도 가능. 다만 주소에는 대문자를 쓸수 있는곳이 있고 안되는 곳이 있음. http://localhost:8080
	// 여기에는 대소문자 구분이 안됨을 알아야함!
	public String joinCompanyMemberFinish() {
		return "/WEB-INF/views/company/joinFinish.jsp";
	}

}
