<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
    
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="container w-700" style="border: 1px solid rgb(197, 197, 197); border-radius: 10px;">
	<div class="cell m-10">
		<div>
			<p style="color: grey; font-size: 12px;">
				${companyDto.companyIndustry} | ${compantDto.companyJob} | ${reviewDto.reviewWtime}
		    </p>
		    <h2>${reviewDto.reviewComment}</h2> <!--한줄평(=제목)-->
		</div>
		<hr>
		<div class="cell m-10" style="display: inline-block; width: 100px; vertical-align: top">
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
		    <p>${reviewDto.reviewWorkAndLife}</p>
		    <label>사내문화</label>
		    <p style="font-weight: 700;">${reviewDto.reviewCulture}</p>
		    <label>경영진</label>
		    <p style="font-weight: 700;">${reviewDto.reviewDirector}</p>
		</div>
		<div class="cell" style="display: inline-block; width: 500px; vertical-align: top">
		    <label style="font-size: 15px; border-radius: 3px; text-align: center; color: white; background-color: rgb(111, 182, 240); padding: 2px;">
		        장점
		    </label>
		    <h5>${reviewDto.reviewStrength}</h5>
		    <label style="font-size: 15px; border-radius: 3px; text-align: center; color: white; background-color: rgb(250, 138, 138); padding: 2px;">
		        단점
		    </label>
		    <h5>${reviewDto.reviewWeakness}</h5>
		    <br>
		    <div class="cell" style="font-size: 12px; color: grey;">
		        도움이 돼요&nbsp;<i class="fa-solid fa-thumbs-up"></i> 좋아요수
		        &nbsp;${reviewDto.reviewLike}
		    </div>
		</div>
		<hr>
		<div class="cell m-10" style="padding: 5px;">
		    <p><i class="fa-solid fa-user-tie"></i> 담당자 피드백</p>
		    <div style="display: flex; align-items: center;">
			    <textarea class="field" style="width: 85%;" rows="4" placeholder="해당 기업의 담당자만 피드백을 할 수 있습니다"></textarea>
			    <button type="submit" class="btn btn-green2"style="margin-left: 10px;"><i class="fa-solid fa-check"></i>&nbsp;등록</button>
	   		</div>
	    </div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>