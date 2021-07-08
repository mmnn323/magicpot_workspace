<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
       height:3900px
    }

    .wrap>div{width:100%}
    .content_1{height: 240px; background-color: rgb(225, 212, 169);}
    .content_2{
       
        
       
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

    .guide, #etc{
        width: 220px;
        margin-left: 10px;
    }

    #cloudTitle, #enrollTitle, .guideTitle{
        padding: 30px 0px;
    }



    #cloudContent, #enrollContent{
        border-top: 3px solid lightgray;
        margin-top: -20px;
    }

    .gudieContent{
        border-top: 3px solid lightgray;
        margin-top: -20px;
        color: gray;
        font-size: small;
    }

    a{
        color: black;
        text-decoration: none;
    }
    

    




</style>

</head>
<body>
    
    <jsp:include page="../common/header.jsp"/>
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

            <img src="resources/images/common/guideLogo.png" id="guideLogo">
                                       
                
        </div>

        <div class="content_2">
            <div class="mainContent">

                <div id="cloud">
                    <div id="cloudTitle">
                        <h6><b>${gu[0].guTitle }</b></h6>
                    </div>
                    

                    <div id="cloudContent">
                        <br>
                        <p>
                           ${gu[0].guContent }
                        </p>
                    </div>
                </div>

                <br><br>
                <div id="enroll">
                    <div id="enrollTitle">
                        <h6><b>${gu[1].guTitle }</b></h6>
                    </div>

                    

                    <div id="enrollContent">
                        <br>
                        <p>
                           ${gu[1].guContent }
                        </p>
                    </div>
                </div>

            </div>

            <div class="sideContent">

                <div class="guide">
                    <div class="guideTitle">
                        <a href="guide.me" style="text-decorateion:none; color:black;"><h6>공통</h6></a>
                    </div>
                    <div class="gudieContent">
                        <br>
                        <p>
                            - 크라우드 펀딩이란?<br>
                            - 회원가입
                        </p>
                    </div>

                </div>

                <br><br>
                <div class="guide">
                    <div class="guideTitle">
                        <a href="guide.me?ctg=1" style="text-decorateion:none; color:black;"><h6>펀딩 참여자</h6></a>
                    </div>
                    <div class="gudieContent">
                        <br>
                        <p>
                            - 결제 <br>
                            - 리워드
                        </p>
                    </div>
                </div>

                <br><br>
                <div class="guide">
                    <div class="guideTitle">
                        <a href="guide.me?ctg=2" style="text-decorateion:none; color:black;"><h6>펀딩 개설자</h6></a>
                    </div>
                    <div class="gudieContent">
                        <br>
                        <p>
                            - 프로젝트 신청 <br>
                            - 프로젝트 심사 <br>
                           
                        </p>
                    </div>
                </div>

                <br><br>
                
                <div class="guide">
                    <div class="guideTitle">
                        <a href="guide.me?ctg=3" style="text-decorateion:none; color:black;"><h6>ETC</h6></a>
                    </div>
                    <div class="gudieContent">
                        <br>
                        <p>
                             - 펀딩진행 <br>
                             - 정산
                        </p>
                    </div>
                </div>

                <br><br>
                <div id="etc">
                    <a href="" style="text-decorateion:none; color:black;"><h6>공지사항</h6></a>
                    <br>
                    <a href="" style="text-decorateion:none; color:black;"><h6>이용약관</h6></a>
                    <br>
                    <a href="faq.li" style="text-decorateion:none; color:black;"><h6>FAQ</h6></a>

                </div>
                

            </div>
        </div>
		
	
    </div>
    
    
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>