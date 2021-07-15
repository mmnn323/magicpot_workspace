<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        margin-left:20px;
    }
    #content {
        width:1000px;
        height:auto;
        padding-bottom:20px;
        background-color: rgb(220, 221, 206);
    }
    #innerContent {
        width:800px;
        height:200px;
        background-color: white;
        display: inline-block;
        margin-left:100px;
        margin-right:100px;
        margin-top:30px;
        border: 1px solid lightgrey;
    }
    #innerContent img{
        width:140px;
        height:140px;
        margin:20px;
    }
    #title{
        font-size:15px;
        font-weight: 600;
        padding-top:20px;
    }
    #message {
        color:grey;
        font-size: large;
    }
    #innerFooter td {
    	font-size:16px;
    }
    

    /* 답변 모달 */
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

     /* 페이징 영역 */
     #me_pagingArea{padding:30px;}
    .pagination>li>a{color:rgb(116, 152, 107);}
    .pagination>li>a:hover{color:rgb(225, 212, 169);}
    #me_paging{
        width: fit-content;
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
                <br><br><br>
            </div>
			
            <div id="content">
				<c:forEach var="m" items="${msgList}">
	                <div id="innerContent" data-toggle="modal" data-target="#messageAnswer" >
	                	<form>
		                    <table id="msgTable">	                  
		                    <input type="hidden" id="msgNo" name="msgNo" value="${m.msgNo}">  	
		                        <tr>
		                            <td rowspan="4"><img src="${m.proImage}"></td>
		                        </tr>
		                        <tr>
		                            <td id="title" colspan="3">
		                                <p>${m.proTitle} <br><br> ${m.creName}</p>
		                            </td>
		                        </tr>
		                        <tr id="innerFooter">
		                            <td id="message">${m.msgReply}</td>
		                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		                            <td id="date">${m.msgAnswer}</td>
		                        </tr>                 
		                    </table>
	                    </form>
	                </div>      
	            </c:forEach>
            </div>


    <!-- 메세지 클릭시 Modal -->
    <div class="modal" id="messageAnswer">
        <div class="modal-dialog">
            <div class="modal-content" style="height:600px; width:700px;">
            
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
                            <th>크리에이터</th>
                            <th>질문 답변일</th>
                        </tr>
                        <tr>
                            <td id="proTitle"></td>
	                        <td id="creName"></td>
	                        <td id="msgAnswer"></td>    
                        </tr>
                        <tr>
                            <th style="padding-top:15px;" colspan="3">메세지 내용</th>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <textarea name="" id="msgContent" cols="70" rows="5" readonly></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th style="padding-top:15px;" colspan="3">답변</th>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <textarea name="" id="msgReply" cols="70" rows="5" readonly></textarea>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    
     <script>
		$(document).on("click", "#innerContent", function(){
			
			var listMsgNo = $(this).find("input[type=hidden]").val();
    		listMsgNo = Number(listMsgNo);
    		console.log(listMsgNo);
       		
       		$.ajax({
       			url: "msgModal.msg",
       			type: "post",
       			data: {msgNo:listMsgNo},
       			success : function(msgModal){
       				
       	    		$("#proTitle").html(msgModal.proTitle);
       	    		$("#creName").html(msgModal.creName);
       	    		$("#msgAnswer").html(msgModal.msgAnswer);
       	    		console.log(msgAnswer);
       	    		$("#msgContent").val(msgModal.msgContent);
       	    		$("#msgReply").val(msgModal.msgReply);
       				
       			}, error : function(msgModal){
       				console.log(msgModal);
       				console.log("실패");
       			}
       		});
       	})
        </script>
 
            <!-- 페이징 영역 -->
            <div id="me_pagingArea" align="center">
                <div id="me_paging" >
                    <ul class="pagination pagination">
                        <c:choose>
	                		<c:when test="${ pi.currentPage eq 1 }">                   
	                        	<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
	                        </c:when>
	                        <c:otherwise>
	                             <li class="page-item"><a class="page-link" href="myPageMsg.me?currentPage=${ pi.currentPage-1 }">Previous</a></li>
			                </c:otherwise>
			             </c:choose>          
	                        
	                     <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">   
	                        <li class="page-item"><a class="page-link" href="myPageMsg.me?currentPage=${ p }">${ p }</a></li>
						 </c:forEach>
	
						<c:choose>
	                		<c:when test="${ pi.currentPage eq pi.maxPage }">                   
	                        	<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
	                        </c:when>
	                        <c:otherwise>
	                             <li class="page-item"><a class="page-link" href="myPageMsg.me?currentPage=${ pi.currentPage+1 }">Next</a></li>
			                </c:otherwise>
			             </c:choose>   
                      </ul>
                </div>
            </div>
        </div>
    </div>
    
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>