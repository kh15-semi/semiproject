<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
			border: none;
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
<script src="/js/button.js"></script>


</head>

<body>

	<!-- 헤더 -->
	<div class="container w-1200" style="height: 50px;">
		<!-- 메뉴 -->
		<div class="cell">
            <ul class="menu">
                <li class="logo">
					<a href="/"></a>
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

				<c:choose>
    				<c:when test="${sessionScope.userId != null}">
        				<c:choose>
            				<%-- 관리자인 경우 --%>
            				<c:when test="${sessionScope.userType == '관리자'}">
                				<li class="menu-end">
                    				<a href="#">
                        				<i class="fa-regular fa-circle-user grey"></i>
                        				<i class="fa-solid fa-chevron-down"></i>
                    				</a>
                    				<ul>
                        				<li><a href="/admin/home">관리자 메뉴</a></li>
                        				<li><a href="/logout">로그아웃</a></li>
                    				</ul>
                				</li>
            			</c:when>

            			<%-- 일반회원인 경우 --%>
            			<c:when test="${sessionScope.userType == '일반회원'}">
                            <li class="menu-end">
                                <a href="#">
                                    <i class="fa-regular fa-circle-user grey"></i>
                                    <i class="fa-solid fa-chevron-down"></i>
                                </a>
                                <ul>
                                    <li><a href="/member/mypage">회원정보</a></li>
                                    <li><a href="#">기업 리뷰</a></li>
                                    <li><a href="/logout">로그아웃</a></li>
                                </ul>
                            </li>
                        </c:when>
                        <%-- 기업회원인 경우 --%>
                        <c:when test="${sessionScope.userType == '기업회원'}">
                            <li class="menu-end">
                                <a href="#">
                                    <i class="fa-regular fa-circle-user grey"></i>
                                    <i class="fa-solid fa-chevron-down"></i>
                                </a>
                                <ul>
                                    <li><a href="/company/member/mypage">기업회원정보</a></li>
                                    <li><a href="#">기업 리뷰</a></li>
                                    <li><a href="/logout">로그아웃</a></li>
                                </ul>
                            </li>
                        </c:when>
                    </c:choose>
                </c:when>

    			<%-- 비회원인 경우 --%>
    			<c:otherwise>
        			<li class="menu-end">
            			<a href="/login">로그인</a>
            			<ul>
                			<li><a href="/member/join">회원가입</a></li>
            			</ul>
        			</li>
    			</c:otherwise>
			</c:choose>


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