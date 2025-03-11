package com.kh.academy.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.academy.dto.ReviewListViewDto;
import com.kh.academy.mapper.ReviewListViewMapper;
import com.kh.academy.vo.PageVO;

@Repository
public class ReviewListViewDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private ReviewListViewMapper reviewListViewMapper;

	public List<ReviewListViewDto> selectList(PageVO pageVO){
		if(pageVO.isList()) {
			String sql = "select * from ("
							+ "select rownum rn, TMP.* from ("
								+ "select * from board_list_view "
								+ "order by review_no desc"
							+ ") TMP"
						+ ") where rn between ? and ?";
			Object[] data = {
					pageVO.getStartRownum(), pageVO.getFinishRownum()
			};
			return jdbcTemplate.query(sql, reviewListViewMapper, data);
		}
		else {
			String sql = "select * from ("
					+ "select rownum rn, TMP.* from ("
						+ "select * from review_list_view "
						+ "where instr(#1, ?) > 0 "
						+ "order by review_no desc"
					+ ") TMP"
				+ ") where rn between ? and ?";
			sql = sql.replace("#1", pageVO.getColumn());
			Object[] data = {
					pageVO.getKeyword(),
					pageVO.getStartRownum(), pageVO.getFinishRownum()
			};
			return jdbcTemplate.query(sql, reviewListViewMapper, data);
			
		}
	}
	
}
