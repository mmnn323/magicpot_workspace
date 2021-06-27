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
        background-color: white;
        height: 46px;
        position: fixed;
        top: 0;
        left: 0;
        right: 0;  
        z-index: 1;
        border-bottom: 1px solid #a5a3a3;
    }
    #menu{
        position: fixed;
        left: 0;
        top: 44px}
    #content{
        position: absolute;
        left: 200px;
        right: 0;}
    body{padding-top: 59px}
    #menuContent{height: 100%;}

    #header>div, #menuContent>div{
        float: left;
        height: 100%;
    }
    #menu{
        width: 200px;
        border:1px solid #f0f0f0}
    #content{width: 100%;}
    #content1{
        width: 70%;
        margin-top: 30px;
        float: left;}

    /* header 스타일*/
    #header>div{height: 100%;}
    #logo{width: 11%;}
    #creatorName{width: 81%;}
    #outPage{width: 8%;}
    #creatorName, #outPage{
        font-size: 17px;
        font-weight: 600;
        color: rgb(116, 152, 107);
        line-height: 45px;
        text-align: center
    }

    /* menu 스타일 */
    #menu_disabled{
        position: fixed;
        z-index: 2;
        width: 198px;
        height: 100%;
        background-color: gray;
        opacity: 20%;
    }
    #menu>div{width: 100%;}
    #creProfile{height: 160px;}

    /* creProfile */
    #creProfile{
        padding-top :15px;
        border: 1px solid #f0f0f0;
        background: rgba(81, 171, 59, 0.51);
        font-size: 16px;
    }
    #p1,#p2,#p3{
        margin-left: 15px;
        color: white; 
        font-weight: 600;
    }
    #p2{font-size: 15px}

    /* menubar */
    #accordian{text-align: center;}
    #accordian>ul{margin-top: 0px;}
    #accordian>ul>li{
        border: 1px solid #f0f0f0;
        margin-left: -40px;
    }
    #accordian li>h1{ cursor: pointer;}
    #accordian li>ul{ display: none;}
    #accordian p{font-size: 16px}
    #accordian h4{
        line-height: 40px;
        font-weight: 600;
    }
    #abled{font-size: 16px;}
    #accordian a{
        list-style: none;
        text-decoration: none;
        color: black;	
    }
    #subMenu a{
        display: block;
        position: relative;
        width: 196px;
        padding: 15px 20px;
        margin-left: -40px;
        background: #f8f8f8;
        border-bottom: 1px solid #eaeaea;
        color: #222;
        font-size: 14px;
        font-weight: 600;
        text-align: center;
    }
    #subMenu a:hover{
        border-bottom: 1px solid #bdbdbd;
        color: #222;
        background: #ebeaea;
        transition: all .8s;
    }
    a:after{
        content: '';
        opacity: 0;
        transition: opacity .3s;
    }
    #ready:hover, #ready p:hover{color: rgb(116, 152, 107)}
    #abled:hover{color: rgb(116, 152, 107)}
    #lock{
        display: inline;
        cursor: default; 
    }

    /* 상태바 스타일 */
    .step-box{
        height: 2%;
        width: 100%;
    }
    .step-state{height: 100%;}
    ul{list-style: none /* ul표시 없앰 */}
    .step-state ul:after{
        content: '';
        display: block;
        clear: both
    }
    .step-state ul li{
        float: left;
        position: relative;
        width: 25%; /* 4개 진행바를 4등분*/
    }
    /* 회색 진행바 */
    .step-state ul li:before{
        /* border:1px solid pink; */
        position: absolute;
        top: -13px;
        left: -40px; /* 위치 설정 */
        right: 0;
        height: 3px; /* 진행바 두께 */
        background: #ddd;
        content: '';
    }
    /* 활성화 상태바 표시 */
    .step-state.step1 ul li:nth-child(1):before{
        position: absolute;
        background: rgb(116, 152, 107);
    }
    /* 1/2영역 비활성화 */
    .step-state ul li p:before{
        position: absolute;
        top: 35px;
        left: 50%;
        right: 0;
        height: 3px;
        content: '';
    }	

    /* content */
    #content1{padding-left: 50px}
</style>
</head>
<body>
    <div class="wrap">
        <div id="header">
            <!-- 나가기 클릭시 메인페이지로 이동 -->
            <div id="logo"><img src="resources/images/logo1.png" width="120px" height="45px;"></div>
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
                    <div id="menu_disabled">&nbsp;</div>
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
                                if(!$(this).next().is(":visible"))
                                {
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
            <div id="content">
                <!-- 상태바 : preview에선 안보이는데 페이지에서는 보임 -->
                <div class="step-box">
                    <div class="step-state step1">
                        <ul>
                            <li><p></p></li>
                            <li><p></p></li>
                            <li><p></p></li>
                            <li><p></p></li>
                        </ul>
                    </div>
                </div>
                <div id="content1">
                    dfsdfsdfsdfsd
                    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                </div>
            </div>
        </div>
    </div>
</body>
</html>