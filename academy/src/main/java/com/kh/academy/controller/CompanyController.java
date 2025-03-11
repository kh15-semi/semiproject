package com.kh.academy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.academy.dao.CompanyDao;
import com.kh.academy.dao.ReviewDao;
import com.kh.academy.dao.ReviewListViewDao;
import com.kh.academy.dto.CompanyDto;
import com.kh.academy.vo.PageVO;

@Controller
@RequestMapping("/company")
public class CompanyController {

	@Autowired
	private CompanyDao companyDao;
	@Autowired
	private ReviewListViewDao reviewListViewDao;
	@Autowired
	private ReviewDao reviewDao;
	

	//기업목록을 가져와 home.jsp에 전달
	@RequestMapping("/list")
	public String list(Model model) {
		List<CompanyDto> companyList = companyDao.selectList();
		model.addAttribute("companyList", companyList);
		return "/home";
	}
	@GetMapping("/detail")
	public String companyDetail(@RequestParam("companyNo") int companyNo, Model model, @ModelAttribute("pageVO") PageVO pageVO) {
		CompanyDto companyDto = companyDao.selectOne(companyNo);
		if(companyDto == null) {
			return "redirect:/company/list";
		}
		//리뷰 목록 가져오기(reviewListDao필요)
		 
		model.addAttribute("companyDto", companyDto);
		model.addAttribute("list", reviewListViewDao.selectList(pageVO));
		//게시글 수
		int count = reviewDao.count(pageVO);
		pageVO.setCount(count);
		return "/WEB-INF/views/company/detail.jsp";
	}
	
	
}