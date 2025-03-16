<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

    <div class="container w-600" style="border: 1px solid #60cc6b; border-radius: 10px;">
        <div class="cell center">
            <h2>일시적인 오류가 발생했어요</h2>
        </div>
        <div class="cell center">
            <i class="fa-solid fa-screwdriver-wrench"></i>&nbsp; 담당자가 열심히 고치고 있어요<br>
            해당 화면이 반복될 경우, 관리자에게 문의 해주세요
            <p>${message}</p>
        </div>
        <div class="cell center">
            <a href="/" class="btn btn-green2"><i class="fa-solid fa-house"></i>&nbsp;메인</a>
        </div>
    </div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>