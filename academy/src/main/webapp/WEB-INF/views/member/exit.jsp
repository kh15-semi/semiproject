<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="container w-600">
        <div class="cell center">
            <h2>비밀번호 확인</h2>
            <p>회원 탈퇴를 위해 계정 비밀번호를 입력해주세요</p>
        </div>
        <div class="cell center">
            <input type="password" name="memberPw">
            <button class="btn btn-green2">확인</button>
        </div>
</div>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>