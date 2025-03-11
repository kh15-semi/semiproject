<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

	<!-- 기업 추천 -->
		<div class="cell m-30">
			<h2><i class="fa-solid fa-exclamation red"></i>&nbsp; ${memberDto.memberName} 님을 위한 기업 추천</h2>
		</div>

        <div class="cell flex-box">
           
			<div class="cell" style="margin: auto;">
                <div class="cell center flex-box">
                	<a href="#">
                    	<img src="/images/뤼이드.png" style="border-radius: 15px; width: 360px; height: 250px;">
                	</a>
                </div>
				<div class="cell left m-10">
					<span>
						<a href="#" style="text-decoration: none; color: inherit;">
							<b>(주) 뤼이드</b>
						</a><br>
						<a href="#" style="text-decoration: none; color: inherit;">
							<b>[Riiid] 사내 법무 담당자 (재택 근무 병행)</b> 
						</a><br>
						<p style=" font-size: 13px; color: grey;">5년 이상, 법무, 법률 사무</p>
					</span>
				</div>
            </div>
            
			<div class="cell" style="margin: auto;">
                <div class="cell center flex-box">
                	<a href="#">
                    	<img src="/images/쿠팡.png" style="border-radius: 15px; width: 360px; height: 250px;">
                	</a>
                </div>
				<div class="cell left m-10">
					<span>
						<a href="#" style="text-decoration: none; color: inherit;">
							<b>쿠팡(주)</b>
						</a><br>
						<a href="#" style="text-decoration: none; color: inherit;">
							<b>[Coupang] Privacy Compliance</b> 
						</a><br>
						<p style=" font-size: 13px; color: grey;">5년 이상, 법무, 법률 사무</p>
					</span>
				</div>
            </div>

			<div class="cell" style="margin: auto;">
                <div class="cell center flex-box">
                	<a href="#">
                    <img src="/images/코인원.png" style="border-radius: 15px; width: 360px; height: 250px;">
                    </a>
                </div>
				<div class="cell left m-10">
					<span>
						<a href="#" style="text-decoration: none; color: inherit;">
							<b>(주) 코인원</b>
						</a><br>
						<a href="#" style="text-decoration: none; color: inherit;">
							<b>컴플라이언스 담당자</b> 
						</a><br>
						<p style=" font-size: 13px; color: grey;">5년 이상, 내부 통제, 컴플라이언스, 준법감시</p>
					</span>
				</div>
            </div>
        </div>


		<hr class="custom-line">


		<!-- 기업 리뷰 -->
		
		<!-- 
				기업명 옆의 북마크 선택 시
				<i class="fa-solid fa-bookmark"></i>
		-->
				
		<div class="cell m-30">
			<p>전/현직자가 직접 평가한</p>
			<h2>&nbsp;기업 리뷰&nbsp;<i class="fa-regular fa-thumbs-up"></i></h2>
		</div>

		<div class="cell flex-box">

			<div class="cell" style="margin: auto;">
				<div class="cell left m-10">
					<span>
						<img src="https://placehold.co/30x30"><!-- 기업 로고 -->
						<b>&nbsp;기업명&nbsp;<i class="fa-regular fa-bookmark"></i></b>
					</span>
				</div>
                <div class="cell flex-box recommend-box">
					<i class="fa-solid fa-quote-left grey"></i>&nbsp;
					<label>
						체계적인 일처리가 좋음
						<p>
							<i class="fa-solid fa-star yellow"></i>
							<i class="fa-solid fa-star yellow"></i>
							<i class="fa-solid fa-star yellow"></i>
							<i class="fa-solid fa-star yellow"></i>
							<i class="fa-regular fa-star yellow"></i>
						</p>
					</label>		
				</div>
            </div>

			<div class="cell" style="margin: auto;">
				<div class="cell left m-10">
					<span>
						<img src="https://placehold.co/30x30"><!-- 기업 로고 -->
						<b>&nbsp;기업명&nbsp;<i class="fa-regular fa-bookmark"></i></b>
					</span>
				</div>
                <div class="cell flex-box recommend-box">
					<i class="fa-solid fa-quote-left grey"></i>&nbsp;
					<label>
						기업 문화가 좋음, 노후화된 시스템
						<p>
							<i class="fa-solid fa-star yellow"></i>
							<i class="fa-solid fa-star yellow"></i>
							<i class="fa-solid fa-star yellow"></i>
							<i class="fa-solid fa-star yellow"></i>
							<i class="fa-regular fa-star yellow"></i>
						</p>
					</label>	
				</div>
            </div>

		</div>

		
		<div class="cell flex-box">

			<div class="cell" style="margin: auto;">
				<div class="cell left m-10">
					<span>
						<img src="https://placehold.co/30x30"><!-- 기업 로고 -->
						<b>&nbsp;기업명&nbsp;<i class="fa-regular fa-bookmark"></i></b>
					</span>
				</div>
                <div class="cell flex-box recommend-box">
					<i class="fa-solid fa-quote-left grey"></i>&nbsp;
					<label>
						외국계 기업으로서 자유로운 분위기
						<p>
							<i class="fa-solid fa-star yellow"></i>
							<i class="fa-solid fa-star yellow"></i>
							<i class="fa-solid fa-star yellow"></i>
							<i class="fa-solid fa-star yellow"></i>
							<i class="fa-regular fa-star yellow"></i>
						</p>
					</label>	
                </div>
            </div>

			<div class="cell" style="margin: auto;">
				<div class="cell left m-10">
					<span>
						<img src="https://placehold.co/30x30"><!-- 기업 로고 -->
						<b>&nbsp;기업명&nbsp;<i class="fa-regular fa-bookmark"></i></b>
					</span>
				</div>
                <div class="cell flex-box recommend-box">
					<i class="fa-solid fa-quote-left grey"></i>&nbsp;
					<label>
						수평적인 문화, 워라밸 보장
						<p>
							<i class="fa-solid fa-star yellow"></i>
							<i class="fa-solid fa-star yellow"></i>
							<i class="fa-solid fa-star yellow"></i>
							<i class="fa-solid fa-star yellow"></i>
							<i class="fa-regular fa-star yellow"></i>
						</p>
					</label>	
				</div>
            </div>
		</div>
	</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
