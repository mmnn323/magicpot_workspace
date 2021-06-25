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

    <div id="outer">
       <div id="myPage_title">
           <div id="content_title"><i class="fas fa-heart fa-lg"></i> <b>좋아하는 프로젝트</b></div>
       </div>
       <div id="listArea">

            <div class="thumbnail" >
                
                <img src="../../../resources/images/common/유기농마스크.png">

                <span id="likeBtn"><i class="fas fa-heart fa-2x"></i></span>

                <small id="projectCtg">리빙</small>

                <p style="margin-top: 0;">
                    유기농 면으로 만든 끈조절 가능한 다회용 마스크
                </p>

                <div class="progress" style="height: 10px;">
                    <div class="progress-bar" style="width:80%;"></div>
                </div>

                <div id="progress_status" style="margin-bottom: 5px;">
                    <small style="margin-right: 105px;">80% 달성</small>
                    <small >23일 남음</small>
                </div>
            
            </div>

            <div class="thumbnail" >
                
                <img src="../../../resources/images/common/유기농마스크.png">

                <span id="likeBtn"><i class="fas fa-heart fa-2x"></i></span>

                <small id="projectCtg">리빙</small>

                <p style="margin-top: 0;">
                    유기농 면으로 만든 끈조절 가능한 다회용 마스크
                </p>

                <div class="progress" style="height: 10px;">
                    <div class="progress-bar" style="width:80%;"></div>
                </div>

                <div id="progress_status" style="margin-bottom: 5px;">
                    <small style="margin-right: 105px;">80% 달성</small>
                    <small >23일 남음</small>
                </div>
            
            </div>

            <div class="thumbnail" >
                
                <img src="../../../resources/images/common/유기농마스크.png">

                <span id="likeBtn"><i class="fas fa-heart fa-2x"></i></span>

                <small id="projectCtg">리빙</small>

                <p style="margin-top: 0;">
                    유기농 면으로 만든 끈조절 가능한 다회용 마스크
                </p>

                <div class="progress" style="height: 10px;">
                    <div class="progress-bar" style="width:80%;"></div>
                </div>

                <div id="progress_status" style="margin-bottom: 5px;">
                    <small style="margin-right: 105px;">80% 달성</small>
                    <small >23일 남음</small>
                </div>
            
            </div>

            <div class="thumbnail" >
                
                <img src="../../../resources/images/common/유기농마스크.png">

                <span id="likeBtn"><i class="fas fa-heart fa-2x"></i></span>

                <small id="projectCtg">리빙</small>

                <p style="margin-top: 0;">
                    유기농 면으로 만든 끈조절 가능한 다회용 마스크
                </p>

                <div class="progress" style="height: 10px;">
                    <div class="progress-bar" style="width:80%;"></div>
                </div>

                <div id="progress_status" style="margin-bottom: 5px;">
                    <small style="margin-right: 105px;">80% 달성</small>
                    <small >23일 남음</small>
                </div>
            
            </div>

            <div class="thumbnail" >
                
                <img src="../../../resources/images/common/유기농마스크.png">

                <span id="likeBtn"><i class="fas fa-heart fa-2x"></i></span>

                <small id="projectCtg">리빙</small>

                <p style="margin-top: 0;">
                    유기농 면으로 만든 끈조절 가능한 다회용 마스크
                </p>

                <div class="progress" style="height: 10px;">
                    <div class="progress-bar" style="width:80%;"></div>
                </div>

                <div id="progress_status" style="margin-bottom: 5px;">
                    <small style="margin-right: 105px;">80% 달성</small>
                    <small >23일 남음</small>
                </div>
            
            </div>

            <div class="thumbnail" >
                
                <img src="../../../resources/images/common/유기농마스크.png">

                <span id="likeBtn"><i class="fas fa-heart fa-2x"></i></span>

                <small id="projectCtg">리빙</small>

                <p style="margin-top: 0;">
                    유기농 면으로 만든 끈조절 가능한 다회용 마스크
                </p>

                <div class="progress" style="height: 10px;">
                    <div class="progress-bar" style="width:80%;"></div>
                </div>

                <div id="progress_status" style="margin-bottom: 5px;">
                    <small style="margin-right: 105px;">80% 달성</small>
                    <small >23일 남음</small>
                </div>
            
            </div>

            <div class="thumbnail" onclick="test1();">
                
                <img src="../../../resources/images/common/유기농마스크.png">

                <span id="likeBtn"><i class="fas fa-heart fa-2x"></i></span>

                <small id="projectCtg">리빙</small>

                <p style="margin-top: 0;">
                    유기농 면으로 만든 끈조절 가능한 다회용 마스크
                </p>

                <div class="progress" style="height: 10px;">
                    <div class="progress-bar" style="width:80%;"></div>
                </div>

                <div id="progress_status" style="margin-bottom: 5px;">
                    <small style="margin-right: 105px;">80% 달성</small>
                    <small >23일 남음</small>
                </div>
            
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
    
</body>
</html>