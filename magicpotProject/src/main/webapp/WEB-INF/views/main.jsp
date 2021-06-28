<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<style>
    div{box-sizing: border-box;}
    .wrap{
        width: 1000px;
        height: 800px;
        margin: auto;
        font-family: 'Noto Sans KR', sans-serif;
    }
    .wrap>div{width: 100%;}
    #header{
        background-color:#d3d3d3;
        height: 50px;
        position: fixed;
        top: 0px;
        left: 0;
        right: 0;  
        z-index: 1;
    }
    #menu{position:fixed;left:0;background-color:#d3d3d3;}
    #content{position:absolute;left:200px;right:0;}
    body{padding-top:45px}
    #menu_content{height:100%;}

    #header>div, #menu_content>div{
        height: 100%;
        float: left;
    }
    #menu{width:200px; border:1px solid #f0f0f0}
    #content{width:100%;margin-top:20px}

    /* header 스타일*/
    #header>div{height: 100%;}
    #logo{width: 11%;}
    #adminId{width: 72%;}
    #logout{width: 8%;}
    #bar{width: 1%;}
    #outPage{width: 8%;}
    #adminId, #logout, #bar, #outPage{
        font-size: 17px;
        font-weight: 600;
        color:rgb(116, 152, 107);
        line-height: 45px;
        text-align: center;
    }
    #adminId{text-align: right;}

    /* menu 스타일 */
    #menu>div{width: 100%;}

    /* menubar */
    #accordian{text-align:center;}
    #accordian>ul{margin-top:0px;}
    #accordian>ul>li{border:1px solid #f0f0f0;margin-left:-40px;}
	#accordian li>h1{ cursor:pointer;}
	#accordian li>ul{ display:none;}
    #accordian p{font-size:16px}
    #accordian h4{line-height:42px;font-weight:600;}
    #abled{font-size:16px;}
	#accordian a{
		list-style:none;
		text-decoration:none;
		color:black;	
	}
	#subMenu a{
		width:196px;
        background:#f8f8f8;
		display:block;
		padding:15px 20px;
		margin-left:-40px;
		color:#222;
		font-weight:600;
        text-align:center;
		border-bottom:1px solid #eaeaea;
		position:relative;
   	}
	#subMenu a:hover{
		color:#222;
		background:#ebeaea;
		transition:all 0.8s;
		border-bottom:1px solid #bdbdbd;
    }
   	a:after{
   		content:'';
  		opacity:0;
  		transition:opacity 0.3s;
  	}
	#ready:hover, #ready p:hover{color:rgb(116, 152, 107)}
    #abled:hover{color:rgb(116, 152, 107)}
    
    /* content */
   
    .outer{
            /* height: 700px; */
            /* border: 1px solid red; */
            width: 900px;
            margin: 30px;
            float: left;
        }
    #title{font-size: 25px; font-weight: bold;}

    #title2{
            font-size:16px;
            background-color: gray;
            color:white;
            margin-left: 10px;
            border:1px solid gray;
            border-radius: 5px;
            padding:3px;
        }

        /* 컨텐트 카테고리 타이틀 영역 */
    .guideTitle{
        font-family: 'Noto Sans KR', sans-serif;
        width:900px;
        border-bottom: 2px solid lightgray;
        padding:10px;
        margin:20px;
        margin-top: 0;
        
    }

    .explainContent{
        width: 700px;
        height: 500px;
        border: 2px solid lightgray;
        margin-left: 50px;
        border-radius: 10px;
    }

    .btnArea{
        margin-top: 20px;
        margin-left: 300px;
    }

    #editBtn{
        background-color: rgb(116, 152, 107);
        
        width: 95px;
        height: 45px;
        border: none;
    }
    #editBtn:hover{
         background-color: rgb(93, 121, 86);
    }
    #cancelBtn{
        background-color: gray;
        width: 95px;
        height: 45px;
        border: none;
        margin-left: 15px;
     }
     #cancelBtn:hover{
         background-color: rgb(105, 104, 104);
    }



    
</style>
</head>
<body>
	<jsp:include page="common/header.jsp"/>
	
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
                                    <a href="" id="abled">&nbsp; 이용가이드 관리</a><span style="margin-left:80px"></span></h4>
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
                <div class="outer">
                    <div class="guideTitle">
                        <span id="title">이용가이드 관리</span>
                        <span id="title2">프로젝트 심사</span>
                    </div>
                    <div class="explainArea" >
                        <br>
                        <form action="" id="evaluateContent">  
                            <div class="explainContent">
                                <br>
                                <p>
                                    1) 프로젝트 심사 내용<br><br>
                                    크라우드펀딩은 단순 자금 조달을 넘어 대중과 소통하며 대중의 공감을 얻는 과정입니다. 심사 가이드는 개설자님의 펀딩 프로젝트가 더 많은 사람들의 공감과 후원을 받을 수 있도록 도와드리기 위한 것이니 조금 시간이 걸리더라도 심사 가이드를 꼼꼼히 확인해보시고 프로젝트를 준비해주세요.
                                    <br><br>
                                    2) 프로젝트 심사 기간
                                    프로젝트 신청 후 프로젝트 검토는 영업일 기준 3~5일이 소요됩니다. 접수된 프로젝트는 프로젝트 매니저가 검토 후 진행이 가능한지 확인합니다. 피드백은 회원가입 및 프로젝트 신청 시 기입한 이메일로 발송됩니다
                                    프로젝트 심사와 피드백 반영을 고려한 통상적으로 프로젝트 신청 후 오픈까지는 1~2주가 소요됩니다. 희망하시는 프로젝트 오픈 시점을 고려하여 프로젝트를 미리 준비해주세요.
                                </p>
                            </div>

                            <div class="btnArea">
                                <button type="submit" class="btn btn-success" id="editBtn">수정</button>
                                <button type="button" class="btn btn-success" id="cancelBtn">취소</button>
                            </div>

                        </form>
                    </div>


                </div>
                    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
            </div>

                
            
        </div>
    </div>
    
    <jsp:include page="common/footer.jsp"/>
</body>
</html>