<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="container w-700">
    <div class="cell" style="border: 2px solid rgb(184, 183, 183); padding: 20px; border-radius: 10px;">
        <img src="http://placehold.co/150x150">
        <div class="cell m-10">
            <h2>${companyDto.companyName}</h2>
            <p style="font-weight: 700;"><i class="fa-solid fa-star green"></i>&nbsp;3.0</p>
            <!-- ${companyDto.reviewScore}<br> -->
            <p>IT&nbsp; / &nbsp;웹/통신</p>
            <!-- <p>${companyDto.companyIndustry}&nbsp; / &nbsp;${companyDto.companyJob}</p> -->
             <p>www.company.com</p>
             <!-- <p>${companyDto.companyUrl}</p> -->
              <p>ㅇㅇ시 ㅇㅇ구 ㅇㅇㅇ로 ㅇㅇ ㅇㅇㅇ-ㅇㅇㅇ</p>
              <!-- <p>${companyDto.companyPost}&nbsp;${companyDto.companyAddress1}&nbsp;${companyDto.companyAddress2}</p> -->
              <p>사업자 번호</p>
              <!-- <p>${companyDto.companyCrNumber}</p> -->
        </div>
    </div>
    <br><hr>
    
    <div class="cell">
        <div class="cell left p-20">
            <p><i class="fa-regular fa-comment grey"></i> 실제 근무자가 작성하는</p>
            <h2>기업 리뷰</h2>
        </div>
        <div class="cell m-10">
            <h3><i class="fa-solid fa-ranking-star yellow"></i>&nbsp;전체 통계</h3>
            <!-- 실습 시 구현했던 그래프 처럼 만들 수 있으면 사용, 아니면 숫자로만 통계 수치 -->
            <div class="cell center" style="border: 2px solid rgb(184, 183, 183); border-radius: 10px;">
                <p>승진 기회 및 가능성</p>
                
                <p>복지 및 급여</p>
                
                <p>업무와 삶의 균형</p>
                
                <p>사내문화</p>
                
                <p>경영진</p>
                
            </div>
        </div>
        
        <div class="cell m-10 right">
            <button type="button" class="btn btn-green2"><i class="fa-solid fa-user-pen"></i>&nbsp;리뷰 작성</button>
        </div>
        <div class="cell m-10">
            <div class="cell" style="border: 2px solid rgb(184, 183, 183); border-radius: 10px;">
                <c:choose>
                    <c:when test="${list.isEmpty()}">
                        <h3 style="text-align: center;">
                            <i class="fa-solid fa-circle-exclamation green"></i>&nbsp;아직 기업에 대해 등록된 리뷰가 없어요.
                        </h3>
                    </c:when>
                    <c:otherwise>
                        <div class="cell m-20" style="color: grey; font-size: 12px;">
                            <p>작성일</p>
                            <!-- <p>${reviewDto.reviewWtime}</p> -->
                        </div>
                        <div class="cell m-20 center">
                            <h3>
                                <c:forEach var="reviewListViewDto" items="${list}">
                                    <i class="fa-solid fa-quote-left grey"></i>&nbsp;
                                    한줄평 (aka 제목)
                                    <!-- ${reviewListViewDto.reviewComment} -->
                                    &nbsp;<i class="fa-solid fa-quote-right grey"></i>
                                </c:forEach>
                            </h3>
                        </div>
                        <div class="cell  m-20 center" style="font-weight: 700;">
                            <i class="fa-solid fa-star yellow"></i>&nbsp;
                            3.0 (총 평점)
                            <!-- ${reviewListDto.reviewScore} -->
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    <div class="cell center">
        <jsp:include page="/WEB-INF/views/template/pagination.jsp"></jsp:include>
    </div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>