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
 <div class="container w-700">
        <div class="cell" style="border: 2px solid rgb(184, 183, 183); padding: 20px; border-radius: 10px;">
            <img src="http://placehold.co/150x150">
            <div class="cell m-10">
            	<h2>${companyDto.companyName}</h2>
            	<p style="font-weight: 700;"><i class="fa-solid fa-star green"></i>&nbsp;${reviewListViewDto.reviewScore}</p>
				<p>${companyDto.companyIndustry}&nbsp; / &nbsp;${companyDto.companyJob}</p>
           		<p>${companyDto.companyUrl}</p>
            	<p>${companyDto.companyPost}&nbsp;${companyDto.companyAddress1}&nbsp;${companyDto.companyAddress2}</p>
            	<p>${companyDto.companyCrNumber}</p>
            </div>
        </div>
        <br><hr>
        <div class="cell">
           <div class="cell left p-20">
               <p><i class="fa-regular fa-comment grey"></i> 실제 근무자가 작성하는</p>
               <h2>기업 리뷰</h2>
           </div>        
           <div class="cell m-10">
			<a href="/company/review/write?companyNo=${companyDto.companyNo}" class="btn btn-green2">
				<i class="fa-solid fa-user-pen"></i>&nbsp;리뷰 작성
			</a>            
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
							<div class="cell">
							<c:forEach var="reviewListViewDto" items="${list}">
								<p style="margin: 10px; color:grey; font-size: 13px;">${reviewListViewDto.reviewWtime}</p>                              
                                 <h3 style="margin: 20px; text-align: center;"><i class="fa-solid fa-quote-left grey"></i>&nbsp;
                                 ${reviewListViewDto.reviewComment}
                                 &nbsp;<i class="fa-solid fa-quote-right grey"></i></h3>
							</div>
                           <div class="cell  m-20 center" style="font-weight: 700;">
                               <i class="fa-solid fa-star yellow"></i>&nbsp;
                               ${reviewListViewDto.reviewScore}
                           </div>
                           </c:forEach>
                       </c:otherwise>
                   </c:choose>
               </div>
           </div> 
        <div class="cell center p-10">
            <jsp:include page="/WEB-INF/views/template/pagination.jsp"></jsp:include>
        </div>
    </div>
</div>
</form>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>