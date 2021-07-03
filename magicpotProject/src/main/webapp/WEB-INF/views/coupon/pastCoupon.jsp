<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"
	integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc"
	crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}

div, th {
	border: px solid lightgray;
	box-sizing: border-box;
}

table {
	margin-top: 50px;
	margin-left: auto;
	margin-right: auto;
	border-collapse: collapse;
}

.wrap {
	width: 1000px;
	height: 900px;
	margin: auto;
}

.content {
	width: 300px;
	margin-top: 50px;
	border: 1px solid rgb(116, 152, 107);
	border-radius: 5px;
}

#header {
	height: 7%;
}

#header>div {
	width: 110px;
	height: 100%;
	float: left;
	text-align: center;
}

#header2 {
	line-height: 50px;
}

#header3 {
	line-height: 50px;
}

#header4 {
	line-height: 50px;
}

#content1 {
	height: 150px;
}

#a {
	text-decoration: none;
	font-weight: bold;
	color: black;
}
</style>
</head>
<body>

	<div class="wrap">
		<div id="header">
			<div id="header1">
				<h2>쿠폰내역</h2>
			</div>
			<div id="header2">
				<h4>
					<a id="a" href="">나의 쿠폰</a>
				</h4>
			</div>
			<div id="header3">
				<h4>
					<a id="a" href=""><h4>쿠폰존</h4></a>
			</div>
			<div id="header4">
				<h4>
					<a id="a" style="color: rgb(116, 152, 107);" href=""> 지난 쿠폰 내역</a>
				</h4>
			</div>
		</div>

		<hr>
		<div class="content">
			<div>펀딩기간종료</div>
			<div id="content1">
				<h1 style="color: rgb(116, 152, 107);">&nbsp;&nbsp;3,000원</h1>
				<p>
					&nbsp;&nbsp;&nbsp; 첫 구매 쿠폰 <br>&nbsp;&nbsp;&nbsp; 유효기간
					2020.12.12 23시59분 <br>&nbsp;&nbsp;&nbsp; 사용조건 20,000이상 펀딩 시 사용
					가능
				</p>
			</div>
		</div>
	</div>
</body>
</html>