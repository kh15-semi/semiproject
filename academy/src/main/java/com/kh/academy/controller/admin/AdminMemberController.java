package com.kh.academy.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.academy.dao.MemberDao;
import com.kh.academy.vo.PageVO;

@Controller
@RequestMapping("/admin/member")
public class AdminMemberController {

	@Autowired
	private MemberDao memberDao;
	
//	@RequestMapping("/list")
//	public String list(Model model, @ModelAttribute("pageVO") PageVO pageVO) {
//		model.addAttribute("list", memberDao.selectList(pageVO));
//	}
	
}









