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
import com.kh.academy.dto.MemberDto;
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
	
//    // 기업 상세 페이지
//    @GetMapping("/detail")
//    public String detail(@RequestParam int companyNo, Model model) {
//        CompanyDto companyDto = companyDao.selectOne(companyNo);
//        if (companyDto == null) {
//            throw new TargetNotFoundException("존재하지 않는 기업입니다.");
//        }
//        model.addAttribute("companyDto", companyDto);
//        return "/WEB-INF/views/company/mypage/detail.jsp";
//    }
    
 // 기업 정보 수정 페이지
    @GetMapping("/edit")
    public String edit(@RequestParam int companyNo, Model model) {
        CompanyDto companyDto = companyDao.selectOne(companyNo);
        if (companyDto == null) {
            throw new TargetNotFoundException("존재하지 않는 기업입니다.");
        }
        model.addAttribute("companyDto", companyDto);
    	
//    	MemberDto memberDto = memberDao.selectOne(null)
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
    
    // 기업 회원 탈퇴 페이지
    @GetMapping("/share/exit")
    public String exit() {
        return "/WEB-INF/views/share/exit.jsp";
    }

    // 기업 회원 탈퇴 처리
    @PostMapping("/share/exit")
    public String exit(@RequestParam String memberPw, HttpSession session) {
        String userId = (String) session.getAttribute("userId");
        MemberDto memberDto = memberDao.selectOne(userId);

        if (memberDto == null || !memberPw.equals(memberDto.getMemberPw())) {
            return "redirect:exit?error";
        }
        // 회원 삭제
        memberDao.delete(userId);
        // 로그아웃 처리
        session.invalidate();
        return "redirect:exitFinish";
    }
    
    // 회원 탈퇴 완료 페이지
    @RequestMapping("/share/exitFinish")
    public String exitFinish() {
        return "/WEB-INF/views/share/exitFinish.jsp";
    }
    
    // 기업 회원 비밀번호 변경 페이지
    @GetMapping("/password")
    public String password() {
        return "/WEB-INF/views/company/mypage/password.jsp";
    }

    @PostMapping("/password")
    public String password(@RequestParam String currentPw,
                            @RequestParam String newPw, 
                            HttpSession session) {
        String userId = (String) session.getAttribute("userId");
        MemberDto memberDto = memberDao.selectOne(userId);

        if (memberDto == null || !currentPw.equals(memberDto.getMemberPw())) {
            return "redirect:password?error=1"; // 현재 비밀번호 불일치
        }

        if (currentPw.equals(newPw)) {
            return "redirect:password?error=2"; // 새 비밀번호가 기존과 동일함
        }

        memberDto.setMemberPw(newPw);
        memberDao.updateMemberPassword(memberDto);
        
        return "redirect:mypage"; // 비밀번호 변경 후 마이페이지로 이동
    }
	
}




















