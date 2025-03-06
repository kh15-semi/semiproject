$(function() {
	// 정보 수정 버튼 클릭 시
	$(".edit-btn").click(function() {
		window.location.href = "/member/edit";
	});

	//미구현 상태
	// 비밀번호 변경 버튼 클릭 시
	$(".changePw-btn").click(function() {
		window.location.href = "/member/change-password";
	});

	// 메인 버튼 클릭 시
	$(".main-btn").click(function() {
		window.location.href = "/";
	});
});