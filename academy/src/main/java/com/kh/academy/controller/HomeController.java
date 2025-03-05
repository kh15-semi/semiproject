
package com.kh.academy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//메인페이지 및 공용페이지 작성을 위한 컨트롤러(공용주소를 부여하지 않음)
@Controller
public class HomeController {

	@RequestMapping("/")
	public String home() {
		return "/WEB-INF/views/home.jsp";
	}
	
}
