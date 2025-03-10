<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="conatiner w-1200 m-20">
	<div class="cell">
    	<h2><i class="fa-solid fa-user-tie"></i> 관리자 홈</h2>
	</div>
	<div class="cell">
    	<label><i class="fa-solid fa-asterisk"></i> 데이터 관리</label>
   		<div class="cell">
	   		<a href="/admin/member/list" class="btn btn-green2" style="border-radius: 10px;">회원 목록</a>
	   		<a href="/admin/company/list" class="btn btn-green2" style="border-radius: 10px;">기업 목록</a>
   		</div>
	</div>
		<hr>
	<div class="cell">
			<label><i class="fa-solid fa-asterisk"></i> 데이터 현황</label>
			<div class="cell">
			    <a href="/admin/status/member" class="btn btn-green2" style="border-radius: 10px;">회원 현황</a>
			    <a href="/admin/status/member-join" class="btn btn-green2" style="border-radius: 10px;">회원가입 현황</a>
			    <a href="/admin/status/company" a class="btn btn-green2" style="border-radius: 10px;">기업 현황</a>
			    <a href="/admin/status/board-write" class="btn btn-green2" style="border-radius: 10px;">게시글 현황</a>
			</div>
	</div>

</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>