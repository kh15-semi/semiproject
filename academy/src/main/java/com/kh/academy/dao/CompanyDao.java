package com.kh.academy.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.academy.dto.CompanyDto;
import com.kh.academy.mapper.CompanyMapper;

@Repository
public class CompanyDao {
	@Autowired
	private CompanyMapper companyMapper;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public void insertCompany(CompanyDto companyDto) {
		String sql ="insert into company(company_no, company_name, company_url, "
				+ "company_contact, company_industry, company_job, company_post,company_post, "
				+ "company_address1, company_address2, company_cr_number) value()d";
		Object[] data= {};
	}
	
	
}
