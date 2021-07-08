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

.wrap {
	width: 950px;
	height: 1200px;
	
}

#img {
	width: 200px;
	height: 150px;
}

.coupon {
	width: 200px;
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
	width: 400px;
	height: 35px;
	margin: 15px;
}

#pundingbtn2 {
	background-color: lightgray;
	color: white;
	border: none;
	border-radius: 2px;
	width: 400px;
	height: 35px;
	margin: 10px;
}

#btnArea a {
	border: none;
	width: 80px;
	margin-top: 15px;
	padding: 7px;
	margin-left: 10px;
	background-color: rgb(116, 152, 107);
}

#postBtn {
	background-color: rgb(116, 152, 107);
}
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />

	<table class="wrap" align="center">

		<tr>
			<th id="empty"></th>
			<th id="img"><img style="width: 200px;"
				src="../img/sochang.jfif" alt=""></th>
			<td colspan="4">
				<p>
					냄사나는 수건은 그만! 피부관리의 시작, 우리집엔 소창수건이 있다!!<br>
				</p>
			</td>
		</tr>

		<tr>
			<th id="empty"></th>
			<td><h4>펀딩상품</h4></td>
			<td style="width: 100px;"></td>

			<td></td>
			<!-- 공백용-->

			<td><h2></h2></td>
			<td></td>
		</tr>


		<tr>
			<th id="empty"></th>
			<td><h6>펀딩 구성</h6></td>
			<td>소창수건3개</td>

			<td id="empty2"></td>
			<!-- 공백용-->

			<td></td>
			<td></td>
		</tr>

		<tr>
			<th id="empty"></th>
			<td><h6>펀딩 금액</h6></td>
			<td>24000원</td>

			<td id="empty2"></td>
			<!-- 공백용-->

			<td></td>
			<td></td>
		</tr>



		<tr>
			<th id="empty"></th>
			<td><h4>수령자 정보</h4></td>

			<td></td>
			<!-- 공백용-->
			<td></td>
			<!-- 공백용-->

			<td></td>
			<td><h4>결제수단</h4></td>
		</tr>

		<tr>
			<th id="empty"></th>
			<td><h6>연락처</h6></td>
			<td>0101233421</td>

			<td id="empty2"></td>
			<!-- 공백용-->

			<td></td>
			<td><h6>신용카드</h6></td>
		</tr>


		<tr>
			<th id="empty"></th>
			<td><h6>이메일</h6></td>
			<td>askj99@gmail.com</td>

			<td id="empty2"></td>
			<!-- 공백용-->

			<td></td>
			<td><select class="coupon" name="" id="">
					<option value="">쿠폰선택</option>
					<option value="">쿠폰1</option>
			</select></td>
		</tr>

		<tr>
			<th id="empty"></th>
			<td><h6>배송지 정보</h6></td>

			<td><input type="text"> <input type="text"> <input
				type="text"> <br> <a href="#"
				class="btn btn-success btn-sm" id="postBtn" data-toggle="modal"
				data-target="#enrollBtn">우편번호</a></td>
			<td></td>
			<!-- 공백용-->

			<td></td>
			<td></td>
		</tr>

		<tr>
			<th id="empty"></th>
			<td colspan="2"><p>
					* 위 연락처와 이메일로 후원 관련 소식이 전달됩니다. <br> * 연락처 및 이메일 변경은 설정 > 계정
					설정에서 가능합니다.
				</p></td>


			<td id="empty2"></td>
			<!-- 공백용-->

			<td></td>
			<td></td>
		</tr>

		<tr>
			<th id="empty"></th>
			<td><h4>최종 후원 금액</h4></td>
			<td>
				<p>
					배송비 <br> 쿠폰적용
				</p> 24000원
			</td>

			<td id="empty2"></td>
			<!-- 공백용-->

			<td></td>
			<td></td>
		</tr>
		<tr>
			<th id="empty"></th>
			<td colspan="2">
				<p>
					프로젝트 성공시, 결제는 2021.05.31 에 진행됩니다. <br> 프로젝트가 무산되거나 중단된 경우, 예약된
					결제는 자동으로 취소됩니다.
				</p>
			</td>


			<td id="empty2"></td>
			<!-- 공백용-->

			<td></td>
			<td colspan="2"><input type="checkbox" required>개인정보 제
				3자 제공 동의 <a href="">내용보기</a> <br> <br> <input
				type="checkbox" required>후원 유의 사항 <a href="">내용보기</a></td>

		</tr>

		<tr>
			<th id="empty"></th>
			<td colspan="2"></td>
			<td></td>

			<td id="empty2"></td>
			<!-- 공백용-->

			<td colspan="2"></td>

		</tr>

		<tr>
			<th id="empty"></th>
			<th colspan="5">
				<p>
					밀어주기는 아직 실현되지 않은 창작자의 프로젝트에 제작비를 후원하는 과정입니다. <br> 그렇기 때문에 제작
					계획이 변경될 수 있으며, 프로젝트를 완수하고 후원자와 성실히 소통할 책임은 프로젝트 주체인 창작자에게 있습니다.
				</p>
			</th>
			<td id="empty2"></td>
			<!-- 공백용-->
		</tr>


		<tr>
			<th id="empty"></th>
			<th colspan="5">
				<button id="pundingbtn" type="submit">후원 하기</button>
				<button id="pundingbtn2" type="submit">후원 취소</button>
			</th>
			<td id="empty2"></td>
			<!-- 공백용-->
		</tr>
		<!-- The Modal -->
		<div class="modal fade" id="enrollBtn" align="center">
			<!-- ex) 커뮤니티버튼영역 : cmEnrollBtn -->
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">

					<!-- Modal body -->
					<br>
					<div class="modal-body">
						<br>
						<p>
							TIP <br> 아래와 같은 조합으로 검색을 하시면 더욱 정확한 결과가 검색됩니다. <br> 도로명
							+ 건물번호<br> 예) 판교역로 235, 제주 첨단로 242
						</p>
					</div>

					<!-- Modal footer -->
					<div id="modalFooter">
						<!-- ex) 커뮤니티버튼영역 : cmModalFooter-->
						<button id="okBtn" class="btn btn-sm">OK</button>
						<!-- ex) 커뮤니티버튼영역 : cmOkBtn -->
						<button id="cancleBtn" data-dismiss="modal"
							class="btn btn-secondary">Cancle</button>
						<!-- ex) 커뮤니티버튼영역 : cmCancleBtn -->
					</div>
				</div>
			</div>
		</div>
	</table>

	<jsp:include page="../common/footer.jsp" />
</body>
</html>