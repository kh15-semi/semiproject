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
import com.kh.academy.dao.ReviewDao;
import com.kh.academy.dao.ReviewListViewDao;
import com.kh.academy.dto.CompanyDto;
import com.kh.academy.dto.MemberDto;
import com.kh.academy.dto.ReviewDto;
import com.kh.academy.error.TargetNotFoundException;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/company/review")
public class ReviewController {

	@Autowired
	private ReviewDao reviewDao;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private ReviewListViewDao reviewListViewDao;
	@Autowired
	private CompanyDao companyDao;

	// 리뷰 목록 매핑
//	@GetMapping("/list")
//	public String list(Model model) {
//		List<ReviewDto> reviewList = reviewDao.selectList();
//		model.addAttribute("reviewList", reviewList);
//		return "/WEB-INF/views/company/review/list.jsp";
//	}

	// 리뷰 상세 매핑
	@RequestMapping("/detail")
	public String detail(@RequestParam int reviewNo, Model model, HttpSession session) {
		
		ReviewDto reviewDto = reviewDao.selectOne(reviewNo);
		CompanyDto companyDto = companyDao.selectOne(reviewDto.getReviewCompanyNo());
		MemberDto memberDto = memberDao.selectOne(reviewDto.getReviewWriter());
		
		model.addAttribute("reviewDto", reviewDto);
	    model.addAttribute("companyDto", companyDto);
		model.addAttribute("memberDto", memberDto);
		
		return "/WEB-INF/views/company/review/detail.jsp";
	}

	// 리뷰 작성 매핑
	@GetMapping("/write")
	public String write(@RequestParam int companyNo, Model model) {
		model.addAttribute("companyNo", companyNo); // 폼 객체 전달
		model.addAttribute("reviewDto", new ReviewDto()); // 폼 객체 전달
		return "/WEB-INF/views/company/review/write.jsp";
	}

	@PostMapping("/write")
	public String write(@ModelAttribute ReviewDto reviewDto, @RequestParam int companyNo, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		String userType = (String) session.getAttribute("userType");
		MemberDto memberDto = memberDao.selectOne(userId);
		reviewDto.setReviewWriter(userId);

		if (userId == null || memberDto.getMemberCompanyNo() != companyNo || userType.equals("기업회원")) {
			return "redirect:/company/review/write?error";
		}
		
		// 리뷰 DB 저장
		int reviewNo = reviewDao.sequence();
		reviewDto.setReviewNo(reviewNo);
		reviewDao.insert(reviewDto, companyNo);
		
		return "redirect:detail?reviewNo=" + reviewNo; // reviewNo 파라미터 전달
	}
	
	@GetMapping("/checkReview")
	@ResponseBody
	public Map<String, Boolean> checkReview(@RequestParam String userId, @RequestParam int companyNo) {
	    int reviewCount = reviewDao.countReviewByUserIdAndCompanyNo(userId, companyNo);
	    boolean hasReview = reviewCount > 0;

	    Map<String, Boolean> response = new HashMap<>();
	    response.put("hasReview", hasReview);
	    
	    System.out.println("userId: " + userId + ", companyNo: " + companyNo + ", hasReview: " + hasReview); // 로그 추가
	    
	    return response;
	}

	// 리뷰 수정 매핑
	@GetMapping("/edit")
	public String edit(@RequestParam int reviewNo, Model model) {
		ReviewDto reviewDto = reviewDao.selectOne(reviewNo);
		model.addAttribute("reviewDto", reviewDto);
		return "/WEB-INF/views/company/review/edit.jsp";
	}

	@PostMapping("/edit")
	public String edit(@ModelAttribute ReviewDto reviewDto, HttpSession session) {
		MemberDto memberDto = (MemberDto) session.getAttribute("userId");
		if (memberDto == null) {
			return "redirect:login";
		}
		ReviewDto originDto = reviewDao.selectOne(reviewDto.getReviewNo());
		if (originDto == null) {
			throw new TargetNotFoundException("존재하지 않는 리뷰입니다");
		}
		if (!originDto.getReviewWriter().equals(memberDto.getMemberId())) {
			throw new TargetNotFoundException("본인이 작성한 리뷰만 수정가능합니다");
		}
		reviewDao.update(reviewDto);
		return "redirect:detail?reviewNo=" + reviewDto.getReviewNo();

	}
	
	//리뷰 삭제 매핑
	@RequestMapping("/delete")
	public String delete(@RequestParam int reviewNo) {
		ReviewDto reviewDto = reviewDao.selectOne(reviewNo);
		int companyNo = reviewDto.getReviewCompanyNo();
		reviewDao.delete(reviewNo);
		return "redirect:/company/detail?companyNo=" + companyNo;
	}
	
	
	
	
	
	
	
}
