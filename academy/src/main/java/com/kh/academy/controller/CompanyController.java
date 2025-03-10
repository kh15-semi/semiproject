package com.kh.academy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.academy.dao.MemberDao;
import com.kh.academy.dto.MemberDto;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/company")
public class CompanyController {

	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping("/company/detail")
	public String CompanyMypage(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("userId"); // 내 아이디 추출
        MemberDto memberDto = memberDao.selectOne(userId); // 내 정보 획득
        
        // 기업명 추가
        String companyName = memberDao.getCompanyNameByCrNumber(memberDto.getMemberCrNumber());
        //memberDto.setCompanyName(companyName);

        model.addAttribute("memberDto", memberDto);

        return "/WEB-INF/views/company/member/mypage.jsp";
	}
}
