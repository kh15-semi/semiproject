package com.kh.academy.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.academy.dao.StatusDao;
import com.kh.academy.vo.StatusVO;

@CrossOrigin
@RestController
@RequestMapping("/rest/status")
public class StatusRestController {
	
	@Autowired
	private StatusDao statusDao;
	
	@RequestMapping("/member")
	public List<StatusVO> member() {
		return statusDao.member();
	}
	
	@RequestMapping("/member-join")
	public List<StatusVO> memberJoin() {
		return statusDao.memberJoin();
	}
	
	@RequestMapping("/company")
	public List<StatusVO> company() {
		return statusDao.company();
	}
	
	@RequestMapping("/review-write")
	public List<StatusVO> reviewWrite() {
		return statusDao.reviewWrite();
	}
	
}
