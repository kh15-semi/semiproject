<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script src="/js/reply.js"></script>
<div class="container w-700" style="border: 1px solid rgb(197, 197, 197); border-radius: 10px; display: block;">
	<div class="cell m-20">
		<div>
			<p style="color: grey; font-size: 12px;">
				<c:choose>
    				<c:when test="${not empty memberDto.memberIndustry}">
       					${memberDto.memberIndustry} | ${memberDto.memberJob} | 작성일 : <fmt:formatDate value="${reviewDto.reviewWtime}" pattern="yyyy-MM-dd"/>
    				</c:when>
    				<c:otherwise>
        				산업군(미선택) | 작성일 : <fmt:formatDate value="${reviewDto.reviewWtime}" pattern="yyyy-MM-dd"/>
    				</c:otherwise>
				</c:choose>
		    </p>
		    <div class="cell">
		    	<h2 style="margin: 20px; word-wrap: break-word; overflow: hidden; text-overflow: ellipsis;">${reviewDto.reviewComment}</h2> <!--한줄평(=제목)-->
		    </div>
		</div>
		<hr>
		<div class="cell" style="display: flex; justify-content: center;">
		
			<div class="cell" style="width: 100px; margin-right: 20px;">
			    <h3>
			    	<i class="fa-solid fa-star yellow"></i>
			    	<!--총 평점-->
			    	${reviewDto.reviewScore}
			    </h3>
			    <label style="font-weight: 700;">승진기회</label>
			    <c:set var="starCount" value="${reviewDto.reviewPromotion}" />
			    <p style="font-size: 13px;">
				    <c:forEach var="i" begin="1" end="${starCount}">
				        <span><i class="fa-solid fa-star yellow"></i></span>
				    </c:forEach>
			    </p>

			    <label style="font-weight: 700;">복지/급여</label>
			    <c:set var="starCount" value="${reviewDto.reviewSalary}" />
			    <p style="font-size: 13px;">
				    <c:forEach var="i" begin="1" end="${starCount}">
				        <span><i class="fa-solid fa-star yellow"></i></span>
				    </c:forEach>
			    </p>
			    
			    <label style="font-weight: 700;">워라밸</label>
			    <c:set var="starCount" value="${reviewDto.reviewWorkAndLife}" />
			    <p style="font-size: 13px;">
				    <c:forEach var="i" begin="1" end="${starCount}">
				        <span><i class="fa-solid fa-star yellow"></i></span>
				    </c:forEach>
			    </p>
			    
			    <label style="font-weight: 700;">사내문화</label>
			    <c:set var="starCount" value="${reviewDto.reviewCulture}" />
			    <p style="font-size: 13px;">
				    <c:forEach var="i" begin="1" end="${starCount}">
				        <span><i class="fa-solid fa-star yellow"></i></span>
				    </c:forEach>
			    </p>			    
			    
			    <label style="font-weight: 700;">경영진</label>
			    <c:set var="starCount" value="${reviewDto.reviewDirector}" />
			    <p style="font-size: 13px;">
				    <c:forEach var="i" begin="1" end="${starCount}">
				        <span><i class="fa-solid fa-star yellow"></i></span>
				    </c:forEach>
			    </p>	
			</div>
			
			<div class="cell" style="width: 500px; padding-top: 20px; padding-left: 10px;">
			    <label style="font-size: 15px; border-radius: 3px; text-align: center; color: white; background-color: rgb(111, 182, 240); padding: 2px;">
			        장점
			    </label>
			    <h3 style="word-wrap: break-word; overflow: hidden; text-overflow: ellipsis;">${reviewDto.reviewStrength}</h3>
			    <label style="font-size: 15px; border-radius: 3px; text-align: center; color: white; background-color: rgb(250, 138, 138); padding: 2px;">
			        단점
			    </label>
			    <h3 style="word-wrap: break-word; overflow: hidden; text-overflow: ellipsis;">${reviewDto.reviewWeakness}</h3>
			    <br>
			</div>
		</div> 
		
		<hr>
		
		<div class="reply-wrapper mt-20"></div>
		
		<script type="text/template" id="reply-template">
			<div class="flex-box">
    			<div class="w-100 p-10">
        			<h4>	담당자 댓글</h4>
        			<div>
            			<div class="reply-item w-100" style="margin-bottom: 15px; border-bottom: 1px solid #ddd; padding-bottom: 10px;">
                			<!-- 댓글 내용 출력 -->
                			<div style="display: flex; align-items: center;">
                    			<span class="reply-writer" style="font-weight: bold; margin-right: 10px;">작성자</span>  
                    			<span class="reply-content">내용</span>
                			</div>
                			<div>
                    			<span class="reply-wtime">yyyy-MM-dd HH:mm:ss</span>
                			</div>
                			<!-- 댓글 삭제 버튼 (작성자만 보임) -->
                			<div>
                    			<c:if test="${sessionScope.userId != replyDto.replyWriter}">
                        			<form action="/rest/reply/delete" method="post">
                            		<input type="hidden" name="replyNo" value="${reply.replyNo}">
                            		<button type="submit" class="btn btn-negative btn-reply-delete">
                                	<i class="fa-solid fa-trash-can "></i>&nbsp;삭제
                            		</button>
                    	    		</form>
                	    		</c:if>
                			</div>
            			</div>
        			</div>
    			</div>
			</div>
		</script>
			
		<div class="cell m-10" style="padding: 5px;">
		    <p><i class="fa-solid fa-user-tie"></i> 담당자 피드백</p>
		    <c:if test="${sessionScope.userType != null}">
		    	<c:if test="${sessionScope.userType == '기업회원'}">
		    		<c:if test="${sessionScope.userCompanyNo == reviewDto.reviewCompanyNo}">
				    	<div style="display: flex; align-items: center;">
					    	<textarea class="field reply-input" style="width: 85%;" rows="4" placeholder="해당 기업의 담당자만 피드백을 할 수 있습니다"></textarea>
					    	<button class="btn btn-green2 btn-reply-write"style="margin-left: 10px;"><i class=" fa-solid fa-check"></i>&nbsp;등록</button>
			   			</div>
			   		</c:if>
			   		<c:if test="${sessionScope.userCompanyNo != reviewDto.reviewCompanyNo}">
			    	<div style="display: flex; align-items: center;">
				    	<textarea class="field reply-input" style="width: 85%;" rows="4" placeholder="해당 기업의 담당자만 피드백을 할 수 있습니다" disabled></textarea>
				    	<button  class="btn btn-green2 btn-reply-write"style="margin-left: 10px;"><i class="fa-solid fa-check"></i>&nbsp;등록</button>
			  			</div>
					</c:if>
			   	</c:if>
		    	<c:if test="${sessionScope.userType == '일반회원'}">
			    	<div style="display: flex; align-items: center;">
				    	<textarea class="field" style="width: 85%;" rows="4" placeholder="해당 기업의 담당자만 피드백을 할 수 있습니다" disabled></textarea>
				    	<button class="btn btn-green2"style="margin-left: 10px;"><i class="fa-solid fa-check"></i>&nbsp;등록</button>
			  			</div>
				</c:if>
			</c:if>
	    </div> 
		<div class="cell center">
			<a href="/company/detail?companyNo=${companyDto.companyNo}" class="btn btn-green2"><i class="fa-solid fa-arrow-left"></i>&nbsp;이전</a>
			<a href="/" class="btn btn-neutral"><i class="fa-solid fa-house"></i>&nbsp;메인</a>
			<c:if test="${sessionScope.userId != null}">
			    <c:if test="${sessionScope.userId == reviewDto.reviewWriter}">
					<a href="/company/review/delete?reviewNo=${reviewDto.reviewNo}" class="btn btn-negative btn-review-delete"><i class="fa-solid fa-trash-can"></i>&nbsp;삭제</a>
				</c:if>
			</c:if>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>