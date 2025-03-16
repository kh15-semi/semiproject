<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!-- google font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

<!--  font awesome cdn -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
	.field {
		border-radius: 10px;
		border-color: #ebecee;
	}
	.field:focus {
     	border-radius: 10px;
      	border-color: #57ad9c;
    	outline: none;
   	}
</style>

<form action="exit" method="post">

<div class="container w-400" style="border:0; border-radius: 10px; padding: 20px;">
	<div class="cell center">
    	<h2>회원 탈퇴</h2>
    	<p style="margin-top: 0; padding-bottom: 30px; font-size: 14px; color: #636e72;">
            회원님의 개인정보를 보호하기 위해<br>
            탈퇴 시 모든 개인정보는 삭제 됩니다.
        </p>
    </div>
    <div class="cell center">
        <p><i class="fa-solid fa-exclamation red"></i> 회원 탈퇴를 위해 계정 비밀번호를 입력해주세요</p>
    </div>
    <div class="cell center mt-20">
    	<input type="password" name="memberPw" class="field w-75" placeholder="* 비밀번호 입력">
        <button class="btn btn-green2">확인</button>
    </div>
    <c:if test="${param.error != null}">
		<div class="cell center mt-20" style="color:#d63031"><i class="fa-solid fa-circle-exclamation red"></i> 비밀번호가 일치하지 않아요</div>
	</c:if>
</div>

</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>