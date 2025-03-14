<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 페이지 네비게이터 : pageVO에 기반하여 처리하도록 구현 -->
<div class="page-navigator">

<!-- 이전 -->
<c:if test="${pageVO.hasPrevBlock()}">
    <a href="detail?page=${pageVO.prevBlock}&companyNo=${param.companyNo}">
        &lt;
    </a>
</c:if>

<!-- 숫자 -->
<c:forEach var="i" begin="${pageVO.startBlock}" end="${pageVO.finishBlock}" step="1">
    <c:choose>
        <c:when test="${pageVO.page == i}">
            <a class="on">${i}</a>
        </c:when>
        <c:otherwise>
            <a href="detail?page=${i}&companyNo=${param.companyNo}">${i}</a>
        </c:otherwise>
    </c:choose>
</c:forEach>

<!-- 다음 -->
<c:if test="${pageVO.hasNextBlock()}">
    <a href="detail?page=${pageVO.nextBlock}&companyNo=${param.companyNo}">
        &gt;
    </a>
</c:if>

</div>