<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!-- 댓글 관련 스크립트 -->
<script type="text/javascript">
	$(function() {
		//글 번호 읽기
		var params = new URLSearchParams(location.search);
		var reviewNo = params.get("reviewNo");
		var companyNo = ""; // companyNo 변수 선언

		 <c:choose>
	        <c:when test="${companyDto != null}">
	        	companyNo = "${companyDto.companyNo}";
	        </c:when>
	        <c:otherwise>
	        	companyNo = 0;
	        </c:otherwise>
	    </c:choose>

		//최소 1회 목록을 불러오도록 처리
		loadList();

		//.btn-reply-write를 누르면 댓글 등록 ajax 요청을 전송
		$(".btn-reply-write").click(function() {
			var replyContent = $(".reply-input").val();
			if (replyContent.length == 0) {
				window.alert("내용을 작성하세요");
				return;
			}

			$.ajax({
				url : "/rest/reply/write",
				method : "post",
				data : {
					replyOrigin : reviewNo,
					replyContent : replyContent,
					companyNo: companyNo // companyNo 추가
				},
				success : function(response) {
					$(".reply-input").val(""); //입력값 제거
					loadList(); //목록 다시 불러오기 -> 내가 댓글을 작성하는 사이, 다른 댓글이 등록됐을 수 있으므로
				}
			});
		});

		//댓글 삭제
		//.btn-reply-delete를 누르면 삭제 요청을 보내세요
		//$(".btn-reply-delete").click(function(){}); -> 안됨(버튼이 아직 안만들어짐)
		$(document).on("click", ".btn-reply-delete", function() {//문서전체 감시
			//this == 클릭한 삭제 버튼
			var choice = window.confirm("정말 댓글을 삭제하시겠습니까?");
			if (choice == false)
				return;

			var replyNo = $(this).data("reply-no");
			//var replyNo = $(this).attr("data-reply-no");

			$.ajax({
				url : "/rest/reply/delete",
				method : "post",
				data : {
					replyNo : replyNo
				},
				success : function(response) {
					loadList();
				}
			});
		});
		
		//댓글 수정
		$(document).on("click", ".btn-reply-edit", function(){
			//#reply-edit-template을 불러와서 값을 옮긴 뒤 추가
			
			//기존에 열려있는 모든 수정화면을 제거
			$(".reply-edit-item").prev(".reply-item").show();
			$(".reply-edit-item").remove();
			
			//원본은 놔두고 원본 뒤에다 추가
			var template = $("#reply-edit-template").text();
			var html = $.parseHTML(template);
			
			//값을 옮기는 작업이 필요 (총 5개)
			var writerProfile = $(this).closest(".reply-item").find(".writer-profile").prop("src");
			var replyWriter = $(this).closest(".reply-item").find(".reply-writer").text();
			var replyContent = $(this).closest(".reply-item").find(".reply-content").text();
			var replyWtime = $(this).closest(".reply-item").find(".reply-wtime").text();
			var replyNo = $(this).data("reply-no");
			
			$(html).find(".writer-profile").prop("src", writerProfile);
			$(html).find(".reply-writer").text(replyWriter);
			$(html).find(".reply-content").val(replyContent);
			$(html).find(".reply-wtime").text(replyWtime);
			$(html).find(".btn-reply-save").attr("data-reply-no", replyNo);
			
			$(this).closest(".reply-item").after(html); //append 그것의 안쪽에서 맨 뒤에 붙이기. after는 그것의 바로 뒤에
			$(this).closest(".reply-item").hide();
		});
		
		$(document).on("click", ".btn-reply-save", function(){
			//저장을 누르면 작성한 내용을 서버로 전송해 수정 요청하고 목록 갱신
			var replyNo = $(this).data("reply-no");
			var replyContent = $(this).closest(".reply-edit-item").find(".reply-content").val();
			if(replyContent.length == 0){
				window.alert("내용은 필수입니다");
				return;
			}
			
			$.ajax({
				url: "/rest/reply/edit",
				method: "post",
				data: {
					replyNo : replyNo,
					replyContent : replyContent
				},
				success: function(response){
					loadList(); //목록 갱신
				}
			});
		});

		$(document).on("click", ".btn-reply-cancel", function() {
			//취소를 누르면 현재 수정 영역을 제거하고 앞의 표시 영역을 출력
			var choice = window.confirm("댓글 수정을 취소하시겠습니까?");
			if (choice == false)
				return;

			$(this).closest(".reply-edit-item").prev(".reply-item").show();
			$(this).closest(".reply-edit-item").remove();
		});

		//목록을 불러오는 함수
		//- 현재 로그인한 사용자와 작성자를 비교해서 화면에 변화를 부여
		//- 문제는 HttpSession의 값을 자바스크립트가 절대 접근할 수 없다는 것
		//- EL의 도움을 받을 수밖에 없음
		var userId = "${sessionScope.userId}"; //""를 안쓰면 null인 상태이므로, 비로그인 상태일 때 에러 뜸
		var reviewWriter = "${reviewDto.reviewWriter}";

		function loadList() {
			$.ajax({
				url : "/rest/reply/list",
				method : "get",
				data : {
					replyOrigin : reviewNo,
					companyNo: companyNo // companyNo 추가
				},
				success : function(response) { //List<ReplyDto> - JSON(배열)
					$(".reply-wrapper").empty(); //비우기
					$(response).each(function() { //for문과 동일한 기능
								//매 항목(this)에 대해서 템플릿을 불러와 값을 설정한 뒤 추가
								var template = $("#reply-template").html();
								var html = $.parseHTML(template);

								//변환할거 하고
								var convertTime = moment(this.replyWtime).format("YYYY-MM-DD H:mm:ss");
								//var convertTime = moment(this.replyWtime).fromNow(); //몇 시간전 표시 형식

								$(html).find(".reply-writer").text(this.replyWriter || "(탈퇴한 사용자)");
								$(html).find(".reply-content").text(this.replyContent);
								$(html).find(".reply-wtime").text(convertTime);
								$(html).find(".btn-reply-edit").attr("data-reply-no", this.replyNo);
								$(html).find(".btn-reply-delete").attr("data-reply-no", this.replyNo);

								//내 글이 아니면 버튼, 배지들은 삭제
								if (userId.length == 0 || this.replyWriter != userId) {
									$(html).find(".btn-reply-edit").remove();
									$(html).find(".btn-reply-delete").remove();
								}
								//if(탈퇴한 유저의 댓글이거나 탈퇴한 유저의 글이거나 게시글과 댓글의 소유자가 다르면)
								if (this.replyWriter == null || reviewWriter.length == 0 || this.replyWriter != reviewWriter) {
									$(html).find(".owner-badge").remove();
								}

								//추가
								$(".reply-wrapper").append(html); //prepend는 최신 것이 달림
							});
					$(".reply-count").text(response.length); //댓글 개수 갱신
				}
			});
		}
	});
</script>

<input type="hidden" id="companyNo" value="${companyDto.companyNo}"> <!-- companyNo 추가 -->

<script type="text/template" id="reply-template">
        <div style="width: 100%;">
                <div class="reply-item" style="margin-bottom: 15px; border-bottom: 1px solid #ddd; padding-bottom: 10px; width: 100%;">
                    <div class="w-100 p-10" style="display: flex; justify-content: space-between; align-items: center;">
                        <div>
                            <span class="reply-writer" style="font-weight: bold; padding-right: 10px; align-text: ">작성자</span>
                                <span class="reply-wtime" style="color: gray; font-size:14px;"></span>
                        </div>
                        <c:if test="${sessionScope.userId != replyDto.replyWriter}">
                            <input type="hidden" name="replyNo" value="${reply.replyNo}">
							<div class="flex-box">
								<button type = "button" class = "btn btn-positive btn-reply-edit">
									<i class = "fa-solid fa-edit"></i> 수정
								</button>
                                <button type="submit" class="btn btn-negative btn-reply-delete">
                                	<i class="fa-solid fa-trash-can "></i>&nbsp;삭제
                                </button>
							</div>
                        </c:if>
                    </div>
                       <div style="margin: 10px;">
                        <span class="reply-content" style="margin:10px;">내용</span>
                    </div>
                </div>
            </div>
</script>


<script type = "text/template" id = "reply-edit-template">
	<div class = "reply-edit-item flex-box">
		<div class = "w-100 p-10">
			<h3 class = "my-0">
				<span class = "reply-writer">작성자아이디</span>
				<span class = "owner-badge" style = "border: 1px solid black">작성자</span>
			</h3>
			<textarea class = "reply-content field w-100">작성내용</textarea>
			<span class = "reply-wtime">yyyy-MM-dd HH:mm:ss</span>
		</div>
		<div class = "w-150 flex-box flex-vertical p-10">
			<button type = "button" class = "btn btn-positive btn-reply-save">
				<i class = "fa-solid fa-floppy-disk"></i> 저장
			</button>
			<button type = "button" class = "btn btn-negative btn-reply-cancel mt-10">
				<i class = "fa-solid fa-xmark"></i> 취소
			</button>
		</div>
	</div>
</script>


<div class="container w-700"
	style="border: 1px solid rgb(197, 197, 197); border-radius: 10px;">
	<div class="cell m-20">
		<div>
			<p style="color: grey; font-size: 12px;">
				<c:choose>
					<c:when test="${not empty memberDto.memberIndustry}">
       					${memberDto.memberIndustry} | ${memberDto.memberJob} | 작성일 : <fmt:formatDate
							value="${reviewDto.reviewWtime}" pattern="yyyy-MM-dd" />
					</c:when>
					<c:otherwise>
        				산업군(미선택) | 작성일 : <fmt:formatDate
							value="${reviewDto.reviewWtime}" pattern="yyyy-MM-dd" />
					</c:otherwise>
				</c:choose>
			</p>
			<h2
				style="margin: 20px; word-wrap: break-word; overflow: hidden; text-overflow: ellipsis;">${reviewDto.reviewComment}</h2>
			<!--한줄평(=제목)-->
		</div>
		<hr>
		<div class="cell"
			style="display: flex; justify-content: center; align-items: inherit;">

			<div class="cell" style="width: 100px;">
				<h3>
					<i class="fa-solid fa-star green"></i>
					<!--총 평점-->
					<fmt:formatNumber value ="${reviewDto.reviewScore}" pattern="#.0"/>
				</h3>
				<label>승진기회</label>
				<p style="font-weight: 700;">${reviewDto.reviewPromotion}</p>
				<label>복지/급여</label>
				<p style="font-weight: 700;">${reviewDto.reviewSalary}</p>
				<label>워라밸</label>
				<p style="font-weight: 700;">${reviewDto.reviewWorkAndLife}</p>
				<label>사내문화</label>
				<p style="font-weight: 700;">${reviewDto.reviewCulture}</p>
				<label>경영진</label>
				<p style="font-weight: 700;">${reviewDto.reviewDirector}</p>
			</div>

			<div class="cell" style="width: 500px;">
				<label
					style="font-size: 15px; border-radius: 3px; text-align: center; color: white; background-color: rgb(111, 182, 240); padding: 2px;">
					장점 </label>
				<h3
					style="word-wrap: break-word; overflow: hidden; text-overflow: ellipsis;">${reviewDto.reviewStrength}</h3>
				<label
					style="font-size: 15px; border-radius: 3px; text-align: center; color: white; background-color: rgb(250, 138, 138); padding: 2px;">
					단점 </label>
				<h3
					style="word-wrap: break-word; overflow: hidden; text-overflow: ellipsis;">${reviewDto.reviewWeakness}</h3>
				<br>
			</div>
		</div>

	</div>
</div>

<hr>

<!-- 댓글 목록과 댓글 작성란이 표시되는 영역 -->
<div class="reply-wrapper mt-20"></div>

<div class="cell m-10" style="padding: 5px;">
   <p>   <i class="fa-solid fa-user-tie"></i> 담당자 피드백 </p>
   <c:choose>
      <c:when test="${sessionScope.userId != null}">
         <c:if test="${sessionScope.userType == '기업회원'}">
            <c:if test="${sessionScope.userCompanyNo == reviewDto.reviewCompanyNo}">
               <div style="display: flex; align-items: center;">
                  <textarea name = "replyContent" class="field reply-input" style="width: 85%;" rows="4" placeholder="해당 기업의 담당자만 피드백을 할 수 있습니다"></textarea>
                  <button class="btn btn-green2 btn-reply-write" style="margin-left: 10px;">
                     <i class=" fa-solid fa-check"></i>&nbsp;등록
                  </button>
               </div>
            </c:if>
            <c:if test="${sessionScope.userCompanyNo != reviewDto.reviewCompanyNo}">
               <div style="display: flex; align-items: center;">
                  <textarea name = "replyContent" class="field reply-input" style="width: 85%;" rows="4" placeholder="해당 기업의 담당자만 피드백을 할 수 있습니다" disabled></textarea>
                  <button class="btn btn-green2 btn-reply-write" style="margin-left: 10px;">
                     <i class="fa-solid fa-check"></i>&nbsp;등록
                  </button>
               </div>
            </c:if>
         </c:if>
         <c:if test="${sessionScope.userType == '일반회원'}">
            <div style="display: flex; align-items: center;">
               <textarea name = "replyContent" class="field reply-input" style="width: 85%;" rows="4" placeholder="해당 기업의 담당자만 피드백을 할 수 있습니다" disabled></textarea>
               <button class="btn btn-green2 btn-reply-write" style="margin-left: 10px;">
                  <i class="fa-solid fa-check"></i>&nbsp;등록
               </button>
            </div>
         </c:if>
      </c:when>
      <c:otherwise>
         <div style="display: flex; align-items: center;">
            <textarea name = "replyContent" class="field reply-input" style="width: 85%;" rows="4" placeholder="로그인하셔야 댓글 작성이 가능합니다" disabled></textarea>
            <button class="btn btn-green2 btn-reply-write" style="margin-left: 10px;" disabled>
               <i class="fa-solid fa-check"></i>&nbsp;등록
            </button>
         </div>
      </c:otherwise>
   </c:choose>
</div>

<div class="cell center">
	<a href="/company/detail?companyNo=${companyDto.companyNo}" class="btn btn-green2"><i class="fa-solid fa-arrow-left"></i>&nbsp;이전</a>
	<a href="/" class="btn btn-neutral"><i class="fa-solid fa-house"></i>&nbsp;메인</a>
	<c:if test="${sessionScope.userId != null}">
	    <c:if test="${sessionScope.userId == reviewDto.reviewWriter}">
			<a href="/company/review/delete?reviewNo=${reviewDto.reviewNo}" class="btn btn-negative btn-review-delete"><i class="fa-solid fa-trash-can"></i>&nbsp;삭제</a>
		</c:if>
	</c:if>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>