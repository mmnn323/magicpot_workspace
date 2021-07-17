<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.js"></script>
	<link rel="preconnect" href="https://fonts.gstatic.com/%22%3E">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<!-- include libraries(jQuery, bootstrap) -->
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
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
	.modal-content {
		margin-left: 400px;
		margin-top: 300px;
	}
	
	.btn-primary {
		margin-left: 21%;
	}
	
	/* 리스트 영역  */
	#cmNoticeListArea {
		margin-top: 14px;
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
	
	tr:hover{cursor: pointer;}
</style>
</head>
<body>

    <jsp:include page="../common/adminPageTemplate.jsp"/>

	<div id="content">
		<div class="outer">

			<div id="contentTitleArea">
				<span id="title1">회원 관리</span> <span id="title2">일반 회원 관리</span>
			</div>

			<br> <br> <br> <br> <br>

			<!-- 검색바 + 버튼 영역 (오븐에서 한 줄에 있길래 하나의 div안에 넣었어요!) -->
			<div id="searchArea">
				<!--검색바 -->
				<div id="cm_searchArea">
					<form action="search.me" method="post">
							<select name="condition" id="cm_SearchCtg">
								<option value="memId">회원 ID</option>
								<option value="memName">이름</option>
								<option value="email">이메일</option>
							</select> 
						<input type="text" id="cm_keyword" name="cmKeyword" placeholder=" Search">
					</form>
				</div>
				
				<c:if test="${ !empty condition }" >
		        	<script>
		        	$(function(){
		        		$("#SearchArea option[value=${condition}]").attr("selected", true);
		        	})
		        	</script>
				</c:if>
				<!-- 버튼 영역 -->
				<!-- Button to Open the Modal -->
				<button type="button" id="selectDelete_btn" class="btn btn-primary" data-toggle="modal"
					data-target="#myModal" style="background-color: red; border: none;">
					회원 탈퇴
				</button>

			<!-- The Modal -->
				<!-- <div class="modal" id="myModal">
					<div class="modal-dialog">
						<div class="modal-content"> -->

							<!-- Modal Header -->
							<!-- <div class="modal-header">
								<h4 class="modal-title">회원 탈퇴</h4>
								<button type="button" class="close">&times;</button>
							</div> -->
							 
							<!-- <form id="postForm" action="delete.acm" method="post">-->
								<!-- Modal body 
								<div class="modal-body">회원을 탈퇴하겠습니까?</div>
				                  <input type="hidden" name="memNo" value="${ m.memNo }">-->
								<!-- Modal footer 
								<div class="modal-footer">
									<button type="submit" class="btn btn-danger" id="delSelect">네</button>
								</div>
							</form>
						</div>
					</div>
				</div>-->

			</div><br>


			<!-- 리스트 영역 -->
			<!-- 
                                mybatis 수업시간에 제목에 a태그 달아서 제목만 클릭 시 상세보기로 넘어갔는데 일단 그렇게 적용했어요!
                                                                        이 부분은 기능구현 부분이니 tr 클릭 시 요청하고 싶으신 분들은 그렇게 수정해주셔도 될 것 같아요~!
                            -->
			<div id="cmNoticeListArea">
				<table class="table" id="cmNoticeList" align="center" action="multiDel">
					<thead class="thead-light">
						<form method="get" id="delList" actiont="multiDel">
						<tr>
							<th width="40"><input type="checkbox" id="allCheckbox"></th>
							<th width="90">번호</th>
							<th width="100">아이디</th>
							<th width="110">이름</th>
							<th width="270">연락처</th>
							<th width="200">이메일</th>
							<th width="200">가입일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="m" items="${ list }">
						<tr>
							<th onclick="event.cancelBubble=true">
							<input type="checkbox" class="chBox" name="noList" value="${ m.memNo }"  data-cartNum="${ m.memNo }">
							</th>
							<td class="mno">${ m.memNo }</td>
							<td>${ m.memId }</td>
							<td>${ m.memName }</td>
							<td>${ m.phone }</td>
							<td>${ m.email }</td>
							<td>${ m.enrollDate }</td>
						</tr>
						</c:forEach>
						</form>
					</tbody>
				</table>
				<script> //전체 선택
					$('#allCheckbox').click(function(){
						var chk = $("#allCheckbox").prop("checked");
						if(chk){
							$(".chBox").prop("checked", true);
						}else{
							$(".chBox").prop("checked", false);
						}
					})
				</script>
				
				<script>
				$("#selectDelete_btn").click(function(){
					var confirm_val = confirm("정말 삭제하시겠습니까?");
					
					if(confirm_val){
						var checkArr = new Array();
						
						$("input[class='chBox']:checked").each(function(){
							checkArr.push($(this).attr("data-cartNum"));
						})
						
						$.ajax({
							url:"delete.amc",
							type:"post",
							data:{chBox: checkArr},
							success:function(result){
								if(result==1){
									location.href="admin.me";
								}else{
									alert("삭제 오류");
								}
							}
						})
					}
				})
				
				</script>
			
				<script>
					$(function(){
						$("#cmNoticeList tbody tr").click(function(){
							location.href="detail.me?mno=" + $(this).children(".mno").text();
						})
					})
				</script>
			</div>

			<!-- 페이징 영역 -->

			<div id="cm_pagingArea" align="center">

				<div id="cm_paging">
					<ul class="pagination pagination">
					
						<c:choose>
							<c:when test="${ pi.currentPage eq 1}">
								<li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
							</c:when>
							<c:otherwise>						
								<li class="page-item"><a class="page-link" href="admin.me?currentPage=1">&laquo;</a></li>
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${ pi.currentPage eq 1}">
						<li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
							</c:when>
							<c:otherwise>						
						<li class="page-item"><a class="page-link" href="admin.me?currentPage=${ pi.currentPage-1 }">&lt;</a></li>
							</c:otherwise>
						</c:choose>
						
						
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<c:choose>
								<c:when test="${ pi.currentPage eq p }">
									<li class="page-item disabled"><a class="page-link" href="#">${ p }</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="admin.me?currentPage=${ p }">${ p }</a></li>	
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<c:choose>
							<c:when test="${ pi.currentPage eq pi.maxPage }">
								<li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="admin.me?currentPage=${ pi.currentPage+1 }">&gt;</a></li>
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${ pi.currentPage eq pi.maxPage }">
								<li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="admin.me?currentPage=${ pi.maxPage }">&raquo;</a></li>
							</c:otherwise>
						</c:choose>
						
					</ul>
				</div>

			</div>

		</div>
	</div>

</body>
</html>