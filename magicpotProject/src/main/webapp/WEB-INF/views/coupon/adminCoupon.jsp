<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

/* content */
#content1 {
	padding-left: 50px
}

/*  */
/* .outer 스타일 통일 */
.outer {
	/* height: 700px; */
	/* border: 1px solid red; */
	width: 900px;
	margin: 30px;
	float: left;
}

.empty {
	height: 300px;
	width: 400px
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

/* 커뮤니티 검색+버튼 영역 */
#searchBtnArea div {
	float: left;
}

/* 커뮤니티 검색 영역 */
#cm_SearchCtg, #cm_keyword {
	padding: 5px;
	border: 1px solid gray;
	border-radius: 4px;
}

#cm_SearchCtg {
	margin-left: 85px;
	width: 120px;
}

#cm_keyword {
	width: 350px;
	padding-left: 15px;
	margin-left: 3px;
}

#cm_searchArea select {
	text-align-last: center;
	text-align: center;
	-ms-text-align-last: center;
	-moz-text-align-last: center;
}

/* 버튼 영역 */
#cm_btnArea a {
	border: none;
	width: 80px;
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

/* 리스트 영역  */
#cmNoticeListArea {
	margin-top: 50px;
	text-align: center;
}

#cmNoticeList {
	width: 800px;
}

#cmNoticeList>tbody a {
	color: black;
	text-decoration: none;
}

#cmNoticeList>tbody>tr:hover {
	background-color: rgb(215, 231, 212);
}

/* 페이징 영역 */
#cm_pagingArea {
	padding: 30px;
}

.pagination>li>a {
	color: rgb(116, 152, 107);
}

.pagination>li>a:hover {
	color: rgb(225, 212, 169);
}

#cm_paging {
	width: fit-content;
}

#couponBtn1 {
	background-color: rgb(116, 152, 107);
	color: white;
	border: none;
	border-radius: 3px;
}

#coupontitle {
	color: rgb(116, 152, 107);
	font-size: 30px;
}
</style>
</head>
<body>

	<jsp:include page="../common/adminPageTemplate2.jsp" />


	<div id="content">
		<div class="outer">

			<div id="contentTitleArea">
				<span id="title1">쿠폰 관리</span> <span id="title2">쿠폰 등록/삭제</span>
			</div>

			<br> <br> <br> <br> <br>

			<!-- 검색바 + 버튼 영역 (오븐에서 한 줄에 있길래 하나의 div안에 넣었어요!) -->
			<div id="searchBtnArea">
				<!-- 커뮤니티 검색바 -->
				<div id="cm_searchArea">
					<select name="" id="cm_SearchCtg">
						<option value="">쿠폰명</option>
						<option value="">이름</option>
						<option value="">이메일</option>
					</select> <input id="cm_keyword" type="text" placeholder=" Search">
				</div>

				<!-- 버튼 영역 -->
				<div id="cm_btnArea">
					<a href="" class="btn btn-success" id="cm_enrollBtn"
						data-toggle="modal" data-target="#couponModal">쿠폰등록</a>
				</div>
			</div>

			<!-- 리스트 영역 -->
			<!-- 
                        mybatis 수업시간에 제목에 a태그 달아서 제목만 클릭 시 상세보기로 넘어갔는데 일단 그렇게 적용했어요!
                        이 부분은 기능구현 부분이니 tr 클릭 시 요청하고 싶으신 분들은 그렇게 수정해주셔도 될 것 같아요~!
                        -->
			<div id="cmNoticeListArea">
				<table class="table" id="cmNoticeList" align="center">
					<thead class="thead-light">
						<tr>
							<th width="600">쿠폰 번호</th>
							<th width="2000">쿠폰명</th>
							<th width="500">할인금액</th>
							<th width="600">최소구매금액</th>
							<th width="900">사용기간</th>
							<th width="1200">특이사항</th>
							<th></th>
							<th width=""></th>
						</tr>
					</thead>

					<c:forEach var="c" items="${ list }">
						<tr class="font">
							<th>${ c.cpNo }</th>
							<th>${ c.cpName }</th>
							<th>${ c.cpPrice }</th>
							<th>${ c.cpLower }</th>
							<th>${ c.cpLimit }</th>
							<th>${ c.cpCondition }</th>

							<th width="800"><a href="" style="color: white;"
								class="btn btn-success" id="cm_enrollBtn" data-toggle="modal"
								data-target="#deleteModal">삭제</a>
								
									<div class="modal" id="deleteModal">
										<div class="modal-dialog">
											<div class="modal-content">
												<!-- Modal Header -->
												<div class="modal-header">
													<h4 class="modal-title">쿠폰삭제</h4>
													<button type="button" class="close" data-dismiss="modal">&times;</button>
												</div>
	
												<div class="modal-body" align="center">
													<form action="admindelete.me" method="post">
														정말 삭제하시겠습니까? <br> <br> <br>
														<input type="hidden" value="${c.cpNo}" name="cpNumber" >
														<button type="submit" id="couponBtn" class="btn btn-danger"
															data-target="#deleteModal">삭제하기</button>
													</form>
												</div>
											</div>
										</div>
									</div>
								</th>
								
								
								
								
						</tr>
					</c:forEach>
				</table>

			</div>
		</div>
	</div>


	<!-- 쿠폰 등록 모달 -->
	<div class="modal" id="couponModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title" align="center">쿠폰 등록</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form action="adminInsert.me" method="post" id="adminCoupon">
						<table align="center" class="empty">
							<tr>
								<th>쿠폰명</th>
								<th><input type="text" name="cpName" maxlength="30"
									placeholder="30자 이내 "></th>
							</tr>
							<tr>
								<th>할인금액</th>
								<th><input type="text" name="cpPrice"></th>
							</tr>
							<tr>
								<th>최소 구매금액</th>
								<th><input type="text" name="cpLower"></th>
							</tr>
							<tr>
								<th>쿠폰 사용기간</th>
								<th><input type="date" name="cpLimit"></th>
							</tr>
							<tr>
								<th>쿠폰 특이사항</th>
								<th><input type="text" name="cpCondition" maxlength="30"
									placeholder="30자 이내"></th>

							</tr>
							<tr align="center">
								<th colspan="2">
									<button style="width: 90px;" id="couponBtn1" type="submit">등록</button>
								</th>
							</tr>
						</table>
					</form>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" id="couponBtn1" class="btn btn-danger"
						data-dismiss="modal">닫기</button>
				</div>

			</div>
		</div>
	</div>

	



</body>
</html>