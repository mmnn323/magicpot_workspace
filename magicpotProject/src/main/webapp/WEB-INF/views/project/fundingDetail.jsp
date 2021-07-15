<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date" />
<!DOCTYPE html>
<html>
<head>
<!--부트스트랩-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!--폰트-->
<link rel="preconnect" href="https://fonts.gstatic.com/%22%3E">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js%22%3E"></script>
<script src="https://kit.fontawesome.com/dd18300701.js" crossorigin="anonymous"></script>

<!-- 다인 추가 - 오늘 날짜 조회용 -->
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />

<!-- 다인 추가 - 카카오 공유용 js파일 -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>    

<!-- 다인 추가 - 페이스북 공유용 코드 -->
<meta property="og:type"          content="website" />
<meta property="og:url"           content="http://172.30.1.48:8883/magicpot/detail.fd" />
<meta property="og:title"         content="Magicpot 제로웨이스트" />
<meta property="og:description"   content="제로웨이스트의 시작, Magicpot과 환경을 지켜나가요." />
<meta property="og:image"         content="resources/images/common/shareImage.jpg" />



<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    *{font-family:'Noto Sans KR', sans-serif;}
    div{border:px solid white;}
    #outer{width:1000px;overflow:hidden;
		  height:auto; text-align:center; margin:auto;}
    
    #category{
        width:100px; 
        height:30px; 
        background-color:rgb(225, 212, 169); 
        display:inline-block;
    }
    #category>p{font-weight:500; color:white; margin-top:3px;}

    #content1{height:410px;}
    #content1_1>img{
        float:left; 
        width:480px; 
        height:330px; 
        margin-left:50px;
    }
    
    /*content1_2*/
    #content1_2{float:left; margin-left:40px;}
    #content1_2_1,#content1_2_2,#content1_2_3,#content1_2_4{float:left;}

    #progress{
        height:10px; 
        margin-bottom: 0;
    }
    #progress-bar{
        background-color: rgb(116, 152, 107); 
        border-radius:5px;
    }

    #btn-success1{
        width:360px;
        height:45px;
        background-color:rgb(116, 152, 107);
        font-size:19px;
    }
    .btn-outline-secondary{
        width:110px;
        height:50px;
        border-color:lightgray;
        
    }
    
    .btn-outline-secondary:hover{
		background-color:#fff!important;
    	color:#000!important;	
	}
    .btn-outline-secondary>img{
        width:35px; 
        height:35px; 
        margin-top:-2px; 
        float:left;
    }
    .btn-outline-secondary>p{margin-top:5px;}

    /*content2*/
    #content2>ul{list-style-type:none;}
    #content2>ul>li{float:left; margin-left:50px;}
    #content2>ul>li>a{text-decoration:none; color:lightslategray;}
    
    /*content3*/
    #content3_1,#content3_2{float:left;}
    #content3_1{width:480px; margin-left:50px; text-align:left;}
    #content3_1>img{width:480px; height:330px;}

    /*reward*/
    #reward{
        width:360px; 
        margin-left:50px; 
        text-align:left; 
        float:left;
    }
    #reward>div{
        background-color:rgb(250, 250, 250); 
        box-shadow:4px 4px 4px rgb(206, 204, 204);
    }
    #reward a{
        list-style:none;
		text-decoration:none;
		color:black;	
    }
    
    /* 다인 추가 - 공유하기 */
    #shareListButton{width:95%;}
    
    
</style>
</head>
<body>

	<!-- header --> 
	<jsp:include page="../common/header.jsp"/>
	
    <div id="outer">
        <div id="category">
            <p>${ p.caName }</p>
        </div><br>

        <div id="content1">
        	<input type="hidden" value="3">
            <h2><b>${ p.proTitle }</b></h2>
            <br>

            <div id="content1_1">
                <img src="${ p.proImage }">
            </div>
            
            <div id="content1_2">
                <div id="content1_2_1">
                    <span style="font-size:25px;">${ d }</span>일 남음
                </div>
                <br><br>
                <div class="progress" id="progress">
			        <large style="margin-right: 103px; font-size:0;">${Math.round(p.proFundPrice div p.proPrice*100)}</large>
                </div>
                
                <div id="content1_2_2" style="margin-top:5px;">
                    <span style="font-size:25px;">${Math.round(p.proFundPrice div p.proPrice*100)}
                    </span>%달성
                </div><br><br>

                <div id="content1_2_3">
                    <span style="font-size:25px;">${ p.proFundPrice }</span>원 펀딩
                </div><br><br>

                <div id="content1_2_4">
                    <span style="font-size:25px;">102</span>명의 서포터
                </div><br><br>

                <button type="button" class="btn btn-success" id="btn-success1">펀딩하기</button>
                <br><br>
                
                <button type="button" class="btn btn-outline-secondary" data-toggle="modal" data-target="#messageModal"><i class="far fa-envelope fa-2x" style="float: left; margin-left:7px; margin-top:2px;"></i><p>문의</p></button>&nbsp;&nbsp;&nbsp;
                
                <!-- !!휘경!! -->
                <c:choose>
                	<c:when test="${ loginUser == null }">
                		<span id="btnArea" onclick="swal('', '로그인 후 좋아요 서비스를 이용해보세요!', 'warning');"><button type="button" id="likeBtn" class="btn btn-outline-secondary"><i id="heart1" class="far fa-heart fa-2x" style="float: left; margin-left:7px; margin-top:2px; color:gray;"></i><p id="lCount">${ countLike }</p></button>&nbsp;&nbsp;&nbsp;</span>
                	</c:when>
                	<c:when test="${ loginUser != null and isChecked eq 1 }">
	                	<span id="btnArea" onclick="deleteLike();"><button type="button" id="likeBtn" class="btn btn-outline-secondary"><i id="heartIcon" class="far fa-heart fa-2x" style="float: left; margin-left:7px; margin-top:2px; color:red;"></i><p id="lCount">${ countLike }</p></button>&nbsp;&nbsp;&nbsp;</span>
	                </c:when>
	                <c:when test="${ loginUser != null and isChecked eq 0 }">
	                	<span id="btnArea" onclick="insertLike();"><button type="button" id="likeBtn" class="btn btn-outline-secondary"><i id="heartIcon" class="far fa-heart fa-2x" style="float: left; margin-left:7px; margin-top:2px; color:gray;"></i><p id="lCount">${ countLike }</p></button>&nbsp;&nbsp;&nbsp;</span>
                	</c:when>
                </c:choose>
                
                <button type="button" id="share" class="btn btn-outline-secondary"><i class="fas fa-share-alt fa-2x" style="float: left; margin-left:7px; margin-top:2px;"></i><p>공유</p></button>
            </div>
        </div>
        
        <!-- 다인 추가 - 문의용 모달 -->
        <div class="modal" id="messageModal">
            <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header" style="background-color: rgb(116, 152, 107); color:white;">
                    <h4 class="modal-title">크리에이터에게 문의하기</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <!-- Modal body -->
                <form action="newMessage.msg"  method="post">
                <input type="hidden" id="memNo" name="memNo" value="${loginUser.memNo}">
                <input type="hidden" id="creatorNo" name="creatorNo" value="${p.creNo}">
                <input type="hidden" id="msgSend" name="msgSend" value="<c:out value='${today}'/>">
                <input type="hidden" id="proNo" name="proNo" value="${p.proNo}">
	                <div class="modal-body">
	                      <div class="form-group">
	                        <label for="comment">문의 내용</label>
	                        <textarea class="form-control" rows="10" id="msgContent" name="msgContent" placeholder="크리에이터에게 문의하고 싶은 내용을 입력해주세요." style="resize:none"></textarea>
	                      </div>
	                </div>
	        
	                <!-- Modal footer -->
	                <div class="modal-footer">
	                    <button type="submit" class="btn btn-outline-success">메세지 보내기</button>
	                    <button type="button" class="btn btn-outline-danger" data-dismiss="modal">취소</button>
	                </div>
                </form>
        
            </div>
            </div>
        </div>
        
        <!-- 다인 추가 - 공유하기 기능 -->
        <div id="shareListButton" align="right" style="display:none">        
        	<a href="javascript:shareFacebook();"><img src="resources/images/project/icon-facebook.png"></a>
        	<a href="javascript:shareTwitter();"><img src="resources/images/project/icon-twitter.png"></a>
        	<a id="btnKakao" href="javascript:shareKakao();"><img src="resources/images/project/icon-kakao.png"></a>
        </div>
        
        <script>
        	// 공유 버튼 클릭시 공유 가능한 sns띄워주기
        	$(function(){
        		
        		$("#share").on("click", function(){
        			$("#shareListButton").toggle();
        		});
        	});
        	
        	
        	function shareFacebook(){	// 페이스북 공유
        		var url = 'http://172.30.1.48:8883/magicpot/detail.fd';
        		var encodeUrl = encodeURIComponent(url);
        		var facebook = 'http://www.facebook.com/sharer/sharer.php?u=';
        		var link = facebook + encodeUrl;
        		window.open(link);
        	}

			/*
        	function shareFacebook(){
        		window.open("http://www.facebook.com/sharer/sharer.php?u=" + encodeURIComponent(window.locaion.href), "_blank", "width=600, height=400" );
        	}
			*/
   
        	function shareTwitter(){	// 트위터 공유
        		var sendText ="magicpot 제로웨이스트"; 	// 공유시 전달할 text
        		var sendUrl ="http://localhost:8883/magicpot/detail.fd"; // 공유할 url 주소
        		window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
        	}
        	
        	
        	function shareKakao() { // 카카오 공유
                Kakao.init('727f2dc1bc85980ca9ab5f26bd2b0c02');
                Kakao.Link.sendCustom({
                    templateId: [56192]
                });
            }
        	
       		try {
    			  function shareKakao() { // 카카오 공유
    			    Kakao.init('727f2dc1bc85980ca9ab5f26bd2b0c02')
    			    Kakao.Link.sendDefault({
    			      objectType: 'feed',
    			      content: {
    			        title: 'Magicpot',
    			        imageUrl:
    			          'http://k.kakaocdn.net/dn/TcTlF/btq8ytBsVeI/UfCtLRGF9NqYZk6WSHhfPK/kakaolink40_original.jpg',
    			        link: {
    			          mobileWebUrl: 'http://localhost:8883/magicpot/detail.fd',
    			          webUrl: 'http://localhost:8883/magicpot/detail.fd',
    			        },
    			      },
    			      buttons: [
    			        {
    			          title: '웹으로 보기',
    			          link: {
    			            mobileWebUrl: 'http://localhost:8883/magicpot/detail.fd',
    			            webUrl: 'http://localhost:8883/magicpot/detail.fd',
    			          },
    			        },
    			        {
    			          title: '앱으로 보기',
    			          link: {
    			            mobileWebUrl: 'http://localhost:8883/magicpot/detail.fd',
    			            webUrl: 'http://localhost:8883/magicpot/detail.fd',
    			          },
    			        },
    			      ],
    			    })
    			  }
    			; window.kakaoDemoCallback && window.kakaoDemoCallback() }
    			catch(e) { window.kakaoDemoException && window.kakaoDemoException(e) }
        </script>
        
        <!-- [휘경] 좋아요 관련 스크립트 시작 -->
        <script>
        	// [휘경] ajax : 좋아요 취소
			function deleteLike(){
	           		$.ajax({
			    			url:"deleteLike2.pr",
			    			data:{
			    					memNo:${ loginUser.memNo },
			    					proNo:${p.proNo}
			    			},
			    			success:function(status){
			    				
			    				if(status == "success"){
			    					$("#heartIcon").css("color", "gray");
	            					$("#btnArea").attr("onclick", "insertLike();");
				    				swal("Success!", "좋아하는 프로젝트에서 제거되었습니다.", "success");
				    				selectLikeCount();
			    				}else
			    					swal("", "좋아요 취소를 실패했습니다.", "warning");
			    				
			    			},error:function(){
			    				console.log("댓글 삭제용 ajax 통신 실패");
			    			}
		    		})
			}
        	
			// [휘경] ajax : 좋아요 추가
			function insertLike(){
           		$.ajax({
		    			url:"insertLike.pr",
		    			data:{
		    					memNo:${ loginUser.memNo },
		    					proNo:${p.proNo}
		    			},
		    			success:function(status){
		    				if(status == "success"){ // 좋아요 성공
		    					$("#heartIcon").css("color", "red");
            					$("#btnArea").attr("onclick", "deleteLike();");
			    				swal("Success!", "좋아하는 프로젝트에 추가되었습니다.", "success");
			    				selectLikeCount(); 
		    				}else
		    					swal("", "좋아요 추가를 실패했습니다.", "warning");
		    				
		    			},error:function(){
		    				console.log("댓글 삭제용 ajax 통신 실패");
		    			}
	    		})
			};
	         
	        // [휘경] 좋아요 카운트 조회
	        $(function(){
	        	selectLikeCount();
	        });
	        
	        // [휘경] ajax : 좋아요 카운트 조회
	        function selectLikeCount(){
	        	$.ajax({
	        		url:"countLike.pr",
	        		data:{
    					proNo:${p.proNo}
    				},
	        		success:function(result){
	        			$("#lCount").html(result);
	        			
	        		},error:function(){
	        			console.log("좋아요 카운트 조회용 ajax 통신 실패");
	        		}
	        	})
	        };
        </script>
		<!-- [휘경] 좋아요 관련 스크립트 끝 -->
		
        <hr>
        <div id="content2">
                <ul>
                    <li><a href="#">스토리</a></li>
                    <li>
                    	<a id="author" href="#"><input type="hidden" class="proNo"name="proNo" value="${ p.proNo }">작가의 말</a>
                    </li>
                    <li><a href="review.fd">체험리뷰</a></li>
                </ul>
        </div><br>
        <hr> 
        <script>
        $("#author").on("click",function(proNo){
        	proNo = $(this).children().text();
        	
        	$.ajax({
        		url:"author.fd",
        		type:"post",
        		data:{proNo:proNo},
        		error:function(){
        			alert("통신실패");
        		},
        		success:function(p){
        			$("#story").html(p.createWord);
        		}
        	})
        })
        </script>
        
        
        <div id="content3">
            <div id="content3_1">
                <p id="story">${ p.proStory }</p>
            </div>

            <div id="reward">
            	<c:forEach var=" " items="">
	                <div id="reward_1">
	                    <a href="#">
	                        <b>원 펀딩</b><br>
	                        <span></span>
	                    </a>
	                </div><br>
				</c:forEach>
            </div>

        </div>

    </div>
    
    
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
	
</body>
</html>