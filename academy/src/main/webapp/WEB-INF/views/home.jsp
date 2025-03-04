<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인 페이지 _ 회원</title>

    <!-- google font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

    <!-- font awesome cdn -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link rel="stylesheet" type="text/css" href="/css/commons.css">
    
    <style>
        .logo {
			list-style-type: none; 
			background-image: url("https://common.jobplanet.co.kr/images/ssrimg/common/jp_wordmark_green.svg");
			background-size: 120px auto;
			background-repeat: no-repeat;
			background-position: center;
			height: 50px; 
			line-height: 50px;
			text-align: center;
		}
		.logo a {
			display: block;
			width: 100%;
			height: 100%;
		}

		.custom-line {
			border: 0;
			border-top: 1px solid rgb(206, 206, 206);
			margin: 5px;
		}

		.recommend-box {
			width: 500px;
			height: 300px;
			background-color: rgb(234, 245, 234);
			border-radius: 15px;
			font-size: 25px;
			font-weight: 300;
			padding: 30px;
		}

    </style>
    
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    
</head>

<body>

	<!-- 헤더 -->
	<div class="container w-1200" style="height: 50px;">
		<!-- 메뉴 -->
		<div class="cell">
            <ul class="menu">
                <li class="logo">
					<a href="#"></a>
					<!-- 로고 클릭시 메인 홈페이지 뜰 수 있도록 구현 -->
				</li>
                <li>
					<a href="#">회사 정보</a>
					<ul>
                        <li><a href="#">항목1</a></li>
                        <li><a href="#">항목2</a></li>
                        <li><a href="#">항목3</a></li>
                        <li><a href="#">항목4</a></li>
                    </ul>
				</li>
                <li>
					<a href="#">기업 리뷰 작성</a>
					<ul>
                        <li><a href="#">항목1</a></li>
                        <li><a href="#">항목2</a></li>
                        <li><a href="#">항목3</a></li>
                        <li><a href="#">항목4</a></li>
                    </ul>
				</li>
                <li class="menu-end">
                    <a href="#">
						<i class="fa-regular fa-circle-user grey"></i>
						<i class="fa-solid fa-chevron-down"></i>
					</a>
					<ul>
						<li><a href="#">My</a></li>
						<li><a href="#">기업 리뷰</a></li>
						<li><a href="#">로그아웃</a></li>
					</ul>
                </li>
            </ul>
        </div>
	</div>
 
	<hr class="custom-line">
	
    <!-- 메인 화면 -->

	<!-- 검색창 -->
	<div class="container" style="width: 1200px; height: 40px;">
		<div class="cell center">
			<b><label><i class="fa-solid fa-magnifying-glass"></i> Search</label></b>&nbsp;
			<input type="text" style="width: 900px; height: 40px;" placeholder="&nbsp; * 검색어를 입력해주세요">
			<button type="button" class="btn btn-green2" style="height: 40px; width: 80px; padding: 0px;"><i class="fa-solid fa-check"></i>&nbsp;검색</button>
		</div>
	</div>

	<hr class="custom-line">

	<!-- 메인 구성 -->

	<div class="container" style="width: 1200px;">

	<!-- 기업 추천 -->
		<div class="cell m-30">
			<h2><i class="fa-solid fa-exclamation red"></i>&nbsp;"${userDto.userName}" 님을 위한 기업 추천</h2>
		</div>

        <div class="cell flex-box">
           
			<div class="cell" style="margin: auto;">
                <div class="cell center flex-box">
                    <img src="/images/뤼이드.png" style="border-radius: 15px; width: 360px; height: 250px;">
                </div>
				<div class="cell left m-10">
					<span>
						(주) 뤼이드<br>
						<b>[Riiid] 사내 법무 담당자 (재택 근무 병행)</b> <br>
						<p style=" font-size: 13px; color: grey;">5년 이상, 법무, 법률 사무</p>
					</span>
				</div>
            </div>
            
			<div class="cell" style="margin: auto;">
                <div class="cell center flex-box">
                    <img src="/images/쿠팡.png" style="border-radius: 15px; width: 360px; height: 250px;">
                </div>
				<div class="cell left m-10">
					<span>
						쿠팡(주)<br>
						<b>[Coupang] Privacy Compliance</b> <br>
						<p style=" font-size: 13px; color: grey;">5년 이상, 법무, 법률 사무</p>
					</span>
				</div>
            </div>

			<div class="cell" style="margin: auto;">
                <div class="cell center flex-box">
                    <img src="/images/코인원.png" style="border-radius: 15px; width: 360px; height: 250px;">
                </div>
				<div class="cell left m-10">
					<span>
						(주) 코인원<br>
						<b>컴플라이언스 담당자</b> <br>
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



	<!-- 푸터 -->
	<div class="container" style="width: 1200px">
		<hr>
		<div class="cell m-10" style="color: rgb(92, 92, 92); font-size: 14px;">
			<label class="m-30">회사소개</label>
			<label class="m-30">이용약관</label>
			<label class="m-30">개인정보처리방침</label>
			<label class="m-30">리뷰 운영 정책</label>
			<label class="m-30">공지사항</label>
			<label class="m-30">광고 및 제휴문의</label>
			<label class="m-30">고객 문의</label>
			<label class="m-30">FAQ</label>
		</div>
		<hr>
		<div class="m-10 flex-box">
			<div class="cell">
				<div class="cell">
					<h5>(주) 브레인커머스</h5>
				</div>
				<div class="cell">
					<p style="font-size: 12px; color: grey;">
						<label>서울특별시 강남구 테헤란로 509 엔씨타워 1, 10층&nbsp;</label>
						<label>|&nbsp; 대표 황희승, 윤신근&nbsp;</label>
						<label>|&nbsp; 개인정보보호관리자 윤신근</label>
					</p>
					<p style="font-size: 12px; color: grey;">
						<label>사업자등록번호 120-87-92182&nbsp;</label>
						<label>|&nbsp; 통신판매업 신고번호 제2014-서울강남-02942호&nbsp;</label>
						<label>|&nbsp; 유료 직업소개사업 등록번호 (국내) 제2017-3220163-14-5-00046호</label>
					</p>
					<p style="font-size: 12px; color: grey;">
						<label>대표번호 1644-5641 (10:00~17:00 / 매월 마지막 금요일 09:00~13:00 / 주말 및 공휴일 휴무)&nbsp;</label>
						<label>|&nbsp; 대표이메일 : customuer_survice@jobplanet.co.kr</label>
					</p>
				</div>
			</div>
	</div>

</body>
</html>