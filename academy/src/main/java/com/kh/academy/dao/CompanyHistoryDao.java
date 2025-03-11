package com.kh.academy.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.academy.dto.CompanyDto;
import com.kh.academy.dto.CompanyHistoryDto;
import com.kh.academy.mapper.CompanyHistoryMapper;

@Repository
public class CompanyHistoryDao {
	
	@Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private CompanyHistoryMapper companyHistoryMapper;

    public void insertCompanyHistory(CompanyHistoryDto companyHistoryDto) {
        String sql = "INSERT INTO company_history ("
        		+ "company_history_no, member_id_card_num, company_no, "
        		+ "company_history_join_date, company_history_leave_date) " +
                "VALUES (company_history_seq.nextval, ?, ?, ?, ?)";
        Object[] data = { companyHistoryDto.getMemberIdCardNum(),
                companyHistoryDto.getCompanyNo(),
                companyHistoryDto.getCompanyHistoryJoinDate(),
                companyHistoryDto.getCompanyHistoryLeaveDate()
        };
        jdbcTemplate.update(sql, data);
                
    }

    public boolean deleteCompanyHistory(int companyHistoryNo) {
        String sql = "DELETE FROM company_history WHERE company_history_no = ?";
        Object[] data = { companyHistoryNo };
        return jdbcTemplate.update(sql, data) > 0; 
    }
    
    // 일반회원의 주민등록으로 회사 이력 목록 조회
    public CompanyHistoryDto selectCompanyHistoryByMemberIdCardNum(String memberIdCardNum) {
        String sql = "SELECT * FROM company_history WHERE member_id_card_num = ?";
        Object[] data = { memberIdCardNum };
        List<CompanyHistoryDto> list = jdbcTemplate.query(sql, companyHistoryMapper, data);
        return list.isEmpty() ? null : list.get(0);
    }
 	
 	public CompanyHistoryDto selectOneCompanyHistoryById(int companyHistoryNo) {
        String sql = "SELECT * FROM company_history WHERE company_history_no = ?";
        Object[] data = { companyHistoryNo };
        List<CompanyHistoryDto> list = jdbcTemplate.query(sql,companyHistoryMapper, data);
		return list.isEmpty() ? null : list.get(0);
    }
 	
}