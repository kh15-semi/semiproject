$(function() {
    // 상태변수
    var status = {
        memberId: false,
        memberPw: false,
        ok: function() {
            return this.memberId && this.memberPw;
        }
    };

    //아이디 관련 처리
	$("[name=memberId]").on("input",function(){
		var current = $(this).val();
		var convert = current.replace(/[^a-z0-9]+/g, "");
		$(this).val(convert);
	});
	
    $("[name=memberId]").on("blur", function() {
        var memberId = $(this).val().trim();
        
        if (memberId.length > 0) { // 빈 값이 아니면 success 처리
            $(this).removeClass("success fail").addClass("success");
            status.memberId = true;
        } else { // 빈 값이면 fail 처리
            $(this).removeClass("success fail").addClass("fail");
            status.memberId = false;
        }
    });
	//비밀번호 관련 처리
    $("[name=memberPw]").on("blur", function() {
        var memberPw = $(this).val().trim();

        if (memberPw.length > 0) { // 빈 값이 아니면 success 처리
            $(this).removeClass("success fail").addClass("success");
            status.memberPw = true;
        } else { // 빈 값이면 fail 처리
            $(this).removeClass("success fail").addClass("fail");
            status.memberPw = false;
        }
    });

    // 로그인 버튼 활성화 여부 (아이디와 비밀번호 모두 입력되었을 때만 활성화)
    $("#loginButton").prop("disabled", !status.ok());

    // 상태변수 값이 변경되면 로그인 버튼 상태를 업데이트
    $("[name=memberId], [name=memberPw]").on("blur", function() {
        $("#loginButton").prop("disabled", !status.ok());
    });
});