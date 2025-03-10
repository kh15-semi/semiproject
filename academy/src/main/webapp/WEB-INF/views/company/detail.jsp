<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!-- google font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

    <!-- font awesome cdn -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<form action="change" method="post">
   <div class="container w-800">

        <!-- 헤더 -->
        <div class="header">
            <div class="left flex-box logo">
                <a href="http://127.0.0.1:5500/ui/main_non.html">
                    <img src="./image/jobplanet.png">
                </a>
            </div>

            <div class="login-box">
                <button class="login-btn">로그인 / 회원가입</button>
            </div>
        </div>

        <!-- 로그인 창 -->
        <div id="loginpage" class="loginpage" style="display: none;">
            <div class="loginscreen">
                <span class="close">x</span>
                <h2>로그인</h2>ID:
                <input type="text" name="memberId" placeholder="아이디 입력">PW:
                <input type="password" name="memberPw" placeholder="비밀번호 입력">
                <button class="btn-logincheck">Login</button>
                <button class="memberjoin-btn">회원가입 하러가기</button>
            </div>
        </div>

        <!-- 메인 콘텐츠 -->
        <div class="main">
            <!-- 회사 정보 -->
            <div class="content w-100">
                <div class="company-info">
                    <div class="company-image">
                        <img src="./image/Instagram.png">
                    </div>

                    <div class="company-details">
                        <!-- 회사명과 평점을 같은 줄에 배치 -->
                        <div class="company-header">
                            <div class="flex company-name">Instagram</div>
                            <div class="company-rating" data-max="5" data-rate="4"> 총 평점: </div>
                        </div>
                        <div class="company-extra-info">
                            <p>업종: IT</p>
                            <p>이메일: example@email.com</p>
                            <p>홈페이지: www.example.com</p>
                            <p>주소: 서울시 강남구</p>
                            <p>전화번호: 02-1234-5678</p>
                        </div>
                        <div class="map">
                            <button class="map-btn">위치보기 →</button>
                        </div>
                    </div>
                </div>

                <!-- 리뷰창 -->
                <div class="container reviews">
                    <div class="cell centerreviews-header">
                        <h2>리뷰</h2>
                    </div>
                    <p>글은 자신의 인격입니다.존중하며 적어주세요</p>
                        <!-- 리뷰 목록 -->
                            
                            <!-- 테이블 -->
                            <div class="cell center">
                                <table class="table table-border table-hover table-ellipsis">
                                    <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>ID</th>
                                            <th style="width:450px; max-width:450px;">한줄평</th>
                                            <th>평점</th>
                                            <th>좋아요</th>
                                            <th>작성일</th>
                                            <th>수정일</th>
                                        </tr>
                                    </thead>
                                    <c:when test="${list.isEmpty()}">
                                        <tbody>
                                            <tr height="150">
                                                <td colspan="7" align="center">
                                                    등록된 게시글이 없습니다
                                                </td>
                                            </tr>
                                        </tbody>
                                    </c:when>
                                </table>
                            </div>
                            <div>
                                <div class="cell center">
                                </div>
                            <div class="review-actions">
                                <button class="write-review-btn">리뷰 쓰러가기 →</button>
                            </div>
                            
                            <!-- 페이지 네비게이터 -->
                            <div class="cell center">
                                <jsp:include page="/WEB-INF/views/template/pagination.jsp"></jsp:include>
                            </div>
                            
                        </div>

                </div>

                <!-- 푸터 -->
                <div class="footer">
                    <span>(주)브레인커머스</span><br>
                    서울특별시 강남구 테헤란로 509 엔씨타워 I, 10층 대표: 황희승, 윤신근 개인정보보호관리자: 윤신근<br>
                    사업자등록번호: 120-87-92182 통신판매업 신고번호: 제2014-서울강남-02942호 유료 직업소개사업 등록번호 (국내)
                    제2017-3220163-14-5-00046호<br>
                    대표번호: 1644-5641 (10:00~17:00 / 매월 마지막 금요일 09:00~13:00 / 주말 및 공휴일 휴무) <br>
                    대표이메일: customer_service@jobplanet.co.kr<br>
                    <br>
                    &copy; Jobplanet. All rights reserved.
                </div>

            </div>
</form>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>