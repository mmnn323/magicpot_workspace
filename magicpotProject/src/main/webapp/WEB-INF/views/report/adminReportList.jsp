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
    #re_btnArea button{
        border:none;
        width:100px;
        padding:7px;
        margin-right: 10px;
    }
    #re_reportBtn{
        background-color: rgb(252, 99, 99);
    }
    #re_reportBtn:hover{
        background-color: rgb(216, 66, 66);
    }
    #re_answerBtn{
        background-color: rgb(116, 152, 107);
    }
    #re_answerBtn:hover{
        background-color: rgb(93, 121, 86);
    }

    #re_reportStatus{
        border:none;
        width:100px;
        padding:7px;
        margin-right: 10px;
        background-color: rgb(225, 212, 169);
    }

    /* 리스트 영역  */
    #reportListArea{ 
        margin-top:30px; 
        text-align:center;
    }
    #reportList{width:900px;}
    #reportList>tbody a{
        color:black;
        text-decoration: none;
    }
    #reportList>tbody>tr:hover{
        background-color: rgb(215, 231, 212);
        cursor:pointer;
    }

    /* 신고내용 상세 + 답변 달기 */
    .detailList{ background-color: rgb(215, 231, 212);}
    .detailList th{ padding:25px; }
    .detailList button{
        margin-left:10px;
    }
    #reason{
        background-color: rgb(215, 231, 212);
        border:none;
    }
    #re_btnArea button{
        border:none;
        width:100px;
        padding:7px;
        margin-top:20px;
        margin-bottom:20px;
    }

    /* 페이징 영역 */
    #re_pagingArea{padding:30px;}
    .pagination>li>a{color:rgb(116, 152, 107);}
    .pagination>li>a:hover{color:rgb(225, 212, 169);}
    #re_paging{
        width: fit-content;
    }

    /* 신고 처리 모달 */
    .modal-content{width:400px;}
    #reModalFooter{margin-top: 4px; margin-bottom: 25px;}
    #reOkBtn{width:150px; margin-right:10px; padding:8px; background-color: rgb(252, 99, 99); border:none;}
    #reOkBtn, #reCancleBtn{
        color:white;  
        margin-right:10px;   
        border:none;
        width:100px;
        padding:7px;
        margin-right: 10px;
    }
    #reOkBtn:hover{background-color: rgb(216, 66, 66);}
	
</style>
</head>
<body>

	<jsp:include page="../common/adminPageTemplate.jsp"/>
	
		<div id="content">
            <div class="outer" >

                <div id="contentTitleArea">
                    <span id="title1">고객센터 관리</span>
                    <span id="title2">신고 관리</span>
                </div>
            
                <!-- 버튼 영역 -->
                <div>
                    <a href="" class="btn btn-danger" id="re_selectBtn" data-toggle="modal" data-target="#reportModal">선택 신고처리</a>
                </div>
            
                <!-- 리스트 영역 -->
                <div id="reportListArea" >
                      <table class="table" id="reportList" align="center">
                        <thead class="thead-light" >
                          <tr>
                            <th width="40"><input type="checkbox" id="checkall"></th>
                            <th width="80">번호</th>
                            <th width="200">신고일</th>
                            <th width="210">신고유형</th>
                            <th width="700">신고사유</th>
                            <th width="500">비고</th>
                          </tr>
                        </thead>
                        <tbody>
	                        <c:forEach var="r" items="${adminReportList}">
	                          <tr class="reDetailList">
	                            <td><input type="checkbox" name="chk"></td>
	                            <td>${r.reportNo}</td>
	                            <td>${r.reportDate}</td>
	                            <td>${r.reportType}</td>
	                            <td>${r.reportContent}</td>
	                            <td>
	                                <div id="re_btnArea">
	                                    <button href="" class="btn btn-danger" id="re_reportBtn" style="color:white;" data-toggle="modal" data-target="#reportModal">신고처리</button>
	                                    <button href="" class="btn btn-danger" id="re_answerBtn" style="color:white;" onclick="reportDetail()">답변달기</button>
	                                </div>
	                            </td>
	                          </tr>
	                         </c:forEach>
                        </tbody>
                      </table>
                </div>
                
                <script>
                   /* 리스트 체크박스 전체 체크 / 해제 */
                   $(function(){
                       $("#checkall").click(function(){

                           if($("#checkall").prop("checked")){
                           
                               $("input[name=chk]").prop("checked", true);
                           }else{
                               
                               $("input[name=chk]").prop("checked", false);
                           }
                       })
                   })
                </script>    

                <!-- 신고 내용 상세 -->
                <div class="detailList">
                    <table>
                        <tr>
                            <th>신고번호</th>
                            <td style="padding-left:80px;"></td>
                            <th>커뮤니티 댓글 번호</th>
                            <td></td>
                            <th>신고일</th>
                            <td></td>
                        </tr>
                        <tr>
                            <th>신고 유형</th>
                            <td></td>
                        </tr>
                        <tr>
                            <th>신고 사유</th>
                            <td colspan="4">
                                <textarea id="reason" cols="80" rows="3" style="resize:none" readonly></textarea>
                            </td>
                        </tr>
                        <tr>
                           <th>답변 작성</th>
                           <td colspan="4">
                                <textarea cols="80" rows="5" style="resize:none" placeholder="답변 내용을 작성해주세요." required></textarea>
                           </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <div id="re_btnArea" style="text-align:center;">
                                    <button class="btn btn-danger" id="re_reportBtn" data-toggle="modal" data-target="#reportModal">신고처리</button>
                                    <button class="btn btn-danger" id="re_answerBtn" data-toggle="modal" data-target="#answerModal">답변달기</button>
                                    <button type="reset" class="btn btn-secondary" id="reCancleBtn">취소</button>
                                    
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>

                <script>

                    /* 신고 내용 답변 달기 */
                    $(function(){

                        /* 답변하기 버튼 클릭시 => 신고 내용 상세 페이지 */

                        $("#re_answerBtn").click(function(){

                            $(".detailList").slideToggle();
                            //reportDetail();    

                        })

                        $(".detailList").hide();

                    });


                    /* 신고 내용 상세 부분에 데이터 받아오기
                    function reportDetail(){

                        $.ajax({
                            url:"detail.re",
                            data:{commentNo},
                            success:function(){
                                $(".detailList").show();

                            }, error:function(){
                                console.log("ajax 통신실패");
                            }
                        });
                    }
                    */
                </script>

            
                <!-- ajax로 신고 완료되면 신고 처리 버튼 '신고 완료'로 바꿔주기 -->
        
                <!-- 페이징 영역 -->
	            <div id="re_pagingArea" align="center">
	                <div id="re_paging" >
	                    <ul class="pagination pagination">
	                        <c:choose>
		                		<c:when test="${ pi.currentPage eq 1 }">                   
		                        	<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
		                        </c:when>
		                        <c:otherwise>
		                             <li class="page-item"><a class="page-link" href="adminReportList.re?currentPage=${ pi.currentPage-1 }">Previous</a></li>
				                </c:otherwise>
				             </c:choose>          
		                        
		                     <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">   
		                        <li class="page-item"><a class="page-link" href="adminReportList.re?currentPage=${ p }">${ p }</a></li>
							 </c:forEach>
		
							<c:choose>
		                		<c:when test="${ pi.currentPage eq pi.maxPage }">                   
		                        	<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
		                        </c:when>
		                        <c:otherwise>
		                             <li class="page-item"><a class="page-link" href="adminReportList.re?currentPage=${ pi.currentPage+1 }">Next</a></li>
				                </c:otherwise>
				             </c:choose>   
	                      </ul>
	                </div>
	            </div>
            </div>
        
            <!-- 신고 처리 모달 -->
            <div class="modal fade" id="reportModal" align="center">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content" >

                        <!-- Modal body -->
                        <br>
                        <div class="modal-body">
				                            신고 처리 하시겠습니까? <br>
				                            신고 3회 누적시 계정 사용 정지 됩니다.
                        </div>
                        
                        <!-- Modal footer -->
                        <div id="reModalFooter">
                            <button id="reOkBtn" class="btn btn-warning">신고</button>
                            <button id="reCancleBtn" data-dismiss="modal" class="btn btn-secondary">취소</button>
                        </div>
                    </div>
                </div>
            </div>

              <!-- 답변 등록 모달 -->
              <div class="modal fade" id="answerModal" align="center">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content" >

                        <!-- Modal body -->
                        <br>
                        <div class="modal-body">
                            	답변을 등록 하시겠습니까?
                        </div>
                        
                        <!-- Modal footer -->
                        <div id="reModalFooter">
                            <button id="re_answerBtn" class="btn btn-warning" style="color:white;">답변 등록</button>
                            <button id="reCancleBtn" data-dismiss="modal" class="btn btn-secondary">취소</button>
                        </div>
                    </div>
                </div>
              </div>
        </div>

</body>
</html>