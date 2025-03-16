package com.kh.academy.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.academy.dto.CompanyDto;
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
				companyDto.getCompanyCrNumber(), companyDto.getCompanyNo()
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

	public List<CompanyDto> selectList(String string, String keyword) {
		String sql = "select * from company where instr(company_name, ?) > 0 order by company_no asc";
		Object[] data = { keyword };
		return jdbcTemplate.query(sql, companyMapper, data);
	}
	public List<CompanyDto> selectList() {
	    String sql = "select * from company order by company_no asc";
	    return jdbcTemplate.query(sql, companyMapper);
	}

	public int sequence() {
		String sql = "select company_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}

	public void insert2(CompanyDto companyDto) {
		String sql ="insert into company(company_no, company_name, company_url, "
				+ "company_contact, company_industry, company_job, company_post, "
				+ "company_address1, company_address2, company_cr_number) "
				+ "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		Object[] data= {companyDto.getCompanyNo(),companyDto.getCompanyName(),companyDto.getCompanyUrl(),companyDto.getCompanyContact(),
				companyDto.getCompanyIndustry(),companyDto.getCompanyJob(),companyDto.getCompanyPost(),
				companyDto.getCompanyAddress1(),companyDto.getCompanyAddress2(),companyDto.getCompanyCrNumber()};
		jdbcTemplate.update(sql, data);
	}
	
	//회사 이미지 등록(연결)
	public void connect(int companyNo, int attachmentNo) {
		String sql = "insert into company_image ("
							+ "company_no, attachment_no"
					+ ") values(?, ?)";
		Object[] data = { companyNo, attachmentNo };
		jdbcTemplate.update(sql, data);
	}
	
	//회사 이미지 등록 해제(연결 해제)
	public void disconnect(int companyNo, int attachmentNo) {
	    String sql = "DELETE FROM company_image WHERE company_no = ? AND attachment_no = ?";
	    jdbcTemplate.update(sql, companyNo, attachmentNo);
	}
	
	public int findAttachment(int companyNo) {
        String sql = "select attachment_no from company_image "
                        + "where company_no=?";
        Object[] data = {companyNo};
        return jdbcTemplate.queryForObject(sql, int.class, data);
    }
	

}