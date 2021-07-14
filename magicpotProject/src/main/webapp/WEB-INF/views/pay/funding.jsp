<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}

table, tr, th, td {
	border: px solid lightgray;
}

.wrap {
	width: 1000px;
	height: 1000px;
}

#img {
	width: 200px;
	height: 150px;
}

#empty {
	width: 20px;
}

#empty2 {
	width: 60px;
}

#pundingbtn {
	background-color: rgb(116, 152, 107);
	color: white;
	border: none;
	border-radius: 2px;
	width: 300px;
	height: 30px;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<table class="wrap">
		<tr>
			<td colspan="6"><h1>&nbsp;&nbsp;나의 펀딩 상세보기</h1>
				<hr></td>

		</tr>


		<tr>
			<th id="empty"></th>
			<th id="img"><img style="width: 200px;"
				src="../img/sochang.jfif" alt=""></th>
			<td colspan="4">
				<p>
					냄새나는 수건은 그만! 피부관리의 시작, 우리집엔 소창수건이 있다!!<br>
				</p>
			</td>
		</tr>

		<tr>
			<th id="empty"></th>
			<td><h2>주문 정보</h2></td>
			<td></td>

			<td></td>
			<!-- 공백용-->

			<td><h2>리워드 정보</h2></td>
			<td></td>
		</tr>


		<tr>
			<th id="empty"></th>
			<td>주문 번호</td>
			<td>12334</td>

			<td id="empty2"></td>
			<!-- 공백용-->

			<td>리워드 구성</td>
			<td>소창수건3개</td>
		</tr>

		<tr>
			<th id="empty"></th>
			<td>주문 날짜</td>
			<td>123124</td>

			<td id="empty2"></td>
			<!-- 공백용-->

			<td>리워드 금액</td>
			<td>100만운</td>
		</tr>

		<tr>
			<th id="empty"></th>
			<td>주문 마감일</td>
			<td>2021.01.31</td>

			<td id="empty2"></td>
			<!-- 공백용-->

			<td>전달상태</td>
			<td>2021.01.13</td>
		</tr>

		<tr>
			<th id="empty"></th>
			<td><h2>결제정보</h2></td>

			<td></td>
			<!-- 공백용-->
			<td></td>
			<!-- 공백용-->

			<td><h2>배송 정보</h2></td>
			<td></td>
		</tr>

		<tr>
			<th id="empty"></th>
			<td>결제수단</td>
			<td>신용카드</td>

			<td id="empty2"></td>
			<!-- 공백용-->

			<td>받는 사람</td>
			<td>강보람</td>
		</tr>

		<tr>
			<th id="empty"></th>
			<td>결제금액</td>
			<td>100000</td>

			<td id="empty2"></td>
			<!-- 공백용-->

			<td>연락처</td>
			<td>01012345678</td>
		</tr>

		<tr>
			<th id="empty"></th>
			<td>결제상태</td>
			<td>완료</td>

			<td id="empty2"></td>
			<!-- 공백용-->

			<td>주소</td>
			<td>kh정보교육원</td>
		</tr>

		<tr>
			<th id="empty"></th>
			<td></td>
			<td></td>

			<td id="empty2"></td>
			<!-- 공백용-->

			<td>운송장</td>
			<td>CJ대한통운,1234</td>
		</tr>

		<tr>
			<th colspan="6"><br> <br>
				<button id="pundingbtn">후원목록</button></th>
		</tr>

	</table>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>