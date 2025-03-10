<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script type="text/javascript">
    $(function() {
        $(".page").hide().first().show();
        $(".btn-next").click(function() {
            $(this).closest(".page").hide().next(".page").show();
        });
        $(".btn-prev").click(function() {
            $(this).closest(".page").hide().prev(".page").show();
        });
    });

    window.addEventListener("load", function(){
        var answers = document.querySelectorAll(".field-answer, .review-title");
        for(var i=0; i < answers.length; i++) {
            answers[i].addEventListener("input", function(){
                var text = this.value;
                var count = text.length;
                var span = this.nextElementSibling.children[0];
                span.textContent = count;

            if (this.classList.contains('review-title')) {
                if (count > 100) {
                    this.value = text.substring(0, 100);
                    span.textContent = 100;
                }
            } else if (this.classList.contains('field-answer')) {
                if (count > 1000) {
                    this.value = text.substring(0, 1000);
                    span.textContent = 1000;
                }
            }
            });
        }
    });
</script>

<style>
    .rating {
        direction: rtl;
        font-size: 30px;
    }
    .rating input {
        display: none;
    }
    .rating label {
        color: lightgray;
        cursor: pointer;
    }
    .rating input:checked ~ label {
        color: gold;
    }
    .rating input:checked ~ input:checked ~ label {
        color: gold; 
    }
</style>
>>>>>>> refs/heads/main

<<<<<<< HEAD
        <div>
            ${reviewDto.reviewWtime} | 조회 ${reviewDto.reviewRead}
        </div>
=======
<form action="" method="post" autocomplete="off">
>>>>>>> refs/heads/main

<<<<<<< HEAD
        <hr>

        <div class="container w-800">${reviewDto.reviewContent}</div>

        <hr>

        <div class="cell">
            좋아요 ${reviewDto.reviewLike} | 댓글 ${replyDto.reviewContent}
        </div>

        <!-- 게시글 관리 버튼 추가 -->
        <div class="cell review-actions">
            <button onclick="history.back()">이전</button>
            <button onclick="editPost(${reviewDto.reviewNo})">게시글 수정</button>
            <button onclick="deletePost(${reviewDto.reviewNo})">게시글 삭제</button>
        </div>

        <hr>

        <!-- 댓글 목록 -->
        <h3>댓글 목록</h3>
        <div class="comment-list">
            <table class="table table-border">
                <thead>
                    <tr>
                        <th>작성자</th>
                        <th>내용</th>
                        <th>작성일</th>
                        <th>수정</th>
                        <th>삭제</th>
                    </tr>
                </thead>
                <tbody id="comment-table">
                    <!-- 댓글이 JavaScript로 추가될 공간 -->
                </tbody>
            </table>
        </div>

        <!-- 댓글 입력 폼 -->
        <h3>댓글 입력</h3>
        <div class="comment-form">
            <input type="text" id="comment-writer" placeholder="작성자 (기업명)">
            <textarea id="comment-content" placeholder="댓글을 입력하세요"></textarea>
            <button onclick="addComment()">댓글 작성</button>
        </div>
    </div>

=======
	<div class="container w-700">
	 <!-- 기업 총 평점 / 기업 한 줄 평 -->
	 <div class="page">
	     <div class="cell">
	         <h3>기업 총 평점</h3>
	         <div class="rating">
	             <input type="radio" name="rating-total" id="star5-total" value="5" data-name="total"><label for="star5-total">★</label>
	             <input type="radio" name="rating-total" id="star4-total" value="4" data-name="total"><label for="star4-total">★</label>
	             <input type="radio" name="rating-total" id="star3-total" value="3" data-name="total"><label for="star3-total">★</label>
	             <input type="radio" name="rating-total" id="star2-total" value="2" data-name="total"><label for="star2-total">★</label>
	             <input type="radio" name="rating-total" id="star1-total" value="1" data-name="total"><label for="star1-total">★</label>
	         </div>
	     </div>
	     <div class="cell">
	         <h3>기업 한 줄 평</h3>
	         <div class="cell">
	             <p style="font-size: 13px; color: green;">이 기업을 한마디로 소개한다면 어떤 기업인가요?</p>
	             <!-- 입력 칸이 선택되었을 때, 해당 구문이 나타날 수 있도록 구현 필요 -->
	             <input type="text" class="field w-100 review-title" placeholder="(20자 이상) 기업에 대해 작성해 주세요.">
	             <div style="font-size: 12px; color: grey; float: right;">
	                 <span>0</span>
	                 <span> / 최대 100자</span>
	             </div>
	         </div>
	     </div>
	     <br>
	     <div class="w-100 center">
	         <button class="btn btn-green2 btn-next">다음 <i class="fa-solid fa-right-long"></i></button>
	     </div>
	 </div>
	
	 <!-- 기업의 장점 / 기업의 단점 -->
	 <div class="page">
	     <div class="cell">
	         <h3>기업의 장점</h3>
	         <p style="font-size: 13px; color: grey;">이 기업을 다니며 좋았던 점을 남겨주세요</p>
	         <div class="cell">
	             <textarea name="pros" class="field w-100 field-answer"  rows="8" oninput="checkCnt();" placeholder="(30자 이상) 만족스러운 점을 작성해 주세요."></textarea>
	             <div style="font-size: 12px; color: grey; float: right;">
	                 <span>0</span>
	                 <span> / 최대 1,000자</span>
	             </div>
	         </div>
	     </div>
	     <div class="cell">
	         <h3>기업의 단점</h3>
	         <p style="font-size: 13px; color: grey;">기업의 단점을 객관적인 시각에서 적어주세요</p>
	         <div class="cell">
	             <textarea name="cons" class="field w-100 field-answer"  rows="8" oninput="checkCnt();" placeholder="(30자 이상) 아쉬운 점을 작성해 주세요."></textarea>
	             <div style="font-size: 12px; color: grey; float: right;">
	                 <span>0</span>
	                 <span> / 최대 1,000자</span>
	             </div>
	         </div>
	     </div>
	     <br>
	     <div class="w-100 center">
	         <button class="btn btn-green2 btn-prev"><i class="fa-solid fa-left-long"></i> 이전</button>
	         <button class="btn btn-green2 btn-next">다음 <i class="fa-solid fa-right-long"></i></button>
	     </div>
	 </div>
	
	 <!-- 별점 평가 -->
	 <div class="page">
	     <div class="cell">
	        <h3>승진 기회 및 가능성</h3>
	         <div class="rating">
	             <input type="radio" name="rating-growth" id="star5-growth" value="5" data-name="growth"><label for="star5-growth">★</label>
	             <input type="radio" name="rating-growth" id="star4-growth" value="4" data-name="growth"><label for="star4-growth">★</label>
	             <input type="radio" name="rating-growth" id="star3-growth" value="3" data-name="growth"><label for="star3-growth">★</label>
	             <input type="radio" name="rating-growth" id="star2-growth" value="2" data-name="growth"><label for="star2-growth">★</label>
	             <input type="radio" name="rating-growth" id="star1-growth" value="1" data-name="growth"><label for="star1-growth">★</label>
	         </div>
	     </div>
	
	     <div class="cell">
	         <h3>복지 및 급여</h3>
	             <div class="rating">
	                 <input type="radio" name="rating-wage" id="star5-wage" value="5" data-name="wage"><label for="star5-wage">★</label>
	                 <input type="radio" name="rating-wage" id="star4-wage" value="4" data-name="wage"><label for="star4-wage">★</label>
	                 <input type="radio" name="rating-wage" id="star3-wage" value="3" data-name="wage"><label for="star3-wage">★</label>
	                 <input type="radio" name="rating-wage" id="star2-wage" value="2" data-name="wage"><label for="star2-wage">★</label>
	                 <input type="radio" name="rating-wage" id="star1-wage" value="1" data-name="wage"><label for="star1-wage">★</label>
	                 <span class="rating-output" id="wage-rating-output"></span>
	             </div>
	     </div>
	
	     <div class="cell">
	         <h3>업무와 삶의 균형</h3>
	             <div class="rating">
	                 <input type="radio" name="rating-bal" id="star5-bal" value="5" data-name="bal"><label for="star5-bal">★</label>
	                 <input type="radio" name="rating-bal" id="star4-bal" value="4" data-name="bal"><label for="star4-bal">★</label>
	                 <input type="radio" name="rating-bal" id="star3-bal" value="3" data-name="bal"><label for="star3-bal">★</label>
	                 <input type="radio" name="rating-bal" id="star2-bal" value="2" data-name="bal"><label for="star2-bal">★</label>
	                 <input type="radio" name="rating-bal" id="star1-bal" value="1" data-name="bal"><label for="star1-bal">★</label>
	                 <span class="rating-output" id="bal-rating-output"></span>
	             </div>
	     </div>
	
	     <div class="cell">
	         <h3>사내문화</h3>
	             <div class="rating">
	                 <input type="radio" name="rating-culture" id="star5-culture" value="5" data-name="culture"><label for="star5-culture" >★</label>
	                 <input type="radio" name="rating-culture" id="star4-culture" value="4" data-name="culture"><label for="star4-culture" >★</label>
	                 <input type="radio" name="rating-culture" id="star3-culture" value="3" data-name="culture"><label for="star3-culture" >★</label>
	                 <input type="radio" name="rating-culture" id="star2-culture" value="2" data-name="culture"><label for="star2-culture" >★</label>
	                 <input type="radio" name="rating-culture" id="star1-culture" value="1" data-name="culture"><label for="star1-culture" >★</label>
	                 <span class="rating-output" id="culture-rating-output"></span>
	         </div>
	     </div>
	
	     <div class="cell">
	         <h3>경영진</h3>
	             <div class="rating">
	                 <input type="radio" name="rating-ceo" id="star5-ceo" value="5" data-name="ceo"><label for="star5-ceo">★</label>
	                 <input type="radio" name="rating-ceo" id="star4-ceo" value="4" data-name="ceo"><label for="star4-ceo">★</label>
	                 <input type="radio" name="rating-ceo" id="star3-ceo" value="3" data-name="ceo"><label for="star3-ceo">★</label>
	                 <input type="radio" name="rating-ceo" id="star2-ceo" value="2" data-name="ceo"><label for="star2-ceo">★</label>
	                 <input type="radio" name="rating-ceo" id="star1-ceo" value="1" data-name="ceo"><label for="star1-ceo">★</label>
	                 <span class="rating-output" id="ceo-rating-output"></span>
	             </div>
	     </div>
	     <br><br>
	     <div class="w-100 center">
	         <button class="btn btn-green2 btn-prev"><i class="fa-solid fa-left-long"></i> 이전</button>
	         <button class="btn btn-green2 btn-next">다음 <i class="fa-solid fa-right-long"></i></button>
	     </div>
	 </div>
	
	 <!-- CEO에 대한 견해 / 기업의 10년 후 / 타 구직자에게 추천 유무 및 cancel/submit 버튼 -->
	    <div class="page">
	        <div class="cell">
	            <h3>CEO에 대한 견해</h3>
	            <div class="cell">
	                <input type="radio" name="support" id="support-yes">&nbsp;지지해요
	                <input type="radio" name="support" id="support-no">&nbsp;지지하지 않아요
	            </div>
	        </div>
	        <div class="cell">
	            <h3>이 기업은 1년 후 어떻게 될까요?</h3>
	            <div class="cell">
	                <input type="radio" name="potential" id="potential-up">&nbsp;성장
	                <input type="radio" name="potential" id="potential-similar">&nbsp;비슷
	                <input type="radio" name="potential" id="potential-down">&nbsp;하락
	            </div>
	        </div>
	        <div class="cell">
	            <h3>이 기업을 구직자에게 추천하나요?</h3>
	            <div class="cell">
	                <input type="radio" name="recommend" id="recommend-yes">&nbsp;네, 추천해요
	                <input type="radio" name="recommend" id="recommend-no">&nbsp;아니요
	            </div>
	        </div>
	        <br>
	        <div class="w-100 center">
	            <button class="btn btn-neutral btn-prev"><i class="fa-solid fa-left-long"></i> 이전</button>
	            <button class="btn btn-green2">작성 완료</button>
	        </div>
	    </div>
	</div>
>>>>>>> refs/heads/main
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>