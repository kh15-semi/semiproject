package com.kh.academy.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.kh.academy.dto.ReviewDto;

@Component
public class ReviewMapper implements RowMapper<ReviewDto>{

	@Override
	public ReviewDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		return ReviewDto.builder()
				.reviewNo(rs.getInt("review_no"))
                .reviewWriter(rs.getString("review_writer"))
                .reviewCompanyNo(rs.getInt("review_company_no"))
                .reviewScore(rs.getInt("review_score"))
                .reviewComment(rs.getString("review_comment"))
                .reviewLike(rs.getInt("review_like"))
                .reviewWtime(rs.getTimestamp("review_wtime"))
                .reviewEtime(rs.getTimestamp("review_etime"))
                .reviewStrength(rs.getString("review_strength"))
                .reviewWeakness(rs.getString("review_weakness"))
                .reviewSalary(rs.getInt("review_salary"))
                .reviewWorkAndLife(rs.getInt("review_work_and_life"))
                .reviewPromotion(rs.getInt("review_promotion")) 
                .reviewCulture(rs.getInt("review_culture"))
                .reviewDirector(rs.getInt("review_director"))
            .build();
	}
	
}
