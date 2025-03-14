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

	public List<ReviewListViewDto> selectListByCompanyNo(PageVO pageVO, int companyNo) {
		if(pageVO.isList()) {
			String sql = "select * from ("
							+ "select rownum rn, TMP.* from ("
								+ "select * from review_list_view "
								+ "WHERE review_company_no = ? " // companyNo 조건 추가
								+ "order by review_no desc"
							+ ") TMP"
						+ ") where rn between ? and ?";
			Object[] data = {
					companyNo, pageVO.getStartRownum(), pageVO.getFinishRownum()
			};
			return jdbcTemplate.query(sql, reviewListViewMapper, data);
		}
		else {
			// PageVO.getColumn() 값이 유효한 컬럼 이름인지 확인
            String column = pageVO.getColumn();
            if (!isValidColumnName(column)) {
                throw new IllegalArgumentException("유효하지 않은 컬럼 이름입니다: " + column);
            }
			
            String sql = "SELECT * FROM ("
                    + "SELECT ROWNUM RN, TMP.* FROM ("
                    + "SELECT * FROM review_list_view "
                    + "WHERE INSTR(?, ?) > 0 "
                    + "ORDER BY review_no DESC"
                    + ") TMP"
                    + ") WHERE RN BETWEEN ? AND ?";
            Object[] data = {
                    column, // PageVO.getColumn()에서 가져온 컬럼 이름
                    pageVO.getKeyword(),
                    pageVO.getStartRownum(),
                    pageVO.getFinishRownum()
            };
			return jdbcTemplate.query(sql, reviewListViewMapper, data);
			
		}
	}
	
	 // 유효한 컬럼 이름인지 확인하는 메서드
    private boolean isValidColumnName(String column) {
        // 허용되는 컬럼 이름 목록
        List<String> validColumns = List.of("review_no", "review_writer", "review_comment", "member_name", "member_industry", "member_job" /* ... 기타 컬럼 ... */);
        return validColumns.contains(column.toLowerCase()); // 대소문자 구분 없이 비교
    }
    
	
}
