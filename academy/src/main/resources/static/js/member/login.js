$(document).ready(function () {
    $("[name=memberId], [name=memberPw]").on("blur", function() {
        var isValid = $(this).val().trim().length > 0; // 입력 여부만 체크
        $(this).removeClass("success fail").addClass(isValid ? "success" : "fail");
    });
});