package com.kh.academy.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewListDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
}
