$(function() {
	//글번호 읽기
	var params = new URLSearchParams(location.search);
	var reviewNo = params.get("reviewNo");
	

	//최초 1회 목록을 불러오도록 처리
	loadList();

	//.btn-reply-write를 누르면a 댓글 등록 ajax 요청을 전송
	$(".btn-reply-write").click(function(){
		var replyContent = $(".reply-input").val();
		if(replyContent.length == 0) {
			window.alert("내용을 작성하세요");
			return;
		}
		
		$.ajax({
			url:"/rest/reply/write", 
			method:"post",
			data:{
				replyOrigin : reviewNo,
				replyContent : replyContent
			},
			success:function(response){
				$(".reply-input").val("");//입력값 제거
				loadList();//목록 다시 불러오기
			}
		});
	});
	$(document).on("click", ".btn-reply-delete", function(){//문서전체 감시(에너지 소모 큼)
		//this == 클릭한 삭제버튼
		var choice = window.confirm("정말 댓글을 삭제하시겠습니까?");
		if(choice == false) return;
		
		var replyNo = $(this).data("reply-no");
		//var replyNo = $(this).attr("data-reply-no");
		
		$.ajax({
			url:"/rest/reply/delete",
			method:"post",
			data:{
				replyNo : replyNo
			},
			success:function(response){
				loadList();
			}
		});
	});
	
	var userId = "${sessionScope.userId}";
	var reviewWriter = "${reviewDto.reviewWriter}";
	
	function loadList() {
		console.log("댓글 목록 불러오기 실행");
		$.ajax({
			url:"/rest/reply/list",
			method:"post",
			data:{ replyOrigin : reviewNo },
			success:function(response){//List<ReplyDto> - JSON(배열)
				$(".reply-wrapper").empty();//비우기
				$(response).each(function(){
					//매 항목(this)에 대해서 템플릿을 불러와 값을 설정한 뒤 추가
					var template = $("#reply-template").text();
					var html = $.parseHTML(template);
					
					//변환할거 하고
					var convertTime = moment(this.replyWtime).format("YYYY-MM-DD H:mm:ss");
					//var convertTime = moment(this.replyWtime).fromNow();
					
					$(html).find(".reply-writer").text(this.replyWriter);
					$(html).find(".reply-content").text(this.replyContent);
					$(html).find(".reply-wtime").text(convertTime);
					$(html).find(".btn-reply-edit").attr("data-reply-no", this.replyNo);
					$(html).find(".btn-reply-delete").attr("data-reply-no", this.replyNo);
					
//					//내 글이 아니면 버튼들은 삭제
//					if(userId.length == 0 || this.replyWriter != userId) {
//						$(html).find(".btn-reply-edit").remove();
//						$(html).find(".btn-reply-delete").remove();
//					}
					//if(탈퇴한 유저의 댓글이거나 탈퇴한 유저의 글이거나 게시글과 댓글의 소유자가 다르면)
//					if(this.replyWriter == null || boardWriter.length == 0 
//														|| this.replyWriter != boardWriter) {
//						$(html).find(".owner-badge").remove();
//					}
					
					//추가
					$(".reply-wrapper").append(html);
				});
			}
		});
	}		
		
	
});