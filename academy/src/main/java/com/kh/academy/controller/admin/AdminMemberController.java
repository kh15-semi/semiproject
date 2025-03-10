package com.kh.academy.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.academy.dao.MemberDao;
import com.kh.academy.vo.PageVO;
import com.kh.academy.dto.MemberDto;
import com.kh.academy.error.TargetNotFoundException;

@Controller
@RequestMapping("/admin")
public class AdminMemberController {

	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping("/member/list")
	public String memerList(Model model,
										@ModelAttribute("pageVO") PageVO pageVO) {
		model.addAttribute("list", memberDao.selectList(pageVO));
		int count = memberDao.count(pageVO);
		pageVO.setCount(count);
		return "/WEB-INF/views/admin/member/list.jsp";
	}
	
	//일반회원 상세
	@RequestMapping("/member/detail")
	public String memberDetail(@RequestParam String memberId, Model model) {
		MemberDto memberDto = memberDao.selectOne(memberId);
		if(memberDto == null) {
			throw new TargetNotFoundException("존재하지 않는 회원");
		}
		
		model.addAttribute("memberDto", memberDto);
		return "/WEB-INF/views/admin/member/detail.jsp";
	}
	//일반회원 삭제
	@RequestMapping("/member/delete")
	public String memberDelete(@RequestParam String memberId) {
		boolean success = memberDao.delete(memberId);
		if(success == false) {
			throw new TargetNotFoundException("존재하지 않는 회원");
		}
		return "redirect:list";
	}
	//일반회원 개인정보 변경
	@GetMapping("/member/edit")
	public String edit(@RequestParam String memberId, Model model) {
		MemberDto memberDto = memberDao.selectOne(memberId);
		if(memberDto == null)
			throw new TargetNotFoundException("존재하지 않는 회원");
		model.addAttribute("memberDto", memberDto);
		return "/WEB-INF/views/admin/member/edit.jsp";
	}
	
	@PostMapping("/member/edit")
	public String edit(@ModelAttribute MemberDto memberDto) {
		MemberDto findDto = memberDao.selectOne(memberDto.getMemberId());
		if(findDto == null)
			throw new TargetNotFoundException("존재하지 않는 회원");
		
		memberDto.setMemberPw(findDto.getMemberPw());
		memberDao.update(memberDto);
		return "redirect:detail?memberId="+memberDto.getMemberId();
	}
	
	
}









