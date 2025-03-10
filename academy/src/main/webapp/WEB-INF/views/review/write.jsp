<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

    <div class="container">
        <div class="cell center header">
            <h1>리뷰 작성</h1>
        </div>
        <label>기업 총 평점</label><br>
        <div class="review-score3" data-max="5"></div>
        <!-- 리뷰 입력 폼 -->

        <div class="cell">
            <label>기업 한줄평</label>
            <p style="font-size: 12px;">이 기업을 한마디로 소개한다면 어떤 기업인가요?</p>
            <textarea class="field w-100 field-answer" placeholder="(20자 이상) 기업에 대해 작성해 주세요." rows="1"></textarea>
            <div class="text-count">
                <span>0</span>
                <span>/ 최대 100자</span>
            </div>
        </div>

        <div class="cell">
            <label>기업의 장점</label>
            <div class="cell">
                <p style="font-size: 12px;">이 기업을 다니며 좋았던 점을 남겨주세요</p>
                <textarea class="field w-100 field-answer" rows="3" placeholder="(30자 이상) 만족스러운 점을 작성해 주세요."></textarea>
                <div class="text-count">
                    <span>0</span>
                    <span>/ 최대 1000자</span>
                </div>
            </div>
        </div>

        <div class="cell">
            <label>기업의 단점</label>
            <div class="cell">
                <p style="font-size: 12px;">기업의 단점을 객관적인 시각에서 적어주세요</p>
                <textarea class="field w-100 field-answer" rows="3" placeholder="(30자 이상) 아쉬운 점을 작성해 주세요."></textarea>
                <div class="text-count">
                    <span>0</span>
                    <span>/ 최대 1000자</span>
                </div>
            </div>
        </div>

        <div class="container w-700">
            <div class="cell category">
                승진 기회 및 가능성
                <div class="rating-type" data-max="5"></div>
            </div>

            <div class="cell category">
                복지 및 급여
                <div class="rating-type" data-max="5"></div>
            </div>

            <div class="cell category">
                업무와 삶의 균형
                <div class="rating-type" data-max="5"></div>
            </div>

            <div class="cell category">
                사내 문화
                <div class="rating-type" data-max="5"></div>
            </div>

            <div class="cell category">
                경영진
                <div class="rating-type" data-max="5"></div>
            </div>
        </div>

        <div class="container w-700">
            <form>
                <h3>CEO에 대한 견해</h3>
                <label><input type="checkbox" class="single-check"> 지지해요 </label>
                <label><input type="checkbox" class="single-check"> 지지하지 않아요 </label>

                <h3>이 기업은 1년 후 어떻게 될까요?</h3>
                <label><input type="checkbox" class="single-check"> 성장 </label>
                <label><input type="checkbox" class="single-check"> 비슷 </label>
                <label><input type="checkbox" class="single-check"> 하락 </label>

                <h3>이 기업을 구직자에게 추천하나요?</h3>
                <label><input type="checkbox" class="single-check"> 네, 추천해요 </label>
                <label><input type="checkbox" class="single-check"> 아니요 </label>
            </form>
        </div>



        <div class="review-form">
            <!-- 상세 페이지로 돌아가기 -->
            <button type="button" class="btn btn-neutral beforebtn" onclick="goBack()">이전으로</button>
            <button type="button" class="btn btn-positive reviewbtn">리뷰 등록</button>
        </div>

    </div>

</form>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>