<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="cell">
    <h2><i class="fa-solid fa-building"></i>&nbsp; 기업 관리</h2>
</div>
<div class="cell">
    <form action="list" method="get">
        <select name="column" style="border: none; width: 120px;" >
            <option value="company_name" ${pageVO.column == 'company_name' ? 'selected' : ''}>회사명</option>
            <option value="company_industry" ${pageVO.column == 'company_industry' ? 'selected' : ''}></option>
            <option value="company_job" ${pageVO.column == 'company_job' ? 'selected' : ''}>산업</option>
            <option value="" ${pageVO.column == 'company_' ? 'selected' : ''}>직종</option>
        </select>
        <input type="text" name="keyword" value="${pageVO.keyword}">
        <button class="btn btn-green2" style="border-radius: 10px; ">검색</button>
    </form>
</div>
<table border="1" width="500">
    <thead>
        <tr>
            <th>회사명</th>
            <th>사업자 등록번호</th>
            <th>산업</th>
            <th>직종</th>
            <th>연락처</th>
            <th>업체 홈페이지</th>
        </tr> 
    </thead>

    <tbody>
        <c:forEach var="companyDto" items=""${list}>
            <tr>
                <td>
                    <a href="detail?companyName=${companyDto.companyName}">
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


<jsp:include page="/WEB-INF/views/template/pagination.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>