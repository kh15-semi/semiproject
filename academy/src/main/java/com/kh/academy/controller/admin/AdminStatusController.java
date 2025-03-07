package com.kh.academy.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.academy.dao.StatusDao;

@Controller
@RequestMapping("/admin/status")
public class AdminStatusController {
	
	@Autowired
	private StatusDao statusDao;
	
	@RequestMapping("/member")
	public String member(Model model) {
		model.addAttribute("list", statusDao.member());
		return "/WEB-INF/views/admin/status/member.jsp";
	}
	
	@RequestMapping("/member-join")
	public String memberJoin(Model model) {
		model.addAttribute("list", statusDao.memberJoin());
		return "/WEB-INF/views/admin/status/member-join.jsp";
	}
	
	@RequestMapping("/company")
	public String company(Model model) {
		model.addAttribute("list", statusDao.company());
		return "/WEB-INF/views/admin/status/company.jsp";
	}
	
	@RequestMapping("/review-write")
	public String reviewWrite(Model model) {
		model.addAttribute("list", statusDao.reviewWrite());
		return "/WEB-INF/views/admin/status/review-write.jsp";
	}
	
}
