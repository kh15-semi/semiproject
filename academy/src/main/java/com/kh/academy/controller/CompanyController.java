package com.kh.academy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.academy.dao.CompanyDao;
import com.kh.academy.service.CompanyService;

@RestController("/company")
public class CompanyController {

	@Autowired
	private CompanyDao companyDao;
	

}
