package com.kh.academy.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.kh.academy.dto.CompanyDto;
import com.kh.academy.dto.CompanyHistoryDto;

@Component
public class CompanyHistoryMapper implements RowMapper<CompanyHistoryDto> {

	@Override
	public CompanyHistoryDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		return CompanyHistoryDto.builder()
				.companyHistoryNo(rs.getInt("company_history_no"))
				.memberId(rs.getString("member_id"))
				.companyNo(rs.getInt("company_no"))
				.companyHistoryJoinDate(rs.getTimestamp("company_history_join_date"))
				.companyHistoryLeaveDate(rs.getTimestamp("company_history_leave_date"))
			.build();
	}

}
