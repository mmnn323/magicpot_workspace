<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
<link rel="stylesheet" type="text/css" href="resources/css/like/likeListView.css">

<link rel="preconnect" href="https://fonts.gstatic.com/%22%3E">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/dd18300701.js" crossorigin="anonymous"></script>

</head>
<body>

	<!-- 헤더 포함 -->
	<jsp:include page="../common/header.jsp"/>

    <div id="outer">
       <div id="myPage_title">
           <div id="content_title"><i class="fas fa-heart fa-lg"></i> <b>좋아하는 프로젝트</b></div>
       </div>
       <div id=likeCountArea" style="font-family: 'Noto Sans KR', sans-serif;">
       		<b id="lcount" style="color:rgb(255, 67, 67);"></b>개의 프로젝트가 있습니다.
       </div>
       <div id="listArea">
       
       </div>
       
       <div class="alert alert-dark" id="offLikeAlert" style="position:absolute; visibility:hidden; top:100px; left:100px; z-index:1;">
           	 좋아하는 프로젝트에서 제거되었습니다.
       </div>
       
            <script>
	         	// 좋아요 리스트 조회
	            $(function(){
	            	selectLikeList();
	        	})
	         	
	        	// ajax : 좋아요 리스트 조회
                function selectLikeList(){
            		$.ajax({
            			url:"likeList.cm",
            			data:{memNo:${ loginUser.memNo }},		// 로그인한 회원의 회원번호
            			success:function(list){
            				
            				var value="";						// 응답데이터로 돌려줄 댓글 리스트 변수
           					if(Object.keys(list).length == 0){	// 좋아요 리스트가 없는 경우
	           						value += "<div id='noLikeProject' align='center'>"
	            					      	   + 	"<h5>좋아하는 프로젝트가 없습니다. <br></h5>"
	            					           +	"<h6>프로젝트의 하트 이미지를 클릭하면 좋아하는 프로젝트에 저장됩니다!</h6>"
	            					           +	"<br>"
	            					           +	"<a href='fund.li'> 프로젝트 찾아보기 </a>"
	            					           + "</div>"
           					}else{	// 좋아요 리스트가 있는 경우
	            				$.each(list, function(i,obj){
		            					value += "<div class='thumbnail'>"
		         					           + 	"<input type='hidden' value=" + obj.proNo + ">"
		         					           +	"<img src='" + obj.proImage +"'>"
		         					           +	"<span id='likeBtn' class='likeBtn'><i class='fas fa-heart fa-2x'></i></span>"
		         					           +	"<small id='projectCtg'>" + obj.caName + "</small>"
		         					           +	"<p style='margin-top: 0; height: 50px;'>" + obj.proTitle + "</p>"
		         					           +	"<div class='progress' style='height: 10px;'>"
		         					           +		"<div class='progress-bar' style='width:" + Math.round(obj.proFundPrice / obj.proPrice  *100) + "%;'></div>"
		         					           +	"</div>"
		         					           + 	"<div id='progress_status' style='margin-bottom: 5px;'>"
		         					           +		"<small style='margin-right: 100px;'>" + Math.round(obj.proFundPrice / obj.proPrice  *100) + "% 달성 </small>"
		         					           +		"<small>"+ obj.decimalDay + "일 남음</small>"
		         					           +	"</div>"
		         					           + "</div>"     
            					})
            					
            				}
            				$("#listArea").html(value);  // 좋아요 리스트
            				$("#lcount").html(Object.keys(list).length);
            				
            			},error:function(){
            				console.log("댓글 리스트 조회용 ajax 통신 실패");
            			}
            		});
            	};
	          
	         // 좋아하는 프로젝트 클릭 시 해당 프로젝트 상세페이지로 이동
              $(document).on("click", ".thumbnail", function(){
            	  // 프로젝트 번호 넘겨주면서 상세페이지로 이동
            	  //alert("프로젝트 번호 넘겨주면서 상세페이지로 이동");
            	  //proNo = $(this).children().eq(0).val();
            	  location.href = 'detail.fd?proNo=' + $(this).children().eq(0).val();
              })
              
              $(document).on("click", ".likeBtn", function(){
            	  //event.stopPropagation()
                  //console.log(event.target);
                  
                  	proNo = $(this).parents(".thumbnail").children().eq(0).val();
             		$.ajax({
		    			url:"deleteLike.pr",
		    			data:{
		    					memNo:"${ loginUser.memNo }", 
		    					proNo:proNo
		    			},
		    			success:function(status){
		    				
		    				var offLikeAlert=document.getElementById("offLikeAlert");
		    				
		    				if(status == "success"){
			    				swal("Success!", "좋아하는 프로젝트에서 제거되었습니다.", "success");
			    				//offLikeAlert.style.visibility="visible";
			    				selectLikeList();
		    				}else if(status ="hasComment")
		    					swal("", "댓글 수정을 실패했습니다.", "warning");
		    				
		    			},error:function(){
		    				console.log("댓글 삭제용 ajax 통신 실패");
		    			}
	    			})
                  alert(e); // 오류 발생 시키고 썸네일 클릭 넘어가지 않도록 함,,임시로
              })
            </script>
            
       </div> 
    </div>
    
    <!-- 푸터 포함 -->
    <jsp:include page="../common/footer.jsp"/>
    
</body>
</html>