<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="container w-700">
	<div class="cell">
		<h2><i class="fa-solid fa-angles-right"></i> 리뷰 수 현황</h2>
	</div>
	<div class="cell">
		<div class="cell">
			<c:forEach var="statusVO" items="${list}">
			<div class="cell">
				<label><b>${statusVO.key}</b>&nbsp; ${statusVO.value}</label>
			</div>
			<hr>
			</c:forEach>
		</div>
	</div>
	<div class="cell">
		<a href="/admin/home" class="btn btn-green2"><i class="fa-solid fa-user-tie"></i> 관리자 홈</a>
		<a href="/" class="btn btn-blue" style="border-radius: 10px"><i class="fa-solid fa-house"></i> 메인</a>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>