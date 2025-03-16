
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

    <div class="container w-600" style="border: 1px solid #60cc6b; border-radius: 10px;">
        <div class="cell center">
            <h2><i class="fa-solid fa-exclamation red"></i>&nbsp;입력하신 정보를 다시 한번 확인해주세요</h2>
        </div>
        <div class="cell center">
            <p>${message}</p>
        </div>
    </div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
