package com.kh.academy.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.academy.dto.MemberDto;
import com.kh.academy.mapper.MemberMapper;

@Repository
public class MemberDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Autowired
	private MemberMapper memberMapper;

	// 가입(등록) 메소드(일반회원)
	public void insertMember(MemberDto memberDto) {
		String sql = "insert into member(member_id, member_pw, member_type,"
				+ " member_name, member_contact, member_email,"
				+ " member_post, member_address1, member_address2) "
				+ "values(?, ?, '일반회원', ?, ?, ?, ?, ?, ?)";
		Object[] data = { memberDto.getMemberId(), memberDto.getMemberPw(), 
				memberDto.getMemberName(), memberDto.getMemberContact(), memberDto.getMemberEmail(),
				memberDto.getMemberPost(), memberDto.getMemberAddress1(), memberDto.getMemberAddress2() 
		};
		jdbcTemplate.update(sql, data);
	}
	
	// 가입(등록) 메소드(기업회원)
	public void insertCompanyMember(MemberDto memberDto) {
		String sql = "insert into member(member_id, member_pw, member_type, "
				+ "member_name, member_contact, member_email, "
				+ "member_post, member_address1, member_address2, "
				+ "member_industry, member_job, "
				+ "member_position, member_cr_number) "
				+ "values(?, ?, '기업회원', ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
				
		Object[] data = { memberDto.getMemberId(), memberDto.getMemberPw(), 
				memberDto.getMemberName(), memberDto.getMemberContact(), memberDto.getMemberEmail(),
				memberDto.getMemberPost(), memberDto.getMemberAddress1(), memberDto.getMemberAddress2(),
				memberDto.getMemberIndustry(), memberDto.getMemberJob(),
				memberDto.getMemberPosition(), memberDto.getMemberCrNumber()
		};
		jdbcTemplate.update(sql, data);
	}
	
	

}
