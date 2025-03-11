package com.kh.academy.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.academy.mapper.StatusMapper;
import com.kh.academy.vo.StatusVO;

@Repository
public class StatusDao {
	@Autowired
	private StatusMapper statusMapper;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	// 회원 현황
	// : 일반 회원 / 기업 회원으로 분류
	public List<StatusVO> member() {
		String sql = "select member_type key, count(*) value "
				+ "from member "
				+ "group by member_type "
				+ "order by value desc, key asc";
		return jdbcTemplate.query(sql, statusMapper);
	}
	// : 기간 별 가입 회원 수 현황
	public List<StatusVO> memberJoin() {
		String sql = "select to_char(member_join, 'YYYY-MM') key, count(*) value "
				+ "from member "
				+ "group by to_char(member_join, 'YYYY-MM') "
				+ "order by key desc";
		return jdbcTemplate.query(sql, statusMapper);
	}
	
	// 기업 현황
	// : industry로 구분하여 해당하는 기업의 수 추출
	public List<StatusVO> company() {
		String sql = "select company_industry key, count(*) value "
				+ "from company "
				+ "group by company_industry "
				+ "order by value desc, key asc";
		return jdbcTemplate.query(sql, statusMapper);
	}
	
	// 리뷰 현황 (/admin/review 미구현 / review 구현 후 기준 작성)
	public List<StatusVO> reviewWrite() {
		String sql = "select '리뷰 수' key, count(*) value from review";
		return jdbcTemplate.query(sql, statusMapper);
	}
	
	
}
