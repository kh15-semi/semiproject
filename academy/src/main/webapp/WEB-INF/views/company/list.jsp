<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!-- google font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

<!-- font awesome cdn -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
.flex-box {
    display: flex;
    flex-wrap: wrap; 
    width: 100%;
    gap: 10px;
}

.flex-item {
    width: calc((100% - 20px) / 3); /* gap을 고려한 크기 */
    box-sizing: border-box;
}
</style>

<script>

</script>

<form action="" method="post">

	<div class="container" style="margin: auto; width: 1200px;">
	
		<div class="cell ms-10">
			<h2><i class="fa-solid fa-list"></i> 기업 목록</h2>
		</div>
		
		<hr style="border: none; border: 1px solid rgb(196, 196, 196)">
		
		<div class="cell m-30" style="color: #2d3436">
			<div class="cell">
			    <!-- 검색 결과가 있을 경우 검색어 표시 -->
			    <p style="font-size: 18px; font-weight: bold;">
			    	<c:choose>
			        	<c:when test="${not empty keyword}">
			            	"${keyword}"
			        	</c:when>
			    	</c:choose> 검색 결과
				</p>
			</div>
			
			<hr style="border: none; border-top: 1px solid rgb(196, 196, 196)">
		
	    
	   	<div class="cell p-40 flex-box" style="display: flex; flex-wrap: wrap; gap: 10px;">
	        <!-- 검색 결과가 없는 경우 -->
	        <c:choose>
	            <c:when test="${empty list}">
	                <div class="cell">
	                    <h3>검색 결과가 없습니다.</h3>
	                </div>
	            </c:when>
	            <c:otherwise>
	                <c:forEach var="companyWithScore" items="${filteredCompaniesWithScore}">
            			<div class="cell p-20 flex-item" style="border: 1px solid #ccc; border-radius: 8px;">
            				<div class="cell center">
	                			<a href="/company/detail?companyNo=${companyWithScore.company.companyNo}">
	                    			<img src="/company/image?companyNo=${companyWithScore.company.companyNo}" width="300" height="200" style="border-radius: 15px;">
	                			</a>
            				</div>
                			<div class="cell mt-10 ms-10">
                    			<h3>
                        			<a href="/company/detail?companyNo=${companyWithScore.company.companyNo}" style="text-decoration: none; color: #333; font-weight: bold;">
                            			${companyWithScore.company.companyName}
                        			</a>
                    			</h3>
                    			<!-- 평균 별점 출력 -->
                    			<p><i class="fa-solid fa-star yellow"></i>&nbsp;
                    			<c:if test = "${companyWithScore.averageScore == '0.0'}">
                                	<fmt:formatNumber value = "0.0" pattern = "0.0"/>
                            	</c:if>
                            	<c:if test = "${companyWithScore.averageScore != '0.0'}">
                                	<fmt:formatNumber value ="${companyWithScore.averageScore}" pattern="#.0"/>
                            	</c:if>
                    			</p>
                    			<p style="font-size: 14px; color: #666;">${companyWithScore.company.companyIndustry}</p>
                			</div>
            			</div>
        			</c:forEach>      			
	            </c:otherwise>
	        </c:choose>
	    </div>
	        
		</div>
	
	</div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>