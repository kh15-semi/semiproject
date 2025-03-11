<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!-- google font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

    <!-- font awesome cdn -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        /* 전체 컨테이너 */
        .container {
            max-width: 1200px;
            width: 100%;
            margin: 0 auto;
        }

        /* 헤더 */
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px;
            border-bottom: 2px solid black;
            background-color: #f5f5f5;
            /* 배경 추가 */
        }

        /* 로고 */
        .logo img {
            width: 150px;
            height: auto;
        }

        /* 네비게이션 */
        .cell {
            display: flex;
            gap: 20px;
        }

        /* 메인 레이아웃 */
        .main {
            display: flex;
        }

        /* 왼쪽 추가 이미지 영역 */
        .aside {
            width: 20%;
            padding: 20px;
            border-right: 2px solid black;
        }

        /* 메인 콘텐츠 영역 */
        .content {
            width: 80%;
            padding: 20px;
        }

        /* 회사 정보 섹션 */
        .company-info {
            display: flex;
            gap: 20px;
            padding-bottom: 20px;
            border-bottom: 2px solid black;
        }

        /* 회사 이미지 */
        .company-image img {
            width: 200px;
            height: 200px;
            background-color: #ddd;
        }

        /* 회사 정보 상세 */
        .company-details {
            flex: 1;
        }

        .company-header {
            display: grid;
            grid-template-columns: auto 2fr;
            align-items: center;
            width: 100%;
        }

        .company-name {
            display: flex;
            font-size: 20px;
            font-weight: bold;
        }

        .company-rating {
            text-align: right;
            margin-left: auto;
        }

        .company-extra-info {
            font-size: 14px;
            margin-top: 30px;
            margin-bottom: 30px;
        }

        /* 리뷰 섹션 */

        .reviews-header {
            display: flex;
            justify-content: space-between;
            border-bottom: 2px solid black;
            padding-bottom: 10px;
        }

        .review-list {
            margin-top: 10px;
            border: 1px solid black;
            height: 200px;
        }

        .review-actions {
            text-align: left;
            margin-left: auto;
        }

        .review-content-rating {
            text-align: right;
            margin-left: auto;
        }

        .preview {
            border: none;
            border-radius: 5px;
        }

        /* 푸터 */
        .footer {
            width: 100%;
            /* 전체 화면 너비 */
            max-width: 1200px;
            /* 컨테이너 최대 너비 */
            margin: 20px auto;
            /* 자동 가운데 정렬 */
            padding: 15px 20px;
            /* 내부 여백 추가 */
            background-color: #f5f5f5;
            /* 연한 배경색 */
            text-align: left;
            /* 왼쪽 정렬 */
            font-size: 14px;
            /* 글자 크기 줄임 */
            color: #666;
            /* 글자 색상을 회색으로 */
            line-height: 1.6;
            /* 줄 간격 조정 */
            border-top: 1px solid #ddd;
            /* 위쪽 테두리 추가 */
        }

        .close {
            float: right;
            cursor: pointer;
        }

        .map {
            text-align: right;
            margin-left: auto;
        }
    </style>
    
       <script type="text/javascript">
        $(function () {
            $(".company-rating").score();
        });
        $(function () {
            $(".review-content-rating").score({
                starColor: "#00C362",
                editable:true,
                integerOnly:true,
                display: {
                    showNumber: true,
                    placeLimit:2,
                    textColor: "#6a6c6e",
                },
            });
        });
  
            //위치보기창 이동
            $(document).ready(function(){
                $(".map-btn").on("click", function(){
                    window.open("http://127.0.0.1:5500/ui/06.map.html", "", "width=500,height=500")//맵보기 새창으로 구현
                });
            });

            //리뷰쓰러가기이동
            $(document).ready(function () {
                $(".write-review-btn").on("click", function () {
                    window.location.href = "http://127.0.0.1:5500/ui/04.reviewpage.html"; // review.html로 이동
                });
            });
    </script>


<!-- font awesome cdn -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />


<form action="change" method="post">
   <div class="container w-800">

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
                            <div class="flex company-name">${companyDto.companyName}</div>
                            <div class="company-rating" data-max="5" data-rate="4"> 총 평점: </div>

<div class="container w-700">
    <div class="cell" style="border: 2px solid rgb(184, 183, 183); padding: 20px; border-radius: 10px;">
        <img src="http://placehold.co/150x150">
        <div class="cell m-10">
            <h2>${companyDto.companyName}</h2>
            <p style="font-weight: 700;"><i class="fa-solid fa-star green"></i>&nbsp;3.0</p>
            <!-- ${companyDto.reviewScore}<br> -->
            <p>IT&nbsp; / &nbsp;웹/통신</p>
            <!-- <p>${companyDto.companyIndustry}&nbsp; / &nbsp;${companyDto.companyJob}</p> -->
             <p>www.company.com</p>
             <!-- <p>${companyDto.companyUrl}</p> -->
              <p>ㅇㅇ시 ㅇㅇ구 ㅇㅇㅇ로 ㅇㅇ ㅇㅇㅇ-ㅇㅇㅇ</p>
              <!-- <p>${companyDto.companyPost}&nbsp;${companyDto.companyAddress1}&nbsp;${companyDto.companyAddress2}</p> -->
              <p>사업자 번호</p>
              <!-- <p>${companyDto.companyCrNumber}</p> -->
        </div>
    </div>
    <br><hr>
    
    <div class="cell">
        <div class="cell left p-20">
            <p><i class="fa-regular fa-comment grey"></i> 실제 근무자가 작성하는</p>
            <h2>기업 리뷰</h2>
        </div>
        <div class="cell m-10">
            <h3><i class="fa-solid fa-ranking-star yellow"></i>&nbsp;전체 통계</h3>
            <!-- 실습 시 구현했던 그래프 처럼 만들 수 있으면 사용, 아니면 숫자로만 통계 수치 -->
            <div class="cell center" style="border: 2px solid rgb(184, 183, 183); border-radius: 10px;">
                <p>승진 기회 및 가능성</p>
                
                <p>복지 및 급여</p>
                
                <p>업무와 삶의 균형</p>
                
                <p>사내문화</p>
                
                <p>경영진</p>
                
            </div>
        </div>
        
        <div class="cell m-10 right">
            <button type="button" class="btn btn-green2"><i class="fa-solid fa-user-pen"></i>&nbsp;리뷰 작성</button>
        </div>
        <div class="cell m-10">
            <div class="cell" style="border: 2px solid rgb(184, 183, 183); border-radius: 10px;">
                <c:choose>
                    <c:when test="${list.isEmpty()}">
                        <h3 style="text-align: center;">
                            <i class="fa-solid fa-circle-exclamation green"></i>&nbsp;아직 기업에 대해 등록된 리뷰가 없어요.
                        </h3>
                    </c:when>
                    <c:otherwise>
                        <div class="cell m-20" style="color: grey; font-size: 12px;">
                            <p>작성일</p>
                            <!-- <p>${reviewDto.reviewWtime}</p> -->

                        </div>

                        <div class="company-extra-info">
                            <p>${companyDto.companyJob}</p>
                            <p>${memberDto.memberEmail}</p>
                            <p>${companyDto.companyUrl}</p>
                            <p>${companyDto.companyAddress1}</p>
                            <p>${companyDto.companyContact}</p>

                        <div class="cell m-20 center">
                            <h3>
                                <c:forEach var="reviewListViewDto" items="${list}">
                                    <i class="fa-solid fa-quote-left grey"></i>&nbsp;
                                    한줄평 (aka 제목)
                                    <!-- ${reviewListViewDto.reviewComment} -->
                                    &nbsp;<i class="fa-solid fa-quote-right grey"></i>
                                </c:forEach>
                            </h3>

                        </div>
                        <div class="cell  m-20 center" style="font-weight: 700;">
                            <i class="fa-solid fa-star yellow"></i>&nbsp;
                            3.0 (총 평점)
                            <!-- ${reviewListDto.reviewScore} -->
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    <div class="cell center">
        <jsp:include page="/WEB-INF/views/template/pagination.jsp"></jsp:include>
    </div>
</div>


                <!-- 리뷰창 -->
                <div class="container reviews">
                    <div class="cell centerreviews-header">
                        <h2>리뷰</h2>
                        <div class="review-actions">
                            <button class="write-review-btn">리뷰 쓰러가기 →</button>
                        </div>
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
                                    <c:forEach var="reviewDto" items="" ${list}>
                                        <tr>
                                            <td>
                                                <a href="detail?reviewNo=${reviewDto.reviewNo}">
                                                    ${reviewDto.reviewNo}
                                                </a>
                                            </td>
                                            <td>${reviewDto.reviewWriter}</td>
                                            <td>${reviewDto.reviewComment}</td>
                                            <td>${reviewDto.reviewScore}</td>
                                            <td>${reviewDto.reviewLike}</td>
                                            <td>${reviewDto.reviewWtime}</td>
                                            <td>${reviewDto.reviewEtime}</td>
                                        </tr>

                                    </c:forEach>
                                </tbody>
                            </c:when>
                        </table>
                    </div>
                    <div>
                        <div class="cell center">
                        </div>


                        <!-- 페이지 네비게이터 -->
                        <div class="cell center">
                            <jsp:include page="/WEB-INF/views/template/pagination.jsp"></jsp:include>
                        </div>
                    </div>
            </div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>