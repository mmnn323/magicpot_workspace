<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
    <link rel="stylesheet" type="text/css" href="resources/css/community/adminCommunityListView.css">  

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com/%22%3E">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

    
</head>
<body>
    <div class="outer">
        
        <div id="contentTitleArea">
            <span id="title1">커뮤니티 관리</span>
            <span id="title2">커뮤니티 글 관리</span>
        </div>

        <br>


        <!-- 커뮤니티 카테고리 영역 -->
        <div id="cm_categoryArea" align="center">
            <div id="cm_categoryArea1" >
                <ul >
                    <li><a href="">전체</a></li>
                    <li><a href="">자유수다</a></li>
                    <li><a href="">정보나눔</a></li>
                    <li><a href="">#용기내</a></li>
                </ul>
            </div>
        </div>


        <!-- 검색바 + 버튼 영역 (오븐에서 한 줄에 있길래 하나의 div안에 넣었어요!) -->
        <div id="searchBtnArea" >
            <!-- 커뮤니티 검색바 -->
            <div id="cm_searchArea" >
                <select name="" id="cm_SearchCtg" >
                    <option value="" >제목</option>
                    <option value="">내용</option>
                    <option value="">제목+내용</option>
                </select>
                <input id="cm_keyword" type="text" placeholder=" Search">
            </div>
    
            <!-- 버튼 영역 -->
            <div id="cm_btnArea">
                <a href="#" class="btn btn-success" id="cm_deleteBtn" data-toggle="modal" data-target="#cmDeleteBtn">선택삭제</a>
            </div>
        </div>


        <!-- The Modal -->
        <div class="modal fade" id="cmDeleteBtn" align="center"> <!-- ex) 커뮤니티버튼영역 : cmEnrollBtn -->
          <div class="modal-dialog modal-dialog-centered">
              <div class="modal-content" >

                  <!-- Modal body -->
                  <br>
                  <div class="modal-body">
                      삭제하시겠습니까?<br>
                      삭제된 내용은 복구되지 않습니다.
                  </div>
                  
                  <!-- Modal footer -->
                  <div id="cmModalFooter"> <!-- ex) 커뮤니티버튼영역 : cmModalFooter-->
                      <button id="cmOkBtn" class="btn btn-warning">OK</button> <!-- ex) 커뮤니티버튼영역 : cmOkBtn -->
                      <button id="cmCancleBtn" data-dismiss="modal" class="btn btn-secondary">Cancle</button> <!-- ex) 커뮤니티버튼영역 : cmCancleBtn -->
                  </div>
              </div>
          </div>
        </div>

		
        <!-- 리스트 영역 -->
        <!-- 
            mybatis 수업시간에 제목에 a태그 달아서 제목만 클릭 시 상세보기로 넘어갔는데 일단 그렇게 적용했어요!
            이 부분은 기능구현 부분이니 tr 클릭 시 요청하고 싶으신 분들은 그렇게 수정해주셔도 될 것 같아요~!
         -->
        <div id="cmNoticeListArea" >
              <table class="table" id="cmNoticeList" align="center">
                <thead class="thead-light" >
                  <tr>
                    <th width="40"><input type="checkbox"></th>
                    <th width="90">번호</th>
                    <th width="100">카테고리</th>
                    <th width="320">제목</th>
                    <th width="90">작성자</th>
                    <th width="140">작성일</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td><input type="checkbox"></td>
                    <td>50</td>
                    <td>자유수다</td>
                    <td><a href="">펀딩 성공했네요ㅎㅎㅎㅎㅎ </a></td>
                    <td>user23</td>
                    <td>2021-06-02</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox"></td>
                    <td>49</td>
                    <td>자유수다</td>
                    <td><a href="">요즘 읽고 있는 책인데 </a></td>
                    <td>user23</td>
                    <td>2021-06-02</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox"></td>
                    <td>48</td>
                    <td>#용기내</td>
                    <td><a href="">씨리얼 담아왔어요!</a> <i class="far fa-image"></i></td>
                    <td>user23</td>
                    <td>2021-06-02</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox"></td>
                    <td>47</td>
                    <td>자유수다</td>
                    <td><a href="">오늘 너무 덥네요ㅠㅠ </a></td>
                    <td>user23</td>
                    <td>2021-06-02</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox"></td>
                    <td>46</td>
                    <td>정보공유</td>
                    <td><a href="">옷 재활용! 방법이 여러가지가 있네요</a></td>
                    <td>user23</td>
                    <td>2021-06-02</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox"></td>
                    <td>45</td>
                    <td>자유수다</td>
                    <td><a href="">안녕하세요~~ </a></td>
                    <td>user23</td>
                    <td>2021-06-02</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox"></td>
                    <td>44</td>
                    <td>#용기내</td>
                    <td><a href="">떡복이 포장!</a> <i class="far fa-image"></i></td>
                    <td>user23</td>
                    <td>2021-06-02</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox"></td>
                    <td>43</td>
                    <td>#용기내</td>
                    <td><a href="">마카롱 담아왔어요ㅎㅎㅎㅎ </a> <i class="far fa-image"></i></td>
                    <td>user23</td>
                    <td>2021-06-02</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox"></td>
                    <td>42</td>
                    <td>정보공유</td>
                    <td><a href="">천연 수세미 꿀팁 공유해요! </a> <i class="far fa-image"></i></td>
                    <td>user23</td>
                    <td>2021-06-02</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox"></td>
                    <td>41</td>
                    <td>자유수다</td>
                    <td><a href="">제로 웨이스트가 뭔가요? </a></td>
                    <td>user23</td>
                    <td>2021-06-02</td>
                  </tr>
                  
                </tbody>
              </table>
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