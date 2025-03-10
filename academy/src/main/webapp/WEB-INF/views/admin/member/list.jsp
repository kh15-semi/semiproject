<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="cell">
    <h2><i class="fa-regular fa-user green"></i>&nbsp; 회원 관리</h2>
</div>
<div class="cell">
    <form action="list" method="get">
        <select name="column" style="border: none; width: 120px;" >
            <option value="member_id" ${pageVO.column == 'member_id' ? 'selected' : ''}>아이디</option>
            <option value="member_name" ${pageVO.column == 'member_name' ? 'selected' : ''}>이름</option>
            <option value="member_contact" ${pageVO.column == 'member_contact' ? 'selected' : ''}>연락처</option>
            <option value="member_email" ${pageVO.column == 'member_email' ? 'selected' : ''}>이메일</option>
        </select>
        <input type="text" name="keyword" value="${pageVO.keyword}">
        <button class="btn btn-green2" style="border-radius: 10px; ">검색</button>
    </form>
</div>
<table border="1" width="700">
    <thead>
        <tr>
            <th>아이디</th>
            <th>이름</th>
            <th>연락처</th>
            <th>이메일</th>
            <th>회원등급</th>
        </tr>
    </thead>

    <tbody>
        <c:forEach var="memberDto" items="${list}">
            <tr>
                <td>
                    <a href="detail?memberId=${memberDto.memberId}">
                        ${memberDto.memberId}
                    </a>
                </td>
                <td>${memberDto.memberName}</td>
                <td>${memberDto.memberContact}</td>
                <td>${memberDto.memberEmail}</td>
                <td>${memberDto.memberType}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<jsp:include page="/WEB-INF/views/template/pagination.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>