<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!-- Lightpick 라이브러리 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/lightpick@1.6.2/css/lightpick.min.css">
<script src="https://cdn.jsdelivr.net/npm/moment@2.30.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/lightpick@1.6.2/lightpick.min.js"></script>

<!-- font awesome cdn -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- kakao post api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/js/member/login.js" ></script>
<script src="/js/job_select.js"></script>

<style>
	label {
		accent-color: #479081;
  	}
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

<form action="login" method="post" class = "form-login">

	<div class="container center w-400" style="border: none; border-radius: 15px; margin:10px auto; padding: 20px;  background:linear-gradient(0deg, rgba(255,255,255,1) 0%, rgba(82,185,113,0.4204379562043795) 100%);">
        <div class="cell">
            <a href="/">
                <img src="/images/semi_logo.png" width="200px"><br>
            </a>
            <p style="margin-top: 0; padding-bottom: 30px; font-size: 14px; color: #636e72;">
            회원님의 익명성을 보장하기 위해<br>
            어떠한 개인 정보도 노출하지 않습니다.
        	</p>
    	</div>
    	<div class="cell">
        	<div class="cell left">
            	<h3>로그인</h3>
        	</div>
        		<hr>
        	<div class="cell">
            	<input type="text" name="memberId" placeholder="아이디" class="field w-100 mt-10" style="border-radius: 10px;" autocomplete="off"
            			value="${cookie.saveId.value}">
        	</div>
        	<div class="cell">
            	<input type="password" name="memberPw"  placeholder="비밀번호" class="field w-100" style="border-radius: 10px;">
    			<c:if test="${param.error != null}">
					<div class="cell center red" style="font-size: 13px">
						존재하지 않는 아이디거나 비밀번호가 일치하지 않습니다.
					</div>
				</c:if>
        	</div>
        	<button type="submit" class="btn btn-green1 field w-100 mt-10" style="border-radius: 10px; font-weight: 700;">
            	<i class="fa-solid fa-arrow-right-to-bracket"></i> 로그인
            </button>
        	<div class="cell" style="display: flex; justify-content: space-between; width: 100%;">
           		<label>
           			<input type="checkbox" name="remember"
           					${cookie.saveId !=null ? 'checked' : ''}>
           			<span>아이디 기억하기</span>
           		</label>
        	</div>
        	<hr>
        	<div class="cell">
            	<p>아직 회원이 아니세요? &nbsp;&nbsp;<a href="/member/join" style="text-decoration: none; color: #479081; font-weight: 800;">회원가입</a></p>
        	</div>
    	</div>
    	
    	
	</div>
	
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>