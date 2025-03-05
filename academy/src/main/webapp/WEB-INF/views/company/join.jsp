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

<script src="/js/member/join.js"></script>

<script>
    $(document).ready(function() {
        $("#companyNo").on("blur", function() {  // 'blur' 이벤트 사용
            var crNumber = $(this).val();
            console.log("입력된 사업자 번호: " + crNumber);  // 입력된 값 확인
            if (crNumber.length === 12) {  // 사업자 등록 번호는 12자리 (하이픈 포함)
                $.ajax({
                    url: "/company/join", // 요청 URL
                    type: "GET",
                    data: { crNumber: crNumber },  // 사업자 번호를 서버로 전송
                    success: function(response) {
                        console.log(response);  // 서버에서 받은 응답 확인
                        if (response && response.companyName) {
                            $("#memberName").val(response.companyName);  // 조회된 기업명을 'memberName' 텍스트 칸에 입력
                        } else {
                            $("#memberName").val("");  // 기업명이 없는 경우 텍스트 칸을 비운다
                        }
                    },
                    error: function() {
                        alert("기업명 조회에 실패했습니다.");
                    }
                });
            } else {
                $("#memberName").val("");  // 사업자 등록 번호가 12자리가 아닌 경우
            }
        });
    });
</script>



<script src="/js/member/join.js" ></script>
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
</style>



<form action="" method="post" enctype="multipart/form-data" autocomplete="off">
    <div class="container w-400" style="border:0; border-radius: 10px; background-color: rgb(238, 238, 238);">
        <div class="cell center">
            <a href="#">
                <img src="/images/jobplanet_logo.png" class="logo w-250">
            </a>

			<img src="/images/jobplanet_logo.png" width="250px">

        </div>
        
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
            </div>

            <div class="cell" style="padding: 5px;">
                <div class="cell">
                    <input type="text" name="companyName" class="field w-100" placeholder="기업명">
                </div>
                <div class="cell">
                    <select name="memberIndustry" class="field w-100">
                        <option value="">산업군</option>
                    </select>
                </div>
                <div class="cell">
                    <select name="memberJob" class="field w-100">
                        <option value="">직종</option>
                    </select>
                </div>
                <div class="cell">
                    <input type="text" id="companyNo" name="companyNo" class="field w-100" placeholder="사업자 등록 번호">
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

            <div class="cell" style="padding: 5px;">
                <div class="cell">
                    <input type="text" id="memberName" name="memberName" class="field w-100" placeholder="담당자 이름 (실명)">
                </div>
                <div class="cell">
                    <input type="text" name="memberEmail" class="field w-100" placeholder="명함에 기재된 이메일 주소">
                </div>
                <div class="cell">
                    <input type="tel" name="memberContact" class="field w-100" placeholder="연락처">
                </div>
                <div class="cell">
                    <input type="text" name="memberPosition" class="field w-100" placeholder="직책">
                </div>
            </div>

            <div class="cell mt-30 mb-30">
                <button class="btn btn-green2 w-100" style="border-radius: 10px"><i class="fa-solid fa-arrow-right-to-bracket"></i>&nbsp;&nbsp;기업회원 가입하기</button>
            </div>
            <hr>
            <p class="cell center mt-20">
                이미 기업 회원이세요?&nbsp;
                <a href="/member/login" class="btn btn-login" style="border-radius: 10px;" src="/member/login">로그인</a>
            </p>
        </div>
    </div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
