<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include> --><!-- 헤더 -->

<div class="container w-800">
    <div class="cell" style="margin: 10px; padding: 10px">

        <div class="cell">
            <h2><i class="fa-regular fa-user green"></i> 계정 정보</h2>
        </div>
        <hr style="border: 0; border-top: 1px solid rgb(196, 196, 196)">
        
        <div class="cell">
            <h3>이름</h3>
            <p>${memberDto.memberName}</p>
        </div>

        <div class="cell">
            <h3>연락처</h3>
            <p>010-0000-0000</p>
        </div>

        <div class="cell">
            <h3>이메일</h3>
            <p>${memberDto.memberEmail}</p>
        </div>

        <div class="cell">
            <h3>주소</h3>
            <p>${memberDto.memberPost}</p>
            <p>${memberDto.memberAddress1}</p>
            <p>${memberDto.memberAddress2}</p>
        </div>
    </div>
    
    <hr style="border: 0; border-top: 1px solid rgb(196, 196, 196)"><br>

    <div class="cell center" style="margin: 10px; padding: 10px;">
        <button type="button" class="btn btn-green2" style="border-radius: 10px;"><i class="fa-solid fa-pen-to-square"></i> 정보 수정</button>
        <button type="button" class="btn btn-green2" style="border-radius: 10px;"><i class="fa-solid fa-lock"></i> 비밀번호 변경</button>
        <button type="button" class="btn btn-green2" style="border-radius: 10px;"><i class="fa-solid fa-house"></i> 메인</button>
    </div>
</div>

<!-- <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include> --><!-- 푸터 -->