<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script type="text/javascript">
$(function() {
	// 정보 수정 버튼 클릭 시
	$(".btn-edit").click(function() {
		window.location.href = "/member/edit";
	});

	// 비밀번호 변경 버튼 클릭 시
	$(".btn-changePw").click(function() {
		window.location.href = "/share/password";
	});
	
	// 계정삭제 버튼 클릭 시
	$(".btn-delete").click(function() {
		window.location.href = "/share/exit";
	});

	// 메인 버튼 클릭 시
	$(".btn-main").click(function() {
		window.location.href = "/";
	});
	
	
	
	// 회사등록 버튼 클릭 시
	/* 
	$(".btn-addCompany").click(function() {
		window.location.href = "/member/addCompany";
	}); 
	*/
	
});
</script>
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
            <p>${memberDto.memberContact}</p>
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
       
       <div>     
            <!-- 관심산업/직종 추가 -->
            <h3>관심 산업 및 직종</h3>
            <p>${memberDto.memberIndustry}</p>
            <p>${memberDto.memberJob}</p>
            <!-- 관심산업/직종 추가 -->
        </div>
        
    </div>
    
    <hr style="border: 0; border-top: 1px solid rgb(196, 196, 196)"><br>

    <div class="cell center" style="margin: 10px; padding: 10px;">
        <!-- <button type="button" class="btn-addCompany btn btn-green2" style="border-radius: 10px;"><i class="fa-solid fa-pen-to-square"></i> 회사등록</button> -->    
        <button type="button" class="btn-edit btn btn-green2" style="border-radius: 10px;"><i class="fa-solid fa-pen-to-square"></i> 정보 수정</button>
        <button type="button" class="btn-changePw btn btn-green2" style="border-radius: 10px;"><i class="fa-solid fa-lock"></i> 비밀번호 변경</button>
        <button type="button" class="btn-delete btn btn-red" style="border-radius: 10px;"><i class="fa-solid fa-exclamation"></i> 계정삭제</button>
        <button type="button" class="btn-main btn btn-green2" style="border-radius: 10px;"><i class="fa-solid fa-house"></i> 메인</button>
    </div> 
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>