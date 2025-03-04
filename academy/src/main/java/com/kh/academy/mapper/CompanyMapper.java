package com.kh.academy.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.kh.academy.dto.CompanyDto;

@Component
public class CompanyMapper implements RowMapper<CompanyDto>{

	@Override
	public CompanyDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		return CompanyDto.builder()
					.companyNo(rs.getInt("company_no"))
					.companyName(rs.getString("company_name"))
					.companyCrNumber(rs.getInt("company_crnumber"))
					.companyUrl(rs.getString("company_uri"))
					.companyContact(rs.getString("company_contact"))
					.companyIndustry(rs.getString("company_industry"))
					.companyJop(rs.getString("company_job"))
					.companyPost(rs.getString("company_post"))
					.companyAddress1(rs.getString("company_address1"))
					.companyAddress2(rs.getString("company_address2"))
				.build();
	}
}
