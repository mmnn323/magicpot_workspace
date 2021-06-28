<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MyPage_like</title>
<!-- 글씨체 -->
<link rel="preconnect" href="https://fonts.gstatic.com/%22%3E">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/dd18300701.js" crossorigin="anonymous"></script>

<style>
    div, form, input{ box-sizing: border-box;}
    div, p, form, a, input {font-family: 'Noto Sans KR', sans-serif;}
    div{box-sizing: border-box;  }
    .wrap{
        background-color: white;
        margin: auto;
        width: 1000px;
        height: 1300px;
    }

    .wrap>div{width:100%}
    .content_1{height: 240px; background-color: rgb(225, 212, 169);}
    .content_2{
        height: 1000px;
    }

    #textArea{
        margin-top: 50px;
    }

    #textArea_1>p{
        color: hsl(51, 89%, 50%);
        font-size: 30px;
        padding: 70px 60px;
        
    }

    #textArea_1>p>b{
        color: white;
        font-size: 30px;
    }
    #textArea_2>p{
        color: white;
        font-size: 18px;
        margin-top: -90px;
        margin-left: 62px;
    }

    #guideLogo{
        margin-left: 450px;
        margin-top: -130px;
    }

    .content_2>div{
        float: left;
    }
    .mainContent{
        border: 1px solid lightgray;
        height: 1000px;
        width: 700px;
        margin-top: 20px;
        box-shadow: 10px 10px 5px grey;
    }

    .sideContent{
        border: 1px solid lightgray;
        height: 1000px;
        width: 260px;
        margin-top: 20px;
        margin-left: 30px;
        box-shadow: 10px 10px 5px grey;
    }

    #cloud, #enroll{
        width: 650px;
        margin-left: 20px;
    }

    #common, #customer, #creator, #etc{
        width: 220px;
        margin-left: 10px;
    }

    #cloudTitle, #enrollTitle, #commonTitle, #customerTitle, #creatorTitle{
        padding: 30px 0px;
    }


    #cloudContent, #enrollContent{
        border-top: 3px solid lightgray;
        margin-top: -20px;
    }

    #commonContent, #customerContent, #creatorContent{
        border-top: 3px solid lightgray;
        margin-top: -20px;
        color: gray;
        font-size: small;
    }

    a{
        color: black;
        text-decoration: none;
    }

    #title{font-size:25px;}
    #image{
        width:500px; 
        height:400px; 
        margin-left:12%;
    }
    #cloud>p{text-align:center;}
    #cloudContent>p{
        float:right;
        margin-top:30px;
        margin-right:10px;
    }

    /*버튼영역*/
    #cm_enrollBtn{
        background-color:rgb(116, 152, 107); 
        border:none;
    }
    #cm_btnArea{
        float:right;
        margin-top:35%;
        margin-right:50px;    
    }

</style>
</head>
<body>
    

    <div class="wrap">
        <div class="content_1">
            <div id="textArea_1">
                <p>
                    <b>이용가이드</b> Funding Guide
                </p>
            </div>
            <div id="textArea_2">
                <p>
                    매직팟 서비스에 대해 안내해드립니다. 
                </p>
            </div>

            <img src="resources/image/guideLogo.png" id="guideLogo">
                                       
                
        </div>

        <div class="content_2">
            <div class="mainContent">

                <div id="cloud">
                    <div id="cloudTitle">
                        <h6><b>공지사항</b></h6>
                    </div>
                    

                    <div id="cloudContent">
                        <br>
                        <span id="title">
                            가벼운 여름 캠핑 필수템만 시원하게 모았어요! <한여름의 쿨 캠핑> 기획전
                        </span>
                        <p>2021-03-12</p>
                    </div>

                    <br><br>
                    <img src="../common/notice/공지9.jpg" id="image">

                    <br><br>
                    <p>공지사항 내용입니다.</p>
                </div>

                <!-- 버튼 영역 -->
                <div id="cm_btnArea">
                    <a href="" class="btn btn-success" id="cm_enrollBtn">목록</a>                
                </div> 
                
            </div>

            <div class="sideContent">

                <div id="common">
                    <div id="commonTitle">
                        <h6><b>공통</b></h6>
                    </div>
                    <div id="commonContent">
                        <br>
                        <p>
                            - 크라우드 펀딩이란?<br>
                            - 회원가입
                        </p>
                    </div>

                </div>

                <br><br>
                <div id="customer">
                    <div id="customerTitle">
                        <a href=""><h6>펀딩 참여자</h6></a>
                    </div>
                    <div id="customerContent">
                        <br>
                        <p>
                            - 결제 <br>
                            - 리워드
                        </p>
                    </div>
                </div>

                <br><br>
                <div id="creator">
                    <div id="creatorTitle">
                        <a href=""><h6>펀딩 개설자</h6></a>
                    </div>
                    <div id="creatorContent">
                        <br>
                        <p>
                            - 프로젝트 신청 <br>
                            - 프로젝트 심사 <br>
                            - 펀딩진행 <br>
                            - 정산
                        </p>
                    </div>
                </div>

                <br><br>
                <div id="etc">
                    <a href=""><h6>공지사항</h6></a>
                    <br>
                    <a href=""><h6>이용약관</h6></a>
                    <br>
                    <a href=""><h6>FAQ</h6></a>

                </div>
                

            </div>
        </div>


    </div>
</body>
</html>