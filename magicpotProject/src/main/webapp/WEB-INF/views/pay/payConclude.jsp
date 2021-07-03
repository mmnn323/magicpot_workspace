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

div, tr, th {
	border: 1px solid lightgrey;
}

th {
	height: 50px;
	width: 200px;
}

.wrap {
	width: 1000px;
}

#btn {
	background-color: rgb(116, 152, 107);
	border: none;
	border-radius: 3px;
	color: white;
	width: 80px;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />

	<div class="wrap">
		<h1>
			결제 완료
			<hr>
		</h1>

		<table align="center">
			<tr>
				<th>펀딩 번호</th>
				<th>1234</th>


			</tr>
			<tr>
				<th>펀딩 날짜</th>
				<th>2021.02.03</th>
			</tr>
			<tr>
				<th>펀딩 최종 금액</th>
				<th>100,000</th>
			</tr>
			<tr>
				<th>우편 번호</th>
				<th>20032</th>
			</tr>
			<tr>
				<th>배송지</th>
				<th>홍길동 <br> 010-1234-5678 <br> 서울 마포구 동교동 194
				</th>
			</tr>
			<tr>
				<th>배송 메모</th>
				<th>부재시 문앞</th>
			</tr>
			<tr>
				<th colspan="2"><button id="btn">확인</button></th>

			</tr>

		</table>

	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>