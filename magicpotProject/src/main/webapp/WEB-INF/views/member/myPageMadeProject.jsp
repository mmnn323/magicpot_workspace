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
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/dd18300701.js" crossorigin="anonymous"></script>
<style>
    /* div, div *{border:1px solid red;} */
    div{box-sizing: border-box; }
    #outer{
        width:1000px;
        margin:auto;
    }

    #myPage_title{
        width:100%;
        text-decoration: none;
        font-family: 'Noto Sans KR', sans-serif;
        font-size:1.5em;
        color:black;
        }
    #content_title{width:500px; margin:30px; font-size: 30px;}
    #listArea{
        width:100%;
        background-color: rgba(225, 212, 169, 0.233);
        padding:50px 50px;
    }
    #listArea small{color:rgb(116, 152, 107);}

    .thumbnail1{
        font-family: 'Noto Sans KR', sans-serif;
        background-color: white;
        width:250px;
        display:inline-block;
        margin: 23px;
        text-align: left;
        box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    }
    .thumbnail1 img{
        width: 100%;
        height:200px;
    }

    #editBtn {
        position: relative;
        bottom: 200px;
        left: 195px;
        color:white;  
        font-size: 20px;      
        
    }

    #deleteBtn{
        position: relative;
        bottom: 200px;
        left: 200px;
        color:white;  
        font-size: 20px;      

    }
    #editBtn:hover, #deleteBtn:hover{
        color: black;
        
        font-weight:bold;
    }


    #likeBtn i:hover{color:red;}

    .thumbnail1 p,.progress,small{
        margin:10px;
    }
    #projectCtg{
        position: relative;
        bottom: 0px;
        left: -35px;
    }

    .thumbnail1:hover{
        cursor: pointer;
        opacity:0.7;
        transition: .6s;
        transform: scale( 1.03 )
    }
    .progress{height:10px; margin-bottom: 0;}
    .progress-bar{background-color: rgb(116, 152, 107); }

    .modal-content_2{
        height: 150px;
        width: 350px;
        background-color: white;
        margin: auto;

    }

    .modal-content_2>h5{
        margin-left: 50px;
        
    }

    .deleteBtn{
        margin-left: 130px;
        margin-top: 50px;
    }

    .deleteBtn> a{
        background-color: rgb(225, 212, 169);
        border: none;
        width: 90px;
        height: 40px;
    }

    .deleteBtn> button{
        background-color: rgb(94, 94, 94);
        border: none;
        width: 90px;
        height: 40px;
    }
</style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp"/>

    <div id="outer">
       <div id="myPage_title">
           <br><br>
           <div id="content_title"> <b>내가만든 프로젝트</b></div>
           <br>
       </div>
       <div id="listArea">
       
       	
       			<c:choose>
       				<c:when test="${empty pr[0].proNo}">
       					<div style="height:350px;"></div>
       				</c:when>
       				<c:otherwise>
		       			<c:forEach var="i"  begin="0" end="${pr.size()-1 }" >
				            <a href="" id="detailUrl">
				                <div class="thumbnail1" >
				                    
				                    <img src="${pr[i].proImage }">
									<c:choose>
										<c:when test="${pr[i].proStep eq '펀딩안내' }">
					                    	<a href="level1.pro " id="editBtn"><i class="far fa-edit"></i></a>
					                    </c:when>
					                    <c:when test="${pr[i].proStep eq '펀딩준비' || pr[i].proStep eq '콘텐츠확인' }">
					                    	<a href="FundingHome2.pro " id="editBtn"><i class="far fa-edit"></i></a>
					                    </c:when>
					                    <c:otherwise>
					                    	<a href="FundingStatus.pro " id="editBtn"><i class="far fa-edit"></i></a>
					                    </c:otherwise>
				                    </c:choose>
				                    
				                    <a href="delete.pr?proNo=${pr[i].proNo}" style="text-decoration: none;"><span id="deleteBtn" ><i class="fas fa-times" data-toggle="modal" data-target="#deleteModal1"></i> </span></a>
				
				                    <small id="projectCtg" style="color:gray; font-weight:bold;">${pr[i].category.caName }</small>
				
				                    <p style="margin-top: 0; height:60px">
				                       ${pr[i].proTitle }
				                    </p>
				
				                    <div class="progress" style="height:10px; margin-bottom: 0;">
				                        <div class="progress-bar" style="width:${Math.round(pr[i].proFundPrice div pr[i].proPrice  *100) }%; background-color: rgb(116, 152, 107);"></div>
				                    </div>
				
				                    <div id="progress_status"  style="margin-bottom: 5px; color: rgb(116, 152, 107);">
				                        <small style="margin-right: 103px;" >${Math.round(pr[i].proFundPrice div pr[i].proPrice  *100) }% 달성</small>
				                        <small >${arr[i]}일 남음</small>
				                    </div>
				                
				                </div>
				            </a>
						    <!-- The Modal -->
						    <div class="modal" id="deleteModal">
						        <div class="modal-dialog2">
						            <div class="modal-content_2">
						                <br>
						                <h5><b>정말로 삭제하시겠습니까?</b></h5>
						               
						                
						               
						                    <div class="deleteBtn">
						                        <a href=""  class="btn btn-success">삭제</a>
						                        <button type="reset" class="btn btn-success" data-dismiss="modal">취소</button>
						                    </div>
						                
						               
						                
						            </div>
						        </div>
						    </div>
			            </c:forEach>
			    	</c:otherwise>
       			</c:choose>
           
           

       </div> 
    </div>
	<jsp:include page="../common/footer.jsp"/>

    
   
    
</body>
</html>