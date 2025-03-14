
package com.kh.academy.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.academy.dao.CompanyDao;
import com.kh.academy.dao.ReviewDao;
import com.kh.academy.dao.ReviewListViewDao;
import com.kh.academy.dto.CompanyDto;
import com.kh.academy.dto.ReviewListViewDto;
import com.kh.academy.vo.PageVO;

//메인페이지 및 공용페이지 작성을 위한 컨트롤러(공용주소를 부여하지 않음)
@Controller
public class HomeController {

	@Autowired
	private CompanyDao companyDao;
	@Autowired
	private ReviewListViewDao reviewListViewDao;
	@Autowired
    private ReviewDao reviewDao;
	
	@RequestMapping("/")
    public String home(Model model) {
        // 모든 회사 리스트 가져오기
        List<CompanyDto> companyList = companyDao.selectList(); // 모든 회사 리스트
	    
        // 기업 추천을 위해 리스트 섞기
        Collections.shuffle(companyList);
        List<CompanyDto> recommendedCompanies = companyList.subList(0, Math.min(3, companyList.size()));
        
        List<Map<String, Object>> recommendedCompaniesWithScore = new ArrayList<>();
        for (CompanyDto company : recommendedCompanies) {
         	 double averageScore = reviewDao.getAverageScoreByCompanyNo(company.getCompanyNo());
             
             Map<String, Object> companyWithScore = new HashMap<>();
             companyWithScore.put("company", company);
             companyWithScore.put("averageScore", averageScore);
             
             recommendedCompaniesWithScore.add(companyWithScore);
         }
         //model.addAttribute("recommendedCompanies", recommendedCompanies);
         model.addAttribute("recommendedCompaniesWithScore", recommendedCompaniesWithScore);
        
        // 각 회사에 대해 리뷰 정보 가져오기
        List<Map<String, Object>> companyReviews = new ArrayList<>();
        
        for (CompanyDto company : companyList) {
        	
            // 회사에 해당하는 리뷰 가져오기 (예: 첫 번째 리뷰만 가져오기)
            List<ReviewListViewDto> reviews = reviewListViewDao.selectListByCompanyNo(new PageVO(), company.getCompanyNo());
            Map<String, Object> companyReview = new HashMap<>();
            
            companyReview.put("company", company);
            companyReview.put("reviews", reviews);  // 회사에 대한 리뷰 목록 저장

            companyReviews.add(companyReview);  // 전체 목록에 추가
        }
        
        // 리뷰 리스트도 섞기
        Collections.shuffle(companyReviews);
        List<Map<String, Object>> limitedCompanyReviews = companyReviews.subList(0, Math.min(4, companyReviews.size()));

        model.addAttribute("companyReviews", companyReviews);

        return "/WEB-INF/views/home.jsp";
        
	}
}
