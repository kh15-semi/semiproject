<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


<div class="container w-800">
	<div class="cell">
		<h2><i class="fa-solid fa-angles-right"></i> 월별 가입 회원수 현황</h2>
	</div>
	<div class="cell">
		<c:forEach var="statusVO" items="${list}">
		<div class="cell">
			<label><b>${statusVO.key}</b> &nbsp; ${statusVO.value}명</label>
		</div>
		<hr>
		</c:forEach>
	</div>
	<div class="cell">
		<a href="/admin/home" class="btn btn-green2" style="border-radius: 10px"><i class="fa-solid fa-user-tie black"></i> 관리자 홈</a>
		<a href="/admin/home" class="btn btn-green2" style="border-radius: 10px"><i class="fa-solid fa-house"></i> 메인</a>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>