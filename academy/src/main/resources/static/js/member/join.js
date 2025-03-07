$(function(){
	//상태변수
	var status = {
		memberId: false,
		memberPw: false,
		memberPwCheck: false,
		memberName: false,
		memberEmail: true,
		memberContact: true,
		memberAddress: true,
		ok: function () {
        	return this.memberId && this.memberPw
				&& this.memberPwCheck && this.memberName
				&& this.memberEmail && this.memberContact 
				&& this.memberAddress
      	}
	};
	
	//아이디 관련 처리
	$("[name=memberId]").on("input",function(){
		var current = $(this).val();
		var convert = current.replace(/[^a-z0-9]+/g, "");
		$(this).val(convert);
	});
	$("[name=memberId").blur(function(){
		var regex = /^[a-z][a-z0-9]{4,19}$/;
		var memberId = $(this).val();
		
		if(regex.test(memberId)) {//통과
			$.ajax({
				url:"",
				method:"post",
				data:{ memberId : memberId },
				success: function(response) {
					status.memberId = response;
					$("[name=memberId").removeClass("success fail fail2")
												.addClass(response ? "success" : "fail2");
				}
			});
		}
		else {//위반
			status.memberId = false;
			$("[name=memberId]").removeClass("success fail fail2")
												.addClass("fail");
		}
	});
	
	//비밀번호 관련 처리
	$("[name=memberPw]").blur(function(){
		var regex = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*[0-9])(?=.*[!@#$])[A-Za-z0-9!@#$]{8,16}$/;
		var isValid = regex.test($(this).val());
		$(this).removeClass("success fail fail2").addClass(isValid ? "success" : "fail");
		status.memberPw = isValid;
	});
	
	//비밀번호 확인 관련 처리
	$("#memberPwCheck").blur(function(){
		var memberPw = $("[name=memberPw]").val();
		var memberPwCheck = $(this).val();
		$(this).removeClass("success fail fail2");
		if(status.memberPw == false) {//비밀번호 형식에 부합하지 않음
			$(this).addClass("fail2");
			status.memberPwCheck = false;
		}
		else if(memberPw != memberPwCheck) {//비밀번호 불일치
			$(this).addClass("fail");
			status.memberPwCheck = false;
		}
		else {//비밀번호 일치
			$(this).addClass("success");
			status.memberPwCheck = true;
		}
	});
	
	//이름 관련 처리
	$("[name=memberName]").blur(function(){
		var regex = /^[가-힣]{2,5}$/;
		var isValid = regex.test($(this).val());
		$(this).removeClass("success fail fail2").addClass(isValid ? "success" : "fail");
		status.memberName = isValid;
	});
	
	//주민번호 관련 처리
	
	//연락처 관련 처리
	$("[name=memberContact").on("input",function(){
		var current = $(this).val();
		var convert = current.replace(/[^0-9]+/g, "");
		
		if(convert.lenth <= 3) {
			
		}
		else if(convert.length <= 7) {
			convert = convert.replace(/([0-9]{3})([0-9]{1,4})/, "$1-$2");
		}
		else {
			convert = convert.replace(/([0-9]{3})([0-9]{4})([0-9]{1,4})/, "$1-$2-$3");
		}
		
		$(this).val(convert);
	}); 
	$("[name=memberContact]").blur(function(){
		var regex = /^010[0-9]{8}$/;
		var isValid = $(this).val().length > 0;
		$(this).removeClass("success fail").addClass(isValid ? "success" : "fail");
		status.memberContact = isValid;
	});
	$("[name=memberEmail]").blur(function(){
		var isValid = $(this).val().length == 0 || regex.test($(this).val());
		$(this).removeClass("success fail").addClass(isValid ? "success" : "fail");
		status.memberContact = isValid;
	});
	//주소 관련 처리
            $("[name=memberPost]").on("input", function () {
                var current = $(this).val();
                var convert = current.replace(/[^0-9]+/g, "");
                $(this).val(convert);
            });
            $("[name=memberPost], [name=memberAddress1], .btn-address-search").click(function () {
                new daum.Postcode({
                    oncomplete: function (data) {
                        var addr = '';
                        var extraAddr = '';
                        if (data.userSelectedType === 'R') {
                            addr = data.roadAddress;
                        } else {
                            addr = data.jibunAddress;
                        }
                        document.querySelector("[name=memberPost]").value = data.zonecode;
                        document.querySelector("[name=memberAddress1]").value = addr;
                        document.querySelector("[name=memberAddress2]").focus();
                        
                        displayClearButton();
                    }
                }).open();
            });
            $("[name=memberAddress2]").blur(function () {
                var memberPost = $("[name=memberPost]").val();
                var memberAddress1 = $("[name=memberAddress1]").val();
                var memberAddress2 = $("[name=memberAddress2]").val();
                var isEmpty = memberPost.length == 0 && memberAddress1.length == 0 && memberAddress2.length == 0;
                var isFill = memberPost.length > 0 && memberAddress1.length > 0 && memberAddress2.length > 0;
                var isValid = isEmpty || isFill;
                $("[name=memberPost], [name=memberAddress1], [name=memberAddress2]")
                    .removeClass("success fail").addClass(isValid ? "success" : "fail");
                status.memberAddress = isValid;
            });
            $("[name=memberAddress2]").on("input", function () {
                displayClearButton();
            });
            $(".btn-address-clear").click(function () {
                $("[name=memberPost]").val("");
                $("[name=memberAddress1]").val("");
                $("[name=memberAddress2]").val("").trigger("blur");
                status.memberAddress = true;
                displayClearButton();
            });
            //주소 삭제 버튼을 표시/제거하는 함수
            function displayClearButton() {
                var post = $("[name=memberPost]").val();
                var address1 = $("[name=memberAddress1]").val();
                var address2 = $("[name=memberAddress2]").val();
                var exist = post.length > 0 || address1.length > 0 || address2.length > 0;
                if (exist) {
                    $(".btn-address-clear").fadeIn();
                }
                else {
                    $(".btn-address-clear").fadeOut();
                }
            }
});