<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

	<!-- 기업 추천 -->
		<div class="cell m-30">
			<h2><i class="fa-solid fa-exclamation red"></i>&nbsp; ${memberDto.memberName} 님을 위한 기업 추천</h2>
		</div>

        <div class="cell flex-box">
    <c:forEach var="company" items="${recommendedCompanies}">
        <div class="cell" style="margin: auto;">
            <div class="cell center flex-box">
                <a href="company/detail?companyNo=${company.companyNo}">
                    <img src="/company/image?companyNo=${company.companyNo}" width="300" height="200" style="border-radius: 15px;">
                </a>
            </div>
            <div class="cell left m-10">
                <span>
                    <a href="company/detail?companyNo=${company.companyNo}" style="text-decoration: none; color: inherit;">
                        <b>${company.companyName}</b>
                    </a><br>
                    <p style="font-size: 13px; color: grey;">기업 정보 제공</p>
                </span>
            </div>
        </div>
    </c:forEach>
</div>


		<hr class="custom-line">


		<!-- 기업 리뷰 -->
		
		<!-- 
				기업명 옆의 북마크 선택 시
				<i class="fa-solid fa-bookmark"></i>
		-->
				
		<div class="cell m-30">
			<p><i class="fa-solid fa-user-pen grey"></i>&nbsp;기업의 전/현직자가 직접 평가하는</p>
			<h2>&nbsp;기업 리뷰&nbsp;<i class="fa-regular fa-newspaper"></i></h2>
		</div>

		 <div style="display: flex; flex-wrap: wrap; justify-content: space-between; gap: 20px;">
            <!-- 기업 정보와 리뷰가 모두 2개씩 한 줄에 뜨도록 수정 -->
            <c:forEach var="companyReview" items="${companyReviews}">
                <!-- 링크 추가: 회사 박스를 클릭하면 해당 회사의 상세 페이지로 이동 -->
                <a href="company/detail?companyNo=${companyReview.company.companyNo}" style="text-decoration: none; width: 48%; box-sizing: border-box;">
                    <div style="background-color: #f7f7f7; padding: 20px; border-radius: 5px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);">
                        <div style="display: flex; align-items: center;">
<!--                             <img src="https://placehold.co/30x30" alt="기업 로고" style="width: 30px; height: 30px; border-radius: 50%; margin-right: 10px;"> -->
                            <img src="/company/image?companyNo=${companyReview.company.companyNo}" width="30" height="30" style="border-radius: 50%;" alt="기업 로고">&nbsp; &nbsp;
                            <b style="font-size: 18px; color: #333;">${companyReview.company.companyName}</b>
                        </div>
                        <div>
                            <i class="fa-solid fa-quote-left grey" style="color: #888;"></i>
                            <p style="font-size: 16px; color: #333; margin-bottom: 15px; word-wrap: break-word; overflow: hidden; text-overflow: ellipsis;">
                                <c:if test="${not empty companyReview.reviews}">
                                    ${companyReview.reviews[0].reviewComment}
                                </c:if>
                                <c:if test="${empty companyReview.reviews}">
                                    리뷰 없음
                                </c:if>
                            </p>
                            <i class="fa-solid fa-quote-right grey" style="color: #888;"></i>
                        </div>
                    </div>
                </a>
            </c:forEach>
        </div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>