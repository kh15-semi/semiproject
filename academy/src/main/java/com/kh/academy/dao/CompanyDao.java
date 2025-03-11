package com.kh.academy.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.academy.dto.CompanyDto;
import com.kh.academy.dto.ReplyDto;
import com.kh.academy.mapper.CompanyMapper;
import com.kh.academy.vo.PageVO;

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
    
    public List<CompanyDto> selectList(PageVO pageVO) {
        if (pageVO.isList()) {
            String sql = "select * from ("
                        + "select rownum rn, TMP.* from ("
                        + "select * from company order by company_no asc"
                        + ")TMP"
                        + ") "
                        + "where rn between ? and ?";
            Object[] data = {pageVO.getStartRownum(), pageVO.getFinishRownum()};
            return jdbcTemplate.query(sql, companyMapper, data);
        } else {
            String sql = "select * from ("
                        + "select rownum rn, TMP.* from ("
                        + "select * from company "
                        + "where instr(#1, ?) > 0 "
                        + "order by #1 asc, company_no asc"
                        + ")TMP"
                        + ") "
                        + "where rn between ? and ?";
            sql = sql.replace("#1", pageVO.getColumn()); // 검색할 컬럼 동적으로 교체
            Object[] data = {
                pageVO.getKeyword(), 
                pageVO.getStartRownum(),
                pageVO.getFinishRownum()
            };
            return jdbcTemplate.query(sql, companyMapper, data);
        }
    }

    public int count(PageVO pageVO) {
        if (pageVO.isList()) {
            String sql = "select count(*) from company";
            return jdbcTemplate.queryForObject(sql, int.class);
        } else {
            String sql = "select count(*) from company "
                        + "where instr(#1, ?) > 0";
            sql = sql.replace("#1", pageVO.getColumn()); // 검색할 컬럼 동적으로 교체
            Object[] data = {pageVO.getKeyword()};
            return jdbcTemplate.queryForObject(sql, int.class, data);
        }
    }

	public List<CompanyDto> selectList() {
		String sql = "select * from company order by company_no asc";
		return jdbcTemplate.query(sql, companyMapper);
	}

    
}