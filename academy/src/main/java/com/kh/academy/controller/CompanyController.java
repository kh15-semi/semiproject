package com.kh.academy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	//모든 회사 목록 불러오기
	@RequestMapping("/")
	public String home(Model model) {
		List<CompanyDto> companyList = companyDao.selectList();
		model.addAttribute("companyList", companyList);
		return "/home";
	}
	@RequestMapping("/detail")
	public String companyDetail(@RequestParam  int companyNo, Model model) {
		CompanyDto companyDto = companyDao.selectOne(companyNo);
		model.addAttribute("companyDto", companyDto);
		return "/WEB-INF/views/company/detail.jsp";
		}

}
