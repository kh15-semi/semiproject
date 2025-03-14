<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!-- Lightpick 라이브러리 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/lightpick@1.6.2/css/lightpick.min.css">
<script src="https://cdn.jsdelivr.net/npm/moment@2.30.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/lightpick@1.6.2/lightpick.min.js"></script>

<!-- kakao post api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/js/member/join.js"></script>
<script src="/js/job_select.js"></script>

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
	.selectBox {
    border-radius: 10px;
    width: 50%;
  	padding: 5px;
    padding-left: 8px;
    box-sizing: border-box;
    display: block; /* 블록 요소로 변경하여 input과 동일한 동작 */
    height: 40px; /* input과 동일한 높이 설정 */
    line-height: normal; /* 기본 select의 정렬 문제 해결 */
	}
</style>

<script type="text/javascript">
$(function() {
	// 정보 수정 완료 버튼 클릭 시
	$(".btn-edit-complete").click(function() {
		window.location.href = "company/member/mypage";
	});
	
	// 정보 수정 취소 버튼 클릭 시
	$(".btn-edit-cancel").click(function() {
		window.location.href = "/company/member/mypage";
	});
});
</script>


<form action="/company/member/edit" method="post">
	<input type="hidden" name="memberIndustry" value="${memberDto.memberIndustry}" class="field">
	<input type="hidden" name="memberJob" value="${memberDto.memberJob}" class="field">
	<input type="hidden" name="memberPost" value="${memberDto.memberPost}" class="field">
	<input type="hidden" name="memberAddress1" value="${memberDto.memberAddress1}" class="field">
	<input type="hidden" name="memberAddress2" value="${memberDto.memberAddress2}" class="field">
	<input type="hidden" name="memberCrNumber" value="${memberDto.memberCrNumber}" class="field">
	<div class="container w-700">
        <div class="cell" style="margin: 30px; padding: 30px">
            <div class="cell">
          	  <h2><i class="fa-solid fa-user blue"></i>&nbsp;회원 정보 수정 (기업 회원)</h2>
            </div>
            <hr>
            <div class="cell">
               <div class="cell">
                    <h3>ID</h3>
                    <input type="text" name="memberID" class="field" size="30" style="border-radius: 10px;" value="${memberDto.memberId}" readonly>
                </div>
                
                <div class="cell">
                    <h3>이름</h3>
                    <input type="text" name="memberName" class="field" size="30" style="border-radius: 10px;" value="${memberDto.memberName}" readonly>
                </div>
				
                <div class="cell">
                    <h3>E-mail</h3>
                    <input type="email" name="memberEmail" class="field" size="50" style="border-radius: 10px;" value="${memberDto.memberEmail}">
                </div>

			    <div class="cell">
			        <h3>연락처</h3>
			        <input type="tel" name="memberContact" class="field" size="30" style="border-radius: 10px;" value="${memberDto.memberContact}">
			    </div>
                
                <div class="cell">
                    <h3>직책</h3>
                    <input type="text" name="memberPosition" class="field" size="20" style="border-radius: 10px;" value="${memberDto.memberPosition}">
                </div>
                
                <div class="cell">
                    <h3>비밀번호 확인</h3>
                    <input type="password" name="memberPw" class="field" style="border-radius: 10px;" value="${memberDto.memberPw}">
                    <div class="fail-feedback">비밀번호가 맞지 않습니다. 다시 한번 확인해주세요.</div>
                </div>
          	</div>
          	<br><hr>
            <div class="cell center">
				<button type="submit" class="btn-edit-complete btn btn-green2" style="border-radius: 10px;"><i class="fa-solid fa-user-pen"></i> 수정완료</button>
               <button type="button" class="btn-edit-cancel btn btn-red" style="border-radius: 10px;"><i class="fa-solid fa-xmark"></i> 취소</button>
            </div>
        </div>
    </div>
</form>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>