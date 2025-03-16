
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

    <div class="container w-600" style="border: 1px solid #60cc6b; border-radius: 10px;">
        <div class="cell center">
            <h2><i class="fa-solid fa-ban red"></i>&nbsp;접근할 수 없는 페이지</h2>
        </div>
        <div class="cell center">
            해당 페이지는 접근이 어렵습니다
            <p>${message}</p>
        </div>
        <div class="cell center">
            <a href="/" class="btn btn-green2"><i class="fa-solid fa-house"></i>&nbsp;메인</a>
        </div>
    </div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
