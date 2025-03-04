package com.kh.academy.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.kh.academy.dto.MemberDto;

//이 클래스는 pokemon 테이블을 조회(select)한 결과를 변환하는 클래스
//- 소모품이 아니기 때문에 싱글톤 방식(하나만 만들고 공유하는 방식)을 쓰는 것이 효과적
//- 스프링에게 등록을 요청해서 관리 및 혜택을 받는다
//- @Component 라는 애노테이션으로 등록한다 (단위기능을 수행하는 도구 = 1가지 일만 하는 도구)
@Component
public class MemberMapper implements RowMapper<MemberDto> {
	@Override
	public MemberDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		MemberDto memberDto = new MemberDto();
		//모든 항목을 복사
		memberDto.setMemberId(rs.getString("member_id"));
		memberDto.setMemberPw(rs.getString("member_pw"));
		memberDto.setMemberType(rs.getString("member_type"));
		memberDto.setMemberName(rs.getString("member_name"));
		memberDto.setMemberNickname(rs.getString("member_nickname"));
		memberDto.setMemberBirth(rs.getString("member_birth"));
		memberDto.setMemberContact(rs.getString("member_contact"));
		memberDto.setMemberEmail(rs.getString("member_email"));
		memberDto.setMemberPost(rs.getString("member_post"));
		memberDto.setMemberAddress1(rs.getString("member_address1"));
		memberDto.setMemberAddress2(rs.getString("member_address2"));
		memberDto.setMemberJoin(rs.getTimestamp("member_join"));
		memberDto.setMemberLogin(rs.getTimestamp("member_login"));
		memberDto.setMemberChange(rs.getTimestamp("member_change"));
		memberDto.setMemberIndustry(rs.getString("member_change"));
		memberDto.setMemberJob(rs.getString("member_job"));
		memberDto.setMemberPosition(rs.getString("member_position"));
		memberDto.setMemberCompanyNo(rs.getInt("member_company_no"));
		return memberDto;
	}
}

