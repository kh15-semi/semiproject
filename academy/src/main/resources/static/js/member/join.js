$(function() {
	//상태변수
	var status = {
		memberId: false,
		memberPw: false,
		memberPwCheck: false,
		memberName: false,
		memberEmail: true,
		memberContact: true,
		memberAddress: true,
		companyAddress: true,
		ok: function() {
			return this.memberId && this.memberPw
				&& this.memberPwCheck && this.memberName
				&& this.memberEmail && this.memberContact
				&& this.memberAddress && this.companyAddress
		}
	};

	//폼 제출 시 입력값 처리
	if (window.location.href.indexOf("/member/join") !== -1 || window.location.href.indexOf("/company/member/join") !== -1) {  // URL에 'signup'이 포함된 경우
		$("form").submit(function(event) {
			if (!status.ok()) {
				alert("회원가입하려면 모든 필수 정보를 입력해야 합니다.");
				event.preventDefault();
				return false;
			}
		});
	}

	//아이디 관련 처리
	$("[name=memberId]").on("input", function() {
		var current = $(this).val();
		var convert = current.replace(/[^a-z0-9]+/g, "");
		$(this).val(convert);
	});
	$("[name=memberId]").blur(function() {
		var regex = /^[a-z][a-z0-9]{4,19}$/;
		var memberId = $(this).val();

		if (regex.test(memberId)) {//통과
			$.ajax({
				url: "/rest/member/checkMemberId",
				method: "post",
				data: { memberId: memberId },
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
	$("[name=memberPw]").blur(function() {
		var regex = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*[0-9])(?=.*[!@#$])[A-Za-z0-9!@#$]{8,16}$/;
		var isValid = regex.test($(this).val());
		$(this).removeClass("success fail fail2").addClass(isValid ? "success" : "fail");
		status.memberPw = isValid;
	});

	//비밀번호 확인 관련 처리
	$("#memberPwCheck").blur(function() {
		var memberPw = $("[name=memberPw]").val();
		var memberPwCheck = $(this).val();
		$(this).removeClass("success fail fail2");
		if (status.memberPw == false) {//비밀번호 형식에 부합하지 않음
			$(this).addClass("fail2");
			status.memberPwCheck = false;
		}
		else if (memberPw != memberPwCheck) {//비밀번호 불일치
			$(this).addClass("fail");
			status.memberPwCheck = false;
		}
		else {//비밀번호 일치
			$(this).addClass("success");
			status.memberPwCheck = true;
		}
	});

	//이름 관련 처리
	$("[name=memberName]").blur(function() {
		var regex = /^[가-힣]{2,5}$/;
		var isValid = regex.test($(this).val());
		var memberName = $(this).val();
		$(this).removeClass("success fail fail2");
		if (memberName.length == 0) {
			$(this).addClass("fail");
		}
		else if (!isValid) {
			$(this).addClass("fail2");
		}
		else {
			$(this).addClass("success");
			status.memberName = true;
		}
	});

	//주민번호 관련 처리
	$("[name=memberIdCardNum]").on("input", function() {
		var current = $(this).val();
		var convert = current.replace(/[^0-9]+/g, "");

		if (convert.length > 13) {
			convert = convert.substring(0, 13);
		}

		if (convert.length > 6) {
			convert = convert.replace(/([0-9]{6})([0-9]*)/, "$1-$2");
		}

		$(this).val(convert);
	});
	$("[name=memberIdCardNum]").blur(function() {
		var regex = /^[0-9]{6}-[0-9]{7}$/;
		var isValid = $(this).val().length == 0 || regex.test($(this).val());
		$(this).removeClass("success fail").addClass(isValid ? "success" : "fail");
		status.memberIdCardNum = isValid;
	});

	//연락처 관련 처리
	$("[name=memberContact]").on("input", function() {
		var current = $(this).val();
		var convert = current.replace(/[^0-9]+/g, "");

		$(this).val(convert);
	});

	$("[name=memberContact]").blur(function() {
		var regex = /^010[0-9]{8}$/;
		var isValid = $(this).val().length == 0 || regex.test($(this).val());
		$(this).removeClass("success fail").addClass(isValid ? "success" : "fail");
		status.memberContact = isValid;
	});

	//이메일 관련 처리
	$("[name=memberEmail]").blur(function() {
		var regex = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
		var isValid = $(this).val().length == 0 || regex.test($(this).val());
		$(this).removeClass("success fail").addClass(isValid ? "success" : "fail");
		status.memberEmail = isValid;
	});

	//멤머 주소 관련 처리
	$("[name=memberPost]").on("input", function() {
		var current = $(this).val();
		var convert = current.replace(/[^0-9]+/g, "");
		$(this).val(convert);
	});
	$("[name=memberPost], [name=memberAddress1], .btn-member-address-search").click(function() {
		new daum.Postcode({
			oncomplete: function(data) {
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

				memberDisplayClearButton();
			}
		}).open();
	});
	$("[name=memberAddress2]").blur(function() {
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
	$("[name=memberAddress2]").on("input", function() {
		memberDisplayClearButton();
	});
	$(".btn-member-address-clear").click(function() {
		$("[name=memberPost]").val("");
		$("[name=memberAddress1]").val("");
		$("[name=memberAddress2]").val("").trigger("blur");
		status.memberAddress = true;
		memberDisplayClearButton();
	});
	//주소 삭제 버튼을 표시/제거하는 함수
	function memberDisplayClearButton() {
		var post = $("[name=memberPost]").val();
		var address1 = $("[name=memberAddress1]").val();
		var address2 = $("[name=memberAddress2]").val();
		var exist = post.length > 0 || address1.length > 0 || address2.length > 0;
		if (exist) {
			$(".btn-member-address-clear").fadeIn();
		}
		else {
			$(".btn-member-address-clear").fadeOut();
		}
	}

	//회사 주소 관련 처리
	$("[name=companyPost]").on("input", function() {
		var current = $(this).val();
		var convert = current.replace(/[^0-9]+/g, "");
		$(this).val(convert);
	});
	$("[name=companyPost], [name=companyAddress1], .btn-company-address-search").click(function() {
		new daum.Postcode({
			oncomplete: function(data) {
				var addr = '';
				var extraAddr = '';
				if (data.userSelectedType === 'R') {
					addr = data.roadAddress;
				} else {
					addr = data.jibunAddress;
				}
				document.querySelector("[name=companyPost]").value = data.zonecode;
				document.querySelector("[name=companyAddress1]").value = addr;
				document.querySelector("[name=companyAddress2]").focus();

				companyDisplayClearButton();
			}
		}).open();
	});
	$("[name=companyAddress2]").blur(function() {
		var companyPost = $("[name=companyPost]").val();
		var companyAddress1 = $("[name=companyAddress1]").val();
		var companyAddress2 = $("[name=companyAddress2]").val();
		var isEmpty = companyPost.length == 0 && companyAddress1.length == 0 && companyAddress2.length == 0;
		var isFill = companyPost.length > 0 && companyAddress1.length > 0 && companyAddress2.length > 0;
		var isValid = isEmpty || isFill;
		$("[name=companyPost], [name=companyAddress1], [name=companyAddress2]")
			.removeClass("success fail").addClass(isValid ? "success" : "fail");
		status.companyAddress = isValid;
	});
	$("[name=companyAddress2]").on("input", function() {
		companyDisplayClearButton();
	});
	$(".btn-company-address-clear").click(function() {
		$("[name=companyPost]").val("");
		$("[name=companyAddress1]").val("");
		$("[name=companyAddress2]").val("").trigger("blur");
		status.companyAddress = true;
		companyDisplayClearButton();
	});
	//주소 삭제 버튼을 표시/제거하는 함수
	function companyDisplayClearButton() {
		var post = $("[name=companyPost]").val();
		var address1 = $("[name=companyAddress1]").val();
		var address2 = $("[name=companyAddress2]").val();
		var exist = post.length > 0 || address1.length > 0 || address2.length > 0;
		if (exist) {
			$(".btn-company-address-clear").fadeIn();
		}
		else {
			$(".btn-company-address-clear").fadeOut();
		}
	}

	//선택 사항 입력 처리
	$("[name=memberIndustry], [name=memberJob]").on("change", function() {
		var isValid = $(this).val().length > 0;
		$(this).removeClass("success fail").addClass(isValid ? "success" : "fail");
	});
});