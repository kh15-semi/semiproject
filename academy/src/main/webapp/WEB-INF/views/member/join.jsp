<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!-- Lightpick 라이브러리 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/lightpick@1.6.2/css/lightpick.min.css">
<script src="https://cdn.jsdelivr.net/npm/moment@2.30.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/lightpick@1.6.2/lightpick.min.js"></script>

<!-- kakao post api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/js/member/join.js" ></script>
<script src="/js/job_select.js"></script>

<style>
	.field {
		border-radius: 10px;
		border-color: #ebecee;
	}
	 .btn-login {
	 	border: 0;
	    background-color: white;
	    font-size: 13px;
	    font-weight: 600;
	    color: #32AA46;	
	}
	.selectBox {
		border:none;
		width: 200px;
		padding: 5px;
		font-weight: 700;
	}
	
</style>
<form action="" method="post" enctype="multipart/form-data" autocomplete="off">
	<div class="container w-500" style="border:0; border-radius: 10px; background-color: rgb(238, 238, 238);">
        <div class="cell center">
        	<img src="/images/jobplanet_logo.png" width="250px">
        </div>
        <!-- <div class="cell flex-box p-10">
            <a href="#" class="btn btn-individual w-50">개인회원</a>
            <a href="#" class="btn btn-enterprise w-50">기업회원</a>
        </div> -->
        
        <div class="cell center p-10">

            <div class="cell left m-10">
                <h3>회원가입</h3>
            </div>

            <div class="cell" style="padding: 5px;">
                <div class="cell">
                    <input type="text" name="memberId" class="field w-100" placeholder="아이디">
                </div>
                <div class="cell">
                    <input type="password" name="memberPw" class="field w-100" placeholder="비밀번호 (10자리 이상)">
                </div>
                <div class="cell">
                    <input type="password" name="memberPwCheck" class="field w-100" placeholder="비밀번호 확인">
                </div>
                <div class="cell">
                    <input type="text" name="memberName" class="field w-100" placeholder="이름">
                </div>
                <div class="cell">
                    <input type="tel" name="memberContact" class="field w-100" placeholder="연락처">
                </div>
                <div class="cell">
                    <input type="email" name="memberEmail" class="field w-100" placeholder="이메일 주소">
                </div>
                <div class="cell left">
                    <input type="text" name="memberPost" size="14" maxlength="6" class="field" placeholder="우편번호" readonly>
                    <button type="button" class="btn btn-neutral btn-address-search">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </button>
                    <button type="button" class="btn btn-negative btn-address-clear" style="display: none;">
                        <i class="fa-solid fa-xmark"></i>
                    </button>
                </div>
                <div class="cell">
                    <input type="text" name="memberAddress1" class="field w-100" placeholder="기본주소" readonly>
                </div>
                <div class="cell">
                    <input type="text" name="memberAddress2" class="field w-100" placeholder="상세주소" readonly>
                </div>
            </div>

	 		<div class="cell left">
	            <label for="firstSelect">* </label>
	            <select id="firstSelect" onchange="updateSecondSelect()" class="selectBox">
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
	        
	            <label for="secondSelect"></label>
	            <select id="secondSelect" class="selectBox">
	                <option value="">2차 직종 선택</option>
	            </select>
	        </div>
            
            
            <div class="cell mt-30 mb-30">
                <button class="btn btn-green2 w-100" style="border-radius: 10px"><i class="fa-solid fa-arrow-right-to-bracket"></i>&nbsp;&nbsp;개인 회원가입</button>
            </div>
            <hr>
            <p class="cell center mt-20">
                이미 회원이세요?&nbsp;
                <a href="/member/login" class="btn btn-login" style="border-radius: 10px;" src="/member/login">로그인</a>
            </p>
        </div>
    </div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>