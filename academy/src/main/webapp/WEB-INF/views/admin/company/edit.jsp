<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script type="text/javascript"></script>
<style>
	.field {
		border-radius: 10px;'
	}
</style>
<form action="edit" method="post" enctype="multipart/form-data" autocomplete="off" >
	<input type="hidden" name="memberId" value="${memberDto.memberId}">

<div class="container w-700">
	<div class="cell">
		<h2><i class="fa-solid fa-building green"></i> [${companyDto.companyName}] 기업정보 변경</h2>
	</div>
	<div class="cell">
		<label style="font-weight: 600">업체명</label>&nbsp;
		<input type="text" name="companyName" value="${companyDto.companyName}" class="field" ><br>
	</div>

	<div class="cell">
		<label style="font-weight: 600">사업자 등록번호</label>&nbsp;
		<input type="date" name="companyCrNumber" value="${companyDto.companyCrNumber}" class="field" ><br>
	</div>

	<div class="cell">
		<label style="font-weight: 600">산업</label>&nbsp;
		<input type="tel" name="companyIndustry" value="${companyDto.companyIndustry}" class="field"> <br>
	</div>
	
	<div class="cell">
		<label style="font-weight: 600">직종</label>&nbsp;
		<input type="tel" name="companyJob" value="${companyDto.companyJob}" class="field"> <br>
	</div>

	<div class="cell">
		<label style="font-weight: 600">연락처</label>&nbsp;
		<input type="tel" name="companyContact" value="${companyDto.companyContact}" class="field"> <br>
	</div>
	
	<div class="cell">
		<div class="cell">
			<label style="font-weight: 600">주소</label>&nbsp;<br>
		</div>
		<div class="cell">
			<input type="text" name="companyPost" size="6" maxlength="6" class="field" value="${companyDto.companyPost}">
				<button type="button" class="btn btn-neutral"><i class="fa-solid fa-magnifying-glass"></i></button>
				<button type="button" class="btn btn-red btn-address-clear" style="display: none;">
				<i class="fa-solid fa-xmark"></i></button><br>
	    	<input type="text" name="companyAddress1" value="${companyDto.companyAddress1}" class="field" size="50" ><br>
    		<input type="text" name="companyAddress2" value="${companyDto.companyAddress2}" class="field" size="50"><br>
    	</div>
	</div>
	
	<div class="cell">
		<label style="font-weight: 600">업체 홈페이지</label>&nbsp;
		<input type="tel" name="companyUrl" value="${companyDto.companyUrl}" class="field"> <br>
	</div>	

	<div class="cell center">
		<a href="/admin/member/list" class="btn btn-neutral"><i class="fa-solid fa-caret-left"></i> back</a>
		<button class="btn btn-green2"><i class="fa-solid fa-user-pen"></i> 정보 수정</button>
	</div>
	
</div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>