<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

	<!-- 기업 추천 -->
		<div class="cell m-30">
			<h2><i class="fa-solid fa-exclamation red"></i>&nbsp; ${memberDto.memberName} 님을 위한 기업 추천</h2>
		</div>

        <div class="cell flex-box">
           
			<div class="cell" style="margin: auto;">
                <div class="cell center flex-box">
                	<a href="#">
                    	<img src="/images/뤼이드.png" style="border-radius: 15px; width: 360px; height: 250px;">
                	</a>
                </div>
				<div class="cell left m-10">
					<span>
						<a href="#" style="text-decoration: none; color: inherit;">
							<b>(주) 뤼이드</b>
						</a><br>
						<a href="#" style="text-decoration: none; color: inherit;">
							<b>[Riiid] 사내 법무 담당자 (재택 근무 병행)</b> 
						</a><br>
						<p style=" font-size: 13px; color: grey;">5년 이상, 법무, 법률 사무</p>
					</span>
				</div>
            </div>
            
			<div class="cell" style="margin: auto;">
                <div class="cell center flex-box">
                	<a href="#">
                    	<img src="/images/쿠팡.png" style="border-radius: 15px; width: 360px; height: 250px;">
                	</a>
                </div>
				<div class="cell left m-10">
					<span>
						<a href="#" style="text-decoration: none; color: inherit;">
							<b>쿠팡(주)</b>
						</a><br>
						<a href="#" style="text-decoration: none; color: inherit;">
							<b>[Coupang] Privacy Compliance</b> 
						</a><br>
						<p style=" font-size: 13px; color: grey;">5년 이상, 법무, 법률 사무</p>
					</span>
				</div>
            </div>

			<div class="cell" style="margin: auto;">
                <div class="cell center flex-box">
                	<a href="#">
                    <img src="/images/코인원.png" style="border-radius: 15px; width: 360px; height: 250px;">
                    </a>
                </div>
				<div class="cell left m-10">
					<span>
						<a href="#" style="text-decoration: none; color: inherit;">
							<b>(주) 코인원</b>
						</a><br>
						<a href="#" style="text-decoration: none; color: inherit;">
							<b>컴플라이언스 담당자</b> 
						</a><br>
						<p style=" font-size: 13px; color: grey;">5년 이상, 내부 통제, 컴플라이언스, 준법감시</p>
					</span>
				</div>
            </div>
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
                            <img src="https://placehold.co/30x30" alt="기업 로고" style="width: 30px; height: 30px; border-radius: 50%; margin-right: 10px;">
                            <b style="font-size: 18px; color: #333;">${companyReview.company.companyName}</b>
                        </div>
                        <div>
                            <i class="fa-solid fa-quote-left grey" style="color: #888;"></i>
                            <p style="font-size: 16px; color: #333; margin-bottom: 15px;">
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