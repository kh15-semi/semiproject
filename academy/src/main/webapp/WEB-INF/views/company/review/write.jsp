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

<form action="/company/review/write" method="post" autocomplete="off">

	<div class="container w-700">
	 <!-- 기업 총 평점 / 기업 한 줄 평 -->
	 <div class="page">
	     <div class="cell">
	         <h3>기업 총 평점</h3>
	         <div class="rating">
	             <input type="radio" name="reviewScore" id="star5-total" value="5" data-name="total"><label for="star5-total">★</label>
	             <input type="radio" name="reviewScore" id="star4-total" value="4" data-name="total"><label for="star4-total">★</label>
	             <input type="radio" name="reviewScore" id="star3-total" value="3" data-name="total"><label for="star3-total">★</label>
	             <input type="radio" name="reviewScore" id="star2-total" value="2" data-name="total"><label for="star2-total">★</label>
	             <input type="radio" name="reviewScore" id="star1-total" value="1" data-name="total"><label for="star1-total">★</label>
	         </div>
	     </div>
	     <div class="cell">
	         <h3>기업 한 줄 평</h3>
	         <div class="cell">
	             <p style="font-size: 13px; color: green;">이 기업을 한마디로 소개한다면 어떤 기업인가요?</p>
	             <!-- 입력 칸이 선택되었을 때, 해당 구문이 나타날 수 있도록 구현 필요 -->
	             <input type="text" name = "reviewComment" class="field w-100" placeholder="(20자 이상) 기업에 대해 작성해 주세요.">
	             <div style="font-size: 12px; color: grey; float: right;">
	                 <span>0</span>
	                 <span> / 최대 100자</span>
	             </div>
	         </div>
	     </div>
	     <br>
	     <div class="w-100 center">
	         <button type="button" class="btn btn-green2 btn-next">다음 <i class="fa-solid fa-right-long"></i></button>
	     </div>
	 </div>
	
	 <!-- 기업의 장점 / 기업의 단점 -->
	 <div class="page">
	     <div class="cell">
	         <h3>기업의 장점</h3>
	         <p style="font-size: 13px; color: grey;">이 기업을 다니며 좋았던 점을 남겨주세요</p>
	         <div class="cell">
	             <textarea name="reviewStrength" class="field w-100 field-answer"  rows="8" oninput="checkCnt();" placeholder="(30자 이상) 만족스러운 점을 작성해 주세요."></textarea>
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
	             <textarea name="reviewWeakness" class="field w-100 field-answer"  rows="8" oninput="checkCnt();" placeholder="(30자 이상) 아쉬운 점을 작성해 주세요."></textarea>
	             <div style="font-size: 12px; color: grey; float: right;">
	                 <span>0</span>
	                 <span> / 최대 1,000자</span>
	             </div>
	         </div>
	     </div>
	     <br>
	     <div class="w-100 center">
	         <button type="button" class="btn btn-green2 btn-prev"><i class="fa-solid fa-left-long"></i> 이전</button>
	         <button type="button" class="btn btn-green2 btn-next">다음 <i class="fa-solid fa-right-long"></i></button>
	     </div>
	 </div>
	
	 <!-- 별점 평가 -->
	 <div class="page">
	     <div class="cell">
	        <h3>승진 기회 및 가능성</h3>
	         <div class="rating">
	             <input type="radio" name="reviewPromotion" id="star5-growth" value="5" data-name="growth"><label for="star5-growth">★</label>
	             <input type="radio" name="reviewPromotion" id="star4-growth" value="4" data-name="growth"><label for="star4-growth">★</label>
	             <input type="radio" name="reviewPromotion" id="star3-growth" value="3" data-name="growth"><label for="star3-growth">★</label>
	             <input type="radio" name="reviewPromotion" id="star2-growth" value="2" data-name="growth"><label for="star2-growth">★</label>
	             <input type="radio" name="reviewPromotion" id="star1-growth" value="1" data-name="growth"><label for="star1-growth">★</label>
	         </div>
	     </div>
	
	     <div class="cell">
	         <h3>복지 및 급여</h3>
	             <div class="rating">
	                 <input type="radio" name="reviewSalary" id="star5-salary" value="5" data-name="wage"><label for="star5-salary">★</label>
    				 <input type="radio" name="reviewSalary" id="star4-salary" value="4" data-name="wage"><label for="star4-salary">★</label>
    				 <input type="radio" name="reviewSalary" id="star3-salary" value="3" data-name="wage"><label for="star3-salary">★</label>
    				 <input type="radio" name="reviewSalary" id="star2-salary" value="2" data-name="wage"><label for="star2-salary">★</label>
    				 <input type="radio" name="reviewSalary" id="star1-salary" value="1" data-name="wage"><label for="star1-salary">★</label>
	                 <span class="rating-output" id="wage-rating-output"></span>
	             </div>
	     </div>
	
	     <div class="cell">
	         <h3>업무와 삶의 균형</h3>
	             <div class="rating">
	                <input type="radio" name="reviewWorkAndLife" id="star5-worklife" value="5" data-name="bal"><label for="star5-worklife">★</label>
    				<input type="radio" name="reviewWorkAndLife" id="star4-worklife" value="4" data-name="bal"><label for="star4-worklife">★</label>
    				<input type="radio" name="reviewWorkAndLife" id="star3-worklife" value="3" data-name="bal"><label for="star3-worklife">★</label>
    				<input type="radio" name="reviewWorkAndLife" id="star2-worklife" value="2" data-name="bal"><label for="star2-worklife">★</label>
    				<input type="radio" name="reviewWorkAndLife" id="star1-worklife" value="1" data-name="bal"><label for="star1-worklife">★</label>
	                <span class="rating-output" id="bal-rating-output"></span>
	             </div>
	     </div>
	
	     <div class="cell">
	         <h3>사내문화</h3>
	             <div class="rating">
	                 <input type="radio" name="reviewCulture" id="star5-culture" value="5" data-name="culture"><label for="star5-culture" >★</label>
	                 <input type="radio" name="reviewCulture" id="star4-culture" value="4" data-name="culture"><label for="star4-culture" >★</label>
	                 <input type="radio" name="reviewCulture" id="star3-culture" value="3" data-name="culture"><label for="star3-culture" >★</label>
	                 <input type="radio" name="reviewCulture" id="star2-culture" value="2" data-name="culture"><label for="star2-culture" >★</label>
	                 <input type="radio" name="reviewCulture" id="star1-culture" value="1" data-name="culture"><label for="star1-culture" >★</label>
	                 <span class="rating-output" id="culture-rating-output"></span>
	         </div>
	     </div>
	
	     <div class="cell">
	         <h3>경영진</h3>
	             <div class="rating">
	                 <input type="radio" name="reviewDirector" id="star5-ceo" value="5" data-name="ceo"><label for="star5-ceo">★</label>
	                 <input type="radio" name="reviewDirector" id="star4-ceo" value="4" data-name="ceo"><label for="star4-ceo">★</label>
	                 <input type="radio" name="reviewDirector" id="star3-ceo" value="3" data-name="ceo"><label for="star3-ceo">★</label>
	                 <input type="radio" name="reviewDirector" id="star2-ceo" value="2" data-name="ceo"><label for="star2-ceo">★</label>
	                 <input type="radio" name="reviewDirector" id="star1-ceo" value="1" data-name="ceo"><label for="star1-ceo">★</label>
	                 <span class="rating-output" id="ceo-rating-output"></span>
	             </div>
	     </div>
	     <br><br>
	     <div class="w-100 center">
	         <button type="button" class="btn btn-green2 btn-prev"><i class="fa-solid fa-left-long"></i> 이전</button>
	         <button type="button" class="btn btn-green2 btn-next">다음 <i class="fa-solid fa-right-long"></i></button>
	     </div>
	 </div>
	
	 <!-- CEO에 대한 견해 / 기업의 10년 후 / 타 구직자에게 추천 유무 및 cancel/submit 버튼 -->
	    <div class="page">
	        <div class="cell">
	            <h3>CEO에 대한 견해</h3>
	            <div class="cell">
	                <input type="radio" name="reviewCeoEvaluation" id="support-yes" value="Y">&nbsp;지지해요
	                <input type="radio" name="reviewCeoEvaluation" id="support-no" value="N">&nbsp;지지하지 않아요
	            </div>
	        </div>
	        <div class="cell">
	            <h3>이 기업은 1년 후 어떻게 될까요?</h3>
	            <div class="cell">
	                <input type="radio" name="reviewPrediction" id="potential-up" value="성장">&nbsp;성장
	                <input type="radio" name="reviewPrediction" id="potential-similar" value="비슷">&nbsp;비슷
	                <input type="radio" name="reviewPrediction" id="potential-down" value="하락">&nbsp;하락
	            </div>
	        </div>
	        <div class="cell">
	            <h3>이 기업을 구직자에게 추천하나요?</h3>
	            <div class="cell">
	                <input type="radio" name="reviewRecommend" id="recommend-yes" value="Y">&nbsp;네, 추천해요
	                <input type="radio" name="reviewRecommend" id="recommend-no" value="N">&nbsp;아니요
	            </div>
	        </div>
	        <br>
	        <div class="w-100 center">
	            <button type="button" class="btn btn-neutral btn-prev"><i class="fa-solid fa-left-long"></i> 이전</button>
	            <button type="submit" class="btn btn-green2">작성 완료</button>
	        </div>
	    </div>
	</div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>