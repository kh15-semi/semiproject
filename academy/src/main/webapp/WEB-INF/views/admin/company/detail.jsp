<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="container w-600">
	<div class="cell" style="margin: 10px; padding: 10px">
	
	    <div class="cell">
	        <h2><i class="fa-solid fa-building"></i> 업체 상세 정보</h2>
	    </div>
		    
	    <div class="cell">
	        <h3>업체명</h3>
	        <p>${companyDto.companyName}</p>
	    </div>
	    
	    <div class="cell">
	        <h3>사업자 등록번호</h3>
	        <p>${companyDto.companyCrNumber}</p>
	    </div>
	
	    <div class="cell">
	        <h3>산업 </h3>
	        <p>${companyDto.companyIndustry}</p>
	    </div>
	
	    <div class="cell">
	        <h3>직종</h3>
	        <p>${companyDto.companyJob}</p>
	    </div>
		
	    <div class="cell">
	        <h3>연락처</h3>
	        <p>${companyDto.companyContact}</p>
	    </div>
		 
	    <div class="cell">
	        <h3>주소</h3>
	        <p>(${companyDto.companyPost})</p>
	        <p>${companyDto.companyAddress1}</p>
	        <p>${companyDto.companyAddress2}</p>
	    </div>
	    
	    <div class="cell">
	        <h3>업체 홈페이지</h3>
	        <p>${companyDto.companyUrl}</p>
	    </div>    

<div class="cell center" style="margin: 10px; padding: 10px;">
    <a href="#" class="btn btn-green2" style="border-radius: 10px;"><i class="fa-solid fa-lock"></i> 임시 비밀번호 발급</a>
    <a href="edit?companyName=${companyDto.companyName}" class="btn btn-green2" style="border-radius: 10px;"><i class="fa-regular fa-pen-to-square"></i> 개인정보 변경</a>
    <a href="delete?companyName=${companyDto.companyName}" class="btn btn-red" style="border-radius: 10px;"><i class="fa-solid fa-xmark"></i> 회원 탈퇴</a>
    <a href="#" class="btn btn-red" style="border-radius: 10px;"><i class="fa-solid fa-xmark"></i> 블랙리스트 등록</a>
    <a href="list" class="btn btn-blue" style="border-radius: 10px;"><i class="fa-solid fa-list-ul"></i> 리스트</a>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>