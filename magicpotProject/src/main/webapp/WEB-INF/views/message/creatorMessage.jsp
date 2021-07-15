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
    #me_btnArea a {
        border:none;
        width:80px;
        padding:7px;
        margin-right: 10px;
    }
    #answerBtn #me_answerBtn{
    	margin-left: 130px;
    }
    #me_enrollBtn, #me_answerBtn{
        background-color: rgb(116, 152, 107);
        margin-left: 30px;
    }
    #me_enrollBtn:hover{
        background-color: rgb(93, 121, 86);
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
                        <a href="#" id="notRead">안 읽은 메세지</a>
                    </div>
                    
                    <!-- 안읽은 메세지 조회 페이지 -->
                    <script>
                    			                   
                   		$(document).on("click", "#notRead", function(){
                   			
                    		$.ajax({
                    			url : "notRead.msg",
                    			type : "post",
                    			success : function(notReadList){
                    				console.log(notReadList);
                    				
                    				$("#notRead").css("backgroundColor", "lightgrey");
                    				var value = "";
                    				$.each(notReadList, function(i, obj){
                    					value += "<tr>"
                    						  +		"<td>" + obj.msgNo + "</td>"
                    						  +		"<td>" + obj.msgSend + "</td>"
                    						  +		"<td>" + obj.memId + "</td>"
                    						  +		"<td>" + obj.msgContent + "</td>"
                    						  +		"<td>" + "답변대기" + "</td>"      
                    						  +		"<td>" +   
                    						  "<a href='' class='btn btn-success' id='me_enrollBtn' data-toggle='modal' data-target='#meAnswerBtn' style='color: white;'>" + "답변달기" + "</a>"
                    						  + "</td>"
                    						  + "</tr>";
                    				})
                    				$("#messageList tbody").html(value);
                    				
                    			}, error : function(){
                    				console.log("리스트 조회 실패");
                    			}
                    		});              	                   			
                   		})        
                    </script>
                                        
                    <!-- 이용약관 리스트 영역 -->
                    <div id="me_ListArea" >
                       <table class="table" id="messageList" align="center">
                           <thead class="thead-light" >
                               <tr>                       
                                   <th width="90">번호</th>
                                   <th width="200">작성일</th>
                                   <th width="250">회원 아이디</th>
                                   <th width="700">문의 내용</th>
                                   <th width="200">처리 현황</th>
                                   <th width="300">비고</th>
                               </tr>
                           </thead>
                           <tbody>
	                           <c:forEach var="m" items="${creMsgList}">
	                               <tr>
	                                   <td id="messageNo">${m.msgNo}</td>
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
		                                       <c:choose>
			                                       <c:when test="${m.msgStatus eq 'N'}">
			                                           <a href="" class="btn btn-success" id="me_enrollBtn" data-toggle="modal" data-target="#meAnswerBtn" style="color: white;">답변달기</a>
			                                       </c:when>
			                                       <c:otherwise>
			                                       		<a href="" class="btn btn-success" id="me_enrollBtn" data-toggle="modal" data-target="#meAnswerBtn" style="color: white; width:120px; background-color:grey;">문의 내용 확인</a>
			                                       </c:otherwise>
		                                       </c:choose>
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
           <div class="modal-content" style="height:600px; width:700px;">
           
               <!-- Modal Header -->
               <div class="modal-header">
                   <h4 class="modal-title">메세지 답변</h4>
                   <button type="button" class="close" data-dismiss="modal">&times;</button>
               </div>
               
               <!-- Modal body -->
               <div class="modal-body" align="center">
				  <form action="insertMsg.msg" method="post" >
	                  <table id="meModal">
	                      <tr>
	                          <th>프로젝트명</th>
	                          <th>회원 아이디</th>
	                          <th>질문 작성일</th>
	                      </tr>                   
	                      <tr>
	                          <td id="proTitle"></td>
	                          <td id="memIdd"></td>
	                          <td id="msgSend"></td>                          
	                      </tr>
	                      <tr>
	                          <th style="padding-top:15px;" colspan="3">메세지 내용</th>
	                      </tr>
	                      <tr>
	                          <td colspan="3">
	                              <textarea name="" id="msgContent" cols="80" rows="5" readonly></textarea>
	                          </td>
	                      </tr>
	                      <tr>
	                          <th style="padding-top:15px;" colspan="3">답변</th>
	                      </tr>
	                      <tr>
	                          <td colspan="3">
	                              <textarea name="msgReply" id="msgReply" cols="80" rows="5"></textarea>
	                          </td>
	                      </tr>
	                      <tr>
	                          <td id="answerBtn" colspan="3">
	                              <button type="submit" class="btn btn-success" id="me_answerBtn" style="color: white; margin-right:10px;">답변달기</button>
	                              <button id="cancleBtn" data-dismiss="modal" class="btn btn-secondary">취소</button>
	                          </td>
	                      </tr>
	                  </table>
                  </form>
               </div>
           </div>
        </div>
    </div>
    
    <script>
			$(document).on("click", "#me_enrollBtn", function(){
				
				var listMsgNo = $(this).parent().parent().siblings().first().text();
	    		listMsgNo = Number(listMsgNo);
        		
        		$.ajax({
        			url: "creMsgmodal.msg",
        			type: "post",
        			data: {msgNo:listMsgNo},
        			success : function(msgModal){
        	    		$("#proTitle").html(msgModal.proTitle);
        	    		$("#memIdd").html(msgModal.memId);
        	    		$("#msgSend").html(msgModal.msgSend);
        	    		$("#msgContent").val(msgModal.msgContent);
        	    		$("#msgReply").val(msgModal.msgReply);
        	    		
        	    		/*
        	    		if(){ // 버튼에 적힌 내용이 문의 내용 확인인 경우
        	    			//버튼 비활성화? 없애기?
        	    		}
        	    		*/
        				
        			}, error : function(msgModal){
        				console.log(msgModal);
        				console.log("실패");
        			}
        		});
        	})
        	
        	
        	$(document).on("click", "#me_answerBtn", function(){
				
				var listMsgNo = $("#messageNo").text();
				console.log(listMsgNo);
				
	    		listMsgNo = Number(listMsgNo);
        		
        		$.ajax({
        			url: "insertMsg.msg",
        			type: "post",
        			data: {
        				
        				msgNo:listMsgNo, 
        				msgReply:$("#msgReply").val()
        					
        			}, success : function(result){
        	    	
        				if(result == "success"){
        					swal("Success!", "답변이 등록 되었습니다.", "success");
        					location.reload();
        				}
        				
        			}, error : function(msgModal){
        				console.log(msgModal);
        				console.log("실패");
        			}
        		});
        	})
        	

    </script>


    <jsp:include page="../common/footer.jsp"/>

</body>
</html>