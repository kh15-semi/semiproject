package com.kh.academy.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.academy.dto.ReviewDto;
import com.kh.academy.mapper.ReviewMapper;

@Repository
public class ReviewDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private ReviewMapper reviewMapper;
	
	public List<ReviewDto> selectList() {
		String sql = "selcet * from reviews order by review_no desc";
		return jdbcTemplate.query(sql, reviewMapper);		
	}
	
	public void insert(ReviewDto reviewDto) {
		String sql = "insert into review (review_no, review_writer, review_score, review_comment, review_like,"
				+ " review_wtime, review_etime, review_strength, review_weakness, review_salary,"
				+ " review_workandlife, review_promotion, review_culture, review_director,"
				+ " review_ceoevaluation, review_prediction, review_recommend)"
				+ " VALUES (review_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		Object[] data = {
				reviewDto.getReviewWriter(), reviewDto.getReviewScore(), reviewDto.getReviewComment(),
				reviewDto.getReviewLike(), reviewDto.getReviewWtime(), reviewDto.getReviewEtime(), reviewDto.getReviewStrength(),
				reviewDto.getReviewWeakness(), reviewDto.getReviewSalary(), reviewDto.getReviewWorkAndLife(),
				reviewDto.getReviewPromotion(), reviewDto.getReviewCulture(), reviewDto.getReviewDirector(),
				reviewDto.getReviewCeoEvalulation(), reviewDto.getReviewPrediction(), reviewDto.getReviewRecommend()
		};
		jdbcTemplate.update(sql, data);
	}
	
	public ReviewDto selectOne(int reviewNo) {
		String sql = "select * from reviews where review_no = ?";
		Object[] data = {reviewNo};
		List<ReviewDto> list = jdbcTemplate.query(sql,  reviewMapper, data);
		return list.isEmpty() ? null : list.get(0);
	}
}
