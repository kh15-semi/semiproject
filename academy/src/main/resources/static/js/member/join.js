$(function(){
	//상태변수
	var status = {
		memberId: false,
		memberPw: false,
		memberPwReinput: false,
		memberName: false,
		memberEmail: false,
		memberEmailCert: false,
		memberContact: true,
		memberAddress: true,
		ok: function () {
        	return this.memberId && this.memberPw
				&& this.memberPwReinput && this.memberName
				&& this.memberEmail && this.memberEmailCert 
				&& this.memberContact && this.memberAddress
      	}
	};
		
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