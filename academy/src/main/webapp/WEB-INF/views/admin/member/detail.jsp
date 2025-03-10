<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="container w-600">
	<div class="cell" style="margin: 10px; padding: 10px">
	
	    <div class="cell">
	        <h2><i class="fa-regular fa-user"></i> 회원 상세 정보</h2>
	    </div>
		    
	    <div class="cell">
	        <h3>아이디</h3>
	        <p>${memberDto.memberId}</p>
	    </div>
	    
	    <div class="cell">
	        <h3>이름</h3>
	        <p>${memberDto.memberName}</p>
	    </div>
	
	   <div class="cell">
	        <h3>연락처</h3>
	        <p>${memberDto.memberContact}</p>
	    </div>
		
	    <div class="cell">
	        <h3>이메일</h3>
	        <p>${memberDto.memberEmail}</p>
	    </div>
		
	    <div class="cell">
	        <h3>주소</h3>
	        <p>(${memberDto.memberPost})</p>
	        <p>${memberDto.memberAddress1}</p>
	        <p>${memberDto.memberAddress2}</p>
	    </div>
	     
	    <div class="cell">
	        <h3>회원 등급</h3>
	        <p>${memberDto.memberType}</p>
	    </div>
	    
	    <div class="cell">
	        <h3>가입일시</h3>
	        <p>
	        	<fmt:formatDate value="${memberDto.memberJoin}" pattern="y년 M월 d일 a h시 m분 s초"/>
	        </p>
	    </div>	    

<div class="cell center" style="margin: 10px; padding: 10px;">
    <a href="#" class="btn btn-green2" style="border-radius: 10px;"><i class="fa-solid fa-lock"></i> 임시 비밀번호 발급</a>
    <a href="edit?memberId=${memberDto.memberId}" class="btn btn-green2" style="border-radius: 10px;"><i class="fa-regular fa-pen-to-square"></i> 개인정보 변경</a>
    <a href="delete?memberId=${memberDto.memberId}" class="btn btn-red" style="border-radius: 10px;"><i class="fa-solid fa-xmark"></i> 회원 탈퇴</a>
    <a href="#" class="btn btn-red" style="border-radius: 10px;"><i class="fa-solid fa-xmark"></i> 블랙리스트 등록</a>
    <a href="list" class="btn btn-blue" style="border-radius: 10px;"><i class="fa-solid fa-list-ul"></i> 리스트</a>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>