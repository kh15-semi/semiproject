<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!-- google font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

<!-- font awesome cdn -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script type="text/javascript">
    $(function () {
        // 정보 수정 버튼 클릭 시
        $(".btn-edit").click(function() {
            window.location.href = "/company/member/edit";
        });

        // 비밀번호 변경 버튼 클릭 시
        $(".btn-changePw").click(function() {
            window.location.href = "/share/password";
        });

        // 계정 삭제 버튼 클릭 시
        $(".btn-delete").click(function() {
            window.location.href = "/share/exit";
        });

        // 메인 버튼 클릭 시
        $(".btn-main").click(function() {
            window.location.href = "/";
        });
    });
</script>
<div class="container w-800">
        <div class="cell" style="margin: 10px; padding: 10px">
            <div class="cell">
                <h2><i class="fa-solid fa-user blue"></i>&nbsp;기업 회원 정보</h2>
            </div>
            <hr style="border: none; border-top: 1px solid rgb(196, 196, 196)"><br>
            <div class="cell" >
               <div class="cell">
                   <h3><i class="fa-regular fa-square-check blue"></i>&nbsp;ID</h3>
                   <p>${memberDto.memberId}</p>
               </div>
               <div class="cell">
                   <h3><i class="fa-regular fa-square-check blue"></i>&nbsp;이름</h3>
                   <p>${memberDto.memberName}</p>
               </div>
               <div class="cell">
                   <h3><i class="fa-regular fa-square-check blue"></i>&nbsp;이메일</h3>
					<c:choose>
					    <c:when test="${empty memberDto.memberEmail}">
					        <p>이메일 미등록</p>
					    </c:when>
					    <c:otherwise>
					        <p>${memberDto.memberEmail}</p>
					    </c:otherwise>
					</c:choose>
               </div>
               <div class="cell">
                   <h3><i class="fa-regular fa-square-check blue"></i>&nbsp;연락처</h3>
					<c:choose>
					    <c:when test="${empty memberDto.memberContact}">
					        <p>연락처 미등록</p>
					    </c:when>
					    <c:otherwise>
					        <p>${memberDto.memberContact}</p>
					    </c:otherwise>
					</c:choose>
               </div>
               <div class="cell">
                   <h3><i class="fa-regular fa-square-check blue"></i>&nbsp;직책</h3>
					<c:choose>
					    <c:when test="${empty memberDto.memberPosition}">
					        <p>미등록</p>
					    </c:when>
					    <c:otherwise>
					        <p>${memberDto.memberPosition}</p>
					    </c:otherwise>
					</c:choose>
               </div>
        	</div>
        <br>
        <hr style="border: none; border-top: 1px solid rgb(196, 196, 196)"><br>
        <div class="cell center" style="margin: 10px; padding: 10px;">
            <button type="button" class="btn-edit btn btn-green2" style="border-radius: 10px;"><i class="fa-solid fa-pen-to-square"></i> 정보 수정</button>
	        <button type="button" class="btn-changePw btn btn-green2" style="border-radius: 10px;"><i class="fa-solid fa-lock"></i> 비밀번호 변경</button>
	        <button type="button" class="btn-delete btn btn-red" style="border-radius: 10px;"><i class="fa-solid fa-exclamation"></i> 계정삭제</button>
	        <button type="button" class="btn-main btn btn-green2" style="border-radius: 10px;"><i class="fa-solid fa-house"></i> 메인</button>
        </div>
    </div>
</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>