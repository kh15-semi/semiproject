<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<script type="text/javascript">
</script>
<style>

/* 대시보드 */
.dashboard {
    flex-grow: 1;
    padding: 20px;
}

.dashboard h1 {
    font-size: 28px;
    margin-bottom: 20px;
}

/* 카드 스타일 */
.card-container {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 20px;
    margin-bottom: 30px;
}

.card {
    background-color: white;
    border-radius: 10px;
    padding: 20px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    text-align: center;
}

.card h3 {
    margin: 0;
    font-size: 24px;
    color: #34495e;
}

.card p {
    font-size: 16px;
    color: #7f8c8d;
    margin-top: 10px;
}

</style>

<div class="container w-1000">

    <!-- 대시보드 -->
    <div class="dashboard">
        <h1><i class="fa-solid fa-user-tie"></i>&nbsp;관리자 대시보드</h1>

        <!-- 상단 -->
        <div class="card-container">
	        <a href="/admin/member/list" style="text-decoration: none;">
	            <div class="card">
	                <h3>회원 목록</h3>
	            </div>
			</a>
	        <a href="/admin/company/list" style="text-decoration: none;">
	            <div class="card">
	                <h3>기업 목록</h3>
	            </div>
			</a>
	        <a href="/admin/status/member" style="text-decoration: none;">
	            <div class="card">
	                <h3>회원 현황</h3>
	            </div>
			</a>
        </div>
        
        <!-- 하단 -->
        <div class="card-container">
	        <a href="/admin/status/member-join" style="text-decoration: none;">
	            <div class="card">
	                <h3>회원가입 현황</h3>
	            </div>
			</a>
	        <a href="/admin/status/company" style="text-decoration: none;">
	            <div class="card">
	                <h3>기업 관리</h3>
	            </div>
			</a>
	        <a href="/admin/status/review-write" style="text-decoration: none;">
	            <div class="card">
	                <h3>게시글 현황</h3>
	            </div>
			</a>
        </div>
    </div>
</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>