<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script type="text/javascript"></script>
<style>
	.field {
		border-radius: 10px;'
	}
</style>
<form action="edit" method="post" enctype="multipart/form-data" >
	<input type="hidden" name="memberId" value="${memberDto.memberId}">

<div class="container w-700">
	<div class="cell">
		<h2><i class="fa-solid fa-user-pen green"></i> ${memberDto.memberName} 님의 개인정보 변경</h2>
	</div>
	<div class="cell">
		<label style="font-weight: 600">이름</label>&nbsp;
		<input type="text" name="memberName" value="${memberDto.memberName}" class="field" ><br>
	</div>

	<div class="cell">
		<label style="font-weight: 600">연락처</label>&nbsp;
		<input type="date" name="memberContact" value="${memberDto.memberContact}" class="field" ><br>
	</div>

	<div class="cell">
		<label style="font-weight: 600">이메일</label>&nbsp;
		<input type="tel" name="memberEmail" value="${memberDto.memberEmail}" class="field"> <br>
	</div>
	
	<div class="cell">
		<div class="cell">
			<label style="font-weight: 600">주소</label>&nbsp;<br>
		</div>
		<div class="cell">
			<input type="text" name="memberPost" size="6" maxlength="6" class="field" value="${memberDto.memberPost}">
				<button type="button" class="btn btn-neutral"><i class="fa-solid fa-magnifying-glass"></i></button>
				<button type="button" class="btn btn-red btn-address-clear" style="display: none;">
				<i class="fa-solid fa-xmark"></i></button><br>
	    	<input type="text" name="memberAddress1" value="${memberDto.memberAddress1}" class="field" size="50" ><br>
    		<input type="text" name="memberAddress2" value="${memberDto.memberAddress2}" class="field" size="50"><br>
    	</div><br>
	</div>
	

	<div class="cell center">
		<a href="/admin/member/list" class="btn btn-neutral"><i class="fa-solid fa-caret-left"></i> back</a>
		<button class="btn btn-green2"><i class="fa-solid fa-user-pen"></i> 정보 수정</button>
	</div>
	
</div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>