
package com.kh.academy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.academy.dto.MemberDto;
import com.kh.academy.dao.MemberDao;

import jakarta.servlet.http.HttpSession;

//메인페이지 및 공용페이지 작성을 위한 컨트롤러(공용주소를 부여하지 않음)
@Controller
public class HomeController {

	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping("/")
	public String home() {
		return "/WEB-INF/views/home.jsp";
	}
	
}
