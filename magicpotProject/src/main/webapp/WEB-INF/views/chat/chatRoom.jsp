<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MagicPot 헬프센터</title>
<!-- css -->
    <link rel="stylesheet" type="text/css" href="resources/css/chat/chatRoom.css">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com/%22%3E">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
</head>
<body>
    <ul id="messages"></ul>
    
    <div id="titleLine">
        <div align="center"><i class="fas fa-headset"></i> MagicPot 헬프센터 </div>
    </div>
    
    <form action="" id="chat-form">
    <input id="m" autocomplete="off" placeholder="메세지를 입력해주세요"/><button><i class="fas fa-paper-plane"></i></button>
    </form>
    
</body>
</html>