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

import com.kh.academy.dao.MemberDao;
import com.kh.academy.dao.ReviewDao;
import com.kh.academy.dto.MemberDto;
import com.kh.academy.dto.ReviewDto;
import com.kh.academy.error.TargetNotFoundException;
import com.kh.academy.service.AttachmentService;

import jakarta.servlet.http.HttpSession;

@Controller("/review")
public class ReviewController {

	@Autowired
	private ReviewDao reviewDao;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private AttachmentService attachmentService;
	
	
	//리뷰 목록 매핑
	@RequestMapping("/list")
	public String list(Model model) {
		List<ReviewDto> reviewList = reviewDao.selectList();
		model.addAttribute("reviewList", reviewList);
		return "/WEB-INF/views/review/list.jsp";
	}
	//리뷰 상세 매핑
	@RequestMapping("/detail")
	public String detail(@RequestParam int reviewNo, Model model) {
		ReviewDto reviewDto = reviewDao.selectOne(reviewNo);
		
		if(reviewDto.getReviewWriter() != null) {
			MemberDto memberDto = memberDao.selectOne(reviewDto.getReviewWriter());
			model.addAttribute("memberDto", memberDto);
		}
		return "/WEB-INF/views/review/detail.jsp";
	}
	//리뷰 작성 매핑
	@GetMapping("/write")
	public String write() {
		return "/WEB-INF/views/review/write.jsp";
	}
	@PostMapping("/write")
	public String write(@ModelAttribute ReviewDto reviewDto,
								HttpSession session) {
		MemberDto memberDto = (MemberDto) session.getAttribute("userId");
		if(memberDto != null) {
			reviewDto.setReviewWriter(memberDto.getMemberId());			
		}
		//리뷰 DB 저장
		reviewDto.setReviewNo(reviewDao.sequence());
		reviewDao.insert(reviewDto);	
		return "redirect:list";
	}
	//리뷰 수정 매핑
	@GetMapping("/edit")
	public String edit(@RequestParam int reviewNo, Model model) {
		ReviewDto reviewDto = reviewDao.selectOne(reviewNo);
		model.addAttribute("reviewDto", reviewDto);
		return "/WEB-INF/views/review/edit.jsp";
	}
	@PostMapping("/edit")
	public String edit(@ModelAttribute ReviewDto reviewDto, HttpSession session) {
		MemberDto memberDto = (MemberDto)session.getAttribute("userId");
		if(memberDto == null) {
			return "redirect:login";
		}
		ReviewDto originDto = reviewDao.selectOne(reviewDto.getReviewNo());
		if(originDto == null) {
			throw new TargetNotFoundException("존재하지 않는 리뷰입니다");
		}
		if(!originDto.getReviewWriter().equals(memberDto.getMemberId())) {
			throw new TargetNotFoundException("본인이 작성한 리뷰만 수정가능합니다");
		}
		reviewDao.update(reviewDto);
		return "redirect:detail?reviewNo="+reviewDto.getReviewNo();
	}
	//리뷰 삭제 매핑
	@RequestMapping("/delete")
	public String delete(@RequestParam int reviewNo) {
		ReviewDto reviewDto = reviewDao.selectOne(reviewNo);
		if(reviewDto == null) {
			throw new TargetNotFoundException("리뷰가 존재하지 않습니다");			
		}
		reviewDao.delete(reviewNo);
		return "redirect:list";
	}
	
}












