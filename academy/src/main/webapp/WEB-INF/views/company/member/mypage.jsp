<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

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

<div class="container w-700" style="border:0; border-radius: 10px; background-color: rgb(238, 238, 238);">
	<div class="cell" style="margin: 30px; padding: 30px">
		
    	<div class="cell">
      		<h2><i class="fa-solid fa-building green"></i> 기업 회원 정보</h2>
        </div>
        
        <hr style="border: 0; border: 1px solid rgb(196, 196, 196)">

        <div class="cell" style="padding: 15px;">
            
        	<div class="cell">
         		<h3>기업명</h3>
                <p><i class="fa-solid fa-angle-right"></i> ${companyDto.companyName}</p>
            </div>
            
        <hr style="border: 0; border-top: 1px solid rgb(196, 196, 196)">
            
            <div class="cell">
                <h3>사업자 등록 번호</h3>
                <p><i class="fa-solid fa-angle-right"></i> ${memberDto.memberCrNumber}</p> 
            </div>
            
        <hr style="border: 0; border-top: 1px solid rgb(196, 196, 196)">
            
           	<div class="cell">
            	<h3>산업군 및 직종</h3>
                <p><i class="fa-solid fa-angle-right"></i> 산업군 : ${memberDto.memberIndustry}</p>
                <p><i class="fa-solid fa-angle-right"></i> 직종 : ${memberDto.memberJob}</p>
            </div>
            
       	<hr style="border: 0; border-top: 1px solid rgb(196, 196, 196)">
            
            <div class="cell">
                <h3>기업 주소</h3>
                <p><i class="fa-solid fa-angle-right"></i> 우편주소 : ${memberDto.memberPost}</p>
                <p><i class="fa-solid fa-angle-right"></i> 기본주소 : ${memberDto.memberAddress1}</p>
                <p><i class="fa-solid fa-angle-right"></i> 상세주소 : ${memberDto.memberAddress2}</p>
            </div>            

        <hr style="border: 0; border-top: 1px solid rgb(196, 196, 196)">
            
            <div class="cell">
                <h3>담당자 이름</h3>
                <p><i class="fa-solid fa-angle-right"></i> ${memberDto.memberName}</p>
            </div>
        
        <hr style="border: 0; border-top: 1px solid rgb(196, 196, 196)">
            
            <div class="cell">
                <h3>담당자 직책</h3>
                <p><i class="fa-solid fa-angle-right"></i> ${memberDto.memberPosition}</p>
            </div>
            
        <hr style="border: 0; border-top: 1px solid rgb(196, 196, 196)">
            
            <div class="cell">
               	<h3>연락처</h3>
                <p><i class="fa-solid fa-angle-right"></i> ${memberDto.memberContact}</p>
            </div>
            
        <hr style="border: 0; border-top: 1px solid rgb(196, 196, 196)">
        
            <div class="cell">
                <h3>이메일</h3>
                <p><i class="fa-solid fa-angle-right"></i> ${memberDto.memberEmail}</p>
            </div>
            
        </div>
        
    <hr style="border: none; border: 1px solid rgb(196, 196, 196)">
	
        <div class="cell">
        <!-- <button type="button" class="btn-addCompany btn btn-green2" style="border-radius: 10px;"><i class="fa-solid fa-pen-to-square"></i> 회사등록</button> -->    
        <div class="cell" style="display: inline-block; width: 75%; text-align: left;">
        	<button type="button" class="btn-main btn btn-green2" style="border-radius: 10px;"><i class="fa-solid fa-house"></i> 메인</button>
        	<button type="button" class="btn-edit btn btn-green2" style="border-radius: 10px;"><i class="fa-solid fa-pen-to-square"></i> 정보수정</button>
        	<button type="button" class="btn-changePw btn btn-green2" style="border-radius: 10px;"><i class="fa-solid fa-lock"></i> 비밀번호 변경</button>
        </div>
        <div class="cell" style="display: inline-block; width: 24%; text-align: right;">
        	<button type="button" class="btn-delete btn btn-red" style="border-radius: 10px;">회원탈퇴</button>
        </div>
    </div> 

    </div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>