<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		여기가 바로 파이널 프로젝트 main.jsp임<br>
		여기에 header.jsp / content.jsp / footer.jsp 포함 시킬 예정!
	 -->
	
	<!-- header 추가 --> 
	<jsp:include page="common/header.jsp"/>
	
	<!-- content 추가 : 일단 임의로 div 넣어두었습니다!-->
	<div style="height:500px"></div>
	
	<!-- footer 추가 -->
	<jsp:include page="common/footer.jsp"/>
	
	
</body>
</html>