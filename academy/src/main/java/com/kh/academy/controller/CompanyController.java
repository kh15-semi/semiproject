package com.kh.academy.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.academy.dao.CompanyDao;
import com.kh.academy.dao.MemberDao;
import com.kh.academy.dao.ReplyDao;
import com.kh.academy.dao.ReviewDao;
import com.kh.academy.dao.ReviewListViewDao;
import com.kh.academy.dto.CompanyDto;
import com.kh.academy.dto.MemberDto;
import com.kh.academy.dto.ReviewDto;
import com.kh.academy.dto.ReviewListViewDto;
import com.kh.academy.service.AttachmentService;
import com.kh.academy.vo.PageVO;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/company")
public class CompanyController {

	@Autowired
	private CompanyDao companyDao;
	@Autowired
	private ReviewListViewDao reviewListViewDao;
	@Autowired
	private ReviewDao reviewDao;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private AttachmentService attachmentService;
	@Autowired
	private ReplyDao replyDao;
	
	@GetMapping("/list")
	public String companyList(@RequestParam(required = false) String keyword, Model model, @ModelAttribute PageVO pageVO) {
	    boolean search = keyword != null && !keyword.trim().isEmpty();
	    List<CompanyDto> list;

	    if (search) {
	        // 기본적으로 회사명을 검색
	        list = companyDao.selectList("company_name", keyword);
	    } else {
	        list = companyDao.selectList();
	    }
	    // 검색 결과에 따라 allCompaniesWithScore 필터링
        List<Map<String, Object>> filteredCompaniesWithScore = new ArrayList<>();
        for (CompanyDto company : list) {
            double averageScore = reviewDao.getAverageScoreByCompanyNo(company.getCompanyNo());
            
            Map<String, Object> companyWithScore = new HashMap<>();
            companyWithScore.put("company", company);
            companyWithScore.put("averageScore", averageScore);
            
            filteredCompaniesWithScore.add(companyWithScore);
        }
        model.addAttribute("filteredCompaniesWithScore", filteredCompaniesWithScore);

	    // JSP로 전달
	    model.addAttribute("search", search);
	    model.addAttribute("keyword", keyword);
	    model.addAttribute("list", list);

	    return "/WEB-INF/views/company/list.jsp"; // JSP 파일 이름
	}
	
	@GetMapping("/detail")
	public String companyDetail(@RequestParam int companyNo, Model model, @ModelAttribute PageVO pageVO, HttpSession session) {
				
	    CompanyDto companyDto = companyDao.selectOne(companyNo);

	    if (companyDto == null) {
	        return "redirect:/company/list";
	    }
	    model.addAttribute("companyDto", companyDto);

	    // 특정 회사의 리뷰 목록 조회
	    List<ReviewListViewDto> list = reviewListViewDao.selectListByCompanyNo(pageVO, companyNo);
	    model.addAttribute("list", list);
	 
	    // 리뷰의 점수를 합산하여 평균 점수 계산
	    int totalScore = 0;
	    for (ReviewListViewDto review : list) {
	        totalScore += review.getReviewScore();  // 각 리뷰의 점수 합산
	    }
	    
	    double averageScore = list.isEmpty() ? 0 : (double) totalScore / list.size();  // 리뷰가 없으면 0점, 아니면 평균 계산

	    // 평균 점수를 모델에 추가
	    model.addAttribute("averageScore", averageScore);

	    // 리뷰 개수 세기
	    int count = reviewDao.count(companyNo);
	    model.addAttribute("count", count);
	    pageVO.setCount(count);
	    
	    // 승진기회 리뷰 평균
	    int totalPromotion = 0;
	    for(ReviewListViewDto review : list) {
	    	totalPromotion += review.getReviewPromotion();
	    } 
	    double avgPromotion = list.isEmpty() ? 0.0d : (double)totalPromotion / list.size();
	    model.addAttribute("avgPromotion", avgPromotion);
	    
	    // 복지/급여 리뷰 평균
	    int totalSalary = 0;
	    for(ReviewListViewDto review : list) {
	    	totalSalary += review.getReviewSalary();
	    } double avgSalary = list.isEmpty() ? 0.0d : (double)totalSalary / list.size();
	    model.addAttribute("avgSalary", avgSalary);
	    
	    // 워라밸 리뷰 평균
	    int totalWorkAndLife = 0;
	    for(ReviewListViewDto review : list) {
	    	totalWorkAndLife += review.getReviewWorkAndLife();
	    } double avgWorkAndLife = list.isEmpty() ? 0.0d : (double)totalWorkAndLife / list.size();
	    model.addAttribute("avgWorkAndLife", avgWorkAndLife);
	     
	    // 사내문화 리뷰 평균
	    int totalCulture = 0;
	    for(ReviewListViewDto review : list) {
	    	totalCulture += review.getReviewCulture();
	    } double avgCulture = list.isEmpty() ? 0.0d : (double)totalCulture / list.size();
	    model.addAttribute("avgCulture", avgCulture);
	    
	    // 경영진 리뷰 평균
	    int totalDirector = 0;
	    for(ReviewListViewDto review : list) {
	    	totalDirector += review.getReviewDirector();
	    } double avgDirector = list.isEmpty() ? 0.0d : (double)totalDirector / list.size();
	    model.addAttribute("avgDirector", avgDirector);

	    // 현재 사용자가 작성한 리뷰가 있는지 확인
        String userId = (String) session.getAttribute("userId");
        ReviewDto reviewDto = null;
        if (userId != null) {
        	reviewDto = reviewDao.selectOneByCompanyNoAndMemberId(companyNo, userId);
        }
        model.addAttribute("reviewDto", reviewDto);

	    return "/WEB-INF/views/company/detail.jsp";
	    
	 
	    
	}



	@GetMapping("/edit")
    public String companyEdit(@RequestParam int companyNo, HttpSession session, Model model) {
        String userId = (String) session.getAttribute("userId");
        MemberDto memberDto = memberDao.selectOne(userId);  // 세션에서 사용자 정보 가져오기

        // 세션에서 memberDto를 통해 companyDto 가져오기
        CompanyDto companyDto = companyDao.selectOne(companyNo);  // memberCompanyNo로 회사 정보 조회

        // 회사 정보가 없거나 일치하지 않으면 오류 페이지로 리다이렉트
        if (companyDto == null || companyDto.getCompanyNo() != memberDto.getMemberCompanyNo()) {
            return "redirect:/company/mycompany";  // 권한 오류 시 마이페이지로 리다이렉트
        }
        model.addAttribute("companyDto", companyDto);
        
        return "/WEB-INF/views/company/edit.jsp";  // 기업 정보 수정 페이지
    }

    // POST 요청: 수정된 기업 정보 처리 후 리다이렉트
    @PostMapping("/edit")
    public String companyEdit(@RequestParam int companyNo, @ModelAttribute CompanyDto companyDto, @RequestParam(required = false) MultipartFile attach, HttpSession session) throws IllegalStateException, IOException {
        String userId = (String) session.getAttribute("userId");
        MemberDto memberDto = memberDao.selectOne(userId);
        
        // 회원이 속한 기업 정보와 일치하는지 확인
        if (memberDto.getMemberCompanyNo() != companyDto.getCompanyNo()) {
        	return "redirect:/company/mycompany";
        }

        // 기업 정보 업데이트
        companyDao.update(companyDto);
        
        // 첨부 파일 처리
        if (attach != null && !attach.isEmpty()) {
            // 새로운 첨부 파일 등록
            int attachmentNo = attachmentService.save(attach);

            // 회사 이미지 등록 (연결)
            // 기존 연결된 attachmentNo가 있는지 확인
            try {
                int oldAttachmentNo = companyDao.findAttachment(companyDto.getCompanyNo());
                // 기존 연결된 attachmentNo가 있다면 연결 해제
                companyDao.disconnect(companyDto.getCompanyNo(), oldAttachmentNo);
                // 기존 attachment 삭제
                attachmentService.delete(oldAttachmentNo);
            } catch (EmptyResultDataAccessException e) {
                // 기존 첨부 파일이 없는 경우 예외 발생 -> 무시
                // - EmptyResultDataAccessException은 Spring JDBC에서 데이터가 없을 때 발생하는 예외
                // - catch 블록이 비어 있으면, 기존 첨부 파일이 없을 때 아무 작업도 하지 않음
            } catch (Exception e) {
                // 그 외 예외 발생 시 로그 출력 또는 예외 처리
                e.printStackTrace();
            }

            // 새로운 attachmentNo와 연결
            companyDao.connect(companyNo, attachmentNo);
        }
        
    	// 수정 후 기업 마이페이지로 리다이렉트
        return "redirect:/company/mycompany";
    }

	@RequestMapping("/mycompany")
	public String mycompany(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("userId");
		MemberDto memberDto = (MemberDto) session.getAttribute("memberDto");
		if(memberDto == null) {
			memberDto = memberDao.selectOne(userId);
			session.setAttribute("memberDto", memberDto); // 세션에 정보 저장
		}
		CompanyDto companyDto = companyDao.selectOne(memberDto.getMemberCompanyNo());

	    model.addAttribute("memberDto", memberDto);
	    model.addAttribute("companyDto", companyDto);
	    
	    return "/WEB-INF/views/company/mycompany.jsp";
	}
	
	//회사 번호(PK)로 이미지 주소를 반환하는 매핑
	@RequestMapping("/image")
	public String image(@RequestParam int companyNo) {
		try {//플랜A : 이미지가 있는 경우
			int attachmentNo = companyDao.findAttachment(companyNo);//2 출력 확인
			return "redirect:/attachment/download?attachmentNo="+attachmentNo;
		}
		catch(Exception e) {//플랜B : 이미지가 없는 경우
			return "redirect:/images/empty.jpg";
		}
	}
	

//    @RequestMapping("/mycompany")
//    public String mycompany(HttpSession session, Model model) {
//        String userId = (String) session.getAttribute("userId");
//        MemberDto memberDto = memberDao.selectOne(userId);  // 세션에서 사용자 정보 가져오기
//
//        CompanyDto companyDto = companyDao.selectOne(memberDto.getMemberCompanyNo());  // 사용자에게 속한 기업 정보 가져오기
//
//        model.addAttribute("memberDto", memberDto);
//        model.addAttribute("companyDto", companyDto);
//
//        return "/WEB-INF/views/company/mycompany.jsp";  // 수정된 회사 정보를 반영
//    }

}