<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="container w-700" style="border: 1px solid rgb(197, 197, 197); border-radius: 10px;">
	<div class="cell m-20">
		<div>
			<p style="color: grey; font-size: 12px;">
				${memberDto.memberIndustry} | ${memberDto.memberJob} | 작성일 : <fmt:formatDate value="${reviewDto.reviewWtime}" pattern="yyyy-MM-dd"/>
		    </p>
		    <h2 style="margin: 20px; word-wrap: break-word; overflow: hidden; text-overflow: ellipsis;">${reviewDto.reviewComment}</h2> <!--한줄평(=제목)-->
		</div>
		<hr>
		<div class="cell" style="display: flex; justify-content: center; align-items:inherit; ;">
		
			<div class="cell" style="width: 100px;">
			    <h3>
			    	<i class="fa-solid fa-star green"></i>
			    	<!--총 평점-->
			    	${reviewDto.reviewScore}
			    </h3>
			    <label>승진기회</label>
			    <p style="font-weight: 700;">${reviewDto.reviewPromotion}</p>
			    <label>복지/급여</label>
			    <p style="font-weight: 700;">${reviewDto.reviewSalary}</p>
			    <label>워라밸</label>
			    <p style="font-weight: 700;">${reviewDto.reviewWorkAndLife}</p>
			    <label>사내문화</label>
			    <p style="font-weight: 700;">${reviewDto.reviewCulture}</p>
			    <label>경영진</label>
			    <p style="font-weight: 700;">${reviewDto.reviewDirector}</p>
			</div>
			
			<div class="cell" style="width: 500px;">
			    <label style="font-size: 15px; border-radius: 3px; text-align: center; color: white; background-color: rgb(111, 182, 240); padding: 2px;">
			        장점
			    </label>
			    <h3 style="word-wrap: break-word; overflow: hidden; text-overflow: ellipsis;">${reviewDto.reviewStrength}</h3>
			    <label style="font-size: 15px; border-radius: 3px; text-align: center; color: white; background-color: rgb(250, 138, 138); padding: 2px;">
			        단점
			    </label>
			    <h3 style="word-wrap: break-word; overflow: hidden; text-overflow: ellipsis;">${reviewDto.reviewWeakness}</h3>
			    <br>
			</div>
		</div> 
		<hr>
		<div class="cell m-10" style="padding: 5px;">
		    <p><i class="fa-solid fa-user-tie"></i> 담당자 피드백</p>
		    <c:if test="${sessionScope.userType != null}">
		    	<c:if test="${sessionScope.userType == '기업회원'}">
		    		<c:if test="${sessionScope.userCompanyNo == reviewDto.reviewCompanyNo}">
				    	<div style="display: flex; align-items: center;">
					    	<textarea class="field" style="width: 85%;" rows="4" placeholder="해당 기업의 담당자만 피드백을 할 수 있습니다"></textarea>
					    	<button type="submit" class="btn btn-green2"style="margin-left: 10px;"><i class="fa-solid fa-check"></i>&nbsp;등록</button>
			   			</div>
			   		</c:if>
			   		<c:if test="${sessionScope.userCompanyNo != reviewDto.reviewCompanyNo}">
			    	<div style="display: flex; align-items: center;">
				    	<textarea class="field" style="width: 85%;" rows="4" placeholder="해당 기업의 담당자만 피드백을 할 수 있습니다" disabled></textarea>
				    	<button type="submit" class="btn btn-green2"style="margin-left: 10px;"><i class="fa-solid fa-check"></i>&nbsp;등록</button>
			  			</div>
					</c:if>
			   	</c:if>
		    	<c:if test="${sessionScope.userType == '일반회원'}">
			    	<div style="display: flex; align-items: center;">
				    	<textarea class="field" style="width: 85%;" rows="4" placeholder="해당 기업의 담당자만 피드백을 할 수 있습니다" disabled></textarea>
				    	<button type="submit" class="btn btn-green2"style="margin-left: 10px;"><i class="fa-solid fa-check"></i>&nbsp;등록</button>
			  			</div>
				</c:if>
			</c:if>
	    </div>
	</div>
	<div class="cell center">
		<a href="/company/detail?companyNo=${companyDto.companyNo}" class="btn btn-green2"><i class="fa-solid fa-arrow-left"></i>&nbsp;이전</a>
		<a href="/" class="btn btn-neutral"><i class="fa-solid fa-house"></i>&nbsp;메인</a>
		<c:if test="${sessionScope.userId != null}">
		    <c:if test="${sessionScope.userId == reviewDto.reviewWriter}">
				<a href="/company/review/delete?reviewNo=${reviewDto.reviewNo}" class="btn btn-negative btn-review-delete"><i class="fa-solid fa-trash-can"></i>&nbsp;삭제</a>
			</c:if>
		</c:if>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>