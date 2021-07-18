<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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

    /*content*/
    
    #content>div{float:left;}
    #content>hr{margin-left:-20px;}
    #title{font-size:25px;}
    #content2>a>img{width:200px; height:150px; margin-top:10px;}
    #content1{margin-top:30px; width:450px;}

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
        margin-bottom:10px;
    }
    
    
	/* 페이징 영역 */
	#cm_pagingArea {
		padding: 30px;
		margin-top:-20px;
	}
	
	.pagination>li>a {
		color: rgb(116, 152, 107);
	}
	
	.pagination>li>a:hover {
		color: rgb(225, 212, 169);
	}
	
	#cm_paging {
		width: fit-content;
	}
	
	tr:hover{cursor: pointer;}

</style>
</head>
<body>


	<!-- 헤더 포함 -->
	<jsp:include page="../common/header.jsp"/>


    <div class="wrap">
        <div class="content_1">
            <div id="textArea_1">
                <p>
                    <b>공지사항</b> Notice
                </p>
            </div>
            <div id="textArea_2">
                <p>
                    매직팟 공지사항에 대해 안내해드립니다. 
                </p>
            </div>

            <img src="resources/images/common/guideLogo.png" id="guideLogo">
                                       
                
        </div>

        <div class="content_2">
            <div class="mainContent">

                <div id="cloud">
                    <div id="cloudTitle">
                        <h6><b>공지사항</b></h6>
                    </div>
                    
                    <div id="cloudContent"></div>
                    <br>
                    
                  
	               <c:if test="${ !empty loginUser and loginUser.memId eq 'admin'}">
	                    <!-- 글작성 버튼 -->
						<div id="cm_btnArea">
							<a href="enroll.no" class="btn btn-success" id="cm_enrollBtn">글작성</a>
						</div>
				   </c:if>
				
					
					<c:forEach var="n" items="${ list }">
	                    <div id="content">
	                        <div id="content1">
	                            <span>공지사항</span><br>
	                            <span id="title">
	                                <a href="notice.de" style="text-decoration:none; color:black;">${ n.noTitle }</a>
	                            </span>
	                            <br><span>${ n.noDate }</span>
	                        </div>
	                        
	                        <div id="content2">
	                            <a href="notice.de"><img src="${ n.noRoute }"></a>
	                        </div>
	                        <br><br><br><br><br><br><br><hr>
	                    </div>                    
                   </c:forEach>      
                   
                   
                    <!-- 페이징 영역 -->
					<div id="cm_pagingArea" align="center">
		
						<div id="cm_paging">
							<ul class="pagination pagination">
							
								<c:choose>
									<c:when test="${ pi.currentPage eq 1}">
										<li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
									</c:when>
									<c:otherwise>						
										<li class="page-item"><a class="page-link" href="notice.li?currentPage=1">&laquo;</a></li>
									</c:otherwise>
								</c:choose>
								
								<c:choose>
									<c:when test="${ pi.currentPage eq 1}">
								<li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
									</c:when>
									<c:otherwise>						
								<li class="page-item"><a class="page-link" href="notice.li?currentPage=${ pi.currentPage-1 }">&lt;</a></li>
									</c:otherwise>
								</c:choose>
								
								
								<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
									<c:choose>
										<c:when test="${ pi.currentPage eq p }">
											<li class="page-item disabled"><a class="page-link" href="#">${ p }</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link" href="notice.li?currentPage=${ p }">${ p }</a></li>	
										</c:otherwise>
									</c:choose>
								</c:forEach>
								
								<c:choose>
									<c:when test="${ pi.currentPage eq pi.maxPage }">
										<li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link" href="notice.li?currentPage=${ pi.currentPage+1 }">&gt;</a></li>
									</c:otherwise>
								</c:choose>
								
								<c:choose>
									<c:when test="${ pi.currentPage eq pi.maxPage }">
										<li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link" href="notice.li?currentPage=${ pi.maxPage }">&raquo;</a></li>
									</c:otherwise>
								</c:choose>
							</ul>
						</div>
					</div>
            
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
                        <h6>펀딩 참여자</h6></a>
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
                        <h6>펀딩 개설자</h6></a>
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
                    <a href="" style="text-decoration:none; color:black;"><h6>공지사항</h6></a>
                    <br>
                    <a href="" style="text-decoration:none; color:black;"><h6>이용약관</h6></a>
                    <br>
                    <a href="" style="text-decoration:none; color:black;"><h6>FAQ</h6></a>

                </div>
            </div>
        </div>
    </div>
    
    
    <!-- 푸터 포함 -->
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>