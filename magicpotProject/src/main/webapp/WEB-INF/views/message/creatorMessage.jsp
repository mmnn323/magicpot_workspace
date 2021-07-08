<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	 div { box-sizing: border-box; }
    .wrap {
        width: 1000px;
        height:1000px;
        margin: auto;
        font-family: 'Noto Sans KR', sans-serif;
    }
    .wrap>div {width: 100%;}
    .innerOuter {
        margin-left:25px;
        border-bottom: 2px solid lightgray;
    }

    /* 메세지 선택 영역 */
    #choiceArea{
        width:950px;
        border-bottom: 1px solid lightgray;
        padding:20px;
        margin-left:30px;
    }
    #choiceArea a {
        text-decoration:none;
        color:black;
        font-size:18px;
        margin-left:20px;
        padding:13px;
        border-radius:15px;
    }
    #choiceArea a:hover{
        background-color: lightgray;
        font-weight: bold;
    }

    /* 버튼 영역 */
    #me_btnArea a, #deModalFooter button {
        border:none;
        width:80px;
        padding:7px;
        margin-right: 10px;
    }
    #me_enrollBtn{
        background-color: rgb(116, 152, 107);
        margin-left: 70px;
    }
    #me_enrollBtn:hover{
        background-color: rgb(93, 121, 86);
    }
    #me_deleteBtn, #deleteBtn{
        background-color: rgb(252, 99, 99);
        color:white;
    }
    #me_deleteBtn:hover, #deleteBtn:hover {
        background-color: rgb(216, 66, 66);
    }

    /* 리스트 영역  */
    #me_ListArea{ 
        margin-top:30px; 
        text-align:center;
        margin-left:50px;
    }
    #messageList{
        width:900px;
    }
    #messageList>tbody a{
        color:black;
        text-decoration: none;
    }
    #messageList>tbody>tr:hover{
        background-color: rgb(215, 231, 212);
    }
  

     /* 페이징 영역 */
     #me_pagingArea{padding:30px;}
    .pagination>li>a{color:rgb(116, 152, 107);}
    .pagination>li>a:hover{color:rgb(225, 212, 169);}
    #me_paging{
        width: fit-content;
    }

    /* 답변 달기 모달 */
    #meModal th, #meModal td {
        padding-left:30px;
        padding-bottom:10px;
    }
    textarea {
        resize: none;
        border:none;
        background-color: rgb(225, 212, 169);
        border-radius: 20px;
    }


    /* 메세지 삭제 모달 */
    .modal-body {
        height:120px;
        padding:40px;
    }
    #deModalFooter {
        margin:auto;
        margin-bottom:30px;
    }
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
	<div class="wrap">
        <div class="content">
            <br><br>
            <div class="innerOuter">
                <i class="far fa-envelope fa-2x" style="float: left;">&nbsp;&nbsp;</i>
                <h3><b>메세지</b></h3>
                <br>   
            </div>
                <br>

            <div id="messageList">
                <div class="outer" >

                    <div id="choiceArea">
                        <a href=""  id="all">모든 메세지</a>
                        <a href="#" onclick="notRead();" id="notRead">안 읽은 메세지</a>
                    </div>
                    <!-- 
                    <script>
                    	function notRead(){
                    		$.ajax({
                    			
                    			
                    			
                    		})              
                    		
                    	}
                    
                    </script>
                     -->
                    
                    <!-- 이용약관 리스트 영역 -->
                    <div id="me_ListArea" >
                       <table class="table" id="messageList" align="center">
                           <thead class="thead-light" >
                               <tr>                       
                                   <th width="90">번호</th>
                                   <th width="200">작성일</th>
                                   <th width="250">회원 아이디</th>
                                   <th width="600">문의 내용</th>
                                   <th width="200">처리 현황</th>
                                   <th width="500">비고</th>
                               </tr>
                           </thead>
                           <tbody>
	                           <c:forEach var="m" items="${creMsgList}">
	                               <tr>
	                                   <td>${m.msgNo}</td>
	                                   <td>${m.msgSend}</td>
	                                   <td>${m.memId}</td>
	                                   <td>${m.msgContent}</td>
	                                   <td>
		                                   <c:choose>
		                                   		<c:when test="${m.msgStatus eq 'N'}">
		                                   			답변 대기
		                                   		</c:when>
		                                   		<c:otherwise>
		                                   			답변 완료
		                                   		</c:otherwise> 
		                                   </c:choose>
	                                   </td>
	                                   <td>
	                                       <div id="me_btnArea">
	                                           <a href="" class="btn btn-success" id="me_enrollBtn" data-toggle="modal" data-target="#meAnswerBtn" style="color: white;">답변달기</a>
	                                           <a href="" class="btn btn-danger" id="me_deleteBtn" data-toggle="modal" data-target="#meDeleteBtn" style="color: white;">삭제</a>
	                                       </div>
	                                   </td>
	                               </tr>
	                           </c:forEach>                           
                           </tbody>
                       </table>
                   </div>
                </div>
            </div>

            <!-- 페이징 영역 -->
            <div id="me_pagingArea" align="center">                        
                <div id="me_paging" >
                    <ul class="pagination pagination">
	                    <c:choose>
	                		<c:when test="${ pi.currentPage eq 1 }">                   
	                        	<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
	                        </c:when>
	                        <c:otherwise>
	                             <li class="page-item"><a class="page-link" href="creatorMsg.me?currentPage=${ pi.currentPage-1 }">Previous</a></li>
			                </c:otherwise>
			             </c:choose>          
	                        
	                     <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">   
	                        <li class="page-item"><a class="page-link" href="creatorMsg.me?currentPage=${ p }">${ p }</a></li>
						 </c:forEach>
	
						<c:choose>
	                		<c:when test="${ pi.currentPage eq pi.maxPage }">                   
	                        	<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
	                        </c:when>
	                        <c:otherwise>
	                             <li class="page-item"><a class="page-link" href="creatorMsg.me?currentPage=${ pi.currentPage+1 }">Next</a></li>
			                </c:otherwise>
			             </c:choose>   
                      </ul>
                </div> 
            </div>
        </div>
    </div>

    <!-- 답변달기 클릭시 Modal -->
    <div class="modal" id="meAnswerBtn">
        <div class="modal-dialog">
           <div class="modal-content" style="height:800px; width:700px;">
           
               <!-- Modal Header -->
               <div class="modal-header">
                   <h4 class="modal-title">메세지 답변</h4>
                   <button type="button" class="close" data-dismiss="modal">&times;</button>
               </div>
               
               <!-- Modal body -->
               <div class="modal-body" align="center">

                  <table id="meModal">
                      <tr>
                          <th>프로젝트명</th>
                          <th>회원 아이디</th>
                          <th>질문 작성일</th>
                      </tr>                   
                      <tr>
                          <td>ㅐㅐㅐㅐㅐㅐㅐ</td>
                          <td>user01</td>
                          <td>21-02-11</td>                          
                      </tr>
                      <tr>
                          <th style="padding-top:15px;" colspan="3">메세지 내용</th>
                      </tr>
                      <tr>
                          <td colspan="3">
                              <textarea name="" id="" cols="70" rows="5" readonly>비싸여</textarea>
                          </td>
                      </tr>
                      <tr>
                          <th style="padding-top:15px;" colspan="3">답변</th>
                      </tr>
                      <tr>
                          <td colspan="3">
                              <textarea name="" id="" cols="70" rows="5"></textarea>
                          </td>
                      </tr>
                      <tr>
                          <td id="answerBtn" colspan="3">
                              <button type="submit" class="btn btn-success" id="me_enrollBtn" style="color: white; margin-right:10px;">답변달기</button>
                              <button id="cancleBtn" data-dismiss="modal" class="btn btn-secondary">취소</button>
                          </td>
                      </tr>
                  </table>
               </div>
           </div>
        </div>
    </div>


    <!-- 삭제 클릭시 모달 -->
    <div class="modal" id="meDeleteBtn">
        <div class="modal-dialog">
            <div class="modal-content">
            
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">메세지 삭제</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                
                <!-- Modal body -->
                <div class="modal-body" align="center">
                    <b>
			                      메세지를 삭제하면 복구할 수 없습니다. <br>   
				            정말로 삭제하시겠습니까?? 
                    </b>
                </div>

                <!-- Modal footer -->
                <div id="deModalFooter">
                    <button type="submit" id="deleteBtn" class="btn btn-warning">삭제</button>
                    <button id="cancleBtn" data-dismiss="modal" class="btn btn-secondary">취소</button>
                </div>               
            </div>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp"/>

</body>
</html>