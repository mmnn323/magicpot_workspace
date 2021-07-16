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
/*content*/
.content {
	margin: auto;
	text-align: center;
	width: 50%;
	height: 100%;
	float: left;
}

.content>h5 {
	padding-top: 15px;
}

.content1 {
	width: 50%;
	float: left;
	height: 100%;
	font-size: 15px;
	line-height: 40px;
	margin-left: -60px;
}

.content1>ul>li {
	border: 1px solid;
	border-color: rgb(216, 215, 215);
	border-radius: 5px;
	font-size: 12px;
	text-align: center;
	list-style: none;
	width: 200px;
	margin-top: 5px;
}

/* 버튼 영역 */
#cm_btnArea {
	margin-left: -250px;
}

#cm_btnArea a {
	border: none;
	width: 100px;
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
</style>
</head>
<body>
	<jsp:include page="../common/adminPageTemplate2.jsp" />

	<div id="content">
		<div class="outer">
			<div id="contentTitleArea">
				<span id="title1">결제관리</span> <span id="title2">결제상세 조회</span>
			</div>

			<br> <br> <br> <br> <br>

			<div class="content">
				<h5>
					<b>회원번호</b>
				</h5>
				<h5>
					<b>아이디</b>
				</h5>
				<h5>
					<b>이름</b>
				</h5>
				<h5>
					<b>프로젝트</b>
				</h5>
				<h5>
					<b>결제 방법</b>
				</h5>
				<h5>
					<b>쿠폰</b>
				</h5>
				<h5>
					<b>결제 금액</b>
				</h5>
				<h5>
					<b>총 결제 금액</b>
				</h5>
			</div>
			<div class="content1">
				<ul>
					<li>2</li>
					<li>user01</li>
					<li>김김</li>
					<li>소창</li>
					<li>리빙</li>
					<li>100%</li>
					<li>카드</li>
					<li>3000</li>
					<li>24000</li>
					<li>24000</li>
				</ul>
				<br>
			</div>

			<!-- 버튼 영역 -->
			<div id="cm_btnArea" align="center">
				<a href="" class="btn btn-success" id="cm_enrollBtn">결제취소</a>

			</div>

			<br> <br> <br> <br> <br> <br> <br>
			<br> <br>
		</div>
	</div>

</body>
</html>