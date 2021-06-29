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
    div{box-sizing: border-box;}
    .wrap{
        width: 1000px;
        height: 800px;
        margin: auto;
        font-family: 'Noto Sans KR', sans-serif;
    }
    .wrap>div{width: 100%;}
    #header{
        background-color:#d3d3d3;
        height: 50px;
        position: fixed;
        top: 0px;
        left: 0;
        right: 0;  
        z-index: 1;
    }
    #menu{position:fixed;left:0;background-color:#d3d3d3;}
    #content{position:absolute;left:200px;right:0;}
    body{padding-top:45px}
    #menu_content{height:100%;}

    #header>div, #menu_content>div{
        height: 100%;
        float: left;
    }
    #menu{width:200px; border:1px solid #f0f0f0}
    #content{width:100%;margin-top:20px}

    /* header 스타일*/
    #header>div{height: 100%;}
    #logo{width: 11%;}
    #adminId{width: 72%;}
    #logout{width: 8%;}
    #bar{width: 1%;}
    #outPage{width: 8%;}
    #adminId, #logout, #bar, #outPage{
        font-size: 17px;
        font-weight: 600;
        color:rgb(116, 152, 107);
        line-height: 45px;
        text-align: center;
    }
    #adminId{text-align: right;}

    /* menu 스타일 */
    #menu>div{width: 100%;}

    /* menubar */
    #accordian{text-align:center;}
    #accordian>ul{margin-top:0px;}
    #accordian>ul>li{border:1px solid #f0f0f0;margin-left:-40px;}
	#accordian li>h1{ cursor:pointer;}
	#accordian li>ul{ display:none;}
    #accordian p{font-size:16px}
    #accordian h4{line-height:42px;font-weight:600;}
    #abled{font-size:16px;}
	#accordian a{
		list-style:none;
		text-decoration:none;
		color:black;	
	}
	#subMenu a{
		width:196px;
        background:#f8f8f8;
		display:block;
		padding:15px 20px;
		margin-left:-40px;
		color:#222;
		font-weight:600;
        text-align:center;
		border-bottom:1px solid #eaeaea;
		position:relative;
   	}
	#subMenu a:hover{
		color:#222;
		background:#ebeaea;
		transition:all 0.8s;
		border-bottom:1px solid #bdbdbd;
    }
   	a:after{
   		content:'';
  		opacity:0;
  		transition:opacity 0.3s;
  	}
	#ready:hover, #ready p:hover{color:rgb(116, 152, 107)}
    #abled:hover{color:rgb(116, 152, 107)}
    
    /* content */
    #content1{padding-left:50px}

    /* .outer 스타일 통일 */
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
</style>
</head>
<body>
    <div class="wrap">
        <div id="header">
            <!-- 나가기 클릭시 메인페이지로 이동 -->
            <div id="logo"><img src="../resources/images/logo1.png" width="120px" height="45px;"></div>
            <div id="adminId">admin1</div>
            <div id="logout" style="cursor:pointer;padding-right:0px;">로그아웃</div>
            <div id="bar" style="cursor:pointer;padding-right:0px;">|</div>
            <div id="outPage" style="cursor:pointer; padding-left:0px;" onclick="location.href='${ pageContext.servletContext.contextPath}';">홈페이지</div>
        </div>
        <div id="menu_content">
            <div id="menu">
                <div id="menubar">
                    <div id="accordian">
                        <ul>
                            <li>
                                <h4 id="user" style="cursor:pointer;">
                                    <p id="p4" style="display:inline;">회원관리</p>
                                    <i id="btn1" class="fas fa-angle-down" style="margin-left:93px"></i>
                                </h4>
                                <ul id="subMenu">
                                    <li><a href="">일반회원 관리</a></li>
                                    <li><a href="">크리에이터 관리</a></li>
                                    <li><a href="">크리에이터 전환 관리</a></li>
                                </ul>
                            </li>
                            <li>
                                <h4>
                                    <a href="" id="abled">결제관리</a><span style="margin-left:110px"></span></h4>
                                </h4>
                            </li>
                            <li>
                                <h4>
                                    <a href="" id="abled">쿠폰관리</a><span style="margin-left:110px"></span></h4>
                                </h4>
                            </li>
                            <li>
                                <h4>
                                    <a href="" id="abled">펀딩관리</a><span style="margin-left:110px"></span></h4>
                                </h4>
                            </li>
                            <li>
                                <h4>
                                    <a href="" id="abled">이용약관 관리</a><span style="margin-left:80px"></span></h4>
                                </h4>
                            </li>
                            <li>
                                <h4 id="comm" style="cursor:pointer;">
                                    <p id="abled" style="display:inline;">커뮤니티 관리</p>
                                    <i id="btn2" class="fas fa-angle-down" style="margin-left:53px"></i>
                                </h4>
                                <ul id="subMenu">
                                    <li><a href="">커뮤니티 공지사항<br>관리</a></li>
                                    <li><a href="">커뮤니티 글 관리</a></li>
                                </ul>
                            </li>
                            <li>
                                <h4 id="support" style="cursor:pointer;">
                                    <p id="abled" style="display:inline;">고객센터 관리</p>
                                    <i id="btn3" class="fas fa-angle-down" style="margin-left:53px"></i>
                                </h4>
                                <ul id="subMenu">
                                    <li><a href="">공지사항 관리</a></li>
                                    <li><a href="">FAQ 관리</a></li>
                                    <li><a href="">1:1 상담관리</a></li>
                                    <li><a href="">신고 관리</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>	
                    <script>            
                        $(function(){
                            $("#accordian h4").click(function(){
                                $("#accordian ul ul").slideUp();
                                $(this).css("color", "")
                                $(this).children("i").removeClass("fas fa-angle-up");
                                $(this).children("i").addClass("fas fa-angle-down");
                                if(!$(this).next().is(":visible"))
                                {
                                    $(this).next().slideDown();
                                    $(this).css("color", "rgb(116, 152, 107)")
                                    $(this).children("i").removeClass("fas fa-angle-down");
                                    $(this).children("i").addClass("fas fa-angle-up");
                                }
                            })
                        })
                    </script>
                </div>
            </div>
           
                    <div id="content">
                        <div class="outer">
                
                            <div id="contentTitleArea">
                                <span id="title1">회원 관리</span> <span id="title2">일반 회원 관리</span>
                            </div>
                
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                
                            <!-- 검색바 + 버튼 영역 (오븐에서 한 줄에 있길래 하나의 div안에 넣었어요!) -->
                            <div id="searchBtnArea">
                                <!-- 커뮤니티 검색바 -->
                                <div id="cm_searchArea">
                                    <select name="" id="cm_SearchCtg">
                                        <option value="">회원 ID</option>
                                        <option value="">이름</option>
                                        <option value="">이메일</option>
                                    </select> <input id="cm_keyword" type="text" placeholder=" Search">
                                </div>
                
                                <!-- 버튼 영역 -->
                                <!-- Button to Open the Modal -->
                                <button type="button" class="btn btn-primary" data-toggle="modal"
                                    data-target="#myModal" style="background-color: red; border: none;">
                                    회원 탈퇴</button>
                
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
                                            <div class="modal-body">회원을 탈퇴하겠습니까?</div>
                
                                            <!-- Modal footer -->
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-danger"
                                                    data-dismiss="modal">네</button>
                                            </div>
                
                                        </div>
                                    </div>
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
                                            <th width="40"><input type="checkbox"></th>
                                            <th width="90">번호</th>
                                            <th width="100">아이디</th>
                                            <th width="110">이름</th>
                                            <th width="270">연락처</th>
                                            <th width="200">이메일</th>
                                            <th width="200">가입일</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><input type="checkbox"></td>
                                            <td>50</td>
                                            <td><a href="">user01</a></td>
                                            <td>김개똥</td>
                                            <td>010-1234-5678</td>
                                            <td>user01@gmail.com</td>
                                            <td>2021-02-14</td>
                                        </tr>
                                        <tr>
                                            <td><input type="checkbox"></td>
                                            <td>49</td>
                                            <td><a href="">user01</a></td>
                                            <td>김개똥</td>
                                            <td>010-1234-5678</td>
                                            <td>user01@gmail.com</td>
                                            <td>2021-02-14</td>
                                        </tr>
                                        <tr>
                                            <td><input type="checkbox"></td>
                                            <td>48</td>
                                            <td><a href="">user01</a></td>
                                            <td>김개똥</td>
                                            <td>010-1234-5678</td>
                                            <td>user01@gmail.com</td>
                                            <td>2021-02-14</td>
                                        </tr>
                                        <tr>
                                            <td><input type="checkbox"></td>
                                            <td>47</td>
                                            <td><a href="">user01</a></td>
                                            <td>김개똥</td>
                                            <td>010-1234-5678</td>
                                            <td>user01@gmail.com</td>
                                            <td>2021-02-14</td>
                                        </tr>
                                        <tr>
                                            <td><input type="checkbox"></td>
                                            <td>46</td>
                                            <td><a href="">user01</a></td>
                                            <td>김개똥</td>
                                            <td>010-1234-5678</td>
                                            <td>user01@gmail.com</td>
                                            <td>2021-02-14</td>
                                        </tr>
                                        <tr>
                                            <td><input type="checkbox"></td>
                                            <td>45</td>
                                            <td><a href="">user01</a></td>
                                            <td>김개똥</td>
                                            <td>010-1234-5678</td>
                                            <td>user01@gmail.com</td>
                                            <td>2021-02-14</td>
                                        </tr>
                                        <tr>
                                            <td><input type="checkbox"></td>
                                            <td>43</td>
                                            <td><a href="">user01</a></td>
                                            <td>김개똥</td>
                                            <td>010-1234-5678</td>
                                            <td>user01@gmail.com</td>
                                            <td>2021-02-14</td>
                                        </tr>
                                        <tr>
                                            <td><input type="checkbox"></td>
                                            <td>43</td>
                                            <td><a href="">user01</a></td>
                                            <td>김개똥</td>
                                            <td>010-1234-5678</td>
                                            <td>user01@gmail.com</td>
                                            <td>2021-02-14</td>
                                        </tr>
                                        <tr>
                                            <td><input type="checkbox"></td>
                                            <td>42</td>
                                            <td><a href="">user01</a></td>
                                            <td>김개똥</td>
                                            <td>010-1234-5678</td>
                                            <td>user01@gmail.com</td>
                                            <td>2021-02-14</td>
                                        </tr>
                                        <tr>
                                            <td><input type="checkbox"></td>
                                            <td>41</td>
                                            <td><a href="">user01</a></td>
                                            <td>김개똥</td>
                                            <td>010-1234-5678</td>
                                            <td>user01@gmail.com</td>
                                            <td>2021-02-14</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                
                            <!-- 페이징 영역 -->
                
                            <div id="cm_pagingArea" align="center">
                
                                <div id="cm_paging">
                                    <ul class="pagination pagination">
                                        <li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
                                        <li class="page-item"><a class="page-link" href="#">&lt;</a></li>
                                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                                        <li class="page-item"><a class="page-link" href="#">4</a></li>
                                        <li class="page-item"><a class="page-link" href="#">5</a></li>
                                        <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
                                        <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
                                    </ul>
                                </div>
                
                            </div>
                
                        </div>
                    </div>
                    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                </div>
            </div>
        </div>
    </div>
</body>
</html>