package com.kh.academy.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.academy.dao.CompanyDao;
import com.kh.academy.dto.CompanyDto;
import com.kh.academy.error.TargetNotFoundException;
import com.kh.academy.service.CompanyService;

@RestController("/company")
public class CompanyController {

	@Autowired
	private CompanyDao companyDao;
	
	@GetMapping
	public String list(Model model) {
		List<CompanyDto> companyList = companyDao.selectAll();
		model.addAttribute("companyList", companyList);
		return "/WEB-INF/views/company/list.jsp";
	}
	//기업 등록
	@GetMapping("/mypage/insert")
	public String insert() {
		return "/WEB-INF/views/company/insert.jsp";
	}
	@PostMapping("/mypage/insert")
	public String insert(@ModelAttribute CompanyDto companyDto) {
		companyDao.insert(companyDto);
		return "Redirect:companymypage";
	}
	//기업 상세 페이지
	//데이터조회를 위해 GET요청
	@GetMapping("/mypage/detail")
	public String detail(@RequestParam int companyNo, Model model) {
		CompanyDto companyDto = companyDao.selectOne(companyNo);
		if(companyDto == null) {
			throw new TargetNotFoundException("존재하지 않는 기업입니다");
		}
		model.addAttribute("companyDto", companyDto);
		return "/WEB-INF/views/company/detail.jsp";
	}

}











