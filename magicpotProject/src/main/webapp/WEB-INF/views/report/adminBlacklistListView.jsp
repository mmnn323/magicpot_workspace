<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	  /* .outer 스타일 통일 */
    .outer{
       /* height: 700px; */
       /* border: 1px solid red; */
       width: 900px;
       margin: 30px;
       float: left;
    }

    /* 컨텐트 카테고리 타이틀 영역 */
    #contentTitleArea{
        font-family: 'Noto Sans KR', sans-serif;
        width:900px;
        border-bottom: 2px solid lightgray;
        padding:10px;
        margin:20px;
        margin-top: 0;
    }
    #title1{font-size:25px; font-weight: bold;}
    #title2{
        font-size:16px;
        background-color: gray;
        color:white;
        margin-left: 10px;
        border:1px solid gray;
        border-radius: 5px;
        padding:3px;
    }

    /* 버튼 영역 */
    #re_selectBtn{
        width:140px;
        margin-left:700px;
        padding:7px;
        background-color: rgb(252, 99, 99);
    }
    #re_selectBtn:hover{
        background-color: rgb(216, 66, 66);
    }
    #re_btnArea a{
        border:none;
        width:100px;
        padding:7px;
        margin-right: 10px;
    }
  

    /* 리스트 영역  */
    #blackListArea{ margin-top:30px; text-align:center;}
    #blackListList{width:800px;}
    #blackListList>tbody a{
        color:black;
        text-decoration: none;
    }
    #blackList>tbody>tr:hover{
        background-color: rgb(215, 231, 212);
    }
    #blackListArea tbody{
        cursor:pointer;
    }
    
    /* 페이징 영역 */
    #bl_pagingArea{padding:30px;}
    .pagination>li>a{color:rgb(116, 152, 107);}
    .pagination>li>a:hover{color:rgb(225, 212, 169);}
    #bl_paging{
        width: fit-content;
    }

    /* 모달 영역 */
    .modal-body {
        width:5s00px;
        height:300px;
        margin-right:10px;
        text-align: center;
    }
    .modal-body th {
        width:200px;
    }
    .modal-body tr {
        width:200px;

    }
</style>
</head>
<body>
	
	<jsp:include page="../common/adminPageTemplate.jsp"/>

	 <div class="outer" >
        
        <div id="contentTitleArea">
            <span id="title1">고객센터 관리</span>
            <span id="title2">블랙리스트 관리</span>
        </div>
        <br>
    
        <!-- 리스트 영역 -->
        <div id="blackListArea" >
              <table class="table" id="blackList" align="center">
                <thead class="thead-light" >
                  <tr>
                    <th width="180">블랙리스트 번호</th>
                    <th width="200">회원 아이디</th>
                    <th width="300">활동 중지 여부</th>
                    <th width="300">활동중지일</th>
                    <th width="200">누적신고수</th>
                  </tr>
                </thead>
                <tbody>
                  <tr id="blackListModal" data-toggle="modal" data-target="#blackListBtn">
                    <td>7</td>
                    <td>user15</td>
                    <td>중지</td>
                    <td>21/06/09</td>
                    <td>3</td>
                  </tr>
                  <tr>
                    <td>7</td>
                    <td>user21</td>
                    <td>중지</td>
                    <td>21/06/09</td>
                    <td>3</td>
                  </tr>
                  <tr>
                    <td>7</td>
                    <td>user34</td>
                    <td>신고 1회</td>
                    <td></td>
                    <td>1</td>
                  </tr> 
                  <tr>
                    <td>7</td>
                    <td>user41</td>
                    <td>신고 2회</td>
                    <td></td>
                    <td>2</td>
                  </tr>
                  <tr>
                    <td>7</td>
                    <td>user18</td>
                    <td>중지</td>
                    <td>21/06/09</td>
                    <td>3</td>
                  </tr>
                  <tr>
                    <td>7</td>
                    <td>user22</td>
                    <td>신고 1회</td>
                    <td></td>
                    <td>1</td>
                  </tr>
                  <tr>
                    <td>7</td>
                    <td>user37</td>
                    <td>신고 1회</td>
                    <td></td>
                    <td>1</td>
                  </tr>
                </tbody>
              </table>
        </div>

        <!-- 페이징 영역 -->

        <div id="bl_pagingArea" align="center">
            
            <div id="bl_paging" >
                <ul class="pagination pagination">
                    <li class="page-item" ><a class="page-link" href="#">&laquo;</a></li>
                    <li class="page-item"><a class="page-link" href="#">&lt;</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
                    <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
                  </ul>
            </div>
            
        </div>
        
    </div>
    
     <!-- 블랙리스트 회원 정보 모달 -->
     <div class="modal fade" id="blackListBtn" align="center">
        <div class="modal-dialog modal-dialog-centered">

            <div class="modal-content" >

                <!-- Modal header -->
                <div class="modal-header">
                    <h3>블랙리스트 회원</h3>
                    <button type="button" class="close" data-dismiss="modal">x</button>
                </div>

                <!-- Modal body -->
                <br>
                <div class="modal-body">
                    <table>
                        <thead>
                            <tr>
                                <th>신고 번호</th>
                                <th>커뮤니티 댓글 번호</th>
                                <th>신고 유형</th>
                                <th>신고일</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>15</td>
                                <td>광고</td>
                                <td>20/03/21</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                 
                 <!-- Modal footer -->
                 <div id="ModalFooter">
                     <button id="cancleBtn" data-dismiss="modal" class="btn btn-secondary" style="margin-bottom:20px;">닫기</button>
                 </div>
             </div>
         </div>
     </div>

     <script>
         $(function(){
           
             $("#blackListModal").click(function(){
                 $("#blackListBtn").modal();
             });
         })

         /*
         function blackListModal(){
             $("#blackListBtn").modal({
                 
             });
         }
         */
     </script>


</body>
</html>