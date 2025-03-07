package com.kh.academy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.academy.dao.StatusDao;

@Service
public class StatusService {
	
	@Autowired
	private StatusDao statusDao;
	
}
