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
       <div id="listArea">
       		
       		<c:choose>
       			<c:when test="${ !empty like }">
		       		<c:forEach var="i" begin="0" end="${ like.size()-1 }">
			            <div class="thumbnail" >
			                
			                <img src="${ like[i].proImage }">
			
			                <span id="likeBtn"><i class="fas fa-heart fa-2x"></i></span>
			
			                <small id="projectCtg">${ like[i].caName }</small>
			
			                <p style="margin-top: 0; height: 50px;">
			                    ${ like[i].proTitle }
			                </p>
			
			                <div class="progress" style="height: 10px;">
			                    <div class="progress-bar" style="width:${Math.round(like[i].proFundPrice div like[i].proPrice  *100) }%;"></div>
			                </div>
			
			                <div id="progress_status" style="margin-bottom: 5px;">
			                    <small style="margin-right: 100px;">${Math.round(like[i].proFundPrice div like[i].proPrice  *100) }% 달성</small>
			                    <small >${arr[i]}일 남음</small>
			                </div>
			      		</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div id="noLikeProject" align="center">
		                <h5>좋아하는 프로젝트가 없습니다. <br></h5>
		                <h6>프로젝트의 하트 이미지를 클릭하면 좋아하는 프로젝트에 저장됩니다!</h6>
		                <br>
		                    <a href="fund.li" > 프로젝트 찾아보기 </a>
		           </div>
				</c:otherwise>
			</c:choose>
			
      </div>
            <script>
                $(function(){
                    $(".thumbnail").click(function(){
                        alert("썸네일 클릭");
                    })

                    $("#likeBtn").click(function(){
                        event.stopPropagation();
                        alert("좋아요 클릭");
                        // $('.thumbnail').attr('onclick', 'false');
                    })
                })
            </script>
       </div> 
    </div>
    
    <!-- 푸터 포함 -->
    <jsp:include page="../common/footer.jsp"/>
    
</body>
</html>