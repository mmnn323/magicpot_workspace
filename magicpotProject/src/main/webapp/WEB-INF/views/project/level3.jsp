<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>단계3</title>
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
    .step-state.step3 ul li:nth-child(-n+3):before{
        position:absolute;
        background:rgb(116, 152, 107);
    }
    /* 1/2영역 비활성화 */
    .step-state ul li p:before{
        position:absolute;
        top:35px;
        left:50%;
        right:0;
        height:3px;
        content:'';
    }	
    .step-state.step3 ul li:nth-child(3) p:before{
        background:#ddd;
        top:-13px;
    }

    /* content */
    #content1{padding-left:50px}
    #summary{color:#757575;margin-bottom: -3px;}
    button{cursor:pointer;}
    #before_btn{
        font-size: 15px;
        font-weight: 600;
        color:white;
        background-color:#c7c7c7;
        width: 100px;
        height: 35px;
        border:none;
        border-radius: 5px;
        float:left;
    }
    #after_btn{
        font-size: 15px;
        font-weight: 600;
        color:white;
        background-color:rgb(116, 152, 107);
        width: 100px;
        height: 35px;
        border:none;
        border-radius: 5px;
    }
    #level_summary{margin-top:-3px;color:#757575}
    #level{color:black;font-weight:900;}
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
                    <div class="step-state step3">
                        <ul>
                            <li><p></p></li>
                            <li><p></p></li>
                            <li><p></p></li>
                            <li><p></p></li>
                        </ul>
                    </div>
                </div>
                <div id="content1">
                    <h5 id="summary">프로젝트가 성공적으로 종료되면</h5>
                    <h3 style="font-weight:600;">아래와 같은 프로세스로 진행됩니다.</h3>
                    <br><br>
                    
                    <h5 id="level">펀딩 종료 및 결제 진행</h5>
                    <h6 id="level_summary">결제는 종료일 +1영업일로부터 최대 4영업일까지 진행됩니다.</h6>
                    <br>

                    <h5 id="level">바로 정산</h5>
                    <h6 id="level_summary">펀딩이 성공적으로 종료 후, 최종 결제 금액의 일부가 정산금으로 지급됩니다.</h6>
                    <br>

                    <h5 id="level">리워드 발송</h5>
                    <h6 id="level_summary">크리에이터는 리워드 준비 및 발송을 진행하며 발송 후에는 발송 정보에 대한 발송 상태를 변경해야합니다.</h6>
                    <br>

                    <h5 id="level">펀딩금 반환 <p style="display: inline;font-size:12px;color:#757575">(신청한 서포터가 있는 경우에 한함)</p></h5>
                    <h6 id="level_summary">펀딩한 서포터는 리워드 하자 및 배송 지연에 대한 펀딩금 반환을 신청할 수 있습니다.</h6>
                    <br>

                    <h5 id="level">최종 정산</h5>
                    <h6 id="level_summary">리워드 발송과 펀딩금 반환이 모두 완료되면 최종정산이 진행됩니다.</h6>

                    <br><br><br>
                    <button id="before_btn">이전</button> 
                    &nbsp;
                    <button id="after_btn">다음</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>