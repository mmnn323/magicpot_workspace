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
     #b_pagingArea{padding:50px;}
    .pagination>li>a{color:rgb(116, 152, 107);}
    .pagination>li>a:hover{color:rgb(225, 212, 169);}
    #b_paging{
        width: fit-content;
    }

    /* 모달 영역 */
    .modal-body {
        width:500px;
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
    th, tr, td {
    	border:1px solid lightgrey;
    	padding:8px; 
    }
    #cmUrl {
    	border:none;
    	
    }
</style>
</head>
<body>
	
	<jsp:include page="../common/adminPageTemplate.jsp"/>

	<div id="content">
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
	                    <th width="200">블랙리스트 번호</th>
	                    <th width="200">회원 아이디</th>
	                    <th width="200">활동 중지 여부</th>
	                    <th width="200">활동중지일</th>
	                    <th width="200">누적신고수</th>
	                  </tr>
	                </thead>
	                <tbody>
		                <c:forEach var="b" items="${adminBlacklist}">
		                  <tr id="blackListModal" data-toggle="modal" data-target="#blackListBtn">
		                    <td>${b.blacklistNo}</td>
		                    <td>${b.memId}</td>
		                    <td>${b.suspended}</td>
		                    <td>${b.suspendedDate}</td>
		                    <td>${b.reportCount}</td>
		                  </tr>
		              	</c:forEach>
	                </tbody>
	              </table>
	        </div>
	
	       <!-- 페이징 영역 -->
            <div id="b_pagingArea" align="center">
                <div id="b_paging" >
                    <ul class="pagination pagination">
                        <c:choose>
	                		<c:when test="${ pi.currentPage eq 1 }">                   
	                        	<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
	                        </c:when>
	                        <c:otherwise>
	                             <li class="page-item"><a class="page-link" href="adminBlacklist.re?currentPage=${ pi.currentPage-1 }">Previous</a></li>
			                </c:otherwise>
			             </c:choose>          
	                        
	                     <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">   
	                        <li class="page-item"><a class="page-link" href="adminBlacklist.re?currentPage=${ p }">${ p }</a></li>
						 </c:forEach>
	
						<c:choose>
	                		<c:when test="${ pi.currentPage eq pi.maxPage }">                   
	                        	<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
	                        </c:when>
	                        <c:otherwise>
	                             <li class="page-item"><a class="page-link" href="adminBlacklist.re?currentPage=${ pi.currentPage+1 }">Next</a></li>
			                </c:otherwise>
			             </c:choose>   
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
		
	         $(document).on("click", "#blackListModal", function(){
   
				var blacklistNo = $(this).children().first().text();
				console.log(blacklistNo);
				blacklistNo = Number(blacklistNo);
        		
        		$.ajax({
        			url: "modalBlacklist.re",
        			type: "post",
        			data: {blacklistNo : blacklistNo}, 
        			success : function(report){
        				
        				console.log(report);
        				
        	    		var value = "";
        	    		$.each(report, function(i, obj){
        	    			
        	    			obj.cmNo = Number(obj.cmNo);
        	    			
        	    			value += "<tr>"
        	    			      +		"<td>" + obj.reportNo + "</td>"
        	    			      +		"<td><button id='cmUrl' type='button' onClick=window.open('http://localhost:8883/magicpot/detail.cm?cmNo=" + obj.cmNo + "')>" + obj.cmcoNo + "</button></td>"
        	    			      +		"<td>" + obj.reportType + "</td>"
        	    			      +		"<td>" + obj.reportDate + "</td>"
        	    				  + "</tr>";
        	    		})
        	    		$(".modal-body tbody").html(value);
        				
        			}, error : function(){
        				console.log("실패");
        			}
        		});
        	})
	     </script>
	</div>

</body>
</html>