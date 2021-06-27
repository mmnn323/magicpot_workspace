<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>단계1</title>
<!-- 폰트어섬, 폰트 -->
<script src="https://kit.fontawesome.com/dd18300701.js" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.gstatic.com/%22%3E">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- include libraries(jQuery, bootstrap) -->
<!-- include libraries(jQuery, bootstrap) -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/css/basic.css">
<!-- css -->
<style>
    /* 상태바 */
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
    h5{color: #757575}
    #content #btn{
        width: 100px;
        height: 35px;
        border: none;
        border-radius: 5px;
        background-color: rgb(116, 152, 107);
        font-size: 15px;
        font-weight: 600;
        color: white;
    }
    button{cursor:pointer;}
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
                    <h3 style="font-weight:600;">대장님, 반갑습니다!</h3>
                        <h5>프로젝트 개설을 축하드리며, <br>
                            서포터에게 잊지 못할 프로젝트 경험을 선사하고 크리에이터님의 성공적인 펀딩을 위해
                            매직팟이 함께 협력할 수 있기를 기대합니다.
                        </h5>
    
                        <br><br>
                        
                        <h5>자 시작해볼까요?</h5>

                        <br>
                        <button id="btn" onclick="">다음</button>
                        <!-- level2로 이동 -->
                </div>
            </div>
        </div>
    </div>
</body>
</html>