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
<script type="text/javascript">
$(function() {
	// 사업자번호 버튼 클릭 시
	$(".btn").click(function() {
		
	});

});
</script>    
</head>
<body>
    <h1 class="title">사업자번호</h1>
    <input name="memeberCrNumber" class="field" placeholder="회사 사업자번호 ">
    <button class="btn">등록</button>
</body>
</html>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>