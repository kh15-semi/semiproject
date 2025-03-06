package com.kh.academy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.academy.dao.CompanyDao;
import com.kh.academy.dao.MemberDao;
import com.kh.academy.dto.CompanyDto;
import com.kh.academy.error.TargetNotFoundException;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/company/mypage")
public class CompanyMypageController {
	
	@Autowired
	private CompanyDao companyDao;
	@Autowired
	private MemberDao memberDao;
	
	
//    // 기업 등록 페이지
//    @GetMapping("/insert")
//    public String insert() {
//        return "/WEB-INF/views/company/mypage/insert.jsp";
//    }
//
//    @PostMapping("/insert")
//    public String insert(@ModelAttribute CompanyDto companyDto) {
//        companyDao.insert(companyDto);
//        return "redirect:/company/mypage";
//    }
	
    // 기업 상세 페이지
    @GetMapping("/detail")
    public String detail(@RequestParam int companyNo, Model model) {
        CompanyDto companyDto = companyDao.selectOne(companyNo);
        if (companyDto == null) {
            throw new TargetNotFoundException("존재하지 않는 기업입니다.");
        }
        model.addAttribute("companyDto", companyDto);
        return "/WEB-INF/views/company/mypage/detail.jsp";
    }
    
 // 기업 정보 수정 페이지
    @GetMapping("/edit")
    public String edit(@RequestParam int companyNo, Model model) {
        CompanyDto companyDto = companyDao.selectOne(companyNo);
        if (companyDto == null) {
            throw new TargetNotFoundException("존재하지 않는 기업입니다.");
        }
        model.addAttribute("companyDto", companyDto);
        return "/WEB-INF/views/company/mypage/edit.jsp";
    }

    @PostMapping("/edit")
    public String edit(@ModelAttribute CompanyDto companyDto) {
        boolean updated = companyDao.update(companyDto);
        if (!updated) {
            throw new TargetNotFoundException("기업 정보 수정에 실패했습니다.");
        }
        return "redirect:detail?companyNo=" + companyDto.getCompanyNo();
    }
    //기업 회원 탈퇴
	@GetMapping("/delete")
	public String delete(@RequestParam int companyNo, HttpSession session) {
		session.invalidate(); //세션 삭제(로그아웃처리)
		return "redirect:/";
	}
	@GetMapping("/mypage/delete")
	public String delete() {
	    return "/WEB-INF/views/company/mypage/delete.jsp";
	}

	// 2. 회원 탈퇴 처리 -> 메인 페이지로 이동
	@PostMapping("/delete")
	public String deleteCompany(@RequestParam int companyNo, HttpSession session) {

	    // 세션 무효화 (로그아웃 처리)
	    session.invalidate();

	    return "redirect:/"; // 메인 홈페이지로 이동
	}
	
	
}




















