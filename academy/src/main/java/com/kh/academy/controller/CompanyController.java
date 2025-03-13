package com.kh.academy.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.kh.academy.dao.ReviewDao;
import com.kh.academy.dao.ReviewListViewDao;
import com.kh.academy.dto.CompanyDto;
import com.kh.academy.dto.MemberDto;
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
	
	
//	//기업목록을 가져와 home.jsp에 전달
//	@RequestMapping("/list")
//	public String list(Model model) {
//		List<CompanyDto> companyList = companyDao.selectList();
//		model.addAttribute("companyList", companyList);
//		return "/home";
//	}
	// 기업목록을 가져와 home.jsp에 전달
	@RequestMapping("/list")
	public String list(Model model) {
		List<CompanyDto> companyList = companyDao.selectList();
		model.addAttribute("companyList", companyList);
		return "/home";
	}

	@GetMapping("/detail")
	public String companyDetail(@RequestParam("companyNo") int companyNo, Model model, @ModelAttribute("pageVO") PageVO pageVO) {
		CompanyDto companyDto = companyDao.selectOne(companyNo);

		if (companyDto == null) {
			return "redirect:/company/list";
		}
		model.addAttribute("companyDto", companyDto);

		// 특정 회사의 리뷰 목록 조회
		List<ReviewListViewDto> list = reviewListViewDao.selectListByCompanyNo(pageVO, companyNo);
		model.addAttribute("list", list);

		int count = reviewDao.count(companyNo);
		pageVO.setCount(count);

		return "/WEB-INF/views/company/detail.jsp";
	}

	@GetMapping("/edit")
    public String companyEdit(@RequestParam int companyNo, HttpSession session, Model model) {
        String userId = (String) session.getAttribute("userId");
        MemberDto memberDto = memberDao.selectOne(userId);  // 세션에서 사용자 정보 가져오기

        // 세션에 memberDto가 없으면 DB에서 조회 후 세션에 저장
//        if (memberDto == null) {
//            memberDto = memberDao.selectOne(userId);
//            session.setAttribute("memberDto", memberDto);
//        }

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
    public String companyEdit( @RequestParam int companyNo, @ModelAttribute CompanyDto companyDto,@RequestParam MultipartFile attach, HttpSession session) throws IllegalStateException, IOException {
        String userId = (String) session.getAttribute("userId");
        //MemberDto memberDto = (MemberDto) session.getAttribute("memberDto");
        MemberDto memberDto = memberDao.selectOne(userId);
      //1. 기업정보 조회
        CompanyDto findDto = companyDao.selectOne(memberDto.getMemberCompanyNo());
        
//        findDto.setCompanyContact(companyDto.getCompanyContact());
//        findDto.setCompanyUrl(companyDto.getCompanyUrl());
//        findDto.setCompanyIndustry(companyDto.getCompanyIndustry());
//        findDto.setCompanyPost(companyDto.getCompanyPost());
//        findDto.setCompanyAddress1(companyDto.getCompanyAddress1());
//        findDto.setCompanyAddress2(companyDto.getCompanyAddress2());
//        findDto.setCompanyNo(companyNo); 

        // 회원이 속한 기업 정보와 일치하는지 확인
        if (memberDto.getMemberCompanyNo() != companyDto.getCompanyNo()) {
        	return "redirect:/company/mycompany";
        }

        // 기업 정보 업데이트
        companyDao.update(companyDto);
        
        //4. 이미지 첨부 처리
        if(!attach.isEmpty()) {//첨부 파일이 없다면
			try {//기존 이미지 삭제 처리(없으면 예외 발생)
				int attachmentNo = companyDao.findAttachment(companyDto.getCompanyNo());
				attachmentService.delete(attachmentNo);
			} catch(Exception e) {/*아무것도 안함*/}
        }
    	//첨부파일 등록
    	int attachmentNo = attachmentService.save(attach);
    	//회사 이미지 등록(연결)
    	companyDao.connect(companyNo, attachmentNo);
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








