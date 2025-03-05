package com.kh.academy.dao;

import java.util.List;

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
				+ " member_post, member_address1, member_address2,"
				+ " member_industry, member_job" // 산업, 직종은 선택
				+ ") "
				+ "values(?, ?, '일반회원', ?, ?, ?, ?, ?, ?, ?, ?)";
		Object[] data = { memberDto.getMemberId(), memberDto.getMemberPw(), memberDto.getMemberName(),
				memberDto.getMemberContact(), memberDto.getMemberEmail(), memberDto.getMemberPost(),
				memberDto.getMemberAddress1(), memberDto.getMemberAddress2(),
				memberDto.getMemberIndustry(), memberDto.getMemberJob()
		};
		jdbcTemplate.update(sql, data);
	}

	// 가입(등록) 메소드(기업회원)
	public void insertCompanyMember(MemberDto memberDto) {
		String sql = "insert into member(member_id, member_pw, member_type, "
				+ "member_name, member_contact, member_email, "
				+ "member_post, member_address1, member_address2, "
				+ "member_industry, member_job, " // 산업, 직종은 필수
				+ "member_position, member_cr_number) "
				+ "values(?, ?, '기업회원', ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		Object[] data = { memberDto.getMemberId(), memberDto.getMemberPw(), memberDto.getMemberName(),
				memberDto.getMemberContact(), memberDto.getMemberEmail(), memberDto.getMemberPost(),
				memberDto.getMemberAddress1(), memberDto.getMemberAddress2(), memberDto.getMemberIndustry(),
				memberDto.getMemberJob(), memberDto.getMemberPosition(), memberDto.getMemberCrNumber() };
		jdbcTemplate.update(sql, data);
	}
	
	public String getCompanyNameByCrNumber(String crNumber) {
        String sql = "SELECT bn_company_name FROM business_number WHERE bn_cr_number = ?";
        return jdbcTemplate.queryForObject(sql, String.class, crNumber);
    }

	// 상세조회 기능
	public MemberDto selectOne(String memberId) {
		String sql = "select * from member where member_id = ?";
		Object[] data = { memberId };
		List<MemberDto> list = jdbcTemplate.query(sql, memberMapper, data);
		return list.isEmpty() ? null : list.get(0);
	}

	// 수정 기능(일반회원)
	public boolean updateMember(MemberDto memberDto) {
		String sql = "update member set " 
				+ "member_pw = ?, member_name = ?, member_contact = ?, "
				+ "member_email = ?, member_post = ?, "
				+ "member_address1 = ?, member_address2 = ?, "
				+ "member_industry = ?, member_job = ? "
				+ "where member_id = ?";
		Object[] data = { memberDto.getMemberPw(), memberDto.getMemberName(), memberDto.getMemberContact(),
				memberDto.getMemberEmail(), memberDto.getMemberPost(), memberDto.getMemberAddress1(),
				memberDto.getMemberAddress2(), memberDto.getMemberIndustry(), memberDto.getMemberJob(),
				memberDto.getMemberId() };
		return jdbcTemplate.update(sql, data) > 0;
	}

	// 수정 기능(기업회원)
	public boolean updateCompanyMember(MemberDto memberDto) {
		String sql = "update member set "
				+ "member_pw = ?, member_name = ?, member_contact = ?, "
				+ "member_email = ?, member_post = ?, "
				+ "member_address1 = ?, member_address2 = ?, "
				+ "member_industry = ?, member_job = ?, "
				+ "member_position = ?, member_cr_number = ?"
				+ "where member_id = ?";
		Object[] data = { memberDto.getMemberPw(), memberDto.getMemberName(), memberDto.getMemberContact(),
				memberDto.getMemberEmail(), memberDto.getMemberPost(), memberDto.getMemberAddress1(),
				memberDto.getMemberAddress2(), memberDto.getMemberIndustry(), memberDto.getMemberJob(),
				memberDto.getMemberPosition(), memberDto.getMemberCrNumber(), memberDto.getMemberId() };
		return jdbcTemplate.update(sql, data) > 0;
	}

	// 회원 삭제 기능(통합)
	public boolean delete(String memberId) {
		String sql = "delete member where member_id = ?";
		Object[] data = { memberId };
		return jdbcTemplate.update(sql, data) > 0;
	}

	// 최종 로그인 시각 갱신 메소드
	public boolean updateMemberLogin(String memberId) {
		String sql = "update member set member_login = systimestamp where member_id = ?";
		Object[] data = { memberId };
		return jdbcTemplate.update(sql, data) > 0;
	}

	// 비밀번호 변경 시 최종 비밀번호 변경일도 같이 변경되게 구현
	public boolean updateMemberPassword(MemberDto memberDto) {
		String sql = "update member set member_pw = ?, member_change = systimestamp where member_id = ?";
		Object[] data = { memberDto.getMemberPw(), memberDto.getMemberId() };
		return jdbcTemplate.update(sql, data) > 0;
	}

}
