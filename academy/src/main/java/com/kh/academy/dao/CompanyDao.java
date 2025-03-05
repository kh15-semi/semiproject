package com.kh.academy.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.academy.dto.CompanyDto;
import com.kh.academy.entity.Company;
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
				+ "values(company_seq.nextval,?,?,?,?,?,?,?,?,?)";
		Object[] data= {companyDto.getCompanyName(),companyDto.getCompanyUrl(),companyDto.getCompanyContact(),
				companyDto.getCompanyIndustry(),companyDto.getCompanyJop(),companyDto.getCompanyPost(),
				companyDto.getCompanyAddress1(),companyDto.getCompanyAddress2(),companyDto.getCompanyCrNumber()};
		jdbcTemplate.update(sql,data);
	}
	
	public boolean delete(int companyNo) { //삭제
		String sql = "delete company where company_no = ?";
		Object[] data = {companyNo};
		return jdbcTemplate.update(sql, data) > 0;
	}		
	
	public boolean update(CompanyDto companyDto) { //업데이트 (회사이름,사업자번호는 일치해야하고 데이터에 있어야 한다)
		String sql = "update company "
				+ "set "
				+ "company_name=?, company_url=?, company_contact=?, company_industry=?, "
				+ "company_job=?, company_post=?, company_address1=?, company_address2=?, company_cr_number=? "
				+ "where company_no=?";
		Object[] data = {
				companyDto.getCompanyName(),companyDto.getCompanyUrl(),companyDto.getCompanyContact(),companyDto.getCompanyIndustry(),
				companyDto.getCompanyJop(),companyDto.getCompanyPost(),companyDto.getCompanyAddress1(),companyDto.getCompanyAddress2(),
				companyDto.getCompanyCrNumber()
		};
		return jdbcTemplate.update(sql, data) > 0;
	}	
	
	//상세조회 기능
	public CompanyDto selectOne(int companyNo) {
		String sql = "select * from company where company_no=?";
		Object[] data = {companyNo};
		List<CompanyDto> list = jdbcTemplate.query(sql,companyMapper, data);
		return list.isEmpty() ? null : list.get(0);
	}	
	public interface CompanyRepository extends JpaRepository<Company, Integer> {
	    // 사업자등록번호로 회사 조회
	    Company findByCompanyCrNumber(String crNumber);
	}

}
	

