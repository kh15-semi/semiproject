<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<h1>관리자 홈</h1>

<h2><a href="/admin/member/list">회원 관리</a></h2>

<h2><a href="/admin/giftcard/add">상품권 등록</a></h2>
<h2><a href="/admin/giftcard/list">상품권 관리</a></h2>

<h2><a href="/admin/status/pokemon">포켓몬 현황</a></h2>
<h2><a href="/admin/status/game-user">게임유저 현황</a></h2>
<h2><a href="/admin/status/member">회원 현황</a></h2>
<h2><a href="/admin/status/member-join">회원 가입 현황</a></h2>
<h2><a href="/admin/status/board-write">게시글 작성 현황</a></h2>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
