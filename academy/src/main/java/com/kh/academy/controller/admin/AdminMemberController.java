package com.kh.academy.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.academy.dao.MemberDao;
import com.kh.academy.vo.PageVO;
import com.kh.academy.dto.MemberDto;
import com.kh.academy.error.TargetNotFoundException;

@Controller
@RequestMapping("/admin/member")
public class AdminMemberController {

	@Autowired
	private MemberDao memberDao;
	
	//회원 상세
	@RequestMapping("/detail")
	public String detail(@RequestParam String memberId, Model model) {
		MemberDto memberDto = memberDao.selectOne(memberId);
		if(memberDto == null) {
			throw new TargetNotFoundException("존재하지 않는 회원");
		}
		
		model.addAttribute("memberDto", memberDto);
		return "/WEB-INF/views/admin/member/detail.jsp";
	}
	//회원 삭제
	@RequestMapping("/delete")
	public String delete(@RequestParam String memberId) {
		boolean success = memberDao.delete(memberId);
		if(success == false) {
			throw new TargetNotFoundException("존재하지 않는 회원");
		}
		return "redirect:list";
	}
	
}









