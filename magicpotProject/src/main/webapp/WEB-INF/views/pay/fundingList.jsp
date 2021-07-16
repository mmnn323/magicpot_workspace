<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
}

.wrap {
	width: 1000px;
}

img {
	width: 200px;
	height: 150px;
}

#empty {
	width: 20px;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />

	<table class="wrap">
		<tr>
			<td colspan="6"><h1>&nbsp;&nbsp;나의 펀딩 내역</h1>
				<hr></td>
		</tr>

		<tr class="empty">
			<th colspan="2"></th>
			<th style="width: 500px;"></th>
			<th><select name="" id="">
					<option value="전체">전체</option>
					<option value="결제예약">결제예약</option>
					<option value="결제완료">결제완료</option>
					<option value="결제실패">결제실패/취소</option>
			</select></th>
		</tr>

		<tr>
			<th id="empty"></th>
			<th><img src="../img/sochang.jfif" alt=""></th>
			<td colspan="4">
				<p>
					냄사나는 수건은 그만! 피부관리의 시작, 우리집엔 소창수건이 있다!!<br>
				</p>
			</td>
		</tr>
	</table>

	<jsp:include page="../common/footer.jsp" />
</body>
</html>