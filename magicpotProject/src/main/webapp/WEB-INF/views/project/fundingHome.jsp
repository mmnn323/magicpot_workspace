<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펀딩 준비 홈</title>
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
<link rel="stylesheet" href="resources/css/fundinghome.css">
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
                <div id="content1">
                    <h3 style="font-weight:600;">펀딩 준비</h3>
                    <h5 id="summary">본격적으로 펀딩을 오픈하기 위해 프로젝트에 대한 필수항목을 작성하세요.</h5>
                    <br><br>
                    
                    <fieldset>
                        <!-- 단계별로 내용 바뀜 -> select로 전부 내용있으면 작성 완료로 변경, 그외는 프로젝트 상태로 -->
                        <h4 style="font-weight:600;margin-top:25px">프로젝트 준비 상태</h4>
                        <p id="p5">펀딩 준비 작성 중</p>
                        <p id="p6">필수 항목을 모두 작성 후 저장하기 버튼을 클릭해주세요. 작성 중 > 작성 완료 상태로 변경되어야 최종 제출이 가능합니다.</p>
                    </fieldset>
                    <br>

                    <fieldset id="linkField">
                        <!-- 작성 중 작성 완료 단계 변경 필요 -->
                        <h4>기본 요건</h4>
                        <p id="p7">&nbsp;&nbsp;작성 중</p>
                        <button id="linkBtn">작성하기</button>
                    </fieldset>
                    <br>

                    <fieldset id="linkField">
                        <!-- 작성 중 작성 완료 단계 변경 필요 -->
                        <h4>기본 정보</h4>
                        <p id="p7">&nbsp;&nbsp;작성 중</p>
                        <button id="linkBtn">작성하기</button>
                    </fieldset>
                    <br>

                    <fieldset id="linkField">
                        <!-- 작성 중 작성 완료 단계 변경 필요 -->
                        <h4>스토리 작성</h4>
                        <p id="p7">&nbsp;&nbsp;작성 중</p>
                        <button id="linkBtn">작성하기</button>
                    </fieldset>
                    <br>

                    <fieldset id="linkField">
                        <!-- 작성 중 작성 완료 단계 변경 필요 -->
                        <h4>리워드 작성</h4>
                        <p id="p7">&nbsp;&nbsp;작성 중</p>
                        <button id="linkBtn">작성하기</button>
                    </fieldset>
                    <br>

                    <!-- 작성 다해야 제출가능 -> select으로 값 다 있으면 ㄱ?/ 단계따라서 버튼 바꾸기 제출완료, 오픈예약+바로오픈, 오픈완료 -->
                    <br>
                    <button id="submitBtn" disabled>제출하기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>