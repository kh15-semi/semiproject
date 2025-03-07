<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<script src="/js/job_select.js"></script>
<script type="text/javascript">
$(function() {
	// 정보 수정 취소 버튼 클릭 시
	$(".btn-edit-cancel").click(function() {
		window.location.href = "/company/member/mypage";
	});
});
</script>

<form action="/company/member/edit" method="post">
<div class="container w-800">
        <div class="cell">
            <h2><i class="fa-solid fa-building green"></i> 계정 정보 수정 (기업회원)</h2>
        </div>
        <div class="cell">
            <p style="color: grey;">* 기업 정보</p>
            <div class="cell">
                <label><i class="fa-solid fa-angle-right"></i> 사업자 등록 번호</label>&nbsp;
                <input type="text" name="memberCrNumber" class="field" value="${memberDto.memberCrNumber}">
            </div>
            <div class="cell">
                <label><i class="fa-solid fa-angle-right"></i> 산업군 및 직종</label><br>
                <select style="border: 0; width: 200px;" class="field" name="memberIndustry">
                    <option>산업군</option>
                    <option>IT</option>
                    <option></option>
                    <option></option>
                </select>
                <select style="border: 0; width: 200px;" class="field" name="memberJob">
                    <option>직종</option>
                    <option>게임개발</option>
                    <option></option>
                    <option></option>
                </select>
            </div>
            <div class="cell">
                <label><i class="fa-solid fa-angle-right"></i> 기업 주소</label><br>
                <div class="cell">
                    <input type="text" name="memberPost" size="6" maxlength="6" class="field" value="${memberDto.memberPost}">
                    <button type="button" class="btn btn-blue"><i class="fa-solid fa-magnifying-glass"></i></button>
                    <button type="button" class="btn btn-red btn-address-clear" style="display: none;">
                        <i class="fa-solid fa-xmark"></i>
                    </button>
                </div>
                <div class="cell">
                    <input type="text" name="memberAddress1" class="field" style="width: 400px;" value="${memberDto.memberAddress1}">
                </div>
                <div class="cell">
                    <input type="text" name="memberAddress2" class="field" style="width: 400px;" value="${memberDto.memberAddress2}">
                </div>
            </div>
        </div>
        <br>
        <hr>

        <div class="cell">
            <p style="color: grey;">
                * 담당자 정보
            </p>
            <div class="cell">
                <div class="cell">
                    <label><i class="fa-solid fa-angle-right"></i> 이메일</label>&nbsp;
                    <input type="email" name="memberEmail" class="field" value="${memberDto.memberEmail}">
                </div>

                <div class="cell">
                    <label><i class="fa-solid fa-angle-right"></i> 연락처</label>&nbsp;
                    <input type="tel" name="memberContact" class="field" value="${memberDto.memberContact}">
                </div>

                <div class="cell">
                    <label><i class="fa-solid fa-angle-right"></i> 직책</label>&nbsp;
                    <input type="text" name="memberPosition" class="field" value="${memberDto.memberPosition}">
                </div>
                <div class="cell">
                	<label><i class="fa-solid fa-angle-right"></i> 비밀번호 확인</label>
                	<input type="password" name="memberPw" value="${memberDto.memberPw}"><br>
                </div>
            </div>
        </div>
        <br>
        <div class="cell">
            <button type="submit" style="border-radius: 10px;" class="btn-edit-complete btn btn-green2"><i class="fa-solid fa-user-pen"></i> 수정 완료</button>
            <button type="button" style="border-radius: 10px;" class="btn-edit-cancel btn btn-red"><i class="fa-solid fa-xmark"></i> 취소</button>
        </div>
    </div>

</form>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>