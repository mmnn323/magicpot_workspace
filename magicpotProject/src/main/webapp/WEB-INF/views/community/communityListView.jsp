<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
<link rel="stylesheet" type="text/css" href="resources/css/community/communityListView.css">  

<!-- 글씨체 -->
<link rel="preconnect" href="https://fonts.gstatic.com/%22%3E">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/dd18300701.js" crossorigin="anonymous"></script>

</head>
<body>
    <div id="outer">

        <!-- 커뮤니티 타이틀 영역 -->
        <div id="cm_titleArea">
            <div id="cm_titleArea1">
                <div>
                    <img src="../../../resources/images/community/growth (1).png" alt="">
                </div>
                <div>
                    <b>커뮤니티</b>
                    <p>
                        지속 가능한 지구를 위해 제로웨이스트에 대한 <br>
                        다양한 정보와 활동을 자유롭게 공유하는 공간입니다.
                    </p>
                </div>
            </div>
        </div>

        <!-- 커뮤니티 공지사항 영역 -->
        <div id="cm_noticeArea">
            <div id="cm_noticeArea1" align="right">
                <form>
                    <div class="custom-control custom-checkbox">
                      <input type="checkbox" class="custom-control-input" id="customCheck" name="example1" onclick="showAndHide();">
                      <label class="custom-control-label" for="customCheck">공지 숨기기</label>
                    </div>
                  </form>
            </div>

            <div id="noticeLine"></div>

            <div id="cm_noticeArea2">
                <table class="table">
                    <tbody>
                      <tr>
                        <td><span class="noticeBtn">공지</span></td>
                        <td class="cm_noticeTitle">매직팟 커뮤니티 에티켓 안내</td>
                        <td>매직팟</td>
                        <td>2021.02.05</td>
                      </tr>
                      <tr>
                        <td><span class="noticeBtn">공지</span></td>
                        <td class="cm_noticeTitle">매직팟 커뮤니티 카테고리 안내</td>
                        <td>매직팟</td>
                        <td>2021.02.05</td>
                      </tr>
                      <tr>
                        <td><span class="noticeBtn">공지</span></td>
                        <td class="cm_noticeTitle">#용기내 챌린지 동참해요!</td>
                        <td>매직팟</td>
                        <td>2021.02.05</td>
                      </tr>
                    </tbody>
                  </table>
            </div>
        </div>

        <script>
            // 공지사항 숨기기 클릭 시 공지사항 테이블 숨기기
            function showAndHide(){
                if($("#cm_noticeArea2").is(':visible')){
                    $("#cm_noticeArea2").hide(100);
                } else{
                    $("#cm_noticeArea2").show(100);
                }
            }
        </script>

        <!-- 커뮤니티 카테고리 영역 -->
        <div id="cm_categoryArea" align="center">
            <div id="cm_categoryArea1" >
                <ul >
                    <li><a href="" style="border-bottom: 3px solid rgb(116, 152, 107); color: rgb(116, 152, 107);">전체</a></li>
                    <li><a href="" >자유수다</a></li>
                    <li><a href="" >정보나눔</a></li>
                    <li><a href="" >#용기내</a></li>
                </ul>
            </div>
        </div>

        <!-- 커뮤니티 검색바 -->
        <div id="cm_searchArea" align="center">
            <select name="" id="cm_SearchCtg" >
                <option value="" >제목</option>
                <option value="">내용</option>
                <option value="">제목+내용</option>
            </select>
            <input id="cm_keyword" type="text" onkeyup="enterkey();" placeholder=" Search">
        </div>

        <!-- 로그인한 회원일 경우 보여지는 글 등록 버튼 영역 -->
        <div id="cm_btnArea" >
            <div id="cm_enrollBtn" >
                <a href="" class="btn btn-success">등록</a>
            </div>
            <!-- <div id="listStyle">
                <a href=""><i class="fas fa-bars fa-2x"></i></a> 
                <a href=""><i class="fas fa-th-large fa-2x"></i></a>
            </div> -->
        </div>


        <!-- 커뮤니티 글 리스트 영역 -->
        <div id="cm_listArea">

            <div class="cm_thumbnail" >
                <img src="../../../resources/images/common/유기농마스크.png">

                <small id="cm_Ctg">자유수다</small> <br>
                <b style="margin-top: 0;">
                    제로웨이스트 첫 걸음!
                </b>
                
                <div id="progress_status" style="margin-bottom: 5px;">
                    <small >user33</small> <br>
                    <small >2021-05-22 &nbsp&nbsp|&nbsp&nbsp 조회 36</small>
                </div>
            </div>
            <div class="cm_thumbnail" >
                <img src="../../../resources/images/common/유기농마스크.png">

                <small id="cm_Ctg">자유수다</small> <br>
                <b style="margin-top: 0;">
                    제로웨이스트 첫 걸음!
                </b>
                
                <div id="progress_status" style="margin-bottom: 5px;">
                    <small >user33</small> <br>
                    <small >2021-05-22 &nbsp&nbsp|&nbsp&nbsp 조회 36</small>
                </div>
            </div>
            <div class="cm_thumbnail" >
                <img src="../../../resources/images/common/유기농마스크.png">

                <small id="cm_Ctg">자유수다</small> <br>
                <b style="margin-top: 0;">
                    제로웨이스트 첫 걸음!
                </b>
                
                <div id="progress_status" style="margin-bottom: 5px;">
                    <small >user33</small> <br>
                    <small >2021-05-22 &nbsp&nbsp|&nbsp&nbsp 조회 36</small>
                </div>
            </div>
            <div class="cm_thumbnail" >
                <img src="../../../resources/images/common/유기농마스크.png">

                <small id="cm_Ctg">자유수다</small> <br>
                <b style="margin-top: 0;">
                    제로웨이스트 첫 걸음!
                </b>
                
                <div id="progress_status" style="margin-bottom: 5px;">
                    <small >user33</small> <br>
                    <small >2021-05-22 &nbsp&nbsp|&nbsp&nbsp 조회 36</small>
                </div>
            </div>
            <div class="cm_thumbnail" >
                <img src="../../../resources/images/common/유기농마스크.png">

                <small id="cm_Ctg">자유수다</small> <br>
                <b style="margin-top: 0;">
                    제로웨이스트 첫 걸음!
                </b>
                
                <div id="progress_status" style="margin-bottom: 5px;">
                    <small >user33</small> <br>
                    <small >2021-05-22 &nbsp&nbsp|&nbsp&nbsp 조회 36</small>
                </div>
            </div>
            <div class="cm_thumbnail" >
                <img src="../../../resources/images/common/유기농마스크.png">

                <small id="cm_Ctg">자유수다</small> <br>
                <b style="margin-top: 0;">
                    제로웨이스트 첫 걸음!
                </b>
                
                <div id="progress_status" style="margin-bottom: 5px;">
                    <small >user33</small> <br>
                    <small >2021-05-22 &nbsp&nbsp|&nbsp&nbsp 조회 36</small>
                </div>
            </div>
            <div class="cm_thumbnail" >
                <img src="../../../resources/images/common/유기농마스크.png">

                <small id="cm_Ctg">자유수다</small> <br>
                <b style="margin-top: 0;">
                    제로웨이스트 첫 걸음!
                </b>
                
                <div id="progress_status" style="margin-bottom: 5px;">
                    <small >user33</small> <br>
                    <small >2021-05-22 &nbsp&nbsp|&nbsp&nbsp 조회 36</small>
                </div>
            </div>
            <div class="cm_thumbnail" >
                <img src="../../../resources/images/common/유기농마스크.png">

                <small id="cm_Ctg">자유수다</small> <br>
                <b style="margin-top: 0;">
                    제로웨이스트 첫 걸음!
                </b>
                
                <div id="progress_status" style="margin-bottom: 5px;">
                    <small >user33</small> <br>
                    <small >2021-05-22 &nbsp&nbsp|&nbsp&nbsp 조회 36</small>
                </div>
            </div>
            <div class="cm_thumbnail" >
                <img src="../../../resources/images/common/유기농마스크.png">

                <small id="cm_Ctg">자유수다</small> <br>
                <b style="margin-top: 0;">
                    제로웨이스트 첫 걸음!
                </b>
                
                <div id="progress_status" style="margin-bottom: 5px;">
                    <small >user33</small> <br>
                    <small >2021-05-22 &nbsp&nbsp|&nbsp&nbsp 조회 36</small>
                </div>
            </div>
            <div class="cm_thumbnail" >
                <img src="../../../resources/images/common/유기농마스크.png">

                <small id="cm_Ctg">자유수다</small> <br>
                <b style="margin-top: 0;">
                    제로웨이스트 첫 걸음!
                </b>
                
                <div id="progress_status" style="margin-bottom: 5px;">
                    <small >user33</small> <br>
                    <small >2021-05-22 &nbsp&nbsp|&nbsp&nbsp 조회 36</small>
                </div>
            </div>
            <div class="cm_thumbnail" >
                <img src="../../../resources/images/common/유기농마스크.png">

                <small id="cm_Ctg">자유수다</small> <br>
                <b style="margin-top: 0;">
                    제로웨이스트 첫 걸음!
                </b>
                
                <div id="progress_status" style="margin-bottom: 5px;">
                    <small >user33</small> <br>
                    <small >2021-05-22 &nbsp&nbsp|&nbsp&nbsp 조회 36</small>
                </div>
            </div>
            <div class="cm_thumbnail" >
                <img src="../../../resources/images/common/유기농마스크.png">

                <small id="cm_Ctg">자유수다</small> <br>
                <b style="margin-top: 0;">
                    제로웨이스트 첫 걸음!
                </b>
                
                <div id="progress_status" style="margin-bottom: 5px;">
                    <small >user33</small> <br>
                    <small >2021-05-22 &nbsp&nbsp|&nbsp&nbsp 조회 36</small>
                </div>
            </div>

        </div>

        <!-- 페이징 영역 -->

        <div id="cm_pagingArea" align="center">
            
            <div id="cm_paging" >
                <ul class="pagination pagination">
                    <li class="page-item" ><a class="page-link" href="#">&laquo;</a></li>
                    <li class="page-item"><a class="page-link" href="#">&lt;</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
                    <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
                  </ul>
            </div>
            
        </div>
    
        


    </div>

</body>
</html>