<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

div {
	border: 0px solid lightgray;
	box-sizing: border-box;
}

.wrap {
	width: 1000px;
	height: 900px;
	margin: auto;
}

#header {
	height: 8%;
}

#content {
	height: 50%;
}

#header>div {
	width: 110px;
	height: 60px;
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

#a {
	text-decoration: none;
	font-weight: bold;
	color: black;
}

#content3 {
	height: 200px;
	width: 370px;
	border: 1px solid rgb(116, 152, 107);
	border-radius: 3px;
	margin-top: 50px;
}

#content4 {
	height: 300px;
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
					<a id="a" style="color: rgb(116, 152, 107);" href="">나의 쿠폰</a>
				</h4>
			</div>
			<div id="header3">
				<h4>
					<a id="a" href="couponZone.me"><h4>쿠폰존</h4></a>
			</div>
			<div id="header4">
				<h4>
					<a id="a" href="pastCoupon.me">지난 쿠폰 내역</a>
				</h4>
			</div>
		</div>

		<div id="content">
			<hr>
			<div id="content1">
				<h3>&nbsp;&nbsp;사용 가능한 쿠폰</h3>
			</div>

			<div id="content2">
				&nbsp;&nbsp;&nbsp; <a id="a" style="color: rgb(116, 152, 107);"
					href=""> 
				</a>
			</div>
   <c:forEach var="c" items="${ list }"> 
			<div id="content3">
			  <form action="mycoupon.me">
			
				<h1 style="color: rgb(116, 152, 107);">&nbsp;&nbsp;${ c.cpPrice }원</h1>
				<p>
					&nbsp;&nbsp;&nbsp; ${ c.cpName } <br>&nbsp;&nbsp;&nbsp; 
					유효기간 ${ c.cpLimit } <br>&nbsp;&nbsp;&nbsp; 사용조건 ${ c.cpCondition }
					가능
				</p>
			
			  </form>	
			</div>
  </c:forEach>	
			<div id="content4">
				<p>
				<h3>&nbsp;&nbsp;&nbsp;펀딩 쿠폰 이용안내</h3>
				<br> &nbsp; 1. 쿠폰은 펀딩 서비스 이용 시 사용할 수 있습니다.<br> &nbsp; 2.
				쿠폰은 다른 쿠폰과 중복하여 사용할 수 없습니다.<br> &nbsp; 3. 쿠폰의 구체적인 사용 조건은 발행되는
				쿠폰 별로 다를 수 있습니다.<br> &nbsp; 4. 펀딩이 실패하거나 펀딩 예약 취소를 한 경우, 쿠폰은
				반환됩니다.<br> &nbsp; 5. 단, 반환 시점에 쿠폰 유효기간이 만료된 경우 자동 소멸됩니다.<br>
				&nbsp; 6. 펀딩 결제 실패인 경우에는 쿠폰이 반환되지않고, 소멸됩니다.<br>
				</p>
			</div>
		</div>

	</div>


</body>
</html>