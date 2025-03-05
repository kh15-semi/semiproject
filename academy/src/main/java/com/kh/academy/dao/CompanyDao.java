package com.kh.academy.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.academy.dto.CompanyDto;
import com.kh.academy.dto.ReplyDto;
import com.kh.academy.mapper.CompanyMapper;

@Repository
public class CompanyDao {
	@Autowired
	private CompanyMapper companyMapper;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public void insertCompany(CompanyDto companyDto) { //추가 
		String sql ="insert into company(company_no, company_name, company_url, "
				+ "company_contact, company_industry, company_job, company_post, "
				+ "company_address1, company_address2, company_cr_number) "
				+ "values(company_seq.nextval,?,?,?,?,?,?,?,?,?)";
		Object[] data= {companyDto.getCompanyName(),companyDto.getCompanyUrl(),companyDto.getCompanyContact(),
				companyDto.getCompanyIndustry(),companyDto.getCompanyJop(),companyDto.getCompanyPost(),
				companyDto.getCompanyAddress1(),companyDto.getCompanyAddress2(),companyDto.getCompanyCrNumber()};
		jdbcTemplate.update(sql,data);
	}
	
	public boolean deleteCompany(int companyNo) { //삭제
		String sql = "delete company where company_no = ?";
		Object[] data = {companyNo};
		return jdbcTemplate.update(sql, data) > 0;
	}		
	
	public boolean update(ReplyDto replyDto) { //업데이트
		String sql = "update company "
				+ "set "
				+ "company_";
		Object[] data = {
				replyDto.getReplyContent(),
				replyDto.getReplyNo()
		};
		return jdbcTemplate.update(sql, data) > 0;
	}	
	
}
