<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!-- Lightpick 라이브러리 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/lightpick@1.6.2/css/lightpick.min.css">
<script src="https://cdn.jsdelivr.net/npm/moment@2.30.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/lightpick@1.6.2/lightpick.min.js"></script>

<!-- font awesome cdn -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- kakao post api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/js/member/join.js" ></script>
<script src="/js/job_select.js"></script>

<style>
    .selectBox {
    border-radius: 10px;
    border: 1px solid #ebecee;
    width: 100%;
    padding: 5px;
    box-sizing: border-box;
    display: block; /* 블록 요소로 변경하여 input과 동일한 동작 */
    height: 40px; /* input과 동일한 높이 설정 */
    line-height: normal; /* 기본 select의 정렬 문제 해결 */
	}
	.field {
		border-radius: 10px;
		border-color: #ebecee;
	}
	.field:focus {
     	border-radius: 10px;
      	border-color: #5fe075;
    	outline: none;
   	}
	.flex-between {
    	display: flex;
    	justify-content: space-between; /* 양쪽 정렬 */
    	align-items: center; /* 세로 중앙 정렬 */
    	width: 100%;
	}
	.left {
    	text-align: left;
	}
	.right {
    	text-align: right;
	}
</style>
<script>
$(function() {
    $("#memberCrNumber").on("blur", function() { 
        var crNumber = $(this).val();
        $.ajax({
            url: "/company/member/getCompanyName",
            type: "GET",
            data: { crNumber: crNumber },
            success: function(response) {
                if (response.companyName) {
                    $("#companyName").val(response.companyName);
                } else {
                    alert("해당 사업자 등록 번호로 기업명을 찾을 수 없습니다.");
                    $("#companyName").val("");
                }
            },
        });
    });
});
</script>

<form action="join" method="post" enctype="multipart/form-data" autocomplete="off">

    <div class="container w-500" style="border:0; border-radius: 10px; background-color: rgb(238, 238, 238);">
        
        <div class="cell center">
            <a href="/">
                <img src="/images/jobplanet_logo.png" width="250px">
            </a>
        </div>
        
        <div class="cell p-20">
            <div class="cell flex-between m-10">
        		<div class="left">
            		<h3>회원가입 (기업)</h3>
        		</div>
        		<div class="right me-20" style="color: #2d3436;">
            		<p>개인회원이신가요? &nbsp;&nbsp;<a href="/member/join" style="text-decoration: none; color: #32AA46; font-weight: 800;">개인회원</a></p>
        		</div>
    		</div>

        	<hr>
        	
            <div class="cell" style="padding: 5px;">
                <div class="cell">
                    <input type="text" name="memberId" class="field w-100" placeholder="아이디">
                    <div class="success-feedback">사용 가능한 아이디입니다.</div>
                    <div class="fail-feedback">영문 소문자로 시작하는 5~20글자 이내여야 합니다.</div>
                    <div class="fail2-feedback">이미 사용중인 아이디입니다.</div>
                </div>
                <div class="cell">
                    <input type="password" name="memberPw" class="field w-100" placeholder="비밀번호 (8자리 이상)">
                    <div class="success-feedback">비밀번호가 올바른 형식입니다.</div>
                    <div class="fail-feedback">8~16자로 영문 대 소문자, 숫자, 특수문자를 조합하여 사용하세요.</div>
                </div>
                <div class="cell">
                    <input type="password" id="memberPwCheck" class="field w-100" placeholder="비밀번호 확인">
                    <div class="success-feedback">비밀번호가 일치합니다.</div>
                    <div class="fail-feedback">비밀번호가 일치하지 않습니다.</div>
                    <div class="fail2-feedback">비밀번호를 먼저 형식에 맞게 작성하세요.</div>
                </div>
                <div class="cell">
                    <input type="text" id="memberName" name="memberName" class="field w-100" placeholder="담당자 이름 (실명)">
                    <div class="fail-feedback">이름을 입력해주세요.</div>
                    <div class="fail2-feedback">이름은 한글2~5글자로만 작성 가능합니다.</div>
                </div>
                <div class="cell">
                    <input type="text" name="memberEmail" class="field w-100" placeholder="명함에 기재된 이메일">
                </div>
                <div class="cell">
                    <input type="tel" name="memberContact" class="field w-100" placeholder="연락처">
                    <div class="fail-feedback">연락처를 작성해주세요.</div>
                </div>
                <div class="cell">
                    <input type="text" name="memberPosition" class="field w-100" placeholder="직책">
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
			    <p><i class="fa-solid fa-star-of-life red"></i> 필수 입력 사항</p>
            <div class="cell">
            	<input type="text" id="memberCrNumber" name="memberCrNumber" class="field w-100" placeholder="사업자 등록 번호">
           	</div>
           	<div class="cell">
    			<input type="text" id="companyName" name="companyName" class="field w-100" placeholder="기업명" value="${companyName}" readonly>
         	</div>
                
            <div class="cell">
	            <label for="firstSelect"></label>
				<div class="cell">
            		<select id="firstSelect" onchange="updateSecondSelect()" class="selectBox field" name="memberIndustry">
	                	<option value="">산업군 선택</option>
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
	                	<option value="">직종 선택</option>
	            	</select>
	        	</div>
            </div>
            
        </div>

            <div class="cell mt-10 mb-30">
                <button class="btn btn-green2 w-100" style="border-radius: 10px"><i class="fa-solid fa-arrow-right-to-bracket"></i>&nbsp;&nbsp;기업 회원가입</button>
            </div>
            <hr>
            <div class="cell center" style="color: #2d3436;">
            	<p>이미 회원이세요? &nbsp;&nbsp;<a href="/share/login" style="text-decoration: none; color: #32AA46; font-weight: 800;">로그인</a></p>
        	</div>
    	</div>
    </div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
