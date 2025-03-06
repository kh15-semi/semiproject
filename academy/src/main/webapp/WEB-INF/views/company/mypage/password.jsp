<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="container w-400" style="border:0; border-radius: 10px; background-color: rgb(238, 238, 238);  padding: 20px;">
        <div class="cell left m-10">
            <h2>비밀번호 변경</h2>
        </div>
        <div class="cell mt-30">
            <input type="password" name="" class="field w-100" placeholder="기존 비밀번호 입력">
        </div>
        <div class="cell">
            <input type="password" name="" class="field w-100" placeholder="변경할 비밀번호 입력">
        </div>
        <div class="cell mt-20">
            <button type="submit" name="" class="btn w-100">비밀번호 변경</button>
        </div>
    </div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>