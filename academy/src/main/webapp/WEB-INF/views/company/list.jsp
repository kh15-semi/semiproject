<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!-- google font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

<!-- font awesome cdn -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회사 리스트</title>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>


    <!-- 검색 결과가 있을 경우 검색어 표시 -->
    <c:if test="${search}">
        <p style="font-size: 18px; font-weight: bold;">"${keyword}" 검색 결과</p>
    </c:if>

    <!-- 회사 리스트 테이블 -->
    <table border="1" width="100%" style="text-align: center;">
        <thead>
            <tr>
                <th>회사명</th>
                <th>업종</th>
                <th>직무</th>
                <th>연락처</th>
            </tr>
        </thead>
        <tbody>
            <!-- 검색 결과가 없는 경우 -->
            <c:choose>
                <c:when test="${empty list}">
                    <tr>
                        <td colspan="4">검색 결과가 없습니다.</td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <c:forEach var="company" items="${list}">
                        <tr>
                            <td>
                                <a href="/company/detail?companyNo=${company.companyNo}">
                                    ${company.companyName}
                                </a>
                            </td>
                            <td>${company.companyIndustry}</td>
                            <td>${company.companyJob}</td>
                            <td>${company.companyContact}</td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>

</body>
</html>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>