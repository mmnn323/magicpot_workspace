<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 폰트어섬, 폰트 -->
<script src="https://kit.fontawesome.com/dd18300701.js" crossorigin="anonymous"></script>
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
<!-- summernote -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<link rel="stylesheet" href="resources/css/funding/basicMenu.css">
</head>
<body>
	<div id="header">
		<!-- 나가기 클릭시 메인페이지로 이동 -->
		<div id="logo"><img src="resources/images/common/mainLogo.png" width="120px" height="45px;"></div>
		<div id="creatorName">돈조 매직팟 님</div>
		<div id="outPage" style="cursor:pointer;">나가기</div>
	</div>
	<div id="menu_content">
		<div id="menu">
			<div id="creProfile">
				<p id="p1">펀딩 준비 작성 중</p>
				<p id="p2">돈조매직팟의<br>멋진 프로젝트</p>
				<p id="p3">프로젝트 번호 1</p>
			</div>
			<div id="menubar">
				<div id="accordian">
					<ul>
						<li>
							<h4 id="ready" style="cursor:pointer;">
								<p id="menu_title" style="display:inline;">펀딩 준비</p>
								<i id="btn" class="fas fa-angle-down" style="margin-left:93px"></i>
							</h4>
							<ul id="subMenu">
								<li><a href="">기본 요건</a></li>
								<li><a href="">기본 정보</a></li>
								<li><a href="">스토리 작성</a></li>
								<li><a href="">리워드 설계</a></li>
							</ul>
						</li>
						<li>
							<h4>
								<p id="lock">펀딩 현황</p>
								<i class="fas fa-lock" style="margin-left:90px"></i>
							</h4>
						</li>
						<li>
							<h4>
								<p id="lock">결제 현황</p>
								<i class="fas fa-lock" style="margin-left:90px"></i>
							</h4>
						</li>
						<li>
							<h4>
								<p id="lock">배송 현황</p>
								<i class="fas fa-lock" style="margin-left:90px"></i>
							</h4>
						</li>
						<li>
							<h4><a href="" id="abled">자료 및 도움말</a><span style="margin-left:80px"></span></h4>
						</li>
					</ul>
				</div>	
			<script>            
				$(function(){
					$("#accordian h4").click(function(){
						$("#accordian ul ul").slideUp();
						$("#menu_title").css("color", "")
						$("#btn").removeClass("fas fa-angle-up");
						$("#btn").addClass("fas fa-angle-down");
						if(!$(this).next().is(":visible")){
							$(this).next().slideDown();
							$("#btn").removeClass("fas fa-angle-down");
							$("#menu_title").css("color", "rgb(116, 152, 107)")
							$("#btn").addClass("fas fa-angle-up");
						}
					})
				})
			</script>
			</div>
		</div>
	</div>
</body>
</html>