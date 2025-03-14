package com.kh.academy.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.academy.dao.ReviewDao;
import com.kh.academy.dto.ReviewDto;

import jakarta.servlet.http.HttpSession;


@RestController
@RequestMapping("/rest/review")
public class ReviewRestController {
	
	@Autowired
	private ReviewDao reviewDao;
	
	@PostMapping("/submit")
	public void submit(@ModelAttribute ReviewDto reviewDto) {
		reviewDao.update(reviewDto);
	}
	
}
