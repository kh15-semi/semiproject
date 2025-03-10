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
	    <h2><i class="fa-solid fa-building green"></i>&nbsp;기업 관리</h2>
	</div>
	<div class="cell">
		<form action="list" method="get" autocomplete="off">
	        <select name="column" style="border: none; width: 100px; font-size: 16px" >
	            <option value="company_name" ${pageVO.column == 'company_name' ? 'selected' : ''}>회사명</option>
	            <option value="company_industry" ${pageVO.column == 'company_industry' ? 'selected' : ''}>산업군</option>
	            <option value="company_job" ${pageVO.column == 'company_job' ? 'selected' : ''}>직종</option>
	            <option value="company_contact" ${pageVO.column == 'company_contact' ? 'selected' : ''}>연락처</option>
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
            <th>회사명</th>
            <th>사업자 등록번호</th>
            <th>산업군</th>
            <th>직종</th>
            <th>연락처</th>
            <th>업체 홈페이지</th>
        </tr> 
    </thead>
	
    <tbody>
        <c:forEach var="companyDto" items="${list}">
            <tr>
                <td>
                    <a href="detail?companyNo=${companyDto.companyNo}">
                        ${companyDto.companyName}
                    </a>
                </td>
                <td>${companyDto.companyCrNumber}</td>
                <td>${companyDto.companyIndustry}</td>
                <td>${companyDto.companyJob}</td>
                <td>${companyDto.companyContact}</td>
                <td>${companyDto.companyUrl}</td>
            </tr>
        </c:forEach>
	</tbody>
	</table>
	</div>
</div>


<jsp:include page="/WEB-INF/views/template/pagination.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>