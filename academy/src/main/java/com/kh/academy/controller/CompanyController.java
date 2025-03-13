package com.kh.academy.controller;

import java.util.List;

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
import com.kh.academy.dao.ReviewDao;
import com.kh.academy.dao.ReviewListViewDao;
import com.kh.academy.dto.CompanyDto;
import com.kh.academy.dto.MemberDto;
import com.kh.academy.dto.ReviewDto;
import com.kh.academy.dto.ReviewListViewDto;
import com.kh.academy.vo.PageVO;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/company")
public class CompanyController {

	@Autowired
	private CompanyDao companyDao;
	@Autowired
	private ReviewListViewDao reviewListViewDao;
	@Autowired
	private ReviewDao reviewDao;
	@Autowired
	private MemberDao memberDao;
	
	@GetMapping("/list")
	public String companyList( @RequestParam(required = false) String keyword, Model model) {
		boolean search = keyword != null && !keyword.trim().isEmpty();
		List<CompanyDto> list;
		if (search) {
	        list = companyDao.selectList("company_name", keyword); // 기본적으로 회사명을 검색
	    } else {
	        list = companyDao.selectList();
	    }

	    model.addAttribute("search", search);
	    model.addAttribute("keyword", keyword);
	    model.addAttribute("list", list);

	    return "/WEB-INF/views/company/list.jsp";
		
	}
	
	@GetMapping("/detail")
	public String companyDetail(@RequestParam("companyNo") int companyNo, Model model, @ModelAttribute("pageVO") PageVO pageVO) {
		CompanyDto companyDto = companyDao.selectOne(companyNo);

		if (companyDto == null) {
			return "redirect:/company/list";
		}
		model.addAttribute("companyDto", companyDto);

		// 특정 회사의 리뷰 목록 조회
		List<ReviewListViewDto> list = reviewListViewDao.selectListByCompanyNo(pageVO, companyNo);
		model.addAttribute("list", list);

		int count = reviewDao.count(companyNo);
		pageVO.setCount(count);

		return "/WEB-INF/views/company/detail.jsp";
	}

	@GetMapping("/edit")
    public String companyEdit(@RequestParam int companyNo, HttpSession session, Model model) {
        String userId = (String) session.getAttribute("userId");
        MemberDto memberDto = memberDao.selectOne(userId);  // 세션에서 사용자 정보 가져오기

        // 세션에 memberDto가 없으면 DB에서 조회 후 세션에 저장
//        if (memberDto == null) {
//            memberDto = memberDao.selectOne(userId);
//            session.setAttribute("memberDto", memberDto);
//        }

        // 세션에서 memberDto를 통해 companyDto 가져오기
        CompanyDto companyDto = companyDao.selectOne(companyNo);  // memberCompanyNo로 회사 정보 조회

        // 회사 정보가 없거나 일치하지 않으면 오류 페이지로 리다이렉트
        if (companyDto == null || companyDto.getCompanyNo() != memberDto.getMemberCompanyNo()) {
            return "redirect:/company/mycompany";  // 권한 오류 시 마이페이지로 리다이렉트
        }

        model.addAttribute("companyDto", companyDto);
        
        return "/WEB-INF/views/company/edit.jsp";  // 기업 정보 수정 페이지
    }

    // POST 요청: 수정된 기업 정보 처리 후 리다이렉트
    @PostMapping("/edit")
    public String companyEdit( @RequestParam int companyNo, @ModelAttribute CompanyDto companyDto, HttpSession session) {
        String userId = (String) session.getAttribute("userId");
        //MemberDto memberDto = (MemberDto) session.getAttribute("memberDto");
        MemberDto memberDto = memberDao.selectOne(userId);
        CompanyDto findDto = companyDao.selectOne(memberDto.getMemberCompanyNo());
        
//        findDto.setCompanyContact(companyDto.getCompanyContact());
//        findDto.setCompanyUrl(companyDto.getCompanyUrl());
//        findDto.setCompanyIndustry(companyDto.getCompanyIndustry());
//        findDto.setCompanyPost(companyDto.getCompanyPost());
//        findDto.setCompanyAddress1(companyDto.getCompanyAddress1());
//        findDto.setCompanyAddress2(companyDto.getCompanyAddress2());
//        findDto.setCompanyNo(companyNo);

        // 회원이 속한 기업 정보와 일치하는지 확인
        if (memberDto.getMemberCompanyNo() != companyDto.getCompanyNo()) {
        	return "redirect:/company/mycompany";
        }

        // 기업 정보 업데이트
        companyDao.update(companyDto);

        // 수정 후 기업 마이페이지로 리다이렉트
        return "redirect:/company/mycompany";
    }
	@RequestMapping("/mycompany")
	public String mycompany(HttpSession session, Model model) {
		 String userId = (String) session.getAttribute("userId");
		    MemberDto memberDto = (MemberDto) session.getAttribute("memberDto");
		if(memberDto == null) {
			memberDto = memberDao.selectOne(userId);
			session.setAttribute("memberDto", memberDto); // 세션에 정보 저장
		}
		CompanyDto companyDto = companyDao.selectOne(memberDto.getMemberCompanyNo());

	    model.addAttribute("memberDto", memberDto);
	    model.addAttribute("companyDto", companyDto);
	    return "/WEB-INF/views/company/mycompany.jsp";
	}
	
	
	
}








