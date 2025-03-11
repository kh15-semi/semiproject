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

	// 가입(등록) 메소드(일반회원)
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

	// 가입(등록) 메소드(기업회원)
	public void insertCompanyMember(MemberDto memberDto) {
		
		// 1. 기존에 같은 사업자등록번호를 가진 회원이 있는지 확인
	    String checkSql = "SELECT COUNT(*) FROM member WHERE member_cr_number = ?";
	    int count = jdbcTemplate.queryForObject(checkSql, Integer.class, memberDto.getMemberCrNumber());
	    
	    if (count > 0) {
	        throw new IllegalStateException("이미 가입된 사업자등록번호입니다."); //(+추후 수정)프론트에서 blur처리로 나오게끔 수정 필요!!!!!!!!!
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
	
	// 기업 회원의 사업자 등록번호로 기업명 조회
	public String getCompanyNameByCrNumber(String crNumber) {
		String sql = "SELECT bn_company_name FROM business_number WHERE bn_cr_number = ?";
        return jdbcTemplate.queryForObject(sql, String.class, crNumber);
    } 
	
	// 일반 회원의 company_no 업데이트
	public void updateMemberCompanyNoForIndividual(String memberId, int companyNo) {
	    String sql = "UPDATE member SET member_company_no = ? WHERE member_id = ?";
	    jdbcTemplate.update(sql, companyNo, memberId);
	}
	
	// 기업 회원의 company_no 업데이트
	public boolean updateMemberCompanyNo(String memberId) {
	    String sql = "UPDATE member SET member_company_no = (SELECT company_no FROM company WHERE company_cr_number = (SELECT member_cr_number FROM member WHERE member_id = ?)) WHERE member_id = ?";
	    return jdbcTemplate.update(sql, memberId, memberId) > 0;
	}
	
	// 상세조회 기능
	public MemberDto selectOne(String memberId) {
		String sql = "select * from member where member_id = ?";
		Object[] data = { memberId };
		List<MemberDto> list = jdbcTemplate.query(sql, memberMapper, data);
		return list.isEmpty() ? null : list.get(0);
	}

	// 수정 기능(일반회원)
	public boolean updateMember(MemberDto memberDto) {
		String sql = "update member set " 
				+ "member_contact = ?, "
				+ "member_email = ?, member_post = ?, "
				+ "member_address1 = ?, member_address2 = ?, "
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
				+ "member_post = ?, member_address1 = ?, member_address2 = ?, "
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

	// 회원 삭제 기능(통합)
	public boolean delete(String memberId) {
		String sql = "delete member where member_id = ?";
		Object[] data = { memberId };
		return jdbcTemplate.update(sql, data) > 0;
	}

	// 최종 로그인 시각 갱신 메소드
	public boolean updateMemberLogin(String memberId) {
		String sql = "update member set member_login = systimestamp where member_id = ?";
		Object[] data = { memberId };
		return jdbcTemplate.update(sql, data) > 0;
	}

	// 비밀번호 변경 시 최종 비밀번호 변경일도 같이 변경되게 구현
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
	    String sql = "UPDATE member SET "
	                 + "member_pw=?, member_contact=?, "
	                 + "member_email=?, member_post=?, "
	                 + "member_address1=?, member_address2=?, "
	                 + "member_type=?, member_industry=?, "
	                 + "member_job=?, member_position=?, "
	                 + "member_cr_number=?, member_company_no=?, "
	                 + "member_change=CURRENT_TIMESTAMP " // 비밀번호 변경일시 업데이트
	                 + "WHERE member_id=?";
	    
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
