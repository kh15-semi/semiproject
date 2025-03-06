<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회사 등록창</title>
    <style>
        .btn,.field{
            display: block;
            margin: 0px auto;
            font-size: 16px;
            box-sizing: border-box;
            padding: 0.8em;
        
        }
        .btn{
             margin: 8px auto;
             background-color: rgb(27, 198, 98);
             color: white;
             border:none;
            border-radius: 5px;
             cursor: pointer;
             width: 410px;
             cursor: pointer; /*커서모양*/
        }
        .field{
            width: 410px;
            font-size: 16px;
            border-radius: 5px;
            border-width: 0.5px;/*테두리폭*/
            border-color: gray;
            border-style: solid;
           
        }
        .title{
            text-align: center;
            color:rgb(27, 198, 98) ;
            font-size: 50px;
           
        }
    </style>
<script>
$(function() {
    $("#memberCrNumber").on("blur", function() { 
        var crNumber = $(this).val();
        $.ajax({
            url: "/company/member/getCompanyName",
            type: "GET",
            data: { crNumber: crNumber },
            success: function(response) {
                if (response.companyName) {
                    $("#companyName").val(response.companyName);
                } else {
                    alert("해당 사업자 등록 번호로 기업명을 찾을 수 없습니다.");
                    $("#companyName").val("");
                }
            },
        });
    });
});
</script>   
</head>
<body>
    <h1 class="title">회사 이력 등록</h1>
    <form action="/member/addCompany" method="post">
    	<input type="text" id="memberCrNumber" name="memberCrNumber" class="field w-100" placeholder="사업자 등록 번호">
        <input type="text" id="companyName" name="companyName" class="field w-100" placeholder="기업명" value="${companyName}" readonly>
        <input type="date" name="companyHistoryJoinDate" class="field" placeholder="입사일" pattern="yyyy-MM-dd">
        <input type="date" name="companyHistoryLeaveDate" class="field" placeholder="퇴사일 (재직 중인 경우 비워두세요)" pattern="yyyy-MM-dd">
        <button type="submit" class="btn">등록 요청</button>
    </form>
</body>
</html>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>