<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!-- google font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

<!-- font awesome cdn -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<div class="container w-800">
        <div class="cell" style="margin: 10px; padding: 10px">

            <div class="cell">
                <h2><i class="fa-solid fa-building green"></i> 계정 정보(기업 회원) </h2>
            </div>
            <hr style="border: 0; border-top: 1px solid rgb(196, 196, 196)">

            <div class="cell" style="padding: 5px;">
                <label style="font-weight: 500; color: grey">* 기업 정보</label>
                <div class="cell">
                    <h3>기업명</h3>
                    <p>${memberDto.companyName}</p>
                </div>
                <div class="cell">
                    <h3>사업자 등록 번호</h3>
                    <p>${memberDto.companyNo}</p>
                </div>
                <div class="cell">
                    <h3>산업군  및 직종</h3>
                    <p>${memberDto.memberIndustry}</p>
                    <p>${memberDto.memberJob}</p>
                </div>
                <div class="cell">
                    <h3>기업 주소</h3>
                    <p>${memberDto.memberPost}</p>
                    <p>${memberDto.memberAddress1}</p>
                    <p>${memberDto.memberAddress2}</p>
                </div>            
            </div>

            <hr style="border: 0; border-top: 1px solid rgb(196, 196, 196)"><br>
            <div class="cell" style="padding: 5px;">
                <label style="font-weight: 500; color: grey;">* 담당자 정보</label>
                <div class="cell">
                    <h3>이름</h3>
                    <p>${memberDto.memberName}</p>
                </div>
                <div class="cell">
                    <h3>이메일</h3>
                    <p>${memberDto.memberEmail}</p>
                </div>
                <div class="cell">
                    <h3>연락처</h3>
                    <p>${memberDto.memberContact}</p>
                </div>
                <div class="cell">
                    <h3>직책</h3>
                    <p>${memberDto.memberPosition}</p>
                </div>

        </div>
        
        <hr style="border: 0; border-top: 1px solid rgb(196, 196, 196)"><br>

        <div class="cell center" style="margin: 10px; padding: 10px;">
        	<a href="/company/mypage/edit">
            	<button type="button" class="btn btn-green2" style="border-radius: 10px;"><i class="fa-solid fa-pen-to-square"></i> 정보 수정</button>
        	</a>
            	<button type="button" class="btn btn-green2" style="border-radius: 10px;"><i class="fa-solid fa-lock"></i> 비밀번호 변경</button>
            	<button type="button" class="btn btn-red" style="border-radius: 10px;"><i class="fa-solid fa-exclamation"></i> 계정삭제</button>
            	<button type="button" class="btn btn-green2" style="border-radius: 10px;"><i class="fa-solid fa-house"></i> 메인</button>
        </div>
    </div>
</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>