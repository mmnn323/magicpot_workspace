<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펀딩 신청 상세조회(리워드 설계)</title>
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
<!-- css -->
<link rel="stylesheet" href="../resources/css/admin/fundingManage3.css">
</head>
<body>
    <div class="wrap">
        <div id="header">
            <!-- 나가기 클릭시 메인페이지로 이동 -->
            <div id="logo"><img src="../resources/images/logo1.png" width="120px" height="45px;"></div>
            <div id="adminId">admin1</div>
            <div id="logout" style="cursor:pointer;padding-right:0px;">로그아웃</div>
            <div id="bar" style="cursor:pointer;padding-right:0px;">|</div>
            <div id="outPage" style="cursor:pointer;padding-left:0px;">홈페이지</div>
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
                <div id="content1">
                    <div id="contentTitleArea">
                        <span id="title1">펀딩 신청 상세 조회</span>
                        <span id="title2">리워드 설계</span>
                    </div>
                    <hr style="clear: both;margin-bottom: 30px;">
                    <div id="rewards">
                        <div id="reward">
                            <p id="rewardPrice">23,000원</p>
                            <p id="quantityLimit">제한 수량 300개</p>
                            <hr>
                            <p id="rewardTitle">[얼리버드] 밥그릇</p>
                            <p id="rewardExplain">지구를 살리기위해 만들어진 종이 폼롤러! 이번기회에 환경 친화적 폼롤러로 피부 걱정없이 홈트하자. 롤러 사고 나무심기 기부 캠페인에 참여하여 우리 지구 함께 살려요 :)</p>
                            <p id="rewardCate">배송비</p>
                            <p id="shipPrice" >3,000원</p>
                            <p id="rewardCate" style="clear:both;">리워드 발송 시작일</p>
                            <p id="deliveryStart">2021년 07월 중순(11~20일)</p>
                        </div>
                        <div id="reward">
                            <p id="rewardPrice">23,000원</p>
                            <p id="quantityLimit">제한 수량 300개</p>
                            <hr>
                            <p id="rewardTitle">[얼리버드] 밥그릇</p>
                            <p id="rewardExplain">지구를 살리기위해 만들어진 종이 폼롤러! 이번기회에 환경 친화적 폼롤러로 피부 걱정없이 홈트하자. 롤러 사고 나무심기 기부 캠페인에 참여하여 우리 지구 함께 살려요 :)</p>
                            <p id="rewardCate">배송비</p>
                            <p id="shipPrice" >3,000원</p>
                            <p id="rewardCate" style="clear:both;">리워드 발송 시작일</p>
                            <p id="deliveryStart">2021년 07월 중순(11~20일)</p>
                        </div>
                        <div id="reward">
                            <p id="rewardPrice">23,000원</p>
                            <p id="quantityLimit">제한 수량 300개</p>
                            <hr>
                            <p id="rewardTitle">[얼리버드] 밥그릇</p>
                            <p id="rewardExplain">지구를 살리기위해 만들어진 종이 폼롤러! 이번기회에 환경 친화적 폼롤러로 피부 걱정없이 홈트하자. 롤러 사고 나무심기 기부 캠페인에 참여하여 우리 지구 함께 살려요 :)</p>
                            <p id="rewardCate">배송비</p>
                            <p id="shipPrice" >3,000원</p>
                            <p id="rewardCate" style="clear:both;">리워드 발송 시작일</p>
                            <p id="deliveryStart">2021년 07월 중순(11~20일)</p>
                        </div>
                        <div id="reward">
                            <p id="rewardPrice">23,000원</p>
                            <p id="quantityLimit">제한 수량 300개</p>
                            <hr>
                            <p id="rewardTitle">[얼리버드] 밥그릇</p>
                            <p id="rewardExplain">지구를 살리기위해 만들어진 종이 폼롤러! 이번기회에 환경 친화적 폼롤러로 피부 걱정없이 홈트하자. 롤러 사고 나무심기 기부 캠페인에 참여하여 우리 지구 함께 살려요 :)</p>
                            <p id="rewardCate">배송비</p>
                            <p id="shipPrice" >3,000원</p>
                            <p id="rewardCate" style="clear:both;">리워드 발송 시작일</p>
                            <p id="deliveryStart">2021년 07월 중순(11~20일)</p>
                        </div>
                        <div id="reward">
                            <p id="rewardPrice">23,000원</p>
                            <p id="quantityLimit">제한 수량 300개</p>
                            <hr>
                            <p id="rewardTitle">[얼리버드] 밥그릇</p>
                            <p id="rewardExplain">지구를 살리기위해 만들어진 종이 폼롤러! 이번기회에 환경 친화적 폼롤러로 피부 걱정없이 홈트하자. 롤러 사고 나무심기 기부 캠페인에 참여하여 우리 지구 함께 살려요 :)</p>
                            <p id="rewardCate">배송비</p>
                            <p id="shipPrice" >3,000원</p>
                            <p id="rewardCate" style="clear:both;">리워드 발송 시작일</p>
                            <p id="deliveryStart">2021년 07월 중순(11~20일)</p>
                        </div>
                    </div>
                    <br><br>
                    <div id="btns">
                        <!-- 이전 페이지 연결 -->
                        <button type="button" id="beforeBtn">이전으로</button>
                        <!-- 다음페이지 연결 -->
                        <button type="button" id="nextBtn">다음으로</button>
                    </div>
                    <br><br><br>
                </div>
            </div>
        </div>
    </div>
</body>
</html>