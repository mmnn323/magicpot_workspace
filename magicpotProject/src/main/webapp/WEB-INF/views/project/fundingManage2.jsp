<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펀딩 신청 상세 조회(기본 요건)</title>
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
<link rel="stylesheet" href="../resources/css/admin/fundingManage2.css">
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
                        <span id="title2">기본 요건</span>
                    </div>
                    <hr style="clear: both;margin-bottom: 30px;">
                    <form id="requireEnroll" action="" method="post">
                        
                        <h5>Q1. 현재까지 진행된 리워드의 준비 상태 및 앞으로의 계획을 구체적으로 설명해주세요.</h5>
                        <p id="p2">제작 공정에 따른 현재 리워드의 제작 상태 및 제조 시설명과 일일 최대 생산 가능량을 포함한 앞으로의 생산 계획을 작성해주세요.</p>
                        <textarea name="rewardPlan" id="rewardPlan" cols="80" rows="8" maxlength="1500" style="resize: none;width: 80%;">
필라로이드 업사이클링 캘린더를 2021.01.07에 기획하여 2021.01.28부터 나무 파렛트를 선정하고 공수하기 시작해 2021.03.30에 작업실에서 1일 40세트 제작 및 시제품 테스트를 완료한 뒤 2021.04.21에 펀딩 오픈 후 05.21에 종료하고 4일 뒤 부터 리워드 발송을 시작할 예정입니다. 총 개수는 기본 달력+스탠드 1개씩 세트로 620세트 제작할 예정입니다.                        
                        </textarea>
                        <br><br>
                        
                        <h5>Q2. 리워드의 전달 계획을 알려주세요.</h5>
                        <p id="p2">
                            1) 리워드의 전달 방법을 입력하고, 리워드 제작 및 전달 일정이 변동될 가능성이 있다면 사유를 알려주세요.<br>
                            2) 발송 업체명 및 일일 최대 발송 가능량을 입력해주세요.
                        </p>
                        <textarea name="rewardDelivery" id="rewardDelivery" cols="80" rows="8" maxlength="1500" style="resize: none;width: 80%;">
발송 방법은 우체국 택배사를 통해 택배 발송할 것이고, 5월 25일부터 1일 최대 300개씩 순차 발송할 예정입니다.
                        </textarea>
                        <br><br>
                        
                        <h5>Q3. 리워드 종류</h5>
                        <p id="p2">리워드 종류를 선택해 주세요.</p>
                        <input type="radio" name="rewardCategory" value=1 checked><span>&nbsp;홈 리빙-생활잡화</span>
                        <p id="p3">
                            원활한 일상 생활을 위해 사용하는 모든 용품<br><br>
                            예시) 미용도구,헤어롤, 물수건, 빨대, 화장지, 면봉, 기저귀, 스포츠 용품(자전거,골프용품 등), 공구, 완구, 캠핑용품, 행거, 옷걸이, 호신용품, 원예용품,벽지, 패브릭,인테리어 소품, 수납/정리용품, 홈데코용품, 청소용품, 세정제, 제거제, 세탁세제, 표백제,섬유유연제, 광택코팅제, 특수목적코팅제, 녹 방지제, 다림질 보조제, 접착제, 접합제, 방향제, 자동차용 워셔액, 자동차용 부동액, 인쇄용 잉크/토너, 미용 접착제, 문신용 염료, 살균제, 가습기용 항균/소독제제, 습기 제거제, 향초, 탈취제 등
                        </p>
                        <br>
                        <input type="radio" name="rewardCategory" value=2><span>&nbsp;홈 리빙-가구, 주방, 욕실</span>
                        <p id="p3">
                            주방, 욕실, 거실 등 주거 환경에서 원활한 일상 생활을 위해 사용하는 모든 용품<br><br>
                            예시) 욕실용품, 가구, 침구류, 그릇/홈세트, 타일, 침구, 커튼, 쿠션, 주방용품, 조리기구, 주방세제, 헹굼보조제 등
                        </p>
                        <br><br>
                        <!-- 이전 페이지 연결 -->
                        <button type="button" id="beforeBtn">이전으로</button>
                        <!-- 다음페이지 연결 -->
                        <button type="button" id="nextBtn">다음으로</button>
                    </form>
                    <br><br><br>
                </div>
            </div>
        </div>
    </div>
</body>
</html>