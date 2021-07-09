<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}

div {
	border: 0px solid lightgray;
}

/*전체 감싸는 */
.wrap {
	width: 400px;
	margin: auto;
	margin-top: 50px;
}

.content {
	height: 150px;
}

/*이메일*/
#email {
	width: 250px;
	padding: 5px;
	border-radius: 5px;
	border: 2px solid rgb(116, 152, 107);
}

/* 확인 버튼 */
#btn1 {
	width: 250px;
	height: 35px;
	color: white;
	background-color: rgb(116, 152, 107);
	margin-top: 30px;
	border-radius: 5px;
	border: none;
}

a {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body>

	<div align="center" class="wrap">
		<div>
			<a href="">아이디 찾기/</a> <a style="color: rgb(116, 152, 107);" href="">비밀번호
				찾기</a>
		</div>
		<h2 style="color: rgb(116, 152, 107);">비밀번호 찾기</h2>

		<div>
			<p>
				MagicPot은 이메일을 아이디로 사용합니다. <br> 소유하고 계신 계정을 입력해보세요. <br>
				가입여부를 확인해드립니다.
			</p>
		</div>

		<!--이메일 입력-->
		<div class="content">
			<input id="email" type="text" name="email" placeholder="이메일을 입력하세요.">
			<button id="btn1" type="submit">확인</button>
			<br>
			<br>

		</div>
	</div>

</body>
</html>