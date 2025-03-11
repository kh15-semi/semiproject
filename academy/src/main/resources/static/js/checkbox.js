$(function () {
    $(".check-all").on("input", function () {
        var isCheck = $(this).prop("checked");
        $(".check-all, .check-item").prop("checked", isCheck);
    });
	
    $(".check-item").on("input", function () {
        var all = $(".check-item").length;
        var checked = $(".check-item").filter(":checked").length;
        var allCheck = all == checked;

        $(".check-all").prop("checked", allCheck);
    });
});