<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 현황</title>
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
<!-- css -->
<link rel="stylesheet" href="resources/css/fundingStatus.css">
</head>
<body>
    <div class="wrap">
        <div id="header">
            <!-- 나가기 클릭시 메인페이지로 이동 -->
            <div id="logo"><img src="resources/images/logo1.png" width="120px" height="45px;"></div>
            <div id="creatorName">돈조 매직팟 님</div>
            <div id="outPage" style="cursor:pointer;">나가기</div>
        </div>
        <div id="menuContent">
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
                                <h4 id="fundingStatus" align="left">
                                    <a href="">펀딩 현황</a>
                                </h4>
                            </li>
                            <li>
                                <h4 id="fundingStatus" align="left">
                                    <a href="">결제 현황</a>
                                </h4>
                            </li>
                            <li>
                                <h4 id="fundingStatus" align="left">
                                    <a href="">배송 현황</a>
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
                <div id="content1">
                    <h3 style="font-weight:600;">펀딩 현황</h3>
                    <h5 id="summary">현재 프로젝트의 현황과 결제 예약 현황을 확인해 프로젝트의 상황을 파악해보세요.</h5>
                    <br><br>
                    <h5>프로젝트 번호 : 11473</h5>
                    <br>
                    <h5><i class="far fa-clipboard"></i> LIVING</h5>
                    <br>
                    <h5><i class="fas fa-briefcase"></i> 3,000,000 원 목표</h5>
                    <br>
                    <h5><i class="far fa-calendar"></i> 2021.05.27~2021.10.27 자정마감</h5>
                    <div id="fundingDate">
                        <span id="fundingDate1">진행중</span>
                        <span id="fundingDate2">(120일 남음)</span>
                    </div>
                    <hr>
                    <br>
                    <div id="proStatus">
                        <h4>프로젝트 현황</h4>
                        <div id="supporter" align="center">
                            <p id="title">서포터 응원</p>
                            <h3 id="qty">27개</h3>
                        </div>
                        <div id="review" align="center">
                            <p id="title">체험 리뷰</p>
                            <h3 id="qty">6개</h3>
                        </div>
                    </div>
                    <hr>
                    <br>
                    <div id="orderStatus">
                        <h4>펀딩 결제 예약 현황</h4>
                        <div id="reservation" align="center">
                            <p id="title2">펀딩 결제 예약 금액</p>
                            <h4>480,000 원</h4>
                            <p id="change">오늘 230,000 원 <i class="fas fa-arrow-up"></i></p>    
                        </div>
                        <div id="achievement" align="center">
                            <p id="title2">펀딩 달성률</p>
                            <h4>16 %</h4>
                            <p id="change">오늘 7.666 % <i class="fas fa-arrow-up"></i></p>
                        </div>
                        <div id="count" align="center">
                            <p id="title2">펀딩 건 수</p>
                            <h4>22건</h4>
                            <p id="change">오늘 10건 <i class="fas fa-arrow-up"></i></p>
                        </div>
                    </div>
                </div>
                <div id="content2"></div>
            </div>
        </div>
    </div>
</body>
</html>