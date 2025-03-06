package com.kh.academy.dao;

import java.util.List;

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
	
	public void insert(CompanyDto companyDto) { //추가 
		String sql ="insert into company(company_no, company_name, company_url, "
				+ "company_contact, company_industry, company_job, company_post, "
				+ "company_address1, company_address2, company_cr_number) "
				+ "values(company_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		Object[] data= {companyDto.getCompanyName(),companyDto.getCompanyUrl(),companyDto.getCompanyContact(),
				companyDto.getCompanyIndustry(),companyDto.getCompanyJob(),companyDto.getCompanyPost(),
				companyDto.getCompanyAddress1(),companyDto.getCompanyAddress2(),companyDto.getCompanyCrNumber()};
		jdbcTemplate.update(sql,data);
	}
	
	public boolean delete(int companyNo) { //삭제
		String sql = "delete from company where company_no = ?";
		Object[] data = {companyNo};
		return jdbcTemplate.update(sql, data) > 0;
	}		
	
	public boolean update(CompanyDto companyDto) { //업데이트
		String sql = "update company "
				+ "set "
				+ "company_name=?, company_url=?, company_contact=?, company_industry=?, "
				+ "company_job=?, company_post=?, company_address1=?, company_address2=?, company_cr_number=? "
				+ "where company_no=?";
		Object[] data = {
				companyDto.getCompanyName(),companyDto.getCompanyUrl(),companyDto.getCompanyContact(),companyDto.getCompanyIndustry(),
				companyDto.getCompanyJob(),companyDto.getCompanyPost(),companyDto.getCompanyAddress1(),companyDto.getCompanyAddress2(),
				companyDto.getCompanyCrNumber()
		};
		return jdbcTemplate.update(sql, data) > 0;
	}	

	
	//상세조회 기능
	public CompanyDto selectOne(int companyNo) {
		System.out.println("Company No: " + companyNo); 
		String sql = "select * from company where company_no=?";
		Object[] data = {companyNo};
		List<CompanyDto> list = jdbcTemplate.query(sql,companyMapper, data);
		return list.isEmpty() ? null : list.get(0);
		
	}	

		
    // 상세조회 기능 (사업자번호로 조회)
    public CompanyDto selectByCrNumber(String crNumber) {
        String sql = "select * from company where company_cr_number = ?";
        Object[] data = { crNumber };
        List<CompanyDto> list = jdbcTemplate.query(sql, companyMapper, data);  // 쿼리 실행 및 매핑
        return list.isEmpty() ? null : list.get(0);  // 첫 번째 결과 반환 (없으면 null 반환)
    }
    
    
    
    
}









