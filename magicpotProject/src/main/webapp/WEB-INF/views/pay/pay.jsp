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

<!-- 결제 관련 cdn -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}

table, tr, th, td {
	border: px solid lightgray;
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

	<c:forEach var="o" items="${ list }">
	<form action="conclude.me" method="post" id="payForm">
	
				<input type="hidden" value="${o.memNo }" name="memNo"/>
				<input type="hidden" value="${o.phone }" name="adPhone"/>
				<input type="hidden" value="${o.orNo }" name="orNo"/>
		<table class="wrap" align="center">

			<tr>
				<th id="empty"></th>
				<th id="img"><img style="width: 200px;" src="${ o.proImage }"
					alt=""></th>
				<td colspan="4">
					<p id="#proTitle">
						${ o.proTitle }<br>
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
				<td>${ o.rewardExplain }</td>

				<td id="empty2"></td>
				<!-- 공백용-->

				<td></td>
				<td></td>
			</tr>

			<tr>
				<th id="empty"></th>
				<td><h6>펀딩 금액</h6></td>
				<td>${ o.rewardPrice }</td>
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
				<td><span id="orderPhone">${ o.Phone }</span></td>

				<td id="empty2"> </td>
				<!-- 공백용-->
					
				<td></td>
				<td><h6>신용카드</h6></td>
			</tr>


			<tr>
			
				<th id="empty"> <input type="hidden" value="${o.memName }" id="memName" name="adName"/> </th>
				<td><h6 id="orderEmail">이메일</h6></td>
				<td>${ o.email }</td>

				<td id="empty2"></td>
				<!-- 공백용-->

				<td><input id="cpPrice" type="hidden" value="${o.cpPrice }" /></td>

				<td><select class="coupon" name="" id="" onchange="changePrice()">
						<option value="">쿠폰선택</option>
						<option value="${o.cpNo}">${ o.cpNo}${ o.cpName }</option>
				</select></td>
				
				
			</tr>

			<tr>
				<th id="empty"></th>
				<td><h6>배송지 정보</h6></td>

				<td><input type="text" placeholder="도로명 주소" id="addr2" name="adRoad"
					name="addr2">
					 <input type="text" placeholder="상세주소" name="adDetail"
					id="addr3" name="addr3"> 
					<input type="text"
					placeholder="우편번호" id="addr1" name="addr1" name="adPost"> 
					<a href="#"
					class="btn btn-success btn-sm" id="postBtn" data-toggle="modal"
					data-target="#enrollBtn" onclick="execPostCode();">우편번호</a></td>

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
					</p>
					<span id="resultPrice"> ${ o.orSum } </span>
					<input id="payPrice" name="payPrice" type="hidden"/>
				</td>

				<td id="empty2"></td>
				<!-- 공백용-->

				<td></td>
				<td></td>
			</tr>
			<tr>
				<th id="empty"></th>
				<td colspan="2">
					<p>프로젝트가 무산되거나 중단된 경우, 예약된 결제는 자동으로 취소됩니다.</p>
				</td>


				<td id="empty2"></td>
				<!-- 공백용-->

				<td></td>

				<!-- 동의  -->
				<td colspan="2"><input type="checkbox" id="check1" required>개인정보
					제 3자 제공 동의 <a id="myPageA" href="">내용보기</a> <br> <br> <input
					type="checkbox" id="check2" required>후원 유의 사항 <a
					id="myPageA" href="">내용보기</a></td>

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
					<button id="pundingbtn" type="submit" class="charge_kakao">후원
						하기</button>
					<button id="pundingbtn2" type="submit">후원 취소</button>
					<script>
						$("#pundingbtn").click(function javascript_onclikc(){
							if(!document.getElementById('check1').checked ||
									!document.getElementById('check2').checked)  
							{
								alert("개인정보 동의 및 후원 유의 사항을 읽고 동의해 주세요.");
							}
							else if($("#addr1").val() == "" || $("#addr2").val() == "" || $("#addr3").val() == "")
							{
								alert("주소 정보를 제대로 입력해 주세요.");
							}
							else {
								
								var IMP = window.IMP;
					            IMP.init('imp45598584');
					            IMP.request_pay({
					                pg: 'html5_inicis',
					                pay_method: 'card',
					                merchant_uid: 'merchant_' + new Date().getTime(),
					                name: $("#proTitle").html(),
					                amount: $("#resultPrice").html(),
					                buyer_email: $("#orderEmail").html(),
					                buyer_name: $("#memName").val(),
					                buyer_tel: $("orderPhone").html(),
					                buyer_addr: '',
					                buyer_postcode: '',
					               // m_redirect_url: 'conclude.me'
					            }, function (rsp) {
					                console.log(rsp);
					                if (rsp.success) {
					                var msg = '결제가 완료되었습니다.';
					                msg += '고유ID : ' + rsp.imp_uid;
					                msg += '상점 거래ID : ' + rsp.merchant_uid;
					                msg += '결제 금액 : ' + rsp.paid_amount;
					                msg += '카드 승인번호 : ' + rsp.apply_num;
					                
					                $("#payForm").submit();
					            } else {
					                var msg = '결제에 실패하였습니다.';
					                msg += '에러내용 : ' + rsp.error_msg;
					            }
					            alert(msg);
					            });
							}
						});

					</script>
				</th>
				<td id="empty2"></td>
				<!-- 공백용-->
			</tr>
		</table>
		</form>
	</c:forEach>


	<script>
		var resultPrice = $("#resultPrice").html();
	
		function changePrice() {
			
			if($(".coupon option:selected").val() > 0) 
			{
			   $("#resultPrice").html( resultPrice - $("#cpPrice").val())
			} 
			else $("#resultPrice").html(resultPrice);
		}
		
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
					document.getElementById('addr2').value = fullRoadAddr;
				}
			}).open();
		}
	</script>

	<script type="text/javascript">
		function agree() {
			var chkbox = document.getElementsByName('agree');
			var chk = false;
			for (var i = 0; i < chkbox.length; i++) {
				if (chkbox[i].checked) {
					chk = true;
				} else {
					chk = false;
				}
			}
			if (chk) {
				alert("모든 약관에 동의함.");
				return false;
			} else {
				alert("모든 약관에 동의해 주세요.")
			}
		}
	</script>



	<script>
	/*
		$('.charge_kakao').click(function() {
			// getter
			var IMP = window.IMP;
			IMP.init('imp45598584');
			var money = $('input[name="cp_item"]:checked').val();
			console.log(money);

			IMP.request_pay({
				pg : 'kakao',
				merchant_uid : 'merchant_' + new Date().getTime(),

				name : '주문명 : 주문명 설정',
				amount : money,
				buyer_email : 'iamport@siot.do',
				buyer_name : '구매자이름',
				buyer_tel : '010-1234-5678',
				buyer_addr : '인천광역시 부평구',
				buyer_postcode : '123-456'
			}, function(rsp) {
				console.log(rsp);
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;
					$.ajax({
						type : "GET",
						url : "/user/mypage/charge/point", //충전 금액값을 보낼 url 설정
						data : {
							"amount" : money
						},
					});
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
				}
				alert(msg);
				document.location.href = "/user/mypage/home"; //alert창 확인 후 이동할 url 설정
			});
		});
	*/
	</script>


	<jsp:include page="../common/footer.jsp" />

</body>
</html>