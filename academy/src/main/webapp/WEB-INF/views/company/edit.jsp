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
<script type="text/javascript">

	$(function(){
		var status = {
				memberIndustry: false,
			ok: function() {
				return this.memberIndustry
			}
		};
		
		$("[name=memberIndustry]").blur(function() {
			$(this).removeClass("success fail fail2").addClass(isValid ? "success" : "fail");
			status.memberIndustry = isValid;
		});
		
	});
	
</script>


<form action="/company/edit" method="post" enctype="multipart/form-data" autocomplete="off">
	<input type="hidden" name="companyNo" value="${companyDto.companyNo}">
    <div class="container w-800">
        <div class="cell" style="margin: 10px; padding: 10px">
     	   <div class="cell">
          	  <h2><i class="fa-solid fa-building green"></i>&nbsp;업체 정보 수정</h2>
            </div>
            <hr>
            <div class="cell">      
                <div class="cell">
                    <h3>기업 이미지</h3>
                    <label style="color: rgb(143, 141, 141);">* 기업의 상표 혹은 업체 사진을 등록해 주세요</label><br>
                    <input type="file" name="attach" class="field" accept=".png, .jpg" style="border-radius: 10px;">
                </div>

                <div class="cell">
                    <h3>상호명</h3>
                    <input type="text" name="companyName" class="field" size="30" style="border-radius: 10px;" value="${companyDto.companyName}" readonly>
                </div>
				
				<div class="cell">
				    <h3>업체 연락처&nbsp;<label style="color: grey; font-size: 13px; font-weight: 500;">(* 담당자 연락처)</label></h3>
				    <input type="text" name="companyContact" class="field" size="20" style="border-radius: 10px;" value="${companyDto.companyContact}">
				</div>

				<div class="cell">
				    <h3>기업 홈페이지 URL</h3>
				    <input type="text" name="companyUrl" class="field" size="50" style="border-radius: 10px;" value="${companyDto.companyUrl}">
				</div>		

                <div class="cell">
                    <h3>사업자 등록번호</h3>
                    <input type="text" name="companyCrNumber" class="field" maxlength="12" oninput="inputCrNum(this)" style="border-radius: 10px;" value="${companyDto.companyCrNumber}" readonly>
                </div>

                <div class="cell">
                    <h3>산업군</h3>
                    <select id="firstSelect"  class="selectBox field" name="companyIndustry" style="width: 200px; border-radius: 10px; " disabled>
                        <option value="">관련 산업군 선택</option>
                        <option value="개발" <c:if test="${companyDto.companyIndustry eq '개발'}">selected</c:if>>개발</option>
                        <option value="교육" <c:if test="${companyDto.companyIndustry eq '교육'}">selected</c:if>>교육</option>
                        <option value="금융/재무" <c:if test="${companyDto.companyIndustry eq '금융/재무'}">selected</c:if>>금융/재무</option>
                        <option value="기획/경영" <c:if test="${companyDto.companyIndustry eq '기획/경영'}">selected</c:if>>기획/경영</option>
                        <option value="데이터" <c:if test="${companyDto.companyIndustry eq '데이터'}">selected</c:if>>데이터</option>
                        <option value="디자인" <c:if test="${companyDto.companyIndustry eq '디자인'}">selected</c:if>>디자인</option>
                        <option value="마케팅/시장조사" <c:if test="${companyDto.companyIndustry eq '마케팅/시장조사'}">selected</c:if>>마케팅/시장조사</option>
                        <option value="미디어/홍보" <c:if test="${companyDto.companyIndustry eq '미디어/홍보'}">selected</c:if>>미디어/홍보</option>
                        <option value="법률/법무" <c:if test="${companyDto.companyIndustry eq '법률/법무'}">selected</c:if>>법률/법무</option>
                        <option value="생산/제조" <c:if test="${companyDto.companyIndustry eq '생산/제조'}">selected</c:if>>생산/제조</option>
                        <option value="생산관리/품질관리" <c:if test="${companyDto.companyIndustry eq '생산관리/품질관리'}">selected</c:if>>생산관리/품질관리</option>
                        <option value="서비스/고객지원" <c:if test="${companyDto.companyIndustry eq '서비스/고객지원'}">selected</c:if>>서비스/고객지원</option>
                        <option value="엔지니어링" <c:if test="${companyDto.companyIndustry eq '엔지니어링'}">selected</c:if>>엔지니어링</option>
                        <option value="연구개발" <c:if test="${companyDto.companyIndustry eq '연구개발'}">selected</c:if>>연구개발</option>
                        <option value="영업/제휴" <c:if test="${companyDto.companyIndustry eq '영업/제휴'}">selected</c:if>>영업/제휴</option>
                        <option value="유통/무역" <c:if test="${companyDto.companyIndustry eq '유통/무역'}">selected</c:if>>유통/무역</option>
                        <option value="의약" <c:if test="${companyDto.companyIndustry eq '의약'}">selected</c:if>>의약</option>
                        <option value="인사/총무" <c:if test="${companyDto.companyIndustry eq '인사/총무'}">selected</c:if>>인사/총무</option>
                        <option value="전문직" <c:if test="${companyDto.companyIndustry eq '전문직'}">selected</c:if>>전문직</option>
                        <option value="특수계층/공공" <c:if test="${companyDto.companyIndustry eq '특수계층/공공'}">selected</c:if>>특수계층/공공</option>
                    </select>
                    <input type="hidden" name="companyIndustry" value="${companyDto.companyIndustry}">
                    <div class="fail-feedback">산업군을 선택해주세요</div>
                    <select id="secondSelect" class="selectBox field" name="companyJob" style="display: none;">
					<option value="2차 직종 선택">2차 직종 선택</option>
				</select><br>
            	</div>
                    
                <div class="cell">
                    <h3>기업 주소</h3>
                    <div class="cell left">
                        <input type="text" name="companyPost" size="14" maxlength="6" class="field" placeholder="우편번호" style="border-radius: 10px;" value="${companyDto.companyPost}">
                        <button type="button" class="btn btn-neutral btn-company-address-search">
                            <i class="fa-solid fa-magnifying-glass"></i>
                        </button>
                        <button type="button" class="btn btn-negative btn-company-address-clear" style="display: none;">
                            <i class="fa-solid fa-xmark"></i>
                        </button>
                    </div>
                    <div class="cell">
                        <input type="text" name="companyAddress1" class="field w-100" placeholder="기본주소" style="border-radius: 10px;" value="${companyDto.companyAddress1}">
                    </div>
                    <div class="cell">
                        <input type="text" name="companyAddress2" class="field w-100" placeholder="상세주소" style="border-radius: 10px;" value="${companyDto.companyAddress2}">
                    </div>
            	</div><br>
   	    	 </div>
            <div class="cell center">
                <button type="submit" class="btn btn-green2" style="border-radius: 10px;">수정</button>
                <a href="/company/mycompany?companyNo=${memberDto.memberCompanyNo}" class="btn btn-red"> 취소</a>
            </div>
        </div>
    </div>
</form>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>