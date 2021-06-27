<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>단계2</title>
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
<link rel="stylesheet" href="resources/css/basic.css">
<style>
    /* 상태바 */
    /* 활성화 상태바 표시 */
    .step-state.step2 ul li:nth-child(-n+2):before{
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
    .step-state.step2 ul li:nth-child(2) p:before{
        background: #ddd;
        top: -13px;
    }

    /* content */
    #content1{padding-left: 50px}
    #summary{
        margin-top: -5px;
        color: #757575;
    }
    button{cursor:pointer;}
    #beforeBtn{
        float: left;
        width: 100px;
        height: 35px;
        border: none;
        border-radius: 5px;
        background-color: #c7c7c7;
        font-size: 15px;
        font-weight: 600;
        color: white;
    }
    #afterBtn{
        width: 100px;
        height: 35px;
        border: none;
        border-radius: 5px;
        background-color: rgb(116, 152, 107);
        font-size: 15px;
        font-weight: 600;
        color: white;
    }
    #levelSummary{
        margin-top: -3px;
        color: #757575
    }
    #level{
        color: black;
        font-weight: 900;
    }
    
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
                    <div class="step-state step2">
                        <ul>
                            <li><p></p></li>
                            <li><p></p></li>
                            <li><p></p></li>
                            <li><p></p></li>
                        </ul>
                    </div>
                </div>
                <div id="content1">
                    <h3 style="font-weight:600;">프로젝트는 4단계에 걸쳐 오픈됩니다.</h3>
                    <h5 id="summary">
                        아래와 같은 4단계의 진행과정을 통해 프로젝트가 오픈됩니다.<br>
                        투명하고 신뢰도 있는 프로젝트를 오픈하기 위해 꼭 필요한 절차이니 차근차근 진행해주세요.
                    </h5>
                    <br><br>

                    <h5 id="level">1단계 : 펀딩 준비 작성</h5>
                    <h6 id="levelSummary">펀딩 준비 메뉴들의 필수항목을 모두 작성하여 제출해주세요.</h6>
                    <br>

                    <h5 id="level">2단계 : 요건 확인 진행</h5>
                    <h6 id="levelSummary">
                        크리에이터님이 작성하신 항목들을 토대로 매직팟 펀딩을 진행하기 위한 기본 요건이 충족되는지 확인합니다.<br>
                        (영업일 기준 3~5일 소요)
                    </h6>
                    <br>

                    <h5 id="level">3단계 : 콘텐츠 확인 진행</h5>
                    <h6 id="levelSummary">
                        요건 확인 완료 시, 프로젝트의 핵심인 스토리를 중심으로 콘텐츠를 확인합니다.<br>
                        필요 시, 매직팟 담당자가 피드백을 반영 요청할 수 있습니다.
                    </h6>
                    <br>
                    
                    <h5 id="level">4단계 : 펀딩 오픈</h5>
                    <h6 id="levelSummary">모든 준비가 완료되면 오픈이 승인됩니다. 크리에이터님이 직접 '바로 오픈' 혹은 '오픈 예약' 할 수 있습니다.</h6>

                    <br><br><br>
                    <button id="beforeBtn">이전</button> 
                    &nbsp;
                    <button id="afterBtn">다음</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>