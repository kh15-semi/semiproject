package com.kh.academy.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.kh.academy.dto.ReviewListViewDto;

@Component
public class ReviewListViewMapper implements RowMapper<ReviewListViewDto> {

	@Override
	public ReviewListViewDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		ReviewListViewDto reviewListViewDto = new ReviewListViewDto();
		
		//review 테이블 부분
		reviewListViewDto.setReviewNo(rs.getInt("review_no"));
		reviewListViewDto.setReviewWriter(rs.getString("review_writer"));
		reviewListViewDto.setReviewCompanyNo(rs.getInt("review_company_no"));
		reviewListViewDto.setReviewScore(rs.getInt("review_score"));
		reviewListViewDto.setReviewComment(rs.getString("review_comment"));
		reviewListViewDto.setReviewLike(rs.getInt("review_like"));
		reviewListViewDto.setReviewWtime(rs.getTimestamp("review_wtime"));
		reviewListViewDto.setReviewEtime(rs.getTimestamp("review_etime"));
		
		//member 부분
		reviewListViewDto.setMemberId(rs.getString("member_id"));
		reviewListViewDto.setMemberPw(rs.getString("member_pw"));
		reviewListViewDto.setMemberType(rs.getString("member_type"));
		reviewListViewDto.setMemberName(rs.getString("member_name"));
		reviewListViewDto.setMemberIdCardNum(rs.getString("member_id_card_num"));
		reviewListViewDto.setMemberContact(rs.getString("member_contact"));
		reviewListViewDto.setMemberEmail(rs.getString("member_email"));
		reviewListViewDto.setMemberPost(rs.getString("member_post"));
		reviewListViewDto.setMemberAddress1(rs.getString("member_address1"));
		reviewListViewDto.setMemberAddress2(rs.getString("member_address2"));
		reviewListViewDto.setMemberJoin(rs.getTimestamp("member_join"));
		reviewListViewDto.setMemberLogin(rs.getTimestamp("member_login"));
		reviewListViewDto.setMemberChange(rs.getTimestamp("member_change"));
		reviewListViewDto.setMemberIndustry(rs.getString("member_industry"));
		reviewListViewDto.setMemberJob(rs.getString("member_job"));
		reviewListViewDto.setMemberPosition(rs.getString("member_position"));
		reviewListViewDto.setMemberCrNumber(rs.getString("member_cr_number"));
		reviewListViewDto.setMemberCompanyNo(rs.getInt("member_company_no"));
		
		return reviewListViewDto;
	}

	
	
}
