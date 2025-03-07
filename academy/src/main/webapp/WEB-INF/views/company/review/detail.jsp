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

<h1>${boardDto.boardTitle}</h1>
<div>
    ${boardDto.boardWriter}
    <br>
    ${boardDto.boardRead}
</div>
<hr>
<div>${boardDto.boardContent}</div>
<hr>
<div>
    좋아요 ${boardDto.boardLike}
    댓글 ${boardDto.boardReply}
</div>
<div>
    <a href="#">수정</a>
    <a href="#">삭제</a>
    <a href="list">목록</a>
</div>
</form>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>