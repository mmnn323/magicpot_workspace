<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.text.SimpleDateFormat, java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css -->
<link rel="stylesheet" type="text/css" href="resources/css/common/footer.css">

<link rel="preconnect" href="https://fonts.gstatic.com/%22%3E">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/dd18300701.js" crossorigin="anonymous"></script>
</head>
<body>

	<%
		String year = new SimpleDateFormat("yyyy").format(new Date());
	%>

	
    <div id="footer">
        <div id="footer_1">
            <ul>
                <li><a href="">이용약관</a></li>
                <li><a href="">공지사항</a></li>
                <li><a href="">FAQ</a></li>
                <li style="margin-right: 0;"><a href="">펀딩설명</a></li>
            </ul>
        </div>
        <div id="footer_2">
            <a href="${ pageContext.servletContext.contextPath }"><img src="resources/images/common/mainLogo.png" alt=""></a>
        </div>
        <div id="footer_3">

            <div id="footer_3_1">
                <p id="p1">
                    매직팟플랫폼(주)&nbsp&nbsp|&nbsp&nbsp대표이사 김대장 <br>
                    사업자등록번호 238-7852-71255 <br>
                    서울특별시 강남구 테헤란로 14길 6 남도빌딩 2F <br>
                </p>
            </div>
            <div id="footer_3_2">
                <p id="p2">
                    <b>매직팟 대표 고객센터</b>&nbsp&nbsp|&nbsp&nbspinfo@magicpot.kr&nbsp&nbsp|&nbsp&nbsp1666-1666 <br>
                    상담 가능 시간 : 평일 오전 9시 ~ 오후 6시 (주말, 공휴일 제외) <br>
                    <small id="p3">Copyright ⓒ <%= year %> MagicPot Inc.</small>
                </p>
            </div>
        </div>
    </div>
    
</body>
</html>