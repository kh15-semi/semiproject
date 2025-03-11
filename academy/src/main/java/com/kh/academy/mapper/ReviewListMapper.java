package com.kh.academy.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.kh.academy.dto.ReviewDto;

@Component
public class ReviewListMapper implements RowMapper<ReviewDto> {
	@Override
	public ReviewDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		ReviewDto reviewDto = new ReviewDto();
		reviewDto.setReviewNo(rs.getInt("review_no"));
		reviewDto.setReviewWriter(rs.getString("review_writer"));
		reviewDto.setReviewCompanyNo(rs.getInt("review_company_no"));
		reviewDto.setReviewScore(rs.getInt("review_score"));
		reviewDto.setReviewComment(rs.getString("review_comment"));
		reviewDto.setReviewLike(rs.getInt("review_like"));
		reviewDto.setReviewWtime(rs.getTimestamp("review_wtime"));
		reviewDto.setReviewEtime(rs.getTimestamp("review_etime"));
		//reviewDto.setReviewStrength(rs.getString("review_strength"));
		//reviewDto.setReviewWeakness(rs.getString("review_weakness"));
		//reviewDto.setReviewSalary(rs.getInt("review_salary"));
		//reviewDto.setReviewWorkAndLife(rs.getInt("review_work_and_life"));
		//reviewDto.setReviewPromotion(rs.getInt("review_promotion"));
		//reviewDto.setReviewCulture(rs.getInt("review_culture"));
		//reviewDto.setReviewDirector(rs.getInt("review_director"));
		
		return reviewDto;
	}
}