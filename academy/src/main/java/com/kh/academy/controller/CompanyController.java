package com.kh.academy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.academy.dao.CompanyDao;
import com.kh.academy.dao.MemberDao;
import com.kh.academy.dto.CompanyDto;
import com.kh.academy.dto.MemberDto;
import com.kh.academy.error.TargetNotFoundException;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/company")
public class CompanyController {

	@Autowired
	private CompanyDao companyDao;
	

	//기업목록을 가져와 home.jsp에 전달
	@RequestMapping("/list")
	public String list(Model model) {
		List<CompanyDto> companyList = companyDao.selectList();
		model.addAttribute("companyList", companyList);
		return "/home";
	}
	@GetMapping("/detail")
	public String companyDetail(@RequestParam("companyNo") int companyNo, Model model) {
		CompanyDto companyDto = companyDao.selectOne(companyNo);
		if(companyDto == null) {
			return "redirect:/company/list";
		}
		//사업자번호 뒤 5자리 *로 변경
		 String crNumber = companyDto.getCompanyCrNumber();
		 if (crNumber != null && crNumber.length() > 5) {
		     crNumber = crNumber.substring(0, crNumber.length() - 5) + "*****";
		}
		 //리뷰 목록 가져오기(reviewListDao필요)
		 
		 
		 
		model.addAttribute("companyDto", companyDto);
		model.addAttribute("maskedCrNumber", crNumber);
		return "/WEB-INF/views/company/detail.jsp";
	}
}
