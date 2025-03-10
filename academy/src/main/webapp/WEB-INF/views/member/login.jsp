<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<form action="login" method="post">

	<div class="container w-400" style="border: 0; border-radius: 10px; background-color: rgb(241, 241, 241); padding: 40px;">
        <div class="cell center">
            <a href="/">
                <img src="/images/jobplanet_logo.png" width="250px"><br>
            </a>
            <p style="margin-top: 0; padding-bottom: 5px;">
            	회원님의 익명성을 보장하기 위<br>
            	어떠한 개인 정보도 노출하지 않습니다.
        	</p>

        <div class="cell left">
            <h3>로그인</h3>
        </div>
        <hr>
        <div class="cell">
            <input type="text" placeholder="아이디" class="field w-100" style="border-radius: 10px;">
        </div>
        <div class="cell">
            <input type="password" placeholder="비밀번호" class="field w-100" style="border-radius: 10px;">
        </div>
        <button type="button" class="btn btn-green1 field w-100" style="border-radius: 10px; font-weight: 700;">
            <i class="fa-solid fa-arrow-right-to-bracket"></i> 로그인</button>
        <div class="cell" style="display: flex; justify-content: space-between; width: 100%;">
            <label><input type="checkbox"> 로그인 상태 유지</label>
            <a href="/member/password" style="text-decoration: none; color: inherit;">비밀번호 찾기</a>
        </div>
        <hr>
        <div class="cell">
            <p>아직 회원이 아니세요? &nbsp;&nbsp;<a href="/member/join" style="text-decoration: none; color: green; font-weight: 800;">회원가입</a></p>
        </div>
    
		</div>
	</div>

</form>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>