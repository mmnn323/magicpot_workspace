<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css -->
<link rel="stylesheet" type="text/css" href="resources/css/common/header.css">

<link rel="preconnect" href="https://fonts.gstatic.com/%22%3E">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/dd18300701.js" crossorigin="anonymous"></script>

</head>
<body>

    <!-- 로고 영역 -->
    <div id="header">
        <div id="header_1">
            <a href=""><img src="../../../resources/images/common/logo2.png" alt=""></a>
        </div>

        <!-- 카테고리 영역-->
        <div id="header_2">
            <ul>
                <li><a href="">펀딩하기</a></li>
                <li><a href="">프로젝트 올리기</a></li>
                <li><a href="">이용가이드</a></li>
                <li><a href="">커뮤니티</a></li>
            </ul>
        </div>

        <!-- 검색 영역 -->
        <div id="header_3">
            <form action="" id="search_form">
                <div class="input-group mb-3" id="search_text">
                    <input type="text" class="form-control">
                    <div class="input-group-append">
                      <button class="btn btn-success" type="submit" ><i class="fas fa-search fa-sm" style="padding:2px;"></i>
                      </button>
                    </div>
                </div>
            </form>
        </div>

        <!-- 로그인전/후 영역-->
        <div id="header_4">
            <!-- 로그인 전 -->
            <a href="">로그인</a> <h style="color:rgb(116, 152, 107)"> &nbsp |</h> 
            <a href="">회원가입</a>

            <!-- 로그인 후 -->
            <!-- <b>김우빈</b> <h style="color:rgb(116, 152, 107)">님</h>
            <abbr title="마이페이지"><a href="" class="afterLogin"><i class="fas fa-user fa-2x " style="margin-top: 20px;"></i></a></abbr>
            <abbr title="좋아하는 프로젝트"><a href="" class="afterLogin"><i class="fas fa-heart fa-2x"></i></a></abbr> -->

            <!-- 로그인한 사용자가 관리자일 경우 관리자 페이지로 이동하는 버튼 노출-->
            <!-- <abbr title="관리자페이지"><a href="" class="afterLogin"><i class="fas fa-cog fa-2x"></i></i></a></abbr> -->

        </div>
    </div>
</body>
</html>