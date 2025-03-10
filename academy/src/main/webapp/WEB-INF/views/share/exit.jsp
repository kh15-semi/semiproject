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

<form action="exit" method="post">
<div class="container w-600" style="border:0; border-radius: 10px; background-color: rgb(238, 238, 238);  padding: 20px;">
        <div class="cell center">
            <h2>비밀번호 확인</h2>
            <p>회원 탈퇴를 위해 계정 비밀번호를 입력해주세요</p>
        </div>
        <div class="cell center">
            <input type="password" name="memberPw">
            <button class="btn btn-green2">확인</button>
        </div>
        
        <c:if test="${param.error != null}">
			<h2 style="color:red">비밀번호가 일치하지 않습니다</h2>
		</c:if>

        <hr>

        <div class="cell">
            <h2>가입 이메일로 확인 메일이 발송되었어요</h2>
        </div>
        <div class="cell mb-50" style="color: #04a052;">
            <p>이메일에 있는 링크 주소로 들어 오셔야 탈퇴가 완료됩니다</p>
        </div>
        <div class="cell">
            <h4>Q.이메일이 오지 않아요</h4>
        </div>
        <div class="cell">
            <p>이메일 도착까지 시간이 다소 소요될 수 있습니다.<br>
                스팸 메일로 분류되어 있을 수 있으니 스팸 메일함도 확인해 주세요.<br>
            </p>
        </div>
        <div class="cell mt-20">
            <input type="text" name="" class="field" placeholder="인증번호 입력해주세요.">
            <button type="button" name="" class="btn btn-neutral">인증 확인</button>
        </div>
    </div>
</form>





<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>