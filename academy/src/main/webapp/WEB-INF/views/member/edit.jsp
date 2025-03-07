<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

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
                <input type="tel" name="memberContact" value="${memberDto.memberContact}" ><br><br>
            <label><i class="fa-solid fa-angle-right"></i> 이메일</label>
                <input type="email" name="memberEmail" value="${memberDto.memberEmail}" ><br><br>
            <label><i class="fa-solid fa-angle-right"></i> 주소</label><br>
                <input type="text" name="memberPost" value="${memberDto.memberPost}" class="field" ><br>
                <input type="text" name="memberAddress1" value="${memberDto.memberAddress1}" class="field" ><br>
                <input type="text" name="memberAddress2" value="${memberDto.memberAddress2}" class="field" ><br><br>
            
            <!-- 관심산업/직종 추가 -->
            <label><i class="fa-solid fa-angle-right"></i> 관심 산업</label><br>
            	<input type="text" name="memberIndustry" value="${memberDto.memberIndustry}" class="field" ><br>
            <label><i class="fa-solid fa-angle-right"></i> 관심 직종</label><br>
            	<input type="text" name="memberJob" value="${memberDto.memberJob}" class="field" ><br>
            <!-- 관심산업/직종 추가 -->	
            	
            <label><i class="fa-solid fa-angle-right"></i> 비밀번호 확인</label>
                <input type="password" name="memberPw" value="${memberDto.memberPw}"><br>
        </div>
        
        <div class="cell">
            <button type="submit" class="btn-edit-complete btn btn-green2" style="border-radius: 10px;"><i class="fa-solid fa-user-pen"></i> 수정 완료</button>
            <button type="button" class="btn-edit-cancel btn btn-red" style="border-radius: 10px;"><i class="fa-solid fa-xmark"></i> 취소</button>
        </div>
    </div>
    
	<c:if test="${param.error != null}">
		<h3 style="color:red">비밀번호가 일치하지 않습니다</h2>
	</c:if>
    
</form>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>