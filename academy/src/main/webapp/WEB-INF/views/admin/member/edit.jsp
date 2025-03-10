<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script src="/js/member/join.js" ></script>
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
		<h2><i class="fa-solid fa-user-pen"></i> ${memberDto.memberName} 님의 개인정보 변경</h2>
	</div>
	<div class="cell">
		<label style="font-weight: 600">이름</label>&nbsp;
		<input type="text" name="memberName" value="${memberDto.memberName}" class="field" > <br><br>
	</div>
	
	<div class="cell">
		<label style="font-weight: 600">생년월일</label>&nbsp;
		<input type="email" name="memberBirth"  value="${memberDto.memberBirth}" class="field" > <br><br>
	</div>	

	<div class="cell">
		<label style="font-weight: 600">연락처</label>&nbsp;
		<input type="date" name="memberContact" value="${memberDto.memberContact}" class="field" > <br><br>
	</div>

	<div class="cell">
		<label style="font-weight: 600">이메일</label>&nbsp;
		<input type="tel" name="memberEmail" value="${memberDto.memberEmail}" class="field"> <br><br>
	</div>
	
	<div class="cell">
		<label style="font-weight: 600">회원 등급</label>&nbsp;
		<select name="memberType" class="field">
			<option ${memberDto.memberType == '일반회원' ? 'selected' : ''}>일반회원</option>
			<option ${memberDto.memberType == '기업회원' ? 'selected' : ''}>기업회원</option>
		</select>
		<br><br>
	</div>
	
	<div class="cell">
		<div class="cell">
			<label style="font-weight: 600">주소</label>&nbsp;<br>
		</div>
		<input type="text" name="memberPost" size="6" maxlength="6" class="field" value="${memberDto.memberPost}">
		<button type="button" class="btn btn-purple"><i class="fa-solid fa-magnifying-glass"></i></button>
		<button type="button" class="btn btn-red btn-address-clear" style="display: none;">
		<i class="fa-solid fa-xmark"></i></button><br>
	    	<input type="text" name="memberAddress1" value="${memberDto.memberAddress1}" class="field" size="50" ><br>
    		<input type="text" name="memberAddress2" value="${memberDto.memberAddress2}" class="field" size="50">
	</div>

	<div class="cell">
		<button class="btn btn-pink">정보 수정</button>
		<a href="/admin/member/list" class="btn btn-blue">home</a>
	</div>
	
</div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>