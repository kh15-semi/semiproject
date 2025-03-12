<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!-- google font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

<!-- font awesome cdn -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script type="text/javascript">
    $(function () {
        // 정보 수정 버튼 클릭 시
        $(".btn-edit").click(function() {
            window.location.href = "/company/edit";
        });
        // 메인 버튼 클릭 시
        $(".btn-main").click(function() {
            window.location.href = "/";
        });
    });
</script>

<div class="container w-800">
        <div class="cell" style="margin: 10px; padding: 10px">
            <div class="cell">
                <h2><i class="fa-regular fa-building blue"></i>&nbsp;기업 상세 정보</h2>
            </div>
            <hr style="border: none; border-top: 1px solid rgb(196, 196, 196)"><br>
            <div class="cell" >
               <div class="cell">
                   <h3><i class="fa-regular fa-square-check blue"></i>&nbsp;기업 이미지</h3>
                   <p><img src="https://www.placehold.co/200x200"></p>
               </div>
               <div class="cell">
                   <h3><i class="fa-regular fa-square-check blue"></i>&nbsp;상호명</h3>
                   <p>${companyDto.companyName}</p>
               </div>
               <div class="cell">
                   <h3><i class="fa-regular fa-square-check blue"></i>&nbsp;업체 연락처</h3>
                   <p>${companyDto.companyContact}</p>
               </div>
               <div class="cell">
                   <h3><i class="fa-regular fa-square-check blue"></i>&nbsp;홈페이지 URL</h3>
                   <p>${companyDto.companyURL}</p>
               </div>
               <div class="cell">
                   <h3><i class="fa-regular fa-square-check blue"></i>&nbsp;사업자 등록번호</h3>
                   <p>${companyDto.companyCrNumber}</p>
               </div>
               <div class="cell">
                   <h3><i class="fa-regular fa-square-check blue"></i>&nbsp;산업군</h3>
                   <p>${companyDto.companyIndustry}</p>
               </div>
               <div class="cell">
                   <h3><i class="fa-regular fa-square-check blue"></i>&nbsp;주소</h3>
                   <p>${companyDto.companyPost}</p>
                   <p>${companyDto.companyAddress1}</p>
                   <p>${companyDto.companyAddress2}</p>
               </div>
        	</div>
        <br>
        <hr style="border: none; border-top: 1px solid rgb(196, 196, 196)"><br>
        <div class="cell center" style="margin: 10px; padding: 10px;">
            <button type="button" class="btn-edit btn btn-green2" style="border-radius: 10px;"><i class="fa-solid fa-pen-to-square"></i> 정보 수정</button>
	        <button type="button" class="btn-main btn btn-green2" style="border-radius: 10px;"><i class="fa-solid fa-house"></i> 메인</button>
        </div>
    </div>
</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
