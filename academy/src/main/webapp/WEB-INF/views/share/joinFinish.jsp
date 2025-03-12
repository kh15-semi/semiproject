<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="container w-500 center" style="border: none; border-radius: 10px; background-color: rgb(241, 241, 241); padding: 40px;">
    <div class="cell">
        <h2>회원 가입이 완료 되었습니다!</h2>
    </div>
    <div class="cell mt-50">
    	<h4>${memberDto.memberName} 회원님</h4>
    </div>
    <div class="cell" style="color: #343536">
    	<p>회원가입을 진심으로 환영합니다.</p>
    </div>
    <div class="cell mt-20">
        <a href="/share/login" class="btn btn-green2" style="border-radius: 10px;"><i class="fa-solid fa-arrow-right-to-bracket"></i> 로그인</a>
        <a href="/" class="btn btn-green2" style="border-radius: 10px;"><i class="fa-solid fa-house"></i> 메인</a>
    </div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>