<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<form action="password" method="post">
<div class="container w-400" style="border:0; border-radius: 10px; background-color: rgb(238, 238, 238);  padding: 20px;">
        <div class="cell left m-10">
            <h2>비밀번호 변경</h2>
        </div>
        <div class="cell mt-30">
            <input type="password" name="pass" class="field w-100" placeholder="기존 비밀번호 입력">
        </div>
        <div class="cell">
            <input type="password" name="" class="field w-100" placeholder="변경할 비밀번호 입력">
        </div>
        <div class="cell mt-20">
            <button type="submit" name="" class="btn w-100">비밀번호 변경</button>
        </div>
        <!-- error message -->
		<c:if test="${param.error == '1'}">
		<div class="cell center">
			<h3 class="red">비밀번호가 일치하지 않습니다</h3>
		</div>
		</c:if>
		<c:if test="${param.error == '2'}">
		<div class="cell center">
			<h3 class="red">같은 비밀번호로는 변경할 수 없습니다</h3>
		</div>
		</c:if>
    </div>
</form>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>