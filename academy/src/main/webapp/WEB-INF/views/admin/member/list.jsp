<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
	table {
		border:none;
		border-collapse: collapse;
	}
	th {
		border: none;
		border-radius: 10px;
		border-style: none;
		background-color: #2abb2d;
		padding: 5px 10px;
		color: white;
		font-weight: 400;
	}
	td {
		border: none;
		text-align: center;
		border-bottom: 1px solid #97bfac;
	}
</style>
<div class="container w-1000">
	<div class="cell">
	    <h2><i class="fa-regular fa-user green"></i>&nbsp; 회원 관리</h2>
	</div>
	<div class="cell">
	    <form action="list" method="get" autocomplete="off">
	        <select name="column" style="border: none; width: 100px; font-size: 16px" >
	            <option value="member_id" ${pageVO.column == 'member_id' ? 'selected' : ''}>아이디</option>
	            <option value="member_name" ${pageVO.column == 'member_name' ? 'selected' : ''}>이름</option>
	            <option value="member_contact" ${pageVO.column == 'member_contact' ? 'selected' : ''}>연락처</option>
	            <option value="member_email" ${pageVO.column == 'member_email' ? 'selected' : ''}>이메일</option>
	            <option value="member_type" ${pageVO.column == 'member_type' ? 'selected' : ''}>회원등급</option>
	        </select>
	        <input type="text" name="keyword" value="${pageVO.keyword}" class="field" style="border-radius: 10px; width: 300px">
	        <button class="btn btn-green2" style="border-radius: 10px; ">검색</button>
	       	<a href="/admin/home" class="btn btn-neutral"><i class="fa-solid fa-user-tie"></i> 관리자 홈</a>
	    </form>
	    
	    </div>
	
		<div class="cell">
		<table border="1" width="1000">
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
		</div>

</div>

<jsp:include page="/WEB-INF/views/template/pagination.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>