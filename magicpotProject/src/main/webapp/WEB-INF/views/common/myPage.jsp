
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<title>Document</title>
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

table, th, td {
	border: px solid lightgray;
}

/*전체 table 크기 설정*/
.wrap {
	width: 1000px;
	height: 1000px;
	margin: auto;
	margin-top: 150px;
}

#a {
	text-decoration: none;
	color: black;
}

th {
	width: 60px;
}

.wrap {
	text-align: center;
}
/* 닉네임 위치 설정*/
#id {
	width: 200px;
}

.my {
	height: 30px;
}

#pd {
	width: 50px;
}

.pd2 {
	background-color: rgb(225, 212, 169);
	border-radius: 5px;
}

#center {
	width: 20px;
}

#myPageA {
	text-decoration: none;
	color: rgb(116, 152, 107);
}
</style>

</head>
<body>


	<jsp:include page="../common/header.jsp" />

	<table class="wrap">

		<tr>
			<!--회원 닉네임-->
			<th id="id"><h2>${ loginUser.memName }</h2>서포터·개인회원</th>
			<th rowspan="6"></th>

			<!--펀딩횟수-->
			<th class="pd2" colspan="6"><h2>펀딩하기</h2> <a
				style="font-size: 20px;" href="" id="myPageA"></a></th>
			<th id="pd" rowspan="8"></th>
		</tr>
		<tr>
			<th rowspan="7"></th>
			<th style="height: 20px;" colspan="6"></th>
		</tr>

		<form class="i">

			<!--메세지, 쿠폰-->
			<tr>
				<th><i class="far fa-envelope fa-2x"></i></th>
				<td colspan="2">
					<!-- 다인 추가 - 로그인 한 회원 상태에 따라 다른 페이지 연결 --> <c:choose>
						<c:when test="${ loginUser.status eq 'Y' }">
							<p>
								<a id="a" href="myPageMsg.me">메세지</a>
							</p>
						</c:when>
						<c:when test="${ loginUser.status eq 'C' }">
							<p>
								<a id="creator" href="creatorMsg.me">메세지</a>
							</p>
						</c:when>
					</c:choose>
							<th></th>
							<!-- 공간유지용-->
				<th><i class="fas fa-tags fa-2x"></i></th>
				<td class="icons">
                <p> <a href="mycoupon.me" id="a">쿠폰 </a> </p>
            </td>         
				
			</tr>

			<!-- 나의 활동 - 내가 만든 프로젝트, 좋아하는 프로젝트-->
			<tr class="my">
				<td colspan="2"><h2>나의 활동</h2></td>
			</tr>

			<tr>
				<th><i class="far fa-edit fa-2x"></i></th>
				<td colspan="2"><c:choose>
						<c:when test="${loginUser.status eq 'C' }">
							<a href="made.pr"><p>내가 만든 프로젝트</p></a>
						</c:when>
						<c:otherwise>
							<a id="a" href="" onclick="creatorYn();"><p>내가 만든 프로젝트</p></a>
						</c:otherwise>
					</c:choose></td>

				<th></th>
				<!--그냥 가운데 공간주는 용도-->

				<th><i class="fas fa-heart fa-2x"></i></th>
				<td><a id="a" href="like.pr"><p>좋아하는 프로젝트</p></a></td>

			</tr>



			<!-- 문의 내역, 정보변경 -->
		<tr>
			<th><i class="fas fa-file-invoice-dollar fa-2x"></i></th>
			<td colspan="2"><a href="fundingList.me?mno=${ loginUser.memNo }" id="a"><p>주문내역</p></a></td>


			<th></th>
			<!-- 공간유지용-->

			<th><i class="fas fa-user-plus fa-2x"></i></th>
			<td><a href="profile.me" id="a"><p>정보변경</p></a></td>
		</tr>

		<tr>
			<th></th>
			<th><i class="fas fa-map-marker-alt fa-2x"></i></th>
			<td colspan="2"><a href="address.me" id="a"><p>배송지 관리</p></a></td>


			<th></th>
			<!-- 공간유지용-->


		</tr>


		<!-- 서포터 팁!-->
		<tr class="my">


			<!-- 공간유지용-->
			<td></td>
			<td colspan="3">
				<h2>서포터 팁</h2>
			</td>
		</tr>
		<tr>
			<th></th>
			<th></th>
			<!-- 공간유지용-->

			<th><i class="fas fa-volume-down fa-2x"></i></th>
			<td colspan="2"><a href="" id="a"><p>공지사항</p> </a></td>

			<th></th>
			<!-- 공간유지용-->

			<th><i class="far fa-clipboard fa-2x"></i></th>
			<td colspan="2"><a href="" id="a"><p>이용가이드</p></a></td>

		</tr>


		</form>

	</table>

	<jsp:include page="../common/footer.jsp" />


</body>
</html>