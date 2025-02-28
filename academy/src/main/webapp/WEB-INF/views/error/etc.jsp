<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="container w-500">
	<div class="cell center">
		<h1>일시적인 오류가 발생했습니다</h1>
	</div>
	<div class="cell center">
		잠시 후 다시 한번 실행해주세요<br>
		${message}
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>