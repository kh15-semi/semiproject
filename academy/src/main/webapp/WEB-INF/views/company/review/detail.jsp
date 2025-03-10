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

     <div class="container">
         <h1>${reviewDto.reviewComment}</h1>
         <div>${reviewDto.reviewWtime} | 조회 ${reviewDto.boardRead}</div>
         <hr>
         <div>${boardDto.boardContent}</div>
         <hr>
         <div class="cell">
             좋아요 <span id="like-count">${boardDto.boardLike}</span> | 댓글 <span
                 id="comment-count">${boardDto.boardReply}</span>
         </div>
 
         <div class="button-group">
             <button onclick="goBack()">이전</button>
             <button onclick="editPost(${boardDto.review_no})">게시글 수정</button>
             <button onclick="deletePost(${boardDto.review_no})">게시글 삭제</button>
         </div>
 
         <hr>
 
         <h3>댓글 목록</h3>
         <div class="comment-list">
             <table>
                 <thead>
                     <tr>
                         <th>작성자</th>
                         <th>내용</th>
                         <th>작성일</th>
                         <th>수정</th>
                         <th>삭제</th>
                     </tr>
                 </thead>
                 <tbody id="comment-table"></tbody>
             </table>
         </div>
 
         <h3>댓글 입력</h3>
         <div class="comment-form">
             <input type="text" id="comment-writer" placeholder="작성자 (기업명)">
             <textarea id="comment-content" placeholder="댓글을 입력하세요"></textarea>
             <button onclick="addComment()">댓글 작성</button>
         </div>
     </div>
</form>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>