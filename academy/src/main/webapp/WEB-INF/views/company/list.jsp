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
       <!-- jQuery cdn -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            margin: 20px;
            background-color: #f8f9fa;
        }

        .container {
            max-width: 900px;
            margin: 0 auto;
        }

        .company-list {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 15px;
        }

        .company-card {
            background: white;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            cursor: pointer;
        }

        .company-card:hover {
            background-color: #f0f0f0;
        }

        .company-header {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .company-logo {
            width: 40px;
            height: 40px;
            border-radius: 5px;
        }

        .company-name {
            font-weight: bold;
            font-size: 16px;
        }

        .company-info {
            font-size: 14px;
            color: #666;
            margin-top: 5px;
        }
    </style>
        <script type="text/javascript">
        $(document).ready(function () {
            fetch('/api/companies') // 기업 목록 가져오기
                .then(response => response.json())
                .then(data => {
                    var companyListHTML = "";
                    data.forEach(company => {
                        companyListHTML += `
                            <div class='company-card' onclick="goToCompanyDetail(${company.id})">
                                <div class='company-header'>
                                    <img src='${company.companyLogo}' alt='${company.companyName} 로고' class='company-logo'>
                                    <div class='company-name'>${company.companyName}</div>
                                </div>
                                <div class='company-info'>${company.companyIndustry} - ${company.companyAddress1}</div>
                                <div class='company-info'>⭐ ${company.reviewScore} 점</div>
                            </div>`;
                    });
                    document.getElementById("companyList").innerHTML = companyListHTML;
                })
                .catch(error => console.error("기업 목록 불러오기 실패:", error));
        });

        function goToCompanyDetail(companyId) {
            window.location.href = `/company/detail.html?id=${companyId}`;
        }
    </script>
    <form>
            <div class="container">
            <h2>기업 <span style="color: blue;">99+</span></h2>
            <div class="company-list">
                <div class="company-card">
                    <div class="company-header">
                        <img src="./image/samsung.png" alt="삼성전자 로고" class="company-logo">
                        <div class="company-name">삼성전자(주)${companyDto.companyName}</div>
                    </div>
                    <div class="company-info">${reviewListViewDto.reviewScore}3.8 ⭐ | ${companyDto.companyIndustry} - ${companyDto.companyAddress1}경기</div>
                </div>
                <div class="company-card">
                    <div class="company-header">
                        <img src="./image/coupang.png" alt="쿠팡 로고" class="company-logo">
                        <div class="company-name">${companyDto.companyName}쿠팡(주)</div>
                    </div>
                    <div class="company-info">${reviewListViewDto.reviewScore}3.2 ⭐ | ${companyDto.companyIndustry}유통/무역/운송 - ${companyDto.companyAddress1}서울</div>
    
                </div>
                <div class="company-card">
                    <div class="company-header">
                        <img src="./image/lg.png" alt="LG전자 로고" class="company-logo">
                        <div class="company-name">${companyDto.companyName}LG전자(주)</div>
                    </div>
                    <div class="company-info">${reviewListViewDto.reviewScore}3.1 ⭐ | ${companyDto.companyIndustry}제조/화학 - ${companyDto.companyAddress1}서울</div>
    
                </div>
                <div class="company-card">
                    <div class="company-header">
                        <img src="./image/starbucks.png" alt="스타벅스 로고" class="company-logo">
                        <div class="company-name">${companyDto.companyName}(주)에스씨케이컴퍼니</div>
                    </div>
                    <div class="company-info">${reviewListViewDto.reviewScore}3.3 ⭐ | ${companyDto.companyIndustry}서비스업 - ${companyDto.companyAddress1}서울</div>
    
                </div>
                <div class="company-card">
                    <div class="company-header">
                        <img src="./image/gs25.png" alt="GS25 로고" class="company-logo">
                        <div class="company-name">${companyDto.companyName}지에스25(GS25) (매장)</div>
                    </div>
                    <div class="company-info">${reviewListViewDto.reviewScore}3.8 ⭐ | ${companyDto.companyIndustry}유통/무역/운송 - ${companyDto.companyAddress1}서울</div>
    
                </div>
                <div class="company-card">
                    <div class="company-header">
                        <img src="./image/paris_baguette.png" alt="파리바게뜨 로고" class="company-logo">
                        <div class="company-name">${companyDto.companyName}파리바게뜨 (매장)</div>
                    </div>
                    <div class="company-info">${reviewListViewDto.reviewScore}3.4 ⭐ | ${companyDto.companyIndustry}서비스업 - ${companyDto.companyAddress1}서울</div>
    
                </div>
    </form>
    
    
    
    
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>