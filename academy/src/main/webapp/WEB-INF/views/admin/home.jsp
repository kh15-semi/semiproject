<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="conatiner w-900">
    <h2>관리자 페이지</h2>
</div>
<div class="cell">
    <p>* 데이터 리스트</p>
    <a href="/admin/member/list" class="btn btn-green2" style="border-radius: 10px;">회원 리스트</a>
</div>
<hr>
<div class="cell">
    <p>* 현황 확인</p>
    <a href="/admin/status/member" class="btn btn-green2" style="border-radius: 10px;">회원 현황</a>
    <a href="/admin/status/member-join" class="btn btn-green2" style="border-radius: 10px;">회원가입 현황</a>
    <a href="/admin" a class="btn btn-green2" style="border-radius: 10px;">기업 관리</a>
    <a href="/admin/status/board-write" class="btn btn-green2" style="border-radius: 10px;">게시글 현황</a>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>