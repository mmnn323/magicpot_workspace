<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 #content{left:200px;right:0; }
    #content{width: 100%;}

	#ready:hover, #ready p:hover{color:rgb(116, 152, 107)}
    #abled:hover{color:rgb(116, 152, 107)}
    
    /* content */
    #content1{padding-left:50px}

    /*  */
    /* .outer 스타일 통일 */
    .outer{
            /* height: 700px; */
            /* border: 1px solid red; */
            width: 900px;
            float: left;
        }

        /* 컨텐트 카테고리 타이틀 영역 */
        #contentTitleArea{
            font-family: 'Noto Sans KR', sans-serif;
            width:900px;
            border-bottom: 2px solid lightgray;
            padding:10px;
            margin:20px;
            margin-top: 0;
        }
        #title1{font-size:25px; font-weight: bold;}
        #title2{
            font-size:16px;
            background-color: gray;
            color:white;
            margin-left: 10px;
            border:1px solid gray;
            border-radius: 5px;
            padding:3px;
        }
    

        #couponBtn{background-color: rgb(116, 152, 107);
        border: none;
        border-radius: 3px;
        color: white;
        width: 100px;}
</style>
</head>
<body>
	<jsp:include page="../common/adminPageTemplate2.jsp" />



		<div id="content">
			<div class="outer">
				<div id="contentTitleArea">
					<span id="title1">쿠폰 관리</span> <span id="title2">쿠폰 등록/삭제</span>
				</div>

				<br>
				<br>
				<br>
				<br>
				<br>
			<form action="adminCoupon.me" method="post" id="adminCoupon">
				<table align="center">
					<tr>
						<th>쿠폰명</th>
						<th><input type="text" name="cpName"  placeholder="30자 이내 "></th>
					</tr>
					<tr>
						<th>할인금액</th>
						<th><input type="text" name="cpPrice" ></th>
					</tr>
					<tr>
						<th>최소 구매금액</th>
						<th><input type="text" name="cpLower" ></th>
					</tr>
					<tr>
						<th>쿠폰 사용기간</th>
						<th><input type="date" name="cpLimit" ></th>
					</tr>
					<tr>
						<th>쿠폰 특이사항</th>
						<th><input type="text" name="cpCondition"  placeholder="30자 이내"></th>

					</tr>
					<tr align="center">
						<th colspan="2">
							<button id="couponBtn" type="">등록</button>
						</th>
					</tr>
				</table>
				<br>
				<br>
				<hr>
				<br>
				<br>
				<table align="center" class="can">
					<h4>
						&nbsp;&nbsp;&nbsp;<strong>등록 된 쿠폰</strong>
					</h4>
					<hr>
					<br>
					<tr>
						<th>쿠폰명</th>
						<th>할인금액</th>
						<th>최소구매 금액</th>
						<th>쿠폰 사용기간</th>
						<th>쿠폰 특이사항</th>
						<th></th>
					</tr>
					<tr class="font">
						<th>첫구매시 50% 할인</th>
						<th>50% 할인</th>
						<th>최소 30000원 구매시</th>
						<th>2021.06.07~ 2021.08.09</th>
						<th>쿠폰 특이사항X</th>
						<th><button id="couponBtn" type="submit">삭제</button></th>
					</tr>
				</table>
			   </form>
			</div>
		</div>


</body>
</html>