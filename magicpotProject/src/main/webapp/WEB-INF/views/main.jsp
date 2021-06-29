<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mainPage</title>
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
    div, form, input{ box-sizing: border-box;}
    div, p, form, a {font-family: 'Noto Sans KR', sans-serif;}
    div{box-sizing: border-box;  }
    .wrap{
        background-color: white;
        margin: auto;
        width: 1000px;
        height: 2080px;
    }

    .wrap>div{width:100%}
    #content_1{height: 350px;}
    #content_2{height: 450px;}
    #content_3{height: 960px; margin: auto; border-top: 1px solid lightgray;}
    #content_4{height: 350px; border-top: 1px solid lightgray;}

    #content_1>div,  #content_2>div{height: 100%; float: left; font-family: 'Noto Sans KR', sans-serif;}
    #mainImg{width: 65%;}
    #imgDetail{
        width: 35%;
        background-color: rgb(225, 212, 169);
        color: white;
        text-align: center;
     }
   
    #content_1{position: relative;}
    #img{width: 100%;
        height: 100%;
    }
    #textTitle{
        margin-top: 80px;
    }
    #text{
        width: 250px;
        margin-left: 50px;
        text-align: center;
    }
    #sign a{
        float: left;
        color: white;  
        }
    #direction_1{
        margin-left: 50px;
    }
    #direction_2{
        margin-left: 30px;
    }

    #recommend{width: 60%;}
    #ranking{width: 40%; border-left: 1px solid lightgray; }
    .reImg{
        width: 180px;
        height: 120px;

    }




    .thumbnail{
        float: left;
        width: 180px;
        height: 100px;
        padding-left: 5px;
        margin: 10px;
       
    }

    .thumbnail:hover{
        cursor: pointer;
        opacity:0.7;
        transition: .6s;
        transform: scale( 1.03 )
    }
    .projectCtg{
        color: lightgray;
    }
    .percent{
        color: rgb(116, 152, 107);
        margin-top: -10px;
    }

    .raContent>div{
        float: left;
        

       
    }
    .raContent{
        height: 65px;
        width: 100%; 
        margin-left: 15px;
        
}
    .raContent_1{
         width: 200px;
         height: 85px;
         margin-left: 10px;
         margin-right: 10px;
    }
    

    .newThumbnail{
        font-family: 'Noto Sans KR', sans-serif;
        background-color: white;
        width:250px;
        display:inline-block;
        margin: 40px;
        text-align: left;
        box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        
    }

    .newThumbnail img{
        width: 100%;
        height:200px;
    }

    #background{
       
        width: 800px;
        height: 250px;
        margin: auto;
        
    }

    #baContent{
        
        margin-left: 170px;
    }

    #baTitle{
        
        color: white;
    }

    a{
        text-decoration: none;
        color: black;
    }

    #raTitle{margin-left: 10px;}
    #reTitle, #raTitle, #newTitle{
        color:  rgb(116, 152, 107);
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

    
    #btnArea a{
            border:none;
            width:150px;
            height: 35px;
            margin-top: 15px;
            margin-left: 850px;
            background-color: rgb(116, 152, 107);
        }
    #btnArea a:hover{
            background-color: rgb(225, 212, 169);
        }

    #backBtn a{
            border:none;
            width:300px;
            height: 50px;
            margin-top: 15px;
            margin-left: 90px;
            background-color: rgb(116, 152, 107);
        }
    #backBtn a:hover{
            background-color: rgb(225, 212, 169);
        }

    #customerBtn a{
        margin-left: 950px;
    }
   .rankTitle{
    	font-size: x-small;
    }




   

</style>
</head>
<body>
    <jsp:include page="common/header.jsp"/>

    <div class="wrap">
        <div id="content_1">

            <div id="mainImg">
                <a class="mainDetailUrl" href="">
                    <img id="img" src="resources/image/mainImg.png" >
                </a>
            </div>

            <div id="imgDetail">
                <h4 id="textTitle"><b> 햄프코튼 다용도 타월</b></h4>
                <br>
                <p id="text">
                미세플라스틱을 발생시키는 화학섬유
                에서 벗어나 건강하고 지속 가능한
                라이프를 시작해 보세요.
                </p>
                
                <div id="sign">
                    <a id="direction_1" href=""> <h2><</h4></a>
                    <a id="direction_2" href=""> <h2>></h2></a>
                </div>
                
            </div>
        </div>

        <div id="content_2">

            <div id="recommend">
                <br>
                <h3 id="reTitle"><b>추천 프로젝트</b></h3>

                <br>
                <div class="thumbnail" >
                    <a class="detailUrl" href="">
                         <img class="reImg" src="">
                    </a>
                
                    <br>
                    <br>
    
                    <small class="projectCtg">리빙</small>
    
                    <p style="margin-top: 0;">
                        유기농 면으로 만든 끈조절 가능한 다회용 마스크
                    </p>

                    <p class="percent">
                        150% 달성
                    </p>
                
                
                </div>

                <div class="thumbnail" >
                    <a class="detailUrl" href="">
                         <img class="reImg" src="">
                    </a>
                
                    <br>
                    <br>
    
                    <small class="projectCtg">리빙</small>
    
                    <p style="margin-top: 0;">
                        유기농 면으로 만든 끈조절 가능한 다회용 마스크
                    </p>

                    <p class="percent">
                        150% 달성
                    </p>
                
                
                </div>

                
                    <div class="thumbnail" >
                        <a class="detailUrl" href="">
                            <img class="reImg" src="">
                        </a>
                    
                        <br>
                        <br>
        
                        <small class="projectCtg">리빙</small>
        
                        <p style="margin-top: 0;">
                            유기농 면으로 만든 끈조절 가능한 다회용 마스크
                        </p>

                        <p class="percent">
                            150% 달성
                        </p>
                    
                    
                    </div>
                
                
            </div>

            <div id="ranking">

                <br>
                <h3 id="raTitle" ><b>실시간 랭킹</b></h3>
                
                <br>
                <c:forEach var="i" begin="1" end="3">
	                <a class="raUrl" href="" style="text-decoration: none; color: black;">
	                    <div class="raContent">
	                        <div class="raNo">
	                            <h3 ><b>${i }</b></h3>
	                        </div>
	
	                        <div class="raContent_1">
	                            <p class="rankTitle${i }">
	                                
	                            </p>
	                            <p class="percent">
	                                <small >150% 달성</small>
	                            </p>
	
	                        </div>
	
	                        <div class="raContent_2">
	                            <img class="raImg${i }" src="" width="150" height="85">
	                        </div>
	                    </div>
	                </a>
                <br><br>
                </c:forEach>
                
                <script>
	                $(function(){
	            		rankList();
	            	})
	            	
	            	function rankList(){
						$.ajax({
							url:"rankAjax.pj",
							success:function(list){
								var i="i";
								for(var i=1; i<=5; i++){
									$(".rankTitle" + i).text(list[i-1].proTitle);
									$(".raImg" + i).attr("src",list[i-1].proImage);
								}
								
								
								
								
								
								
							},error:function(){
								console.log("ajax통신 실패")
							}
						})
					}
	            	
	            	
                </script>
                
                
                
                
                <!--  
                <a class="raUrl" href="">
                    <div class="raContent">
                        <div class="raNo">
                            <h3><b>2</b></h3>
                        </div>

                        <div class="raContent_1">
                            <p>
                                자연 친화적인 대나무 면봉
                                (200pcs)
                            </p>
                            <p class="percent">
                                <small>150% 달성</small>
                            </p>

                        </div>

                        <div class="raContent_2">
                            <img class="raImg" src="">
                            
                        </div>
                    </div>
                </a>
                <br><br>
                <a class="raUrl" href="">
                    <div class="raContent">
                        <div class="raNo">
                            <h3><b>3</b></h3>
                        </div>

                        <div class="raContent_1">
                            <p>
                                자연 친화적인 대나무 면봉
                                (200pcs)
                            </p>
                            <p class="percent">
                                <small>150% 달성</small>
                            </p>

                        </div>

                        <div class="raContent_2">
                            <img class="raImg" src="">
                        </div>
                    </div>
                </a>
				-->


            </div>
            

        </div>

        <div id="content_3">

            <br><br>
            <h2 id="newTitle"><b>신규 펀딩</b></h2>

            <a id="newUrl" href="">
                <div class="newThumbnail" >
                    
                    <img src="">


                    <br><br>
                    <small class="projectCtg">리빙</small>

                    <p style="margin-top: 0;">
                        유기농 면으로 만든 끈조절 가능한 다회용 마스크
                    </p>

                    <div class="progress">
                        <div class="progress-bar" style="width:80%;"></div>
                    </div>

                    <div class="progress_status" style="margin-bottom: 5px;">
                        <small style="margin-right: 105px;">80% 달성</small>
                        <small >23일 남음</small>
                    </div>
                
                </div>
             </a>
             <a id="newUrl" href="">
                <div class="newThumbnail" >
                    
                    <img src="">


                    <br><br>
                    <small class="projectCtg">리빙</small>

                    <p style="margin-top: 0;">
                        유기농 면으로 만든 끈조절 가능한 다회용 마스크
                    </p>

                    <div class="progress">
                        <div class="progress-bar" style="width:80%;"></div>
                    </div>

                    <div class="progress_status" style="margin-bottom: 5px;">
                        <small style="margin-right: 105px;">80% 달성</small>
                        <small >23일 남음</small>
                    </div>
                
                </div>
             </a>

             <a id="newUrl" href="">
                <div class="newThumbnail" >
                    
                    <img src="">


                    <br><br>
                    <small class="projectCtg">리빙</small>

                    <p style="margin-top: 0;">
                        유기농 면으로 만든 끈조절 가능한 다회용 마스크
                    </p>

                    <div class="progress">
                        <div class="progress-bar" style="width:80%;"></div>
                    </div>

                    <div class="progress_status" style="margin-bottom: 5px;">
                        <small style="margin-right: 105px;">80% 달성</small>
                        <small >23일 남음</small>
                    </div>
                
                </div>
             </a>

             <a id="newUrl" href="">
                <div class="newThumbnail" >
                    
                    <img src="">


                    <br><br>
                    <small class="projectCtg">리빙</small>

                    <p style="margin-top: 0;">
                        유기농 면으로 만든 끈조절 가능한 다회용 마스크
                    </p>

                    <div class="progress">
                        <div class="progress-bar" style="width:80%;"></div>
                    </div>

                    <div class="progress_status" style="margin-bottom: 5px;">
                        <small style="margin-right: 105px;">80% 달성</small>
                        <small >23일 남음</small>
                    </div>
                
                </div>
             </a>

             <a id="newUrl" href="">
                <div class="newThumbnail" >
                    
                    <img src="">


                    <br><br>
                    <small class="projectCtg">리빙</small>

                    <p style="margin-top: 0;">
                        유기농 면으로 만든 끈조절 가능한 다회용 마스크
                    </p>

                    <div class="progress">
                        <div class="progress-bar" style="width:80%;"></div>
                    </div>

                    <div class="progress_status" style="margin-bottom: 5px;">
                        <small style="margin-right: 105px;">80% 달성</small>
                        <small >23일 남음</small>
                    </div>
                
                </div>
             </a>

             <a id="newUrl" href="">
                <div class="newThumbnail" >
                    
                    <img src="">


                    <br><br>
                    <small class="projectCtg">리빙</small>

                    <p style="margin-top: 0;">
                        유기농 면으로 만든 끈조절 가능한 다회용 마스크
                    </p>

                    <div class="progress">
                        <div class="progress-bar" style="width:80%;"></div>
                    </div>

                    <div class="progress_status" style="margin-bottom: 5px;">
                        <small style="margin-right: 105px;">80% 달성</small>
                        <small >23일 남음</small>
                    </div>
                
                </div>
             </a>

            <div id="btnArea"> 
                <a href="" class="btn btn-success">신규 펀딩 더보기</a>
            </div>
        </div>
        <br><br>
        

        

        <div id="content_4">
            <br>
            <div id="background">
                <div id="baContent">
                    <p>
                        <br>
                        <h1 id="baTitle"><b>매직팟에서 펀딩을 오픈하세요</b></h1>
                        
                    </p>
                    <div id="backBtn"> 
                        <a href="" class="btn btn-success"><h3>펀딩 올리기</h3></a>
                    </div>
                </div>
            </div>

            
            <div id="customerBtn">
                
                
                <a id="upBtn" href="">
                    <img src="resources/images/common/upBtn.png" >
                </a>
                <br>
                <a id="requestBtn" href="">
                    <img src="resources/images/common/requestBtn.png" >
                </a>
            </div>
            
        </div>

        



        <script>
            window.onload = function(){
            //반복제거
            document.getElementById("background").style.backgroundRepeat = "no-repeat";
            //이미지 등록
            document.getElementById("background").style.backgroundImage = "url('resources/images/common/baImg.png')";
            //이미지 사이즈
            document.getElementById("background").style.backgroundSize = "100%";
            }
        </script>

        
        
        
        
        
      

    </div>
	<jsp:include page="common/footer.jsp"/>

    
</body>
</html>