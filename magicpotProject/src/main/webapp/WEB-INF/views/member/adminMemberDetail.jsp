<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
		.outer {
			/* height: 700px; */
			/* border: 1px solid red; */
			width: 900px;
			margin: 30px;
			float: left;
		}
		
		/* 컨텐트 카테고리 타이틀 영역 */
		#contentTitleArea {
			font-family: 'Noto Sans KR', sans-serif;
			width: 900px;
			border-bottom: 2px solid lightgray;
			padding: 10px;
			margin: 20px;
			margin-top: 0;
		}
		
		#title1 {
			font-size: 25px;
			font-weight: bold;
		}
		
		#title2 {
			font-size: 16px;
			background-color: gray;
			color: white;
			margin-left: 10px;
			border: 1px solid gray;
			border-radius: 5px;
			padding: 3px;
		}
		/*content*/
		.content {
			margin: auto;
			text-align: center;
			width: 50%;
			height: 100%;
			float: left;
		}
		
		.content>h5 {
			padding-top: 15px;
		}
		
		.content1 {
			width: 50%;
			float: left;
			height: 100%;
			font-size: 15px;
			line-height: 40px;
			margin-left: -150px;
		}
		
		.content1>ul>li {
			border: 1px solid;
			border-color: rgb(216, 215, 215);
			border-radius: 5px;
			font-size: 12px;
			text-align: center;
			list-style: none;
			width: 200px;
			margin-top: 5px;
		}
		
		/* 버튼 영역 */
		#cm_btnArea {
			margin-left: -250px;
		}
		
		#cm_btnArea a {
			border: none;
			width: 100px;
			padding: 7px;
			margin-right: 10px;
		}
		
		#cm_enrollBtn {
			background-color: rgb(116, 152, 107);
			margin-left: 70px;
		}
		
		#cm_enrollBtn:hover {
			background-color: rgb(93, 121, 86);
		}
		
		#cm_deleteBtn {
			background-color: rgb(252, 99, 99);
		}
		
		#cm_deleteBtn:hover {
			background-color: rgb(216, 66, 66);
		}
		
		#delete {
			background-color: red;
			border: none;
			width: 100px;
			height: 38px;
		}
</style>
</head>
<body>

	<!-- adminPageTemplate -->
	<jsp:include page="../common/adminPageTemplate.jsp"/>
	
	<div id="content">
		<div class="outer">
			<div id="contentTitleArea">
				<span id="title1">회원 관리</span> <span id="title2">일반 회원 조회</span>
			</div>

			<br>
			<br>
			<br>
			<br>
			<br>


			<div class="content">
				<h5>
					<b>회원번호</b>
				</h5>
				<h5>
					<b>가입일</b>
				</h5>
				<h5>
					<b>아이디</b>
				</h5>
				<h5>
					<b>이름</b>
				</h5>
				<h5>
					<b>연락처</b>
				</h5>
				<h5>
					<b>이메일</b>
				</h5>
				<h5>
					<b>주소</b>
				</h5>
			</div>
			<div class="content1">
				<ul>
					<li>${ m.memNo }</li>
					<li>${ m.enrollDate }</li>
					<li>${ m.memId }</li>
					<li>${ m.memName }</li>
					<li>${ m.phone }</li>
					<li>${ m.email }</li>
					<li style="width: 100px; float: left;">${ m.memPost }</li>
					<li style="float: left; margin-left: 5px; width:auto">
						&nbsp;&nbsp;&nbsp;&nbsp;${ m.memRoad } ${ m.memDetail }&nbsp;&nbsp;&nbsp;&nbsp;
					</li>
				</ul>
				<br>
				<br>
			</div>

			<!-- 버튼 영역 -->
			<div id="cm_btnArea" align="center">
				<a href="" class="btn btn-success" id="cm_enrollBtn">이전</a>
				<button type="button" id="delete" class="btn btn-primary"
					data-toggle="modal" data-target="#myModal">회원탈퇴</button>
			</div>


			<!-- 취소 모달 -->
			<!-- The Modal -->
			<div class="modal" id="myModal">
				<div class="modal-dialog">
					<div class="modal-content">

						<!-- Modal Header -->
						<div class="modal-header">
							<h4 class="modal-title">회원 탈퇴</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>

						<!-- Modal body -->
						<div class="modal-body">탈퇴하겠습니까?</div>

						<!-- Modal footer -->
						<div class="modal-footer">
							<button type="button" class="btn btn-danger" data-dismiss="modal">네</button>
						</div>

					</div>
				</div>
			</div>


			<br>
			<br>
			<br> <br>
			<br>
			<br>
		</div>
	</div>
</body>
</html>