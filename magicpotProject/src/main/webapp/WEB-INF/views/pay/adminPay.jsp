<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery 라이브러리 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/dd18300701.js"
	crossorigin="anonymous"></script>


<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">

<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}

table, tr, th, td {
	border: 1px solid lightgray;
	border-collapse: collapse;
}

/* content */
#content1 {
	padding-left: 50px
}

/*  */
/* .outer 스타일 통일 */
.outer {
	/* height: 700px; */
	/* border: 1px solid red; */
	width: 900px;
	margin: 30px;
	float: left;
}

/* 컨텐트 카테고리 타이틀 영역 */
#contentTitleArea {
	font-family: 'Noto Sans KR', sans-serif;
	width: 900px;
	border-bottom: 2px solid lightgray;
	padding: 10px;
	margin: 20px;
	margin-top: 0;
}

#title1 {
	font-size: 25px;
	font-weight: bold;
}

#title2 {
	font-size: 16px;
	background-color: gray;
	color: white;
	margin-left: 10px;
	border: 1px solid gray;
	border-radius: 5px;
	padding: 3px;
}

/* 커뮤니티 검색+버튼 영역 */
#searchBtnArea div {
	float: left;
}

/* 커뮤니티 검색 영역 */
#cm_SearchCtg, #cm_keyword {
	padding: 5px;
	border: 1px solid gray;
	border-radius: 4px;
}

#cm_SearchCtg {
	margin-left: 85px;
	width: 120px;
}

#cm_keyword {
	width: 350px;
	padding-left: 15px;
	margin-left: 3px;
}

#cm_searchArea select {
	text-align-last: center;
	text-align: center;
	-ms-text-align-last: center;
	-moz-text-align-last: center;
}

/* 버튼 영역 */
#cm_btnArea a {
	border: none;
	width: 80px;
	padding: 7px;
	margin-right: 10px;
}

#cm_enrollBtn {
	background-color: rgb(116, 152, 107);
	margin-left: 70px;
}

#cm_enrollBtn:hover {
	background-color: rgb(93, 121, 86);
}

#cm_deleteBtn {
	background-color: rgb(252, 99, 99);
}

#cm_deleteBtn:hover {
	background-color: rgb(216, 66, 66);
}

/* 리스트 영역  */
#cmNoticeListArea {
	margin-top: 50px;
	text-align: center;
}

#cmNoticeList {
	width: 800px;
}

#cmNoticeList>tbody a {
	color: black;
	text-decoration: none;
}

#cmNoticeList>tbody>tr:hover {
	background-color: rgb(215, 231, 212);
}

/* 페이징 영역 */
#cm_pagingArea {
	padding: 30px;
}

.pagination>li>a {
	color: rgb(116, 152, 107);
}

.pagination>li>a:hover {
	color: rgb(225, 212, 169);
}

#cm_paging {
	width: fit-content;
}
</style>
</head>
<body>
	<jsp:include page="../common/adminPageTemplate2.jsp" />
	

	<div id="content">
		<div class="outer">
			<div id="contentTitleArea">
				<span id="title1">결제 관리</span> <span id="title2">결제 관리</span>
			</div>

			<br> <br> <br> <br> <br>

			<!-- 검색바 + 버튼 영역 (오븐에서 한 줄에 있길래 하나의 div안에 넣었어요!) -->
			<div id="searchBtnArea">
				<!-- 커뮤니티 검색바 -->
				<div id="cm_searchArea">
					<select name="" id="cm_SearchCtg">
						<option value="">회원ID</option>
						<option value="">이름</option>
						<option value="">이메일</option>
					</select> <input id="cm_keyword" type="text" placeholder=" Search">
				</div>

				<!-- 버튼 영역 -->
				<div id="cm_btnArea">
					<a href="" class="btn btn-success" id="cm_enrollBtn">결제취소</a>
				</div>
			</div>

			<!-- 리스트 영역 -->
			<!-- 
                        mybatis 수업시간에 제목에 a태그 달아서 제목만 클릭 시 상세보기로 넘어갔는데 일단 그렇게 적용했어요!
                        이 부분은 기능구현 부분이니 tr 클릭 시 요청하고 싶으신 분들은 그렇게 수정해주셔도 될 것 같아요~!
                        -->
			<div id="cmNoticeListArea">
				<form action="adminPay.me" method="post">
					<table class="table" id="cmNoticeList" align="center">
						<thead class="thead-light">
							<tr>
								<th width="40"><input type="checkbox"></th>
								<th width="150">회원 번호</th>
								<th width="100">아이디</th>
								<th width="90">이름</th>
								<th width="100">카테고리</th>
								<th width="200">프로젝트</th>
								<th width="150">결제금액</th>
								<th width="150">달성현황</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="checkbox"></td>
								<td>41</td>
								<td><a href="">user10</a></td>
								<td>132</td>
								<td>리빙</td>
								<td>소창수건</td>
								<td>23000</td>
								<td>y</td>
							</tr>




						</tbody>
					</table>
				</form>
			</div>

			<!-- 페이징 영역 -->

			<div id="cm_pagingArea" align="center">

				<div id="cm_paging">
					<ul class="pagination pagination">
						<li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
						<li class="page-item"><a class="page-link" href="#">&lt;</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">4</a></li>
						<li class="page-item"><a class="page-link" href="#">5</a></li>
						<li class="page-item"><a class="page-link" href="#">&gt;</a></li>
						<li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
					</ul>
				</div>

			</div>

		</div>
	</div>
	</div>
</body>
</html>