package com.kh.academy.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.academy.dto.MemberDto;
import com.kh.academy.mapper.MemberMapper;
import com.kh.academy.vo.PageVO;

@Repository
public class MemberDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Autowired
	private MemberMapper memberMapper;

	// 가입(등록) 메소드 (일반회원)
	public void insertMember(MemberDto memberDto) {
		String sql = "insert into member(member_id, member_pw, member_type,"
				+ " member_name, member_id_card_num, member_contact, member_email,"
				+ " member_post, member_address1, member_address2,"
				+ " member_industry, member_job" // 산업, 직종은 선택
				+ ") "
				+ "values(?, ?, '일반회원', ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		Object[] data = { memberDto.getMemberId(), memberDto.getMemberPw(), memberDto.getMemberName(), 
				memberDto.getMemberIdCardNum(), memberDto.getMemberContact(), memberDto.getMemberEmail(), 
				memberDto.getMemberPost(), memberDto.getMemberAddress1(), memberDto.getMemberAddress2(),
				memberDto.getMemberIndustry(), memberDto.getMemberJob()
		};
		jdbcTemplate.update(sql, data);
	}

	// 가입(등록) 메소드 (기업회원)
	public void insertCompanyMember(MemberDto memberDto) {
		// 1. 기존에 같은 사업자등록번호를 가진 회원이 있는지 확인
	    String checkSql = "select count(*) from member where member_cr_number = ?";
	    int count = jdbcTemplate.queryForObject(checkSql, Integer.class, memberDto.getMemberCrNumber());
	    
	    if (count > 0) {
	        throw new IllegalStateException("이미 가입된 사업자등록번호입니다.");
	    }
		
		String sql = "insert into member(member_id, member_pw, member_type, "
				+ "member_name, member_contact, member_email, "
				+ "member_post, member_address1, member_address2, "
				+ "member_industry, member_job, " // 산업, 직종은 필수
				+ "member_position, member_cr_number) "
				+ "values(?, ?, '기업회원', ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		Object[] data = { memberDto.getMemberId(), memberDto.getMemberPw(), memberDto.getMemberName(),
				memberDto.getMemberContact(), memberDto.getMemberEmail(), memberDto.getMemberPost(),
				memberDto.getMemberAddress1(), memberDto.getMemberAddress2(), memberDto.getMemberIndustry(),
				memberDto.getMemberJob(), memberDto.getMemberPosition(), memberDto.getMemberCrNumber()
				};
		jdbcTemplate.update(sql, data);
		
		// member_company_no 업데이트
	    updateMemberCompanyNo(memberDto.getMemberId());
	}
	
	// 사업자 등록번호로 기업명 조회 (기업회원)
	public String getCompanyNameByCrNumber(String crNumber) {
		String sql = "select bn_company_name from business_number where bn_cr_number = ?";
        return jdbcTemplate.queryForObject(sql, String.class, crNumber);
    } 
	
	// company_no 업데이트 (일반회원)
	public void updateMemberCompanyNoForIndividual(String memberId, int companyNo) {
	    String sql = "update member set member_company_no = ? where member_id = ?";
	    jdbcTemplate.update(sql, companyNo, memberId);
	}
	
	// company_no 업데이트 (기업회원)
	public boolean updateMemberCompanyNo(String memberId) {
	    String sql = "update member set member_company_no = (select company_no from company where company_cr_number = (select member_cr_number from member where member_id = ?)) where member_id = ?";
	    return jdbcTemplate.update(sql, memberId, memberId) > 0;
	}
	
	// 상세조회 기능 (공용)
	public MemberDto selectOne(String memberId) {
		String sql = "select * from member where member_id = ?";
		Object[] data = { memberId };
		List<MemberDto> list = jdbcTemplate.query(sql, memberMapper, data);
		return list.isEmpty() ? null : list.get(0);
	}

	// company_no로 회원 조회 (공용)
	public MemberDto selectOneByCompanyNo(int companyNo) {
		String sql = "select * from member where member_company_no = ?";
		Object[] data = { companyNo };
		List<MemberDto> list = jdbcTemplate.query(sql, memberMapper, data);
		return list.isEmpty() ? null : list.get(0);
	}
	
	// 회원Id로 company_no 조회 (공용)
	public int selectMemberCompanyNo(String memberId) {
		String sql = "select member_company_no from member where member_id = ?";
		Object[] data = { memberId };
		return jdbcTemplate.queryForObject(sql, int.class, data);
	}
	
	// 수정 기능 (일반회원)
	public boolean updateMember(MemberDto memberDto) {
		String sql = "update member set " 
				+ "member_contact = ?, "
				+ "member_email = ?, member_post = ?, "
				+ "member_address1 = ?, member_address2 = ?, member_change = systimestamp, "
				+ "member_industry = ?, member_job = ? "
				+ "where member_id = ?";
		Object[] data = { memberDto.getMemberContact(),
				memberDto.getMemberEmail(), memberDto.getMemberPost(), memberDto.getMemberAddress1(),
				memberDto.getMemberAddress2(), memberDto.getMemberIndustry(), memberDto.getMemberJob(),
				memberDto.getMemberId() };
		return jdbcTemplate.update(sql, data) > 0;
	}

	// 수정 기능(기업회원)
	public boolean updateCompanyMember(MemberDto memberDto) {
		String sql = "update member set "
				+ "member_contact = ?, member_email = ?, "
				+ "member_post = ?, member_address1 = ?, member_address2 = ?, member_change = systimestamp, "
				+ "member_industry = ?, member_job = ?, "
				+ "member_position = ?, member_cr_number = ? "
				+ "where member_id = ?";
		Object[] data = { memberDto.getMemberContact(), memberDto.getMemberEmail(), 
				memberDto.getMemberPost(), memberDto.getMemberAddress1(), memberDto.getMemberAddress2(), 
				memberDto.getMemberIndustry(), memberDto.getMemberJob(),
				memberDto.getMemberPosition(), memberDto.getMemberCrNumber(), memberDto.getMemberId() };
		
		// member_company_no 업데이트
	    updateMemberCompanyNo(memberDto.getMemberId());
		
		return jdbcTemplate.update(sql, data) > 0;
	}

	// 회원 삭제 기능 (공용)
	public boolean delete(String memberId) {
		String sql = "delete member where member_id = ?";
		Object[] data = { memberId };
		return jdbcTemplate.update(sql, data) > 0;
	}

	// 최종 로그인 시각 갱신 메소드 (공용)
	public boolean updateMemberLogin(String memberId) {
		String sql = "update member set member_login = systimestamp where member_id = ?";
		Object[] data = { memberId };
		return jdbcTemplate.update(sql, data) > 0;
	}

	// 비밀번호 변경 시 최종 비밀번호 변경일도 같이 변경되게 구현 (공용)
	public boolean updateMemberPassword(MemberDto memberDto) {
		String sql = "update member set member_pw = ?, member_change = systimestamp where member_id = ?";
		Object[] data = { memberDto.getMemberPw(), memberDto.getMemberId() };
		return jdbcTemplate.update(sql, data) > 0;
	}
	
	public List<MemberDto> selectList(PageVO pageVO) {
		if(pageVO.isList()) {
			String sql = "select * from ("
								+ "select rownum rn, TMP.* from ("
									+ "select * from member order by member_id asc"
								+ ")TMP"
							+ ") "
							+ "where rn between ? and ?";
			Object[] data = {pageVO.getStartRownum(), pageVO.getFinishRownum()};
			return jdbcTemplate.query(sql, memberMapper, data);
		}
		else {
			String sql = "select * from ("
								+ "select rownum rn, TMP.* from ("
									+ "select * from member "
									+ "where instr(#1, ?) > 0 "
									+ "order by #1 asc, member_id asc"
								+ ")TMP"
							+ ") "
							+ "where rn between ? and ?";
			sql = sql.replace("#1", pageVO.getColumn());
			Object[] data = {
				pageVO.getKeyword(), 
				pageVO.getStartRownum(),
				pageVO.getFinishRownum()
			};
			return jdbcTemplate.query(sql, memberMapper, data);
		}
	}
	
	public int count(PageVO pageVO) {
		if(pageVO.isList()) {
			String sql = "select count(*) from member";
			return jdbcTemplate.queryForObject(sql, int.class);
		}
		else {
			String sql = "select count(*) from member "
							+ "where instr(#1, ?) > 0";
			sql = sql.replace("#1", pageVO.getColumn());
			Object[] data = {pageVO.getKeyword()};
			return jdbcTemplate.queryForObject(sql, int.class, data);
		}
	}
	
	//개인정보변경 매핑
	public boolean update(MemberDto memberDto) {
	    String sql = "update member set "
	                 + "member_pw = ?, member_contact = ?, "
	                 + "member_email = ?, member_post = ?, "
	                 + "member_address1 = ?, member_address2 = ?, "
	                 + "member_type = ?, member_industry = ?, "
	                 + "member_job = ?, member_position = ?, "
	                 + "member_cr_number = ?, member_company_no = ?, "
	                 + "member_change = systimestamp " // 비밀번호 변경일시 업데이트
	                 + "where member_id = ?";
	    Object[] data = {
	        memberDto.getMemberPw(), memberDto.getMemberContact(),
	        memberDto.getMemberEmail(), memberDto.getMemberPost(),
	        memberDto.getMemberAddress1(), memberDto.getMemberAddress2(),
	        memberDto.getMemberType(), memberDto.getMemberIndustry(),
	        memberDto.getMemberJob(), memberDto.getMemberPosition(),
	        memberDto.getMemberCrNumber(), memberDto.getMemberCompanyNo(),
	        memberDto.getMemberId()
	    };
	    
	    return jdbcTemplate.update(sql, data) > 0;
	}


}
