<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script type="text/javascript">
$(function() {
	// 정보 수정 버튼 클릭 시
	$(".btn-edit").click(function() {
		window.location.href = "/member/edit";
	});

	// 비밀번호 변경 버튼 클릭 시
	$(".btn-changePw").click(function() {
		window.location.href = "/share/password";
	});
	
	// 계정삭제 버튼 클릭 시
	$(".btn-delete").click(function() {
		window.location.href = "/share/exit";
	});

	// 메인 버튼 클릭 시
	$(".btn-main").click(function() {
		window.location.href = "/";
	});
	
	
	
	// 회사등록 버튼 클릭 시
	/* 
	$(".btn-addCompany").click(function() {
		window.location.href = "/member/addCompany";
	}); 
	*/
	
});
</script>
<div class="container w-800" >
    <div class="cell" style="margin: 10px; padding: 10px">
        <div class="cell">
            <h2><i class="fa-regular fa-user green"></i> 회원 정보</h2>
        </div>
        
        <hr>
        
	<div class="cell" style="padding: 10px;">
        <div class="cell">
            <h3><i class="fa-regular fa-square-check blue"></i>&nbsp;이름</h3>
            <p>${memberDto.memberName}</p>
        </div>
        
        <div class="cell">
            <h3><i class="fa-regular fa-square-check blue"></i>&nbsp;연락처</h3>
            <p>${memberDto.memberContact}</p>
        </div>
        
        <div class="cell">
            <h3><i class="fa-regular fa-square-check blue"></i>&nbsp;이메일</h3>
            <p>${memberDto.memberEmail}</p>
        </div>
		
        <div class="cell">
            <h3><i class="fa-regular fa-square-check blue"></i>&nbsp;주소</h3>
            <p>${memberDto.memberPost}</p>
            <p>${memberDto.memberAddress1}</p>
            <p>${memberDto.memberAddress2}</p>
       </div>

		<div class="cell">     
		     <!-- 관심산업/직종 추가 -->
		     <c:if test="${memberDto.memberIndustry == null}">
		     <h3><i class="fa-regular fa-square-check blue"></i>&nbsp;관심 산업군 및 직종</h3>
		     	<p>미선택</p>
		     </c:if>
		     	<p>${memberDto.memberIndustry} ${memberDto.memberJob}</p>
		</div>

	<div class="cell mb-20">
		<c:if test="${companyHistoryDto == null}">
			<h3><i class="fa-regular fa-square-check blue"></i>&nbsp;재직 이력</h3>
       		<p>재직 이력 없음</p>
   		</c:if>
       	<h3><i class="fa-regular fa-square-check blue"></i>&nbsp;재직 이력</h3>
   		<p>업체명 | ${companyName}</p>
       	<p>입사일 | ${companyHistoryDto.companyHistoryJoinDate}</p> 
       	<p>퇴사일 | ${companyHistoryDto.companyHistoryLeaveDate}</p>
   	</div>

    </div>
    
   	<hr>

    <div class="cell">
        <!-- <button type="button" class="btn-addCompany btn btn-green2" style="border-radius: 10px;"><i class="fa-solid fa-pen-to-square"></i> 회사등록</button> -->    
        <div class="cell" style="display: inline-block; width: 75%; text-align: left;">
        	<button type="button" class="btn-main btn btn-green2" style="border-radius: 10px;"><i class="fa-solid fa-house"></i> 메인</button>
        	<button type="button" class="btn-edit btn btn-green2" style="border-radius: 10px;"><i class="fa-solid fa-pen-to-square"></i> 정보수정</button>
        	<button type="button" class="btn-changePw btn btn-green2" style="border-radius: 10px;"><i class="fa-solid fa-lock"></i> 비밀번호 변경</button>
        </div>
        <div class="cell" style="display: inline-block; width: 24%; text-align: right;">
        	<button type="button" class="btn-delete btn btn-red" style="border-radius: 10px;">회원탈퇴</button>
        </div>
    </div> 
    </div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>