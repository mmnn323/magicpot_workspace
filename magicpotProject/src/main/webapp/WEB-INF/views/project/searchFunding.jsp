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
    div, p, form, a, input, th, tr, span {font-family: 'Noto Sans KR', sans-serif;}
    div{box-sizing: border-box;  ;}
    .wrap{
        background-color: white;
        margin: auto;
        width: 1000px;
    }

    .wrap>div{width:100%}
    .content_1{
        height: 100px;
       
    }
    .content_2{
        height: 100px;
        
      
    }
   

    #textArea{
        margin-top: 80px;
        margin-left: 300px;
    }

    #textArea>span, p{
        font-size: x-large;
    }

    #no{color: rgb(225, 212, 169);}
    #btnArea{
        
    }
    #btnArea> button{
        background-color: white;
        border: 1px solid lightgray;
        border-radius: 20px;
        width: 100px;
        height: 40px;
        margin-left: 60px;
        text-decoration: none;
        
        
    }
    #btnArea>button:hover{
        border: 1px solid rgb(116, 152, 107);
        color: rgb(116, 152, 107);
    }

    .select{
        border-radius: 20px;
        width: 150px;
        margin-left: 800px;
    }

    .newThumbnail{
        font-family: 'Noto Sans KR', sans-serif;
        background-color: white;
        width:250px;
        display:inline-block;
        margin: 35px;
        text-align: left;
        box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        
    }

    .newThumbnail img{
        width: 100%;
        height:200px;
    }

    .newThumbnail p,.progress,small{
        margin:10px;
    }

    .newThumbnail>p{
        font-size: medium;
    }
    .newThumbnail:hover{
        cursor: pointer;
        opacity:0.7;
        transition: .6s;
        transform: scale( 1.03 )
    }
    .progress{height:10px; margin-bottom: 0;}
    .progress-bar{background-color: rgb(116, 152, 107); }
    .progress_status{color: rgb(116, 152, 107);}
    .projectCtg{
        color: lightgray;
    }

    a{
        color: black;
    }
    
    .dropdown{
    	margin-left: 800px;
    	margin-bottom:-30px;
    }
    .dropdown > button{
    	border:1px solid lightgray;
    	background-color : white;
    	color:black;
    	width:110px;
    	
    }



</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
    <div class="wrap">
        <div class="content_1">
            <div id="textArea">

				<c:choose>
	        		<c:when test="${empty pr[0]}">
		                <!-- 검색결과가 없을 경우-->
		                <span>'${keyword }'</span>
		                <span>의 검색결과가 없습니다. </span>
               		</c:when>
					<c:otherwise>
		                <!-- 결과가 존재할 경우-->
		                <span>'${keyword }'</span>
		                <span>의 결과를 </span>
		                <span id="no">${pr.size() }</span>
		                <span>개 찾았습니다.</span>
                	</c:otherwise>
                </c:choose>
            </div>
        </div>

        <div class="content_2">
            <div id="btnArea">
            	
                <button onclick="location.href='search2.pr?&keyword=${keyword}'" id="ctgAll">ALL</button>
                <button onclick="location.href='search2.pr?&keyword=${keyword}&ctg=5'" id="ctgLiving">LIVING</button>
                <button onclick="location.href='search2.pr?&keyword=${keyword}&ctg=1'" id="ctgOffice">OFFICE</button>
                <button onclick="location.href='search2.pr?&keyword=${keyword}&ctg=2'" id="ctgKitchen">KITCHEN</button>
                <button onclick="location.href='search2.pr?&keyword=${keyword}&ctg=3'" id="ctgTravel">TRAVEL</button>
                <button onclick="location.href='search2.pr?&keyword=${keyword}&ctg=4'" id="ctgBath">BATH </button>
                
            </div>
        </div>

        <br><br>
        <div class="content_3">
        		<br><br>
        
            	<div class="dropdown" >
	                <button  type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
	                       ${ empty ccc ? '인기순' : ccc }
	                </button>
	                <div class="dropdown-menu">
	                
	                   <button id="popular" class="dropdown-item" onclick="location.href='search2.pr?&keyword=${keyword}&ctg=${ctg}'" >인기순</button>
	                   <button name="ctg" value="${ctg}" id="popular" class="dropdown-item" onclick="location.href='search2.pr?&keyword=${keyword}&ctg=${ctg}&ctg2=1'" >마감순</button>
	                   <button id="recent" class="dropdown-item" onclick="location.href='search2.pr?&keyword=${keyword}&ctg=${ctg}&ctg2=2'">최신순</button>
	                	 
	          	   </div>
        		</div>
          
            <br>

            <c:choose>
	        		<c:when test="${empty pr[0]}">
		   				<div id="noSearch" style="height: 200px;">
			               
	                
	            		</div>
	        		
	        		</c:when>
        		<c:otherwise>
		        	<c:forEach var="i" begin="0" end="${pr.size()-1 }">
			            <a id="TotalUrl" href="detail.fd?proNo=${pr[i].proNo }" style="text-decoration:none; color:black">
			                    
			                <div class="newThumbnail" >
			                   <img src="${pr[i].proImage }">
			                   <br><br>
			                   <small class="projectCtg" style="color:gray; font-weight:bold;">${pr[i].category.caName }&nbsp; | &nbsp; ${pr[i].creator.creName }</small>
			   
			                   <p style="margin-top: 0; height:60px;">
			                           ${pr[i].proTitle }
			                   </p>
			   
			                   <div class="progress" style="height:10px; margin-bottom: 0;">
			                           <div class="progress-bar" style="width:${Math.round(pr[i].proFundPrice div pr[i].proPrice  *100) }%; background-color: rgb(116, 152, 107);"></div>
			                   </div>
			   
			                   <div class="progress_status" style="margin-bottom: 5px; color: rgb(116, 152, 107);">
			                       <small style="margin-right: 103px;">${Math.round(pr[i].proFundPrice div pr[i].proPrice  *100) }% 달성</small>
			                       <small >${arr[i]}일 남음</small>
			                   </div>
			                   
			               </div>
			           </a>
		           </c:forEach>
        		</c:otherwise>
        	</c:choose>
           

           

            
    	</div>
    
    </div>
    <jsp:include page="../common/footer.jsp"/>
    
    <script>
   	$(function(){
   		switch(${ctg}){
   		case 0:
   			$("#ctgAll").css("border", "1px solid rgb(116, 152, 107)").css("color", "rgb(116, 152, 107)");
   			break;
   		case 5:
   			$("#ctgLiving").css("border", "1px solid rgb(116, 152, 107)").css("color", "rgb(116, 152, 107)");
   			break;
   		case 1:
   			$("#ctgOffice").css("border", "1px solid rgb(116, 152, 107)").css("color", "rgb(116, 152, 107)");
   			break;
   		case 2:
   			$("#ctgKitchen").css("border", "1px solid rgb(116, 152, 107)").css("color", "rgb(116, 152, 107)");
   			break;
   		case 3:
   			$("#ctgTravel").css("border", "1px solid rgb(116, 152, 107)").css("color", "rgb(116, 152, 107)");
   			break;
   		case 4:
   			$("#ctgBath").css("border", "1px solid rgb(116, 152, 107)").css("color", "rgb(116, 152, 107)");
   			break;
   		};
   		
   	});	 	    
    </script>
    
   
    
    
</body>
</html>