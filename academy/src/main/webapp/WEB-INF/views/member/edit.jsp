<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      	border-color: #5fe075;
    	outline: none;
   	}
	.selectBox {
		width: 300px;
		margin: 5px;
		padding: 5px;
	}
	
</style>


<form action="edit" method="post">
<script type="text/javascript">
$(function() {
	// 정보 수정 완료 버튼 클릭 시
	$(".btn-edit-complete").click(function() {
		window.location.href = "/member/mypage";
	});
	
	// 정보 수정 취소 버튼 클릭 시
	$(".btn-edit-cancel").click(function() {
		window.location.href = "/member/mypage";
	});
	
});
</script>

<form action="/member/edit" method="post">
    <div class="container w-800">
        <div class="cell">
            <div class="cell">
                <h2><i class="fa-regular fa-user green"></i> 계정 정보 수정</h2>
            </div>
            
            <!-- 생년월일 항목 삭제하여 주석처리 해 놓음 -->
            <%-- 
            <label><i class="fa-solid fa-angle-right"></i> 생년월일</label>
                <input type="date" name="memberBirth" value="${memberDto.memberBirth}" ><br><br> 
            --%>
            <label><i class="fa-solid fa-angle-right"></i> 연락처</label>
                <input type="tel" name="memberContact" value="${memberDto.memberContact}" class="field"><br><br>
            <label><i class="fa-solid fa-angle-right"></i> 이메일</label>
                <input type="email" name="memberEmail" value="${memberDto.memberEmail}" class="field"><br><br>
            <label><i class="fa-solid fa-angle-right"></i> 주소</label><br>
		       <div class="cell left">
           	        <input type="text" name="memberPost" size="14" maxlength="6" class="field"  value="${memberDto.memberPost}">
                    <button type="button" class="btn btn-neutral btn-address-search">
                     <i class="fa-solid fa-magnifying-glass"></i>
                  	 </button>
                    <button type="button" class="btn btn-negative btn-address-clear" style="display: none;">
                        <i class="fa-solid fa-xmark"></i>
                    </button>
                </div>
				<div class="cell">
                    <input type="text" name="memberAddress1" value="${memberDto.memberAddress1}"  class="field" size="40" maxlength="60">
                </div>
                <div class="cell">
                    <input type="text" name="memberAddress2" value="${memberDto.memberAddress2}"  class="field" size="40" maxlength="60">
                </div>
       
            <label><i class="fa-solid fa-angle-right"></i> 관심 산업</label><br>
            	<select id="firstSelect" onchange="updateSecondSelect()" class="selectBox field" name="memberIndustry">
		                <option value="">1차 직종 선택</option>
		                <option value="dev">개발</option>
		                <option value="edu">교육</option>
		                <option value="fin">금융/재무</option>
		                <option value="pm">기획/경영</option>
		                <option value="data">데이터</option>
		                <option value="design">디자인</option>
		                <option value="mr">마케팅/시장조사</option>
		                <option value="mp">미디어/홍보</option>
		                <option value="legal">법률/법무</option>
		                <option value="mf">생산/제조</option>
		                <option value="qc">생산관리/품질관리</option>
		                <option value="sv">서비스/고객지원</option>
		                <option value="eng">엔지니어링</option>
		                <option value="rd">연구개발</option>
		                <option value="db">영업/제휴</option>
		                <option value="b2b">유통/무역</option>
		                <option value="med">의약</option>
		                <option value="hr">인사/총무</option>
		                <option value="pro">전문직</option>
		                <option value="csr">특수계층/공공</option>
	            	</select><br>
            <label><i class="fa-solid fa-angle-right"></i> 관심 직종</label><br>
				<select id="secondSelect" class="selectBox field" name="memberJob">
					<option value="">2차 직종 선택</option>
				</select><br><br>
            	
            <label><i class="fa-solid fa-angle-right"></i> 비밀번호 확인</label>
                <input type="password" name="memberPw" value="${memberDto.memberPw}" class="field"><br>
        </div>
        
        <div class="cell">
            <button type="submit" class="btn-edit-complete btn btn-green2" style="border-radius: 10px;"><i class="fa-solid fa-user-pen"></i> 수정 완료</button>
            <button type="button" class="btn-edit-cancel btn btn-red" style="border-radius: 10px;"><i class="fa-solid fa-xmark"></i> 취소</button>
        </div>
    </div>
    
	<c:if test="${param.error != null}">
		<h3 style="color:red">비밀번호가 일치하지 않습니다</h3>
	</c:if>
    
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>