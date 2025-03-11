<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!-- google font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

<!-- font awesome cdn -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<form action="change" method="post">
   <div class="container w-800">
        <!-- 메인 콘텐츠 -->
        <div class="main">
            <!-- 회사 정보 -->
            <div class="content w-100">
                <div class="company-info">
                    <div class="company-image">
                        <img src="./image/Instagram.png">
                    </div>

                    <div class="company-details">
                        <!-- 회사명과 평점을 같은 줄에 배치 -->
                        <div class="company-header">
                            <div class="flex company-name">${companyDto.companyName}</div>
                            <div class="company-rating" data-max="5" data-rate="4"> 총 평점: ${reviewDto.reviewScore}</div>
                        </div>
                        <div class="company-extra-info">
                            <p>업종: ${companyDto.companyIndustry}</p>
                            <p>회사 번호: ${companyDto.companyContact}</a></p>
                            <p>홈페이지: ${companyDto.companyUrl}</p>
                            <p>주소: ${companyDto.companyAddress1}  ${companyDto.companyAddress2}</p>
                            <p>사업자번호: ${maskedCrNumber}</p>
                        </div>
                        <div class="map">
                            <button class="map-btn">위치보기 →</button>
                        </div>
                    </div>
                </div>

                <!-- 리뷰창 -->
                <div class="container reviews">
                    <div class="cell centerreviews-header">
                        <h2>리뷰</h2>
                    </div>
                    <p>글은 자신의 인격입니다.존중하며 적어주세요</p>
                        <!-- 리뷰 목록 -->
                            
                            <!-- 테이블 -->
                            <div class="cell center">
                                <table class="table table-border table-hover table-ellipsis">
                                    <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>ID</th>
                                            <th style="width:450px; max-width:450px;">한줄평</th>
                                            <th>평점</th>
                                            <th>좋아요</th>
                                            <th>작성일</th>
                                            <th>수정일</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                						<c:if test="${empty reviewListDto}">
                    						<tr height="150">
                        						<td colspan="7" align="center">
                           							 등록된 게시글이 없습니다.
                        						</td>
                    						</tr>
                						</c:if>
                						<c:forEach var="review" items="${reviewListDto}">
                    						<tr>
                        						<td>${review.reviewNo}</td>
                        						<td>${review.reviewWriter}</td>
                        						<td>${review.reviewComment}</td>
                        						<td>${review.reviewScore}</td>
                        						<td>${review.reviewLike}</td>
                        						<td>${review.reviewWtime}</td>
                        						<td>${review.reviewEtime}</td>
                    						</tr>
                						</c:forEach>
            						</tbody>
                                </table>
                            </div>
                            <div>
                                <div class="cell center">
                                </div>
		</div>
	</div>
</form>
<div class="review-actions">
	<a href="/company/review/write?companyNo=${companyDto.companyNo}">
		<button type="button" class="write-review-btn">리뷰 쓰러가기 →</button>
	</a>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>