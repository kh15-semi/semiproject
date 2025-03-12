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
	<div class="container w-700" style="border:0; border-radius: 10px; background-color: rgb(238, 238, 238);">
        <div class="cell" style="margin: 30px; padding: 30px">
            <div class="cell">
                <h2><i class="fa-regular fa-user green"></i> 회원 정보 수정</h2>
            </div>
            
            <hr style="border: 0; border: 1px solid rgb(196, 196, 196)">
        <div class="cell" style="padding: 15px;">
            <div class="cell">
                <label><i class="fa-solid fa-angle-right"></i> 사업자 등록 번호</label>
                <div class="cell">
                	<input type="text" name="memberCrNumber" class="field" value="${memberDto.memberCrNumber}">
                </div>
                <label><i class="fa-solid fa-angle-right"></i> 산업군</label>
                <div class="cell">
            		<select id="firstSelect" onchange="updateSecondSelect()" class="selectBox field" name="memberIndustry">
		                <option value="">산업군 선택</option>
		                <option value="개발">개발</option>
		                <option value="교육">교육</option>
		                <option value="금융/재무">금융/재무</option>
		                <option value="기획/경영">기획/경영</option>
		                <option value="데이터">데이터</option>
		                <option value="디자인">디자인</option>
		                <option value="마케팅/시장조사">마케팅/시장조사</option>
		                <option value="미디어/홍보">미디어/홍보</option>
		                <option value="법률/법무">법률/법무</option>
		                <option value="생산/제조">생산/제조</option>
		                <option value="생산관리/품질관리">생산관리/품질관리</option>
		                <option value="서비스/고객지원">서비스/고객지원</option>
		                <option value="엔지니어링">엔지니어링</option>
		                <option value="연구개발">연구개발</option>
		                <option value="영업/제휴">영업/제휴</option>
		                <option value="유통/무역">유통/무역</option>
		                <option value="의약">의약</option>
		                <option value="인사/총무">인사/총무</option>
		                <option value="전문직">전문직</option>
		                <option value="특수계층/공공">특수계층/공공</option>
	            	</select>
                </div>
            	
            	<label><i class="fa-solid fa-angle-right"></i> 직종</label>
            	<div class="cell">
					<select id="secondSelect" class="selectBox field" name="memberJob">
						<option value="">직종 선택</option>
					</select>
            	</div>
          
               	<label><i class="fa-solid fa-angle-right"></i> 기업 주소</label>
                <div class="cell">
                    <input type="text" name="memberPost" size="6" maxlength="6" class="field" value="${memberDto.memberPost}">
                    <button type="button" class="btn btn-neutral btn-address-search">
                    	<i class="fa-solid fa-magnifying-glass"></i>
                    </button>
                    <button type="button" class="btn btn-negative btn-address-clear" style="display: none;">
                        <i class="fa-solid fa-xmark"></i>
                    </button>
                </div>
                <div class="cell">
                    <input type="text" name="memberAddress1" value="${memberDto.memberAddress1}" class="field" size="40" maxlength="60">
                </div>
                <div class="cell mb-30">
                    <input type="text" name="memberAddress2" value="${memberDto.memberAddress2}" class="field" size="40" maxlength="60">
                </div>
                
        	<hr style="border: 0; border-top: 1px solid rgb(196, 196, 196)">
        	
                <label><i class="fa-solid fa-angle-right mt-30"></i> 직책</label>
                <div class="cell">
                    <input type="text" name="memberPosition" class="field" value="${memberDto.memberPosition}">
                </div>

                <label><i class="fa-solid fa-angle-right"></i> 이메일</label>
                <div class="cell">
                	<input type="email" name="memberEmail" class="field" value="${memberDto.memberEmail}">
                </div>
              
                <label><i class="fa-solid fa-angle-right"></i> 연락처</label>
                <div class="cell mb-30">
                    <input type="tel" name="memberContact" class="field" value="${memberDto.memberContact}">
                </div>

            </div>
            
            <hr style="border: 0; border-top: 1px solid rgb(196, 196, 196)">
            
            <div class="cell mt-30">
            	<div class="cell">
                	<label><i class="fa-solid fa-angle-right red"></i> 비밀번호 확인</label>
            	</div>
                <input type="password" name="memberPw" value="${memberDto.memberPw}" class="field"><br>
                <div class="fail-feedback">비밀번호가 맞지 않습니다, 다시 한번 확인해주세요.</div>
            </div>
        </div>
                
           	<hr style="border: 0; border: 1px solid rgb(196, 196, 196)">
                
            <div class="cell right">
        		<div class="cell" style="display: inline-block; width: 50%; text-align: left;">
            		<button type="submit" class="btn-edit-complete btn btn-green2" style="border-radius: 10px;"><i class="fa-solid fa-user-pen"></i> 수정완료</button>
        		</div>
        		<div class="cell" style="display: inline-block; width: 49%; text-align: right;">
            		<button type="button" class="btn-edit-cancel btn btn-red" style="border-radius: 10px;"><i class="fa-solid fa-xmark"></i> 취소</button>
        		</div>
        	</div>
		</div>
		
	</div>
  
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>