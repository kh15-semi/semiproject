<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!-- Lightpick 라이브러리 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/lightpick@1.6.2/css/lightpick.min.css">
<script src="https://cdn.jsdelivr.net/npm/moment@2.30.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/lightpick@1.6.2/lightpick.min.js"></script>

<!-- kakao post api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
	            	</select>
            
				<select id="secondSelect" class="selectBox field" name="memberJob">
					<option value="">2차 직종 선택</option>
				</select><br>
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