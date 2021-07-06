<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
        height: auto;
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

    #cloud {
        width: 650px;
        margin-left: 20px;
    }

    #common, #customer, #creator, #etc{
        width: 220px;
        margin-left: 10px;
    }

    #cloudTitle, #commonTitle, #customerTitle, #creatorTitle{
        padding: 30px 0px;
    }

    #cloudContent {
        border-top: 3px solid lightgray;
        height: auto;
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
    
    /* 버튼 영역 */
    #pro_btnArea a{
        border:none;
        width:80px;
        padding:7px;
        margin-left: 20px;
        float:none;
    }
    #pro_modifyBtn{
        background-color: rgb(63, 121, 247);
    }
    #pro_modifyBtn:hover{
        background-color: rgb(41, 89, 248);
    }

</style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp"/>
	
	<div class="wrap">
        <div class="content_1">
            <div id="textArea_1">
                <p>
                    <b>이용약관</b> Terms of service
                </p>
            </div>
            <div id="textArea_2">
                <p>
                   	 매직팟 이용약관에 대해 안내해드립니다. 
                </p>
            </div>

            <img src="resources/image/guideLogo.png" id="guideLogo">
                                            
        </div>

        <div class="content_2">
            <div class="mainContent">

                <div id="cloud">
                    <div id="cloudTitle">
                        <h6><b>이용약관</b></h6>
                    </div>
                
                    <div id="cloudContent">
                        <br>
                        <p>
                            ${ provision }
                        </p>
                    </div>
                </div>

                <br><br>

                <!-- 관리자 로그인 후 영역-->
                <div id="pro_btnArea">
                    <c:choose>
                        <c:when test="${loginUser.memId eq 'admin'}">
                            <!-- 로그인한 사용자가 관리자일 경우 이용약관 수정하는 페이지로 이동-->
                            <a href="proModifyForm.gu" class="btn btn-primary" id="pro_modifyBtn" style="color: white;">글수정</a>                    
                        </c:when>
                    </c:choose>
                </div>
                
                <br>
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
                        <h6><b>펀딩 참여자</b></h6>
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
                        <h6><b>펀딩 개설자</b></h6>
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
                    <a href=""><h6><b>공지사항</b></h6></a>
                    <br>
                    <a href=""><h6><b>이용약관</b></h6></a>
                    <br>
                    <a href=""><h6><b>FAQ</b></h6></a>

                </div>
            </div>
        </div>
    </div>
	
	

</body>
</html>