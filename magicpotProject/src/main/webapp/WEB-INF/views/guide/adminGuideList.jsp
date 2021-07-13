<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
		width: 900px;
		margin: 30px;
		float: left;
	}
    #title{font-size: 25px; font-weight: bold;}

        /* 컨텐트 카테고리 타이틀 영역 */
    .guideTitle{
        font-family: 'Noto Sans KR', sans-serif;
        width:900px;
        border-bottom: 2px solid lightgray;
        padding:10px;
        margin:20px;
        margin-top: 0;
        
    }
	#cmNoticeListArea{ margin-top:50px; text-align:center;}
	#cmNoticeList{width:500px;}
	#cmNoticeList>tbody a{
		color:black;
		text-decoration: none;
	}
	#cmNoticeList>tbody>tr:hover{
		background-color: rgb(215, 231, 212);
	}
	 #cmNoticeList>tbody>tr{
		cursor: pointer;
	}
</style>
</head>
<body>
	<jsp:include page="../common/adminPageTemplate2.jsp"/>
	            <div id="content">
                <div class="outer">
                    <div class="guideTitle">
                        <span id="title">이용가이드 관리</span>
                    </div>
                        <div id="cmNoticeListArea" >
                            <table class="table" id="cmNoticeList" align="center">
                              <thead class="thead-light" >
                                <tr>
                                  
                                  
                                  <th width="800">목록</th>
                                  
                                </tr>
                              </thead>
                              <tbody>
                                <tr>
                                  <td><a href="">이용약관</a></td>                                 
                                </tr>
                                <tr>
                                    <td><a href="detail.gu?ctg=1">크라우드 펀딩이란?</a></td>                                 
                                </tr>
                                <tr>
                                    <td><a href="detail.gu?ctg=2">회원가입</a></td>                                 
                                </tr>
                                <tr>
                                    <td><a href="detail.gu?ctg=3">결제</a></td>                                 
                                </tr>
                                <tr>
                                    <td><a href="detail.gu?ctg=4">리워드</a></td>                                 
                                </tr>
                                <tr>
                                    <td><a href="detail.gu?ctg=5">프로젝트 신청</a></td>                                 
                                </tr>
                                <tr>
                                    <td><a href="detail.gu?ctg=6">프로젝트 심사</a></td>                                 
                                </tr>
                                <tr>
                                    <td><a href="detail.gu?ctg=7">펀딩진행</a></td>                                 
                                </tr>
                                <tr>
                                    <td><a href="detail.gu?ctg=8">정산</a></td>                                 
                                </tr>
                              
                                  
                                
                              </tbody>
                            </table>
                      </div>

                    


                </div>
                    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
            </div>
</body>
</html>