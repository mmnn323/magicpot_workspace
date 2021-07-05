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
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/dd18300701.js" crossorigin="anonymous"></script>
<script src="https://use.fontawesome.com/3cfa8b1a3c.js"></script>

<style>
    div, form, input{ box-sizing: border-box;}
    div, p, form, a {font-family: 'Noto Sans KR', sans-serif;}
    div{box-sizing: border-box;  }
    .wrap{
        background-color: white;
        margin: auto;
        width: 1000px;
       
    }

    .wrap>div{width:100%}
    #content_1{height: 350px; background-color: rgb(225, 212, 169);}
    #content_2{height: 140px;}
    #content_3{height: 130px; border-bottom: 1px solid lightgray;}
    

    #content_1>div{float: left;}
	#search>div{float: left;}
    

    #textTitle{
        margin-top: 170px;
        margin-left: 50px;
        color: white;
        
    }

  

    #sign a{
        float: left;
        color: white; 
        margin-top: 290px;
        }
    #direction_1{
        margin-left: 565px;
    }

    #direction_2{
        margin-left: 20px;
        
    }

    #category{
        margin-top: 20px;
    }
    #category a{
        margin-left: 72px;

    }

    #search>h2, #search>div,  #search>form{
        margin-top: 70px;
        float: left;
    }
	.dropdown{
		margin-left: 400px;
	}
	.dropdown>button{
		background-color:white;
		color:black;
		border:1px solid lightgray;
	}
    #total{
        margin-left: 15px;
        color: rgb(116, 152, 107);
    }

    #searchForm >div{
        float: left;
    }

    .select{
      margin-right:-10px;
      margin-left:15px;
      border-radius: 40px;
    }
   
    #searchBtn{
        border: none;
        background-color: white;
    }

    .form-control{
        margin-left: 10px;
        width: 200px;
        border-radius: 20px;
        
    }

    .fa-search{
        font-size: 3.1ch;
        margin-top: 5px;
        color: rgb(116, 152, 107);
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
        text-decoration: none;
    }
    
    .box {
    width: 58px;
    height: 58px; 
    border-radius: 70%;
    border:1px solid lightgray;
    overflow: hidden;
    }
    .profile {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    #category > a{
        float: left;
        margin-left: 90px;
    }
    
    #category > a:hover{
    	cursor: pointer;
        opacity:0.7;
        transition: .6s;
        transform: scale( 1.03 )
    }

    .fundCate{
        font-weight: bold;
    }
	 #noSearch > span{
        font-family: 'Noto Sans KR', sans-serif;
        font-size: 30px;

    }
    #noKey{
        font-weight: bold;
        color: rgb(225, 212, 169);
        margin-left: 300px;
    }
  
</style>
</head>
<body>
   
    <jsp:include page="../common/header.jsp"/>

    <div class="wrap">
        <div id="content_1">
            <div id="demo" class="carousel slide" data-ride="carousel">
                <ul class="carousel-indicators">
                  <li data-target="#demo" data-slide-to="0" class="active"></li>
                  <li data-target="#demo" data-slide-to="1"></li>
                  <li data-target="#demo" data-slide-to="2"></li>
                </ul>
                <div class="carousel-inner">
                  <div class="carousel-item active">
                    <img id="mainImg1" src=""  width="1000" height="350">
                    <div class="carousel-caption">
                      <h4 id="textTitle1"></h3>
                      
                    </div>   
                  </div>
                  <div class="carousel-item">
                    <img id="mainImg2" src=""  width="1000" height="350">
                    <div class="carousel-caption">
                      <h4 id="textTitle2"></h3>
                    </div>   
                  </div>
                  <div class="carousel-item">
                    <img id="mainImg3" src=""  width="1000" height="350">
                    <div class="carousel-caption">
                      <h4 id="textTitle3"></h3>
                    </div>   
                  </div>
                </div>
                
              </div>

        </div>
        
        <script>
	            $(function(){
	        		slide();
	        	})
	        	
	        	function slide(){
					$.ajax({
						url:"slideAjax.pj",
						success:function(list){
							var i="i";
							for(var i=1; i<=3; i++){
								$("#textTitle" + i).text(list[i-1].proTitle);
								$("#text" + i).text(list[i-1].proSummary);
								$("#mainImg" + i).attr("src",list[i-1].proImage);
							}
							
							
							
							
							
							
						},error:function(){
							console.log("ajax통신 실패")
						}
					})
				}
	            	
	            	
          </script>

		<br>
        <div id="content_2">
            <div id="category">
                <a id="all" href="fund.li" style="text-decoration: none; color: black;">
                    <div class="box" style="background: #BDBDBD;">
                        <img class="profile" src="resources/images/funding/all.jpg">
                    
                    </div>
                    <div class="fundCate" style="margin-top: 10px; margin-left: 15px;">ALL</div>
                </a>
                <a  href="fund.li?ctg=5" style="text-decoration: none; color: black;">
                    <div id="living" class="box" style="background: #BDBDBD;">
                        <img class="profile" src="resources/images/funding/living.jpg">
                    
                    </div>
                    <div class="fundCate" style="margin-top: 10px; margin-left: 4px;">LIVING</div>
                </a>
                <a id="office" href="fund.li?ctg=1" style="text-decoration: none; color: black;">
                    <div class="box" style="background: #BDBDBD;">
                        <img class="profile" src="resources/images/funding/office.jpg">
                    
                    </div>
                    <div class="fundCate" style="margin-top: 10px; margin-left: 4px;">OFFICE</div>
                </a>
                <a id="kitchen" href="fund.li?ctg=2" style="text-decoration: none; color: black;">
                    <div class="box" style="background: #BDBDBD;">
                        <img class="profile" src="resources/images/funding/kitchen.jpg">
                    
                    </div>
                    <div class="fundCate" style="margin-top: 10px; margin-left: -2px;">KITCHEN</div>
                </a>
                <a id="travel" href="fund.li?ctg=3" style="text-decoration: none; color: black;">
                    <div class="box" style="background: #BDBDBD;">
                        <img class="profile" src="resources/images/funding/travel.jpg">
                    
                    </div>
                    <div class="fundCate" style="margin-top: 10px; margin-left: 2px;">TRAVEL</div>
                </a>
                <a id="bath" href="fund.li?ctg=4" style="text-decoration: none; color: black;">
                    <div class="box" style="background: #BDBDBD;">
                        <img class="profile" src="resources/images/funding/bath.jpg">
                    
                    </div>
                    <div class="fundCate" style="margin-top: 10px; margin-left: 8px;">BATH</div>
                </a>
            </div> 
            


        </div>   

        <div id="content_3">
            <div id="search" >
                
                <h2 id="total" ><b>전체보기</b></h2>
                	
                	<!-- 2차 카테고리 테스트 Area -->
            
	            <div class="dropdown" >
	                <button  type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
	                       ${ empty ccc ? '인기순' : ccc }
	                </button>
	                <div class="dropdown-menu">
	                
	                   <button id="popular" class="dropdown-item" onclick="location.href='fund.li?ctg=${ctg}'" >인기순</button>
	                   <button id="popular" class="dropdown-item" onclick="location.href='fund.li?ctg=${ctg}&ctg2=1'" >마감순</button>
	                   <button id="recent" class="dropdown-item" onclick="location.href='fund.li?ctg=${ctg}&ctg2=2'">최신순</button>
	                	 
	          	    </div>
		                   
	            </div>
	            <form id="searchForm" action="search.pr" method="Get" align="center">
	            	<div class="select" >
	                    <select class="custom-select" name="condition">
	                        <option value="title">제목</option>
	                        <option value="writer">크리에이터</option>
	                    </select>
	                </div>
	                <div class="text">
	                     <input type="text" class="form-control" name="keyword" style="border-radius:20px; width:200px">
	                     <input type="hidden" name="ctg" value="${ ctg }">
	                     <input type="hidden" name="ctg2" value="${ ctg2 }">
	                </div>
	                <button type="submit" id="searchBtn">
	                    <i class="fa fa-search fa-2x"></i>
	                </button>
	                        
	                    
	                    
	           </form>
                
            </div>
        </div>
        <div id="content_4">
        
        
        	<c:choose>
	        		<c:when test="${empty pr[0]}">
		   				<div id="noSearch" style="height: 200px;">
			                <br><br><br><br>
			                <span id="noKey">'${keyword }'</span><span>에 대한 결과가 없습니다.</span>
	                 
	            		</div>
	        		
	        		</c:when>
        		<c:otherwise>
		        	<c:forEach var="i" begin="0" end="${pr.size()-1 }">
			            <a id="TotalUrl" href="" style="text-decoration:none; color:black">
			                    
			                <div class="newThumbnail" >
			                   <img src="${pr[i].proImage }">
			                   <br><br>
			                   <small class="projectCtg" style="color:gray; font-weight:bold;">${pr[i].category.caName }</small>
			   
			                   <p style="margin-top: 0;">
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
    
	    $( document ).ready(function() {
			
		    document.addEventListener('scroll', function() {
		        var currentScrollValue = document.documentElement.scrollTop;
		        console.log('currentScrollValue is ' + currentScrollValue);
		    });
		    
		    
		       
		   
		    
		    
		    
	    });
	    
	    
	   
    	
	 
	    
	   
	   
    </script>
    
</body>
</html>