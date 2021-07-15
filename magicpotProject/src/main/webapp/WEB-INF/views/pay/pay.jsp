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

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>

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

#myPageA {
	text-decoration: none;
	color: rgb(116, 152, 107);
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

			<td>
			<input type="text"  placeholder="도로명 주소" id="addr2" name="addr2"> 
			<input type="text" placeholder="상세주소" id="addr3" name="addr3">
			<input type="text"  placeholder="우편번호" id="addr1" name="addr1">
			<a href="#" class="btn btn-success btn-sm" id="postBtn" data-toggle="modal"
				data-target="#enrollBtn" onclick="execPostCode();" >우편번호</a></td>
				
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
			<td colspan="2">
				<input type="checkbox" id="U_checkAgreement1" required>개인정보 제 3자 제공 동의 <a id="myPageA" href="">내용보기</a> 
				<br> <br> 
				<input type="checkbox" id="U_checkAgreement2" required>후원 유의 사항 <a id="myPageA" href="">내용보기</a></td>

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
	</table>

	<script>
		function execPostCode() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 도로명 조합형 주소 변수

					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}
					// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
					if (fullRoadAddr !== '') {
						fullRoadAddr += extraRoadAddr;
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					console.log(data.zonecode);
					console.log(fullRoadAddr);

					$("[name=addr1]").val(data.zonecode);
					$("[name=addr2]").val(fullRoadAddr);

					document.getElementById('addr1').value = data.zonecode; //5자리 새우편번호 사용
					document.getElementById('addr2').value = fullAddr;
				}
			}).open();
		}
	</script>

	<jsp:include page="../common/footer.jsp" />
</body>
</html>