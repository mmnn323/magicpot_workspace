<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Community Detail View</title>

<!-- css -->
<link rel="stylesheet" type="text/css" href="resources/css/community/communityDetailView.css">  

<!-- 써머노트 -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
</head>
<body>

	<!-- 헤더 포함 -->
	<jsp:include page="../common/header.jsp"/>
	
    <div id="outer">

        <!-- 커뮤니티 타이틀 영역 -->
        <div id="cm_titleArea">
            <div id="cm_titleArea1">
                <div>
                    <img src="resources/images/community/cmLogo.png" alt="">
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

        <!-- 커뮤니티 내용 영역 -->
        <div id="cm_contentArea" align="center">
            <div id="cm_infoArea">
                <div id="cm_category">
                    <c:choose>
                    	<c:when test="${ cm.cmCategory == 1 }">
                    		자유수다
                    	</c:when>
                    	<c:when test="${ cm.cmCategory == 2 }">
                    		정보나눔
                    	</c:when>
                    	<c:otherwise>
                    		#용기내
                    	</c:otherwise>
                    </c:choose>
                </div>
                <div id="cm_title">
                    ${ cm.cmTitle }
                </div>
                <div id="cm_info">
                    ${ cm.memId } &nbsp | &nbsp  ${ cm.enrollDate }
                </div>
            </div>
            
            <c:if test="${ !empty loginUser and loginUser.memId eq cm.memId }">
		        <div id="WriterBtnArea" align="center">
		                <span id="WriterBtnArea2" style="margin-left: 800px;">
		                    <a class="btn btn-success" onclick="postFormSubmit(1);">수정</a>
		                    <a class="btn btn-success" data-toggle="modal" data-target="#cmDeleteBtn">삭제</a>
		                </span>
		         </div>
	         </c:if>
	         
	         <form id="postForm" action="" method="post">
        		<input type="hidden" name="cmNo" value="${ cm.cmNo }">
        		<input type="hidden" name="filePath" value="${ cm.cmImage }">
        	
	    		<!-- The Modal : 공지사항 삭제-->
	            <div class="modal fade" id="cmDeleteBtn" align="center">
	                <div class="modal-dialog modal-dialog-centered">
	                    <div class="modal-content">
	
	                        <!-- Modal body -->
	                        <br>
	                        <div class="modal-body">
	                            	커뮤니티 게시글을 삭제하시겠습니까?
	                        </div>
	                        
	                        <!-- Modal footer -->
	                        <div id="cmModalFooter">
	                            <button id="cmOkBtn" class="btn btn-warning" onclick="postFormSubmit(2);">OK</button>
	                            <button id="cmCancleBtn" data-dismiss="modal" class="btn btn-secondary">Cancle</button>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </form>
        
        <script>
	       	function postFormSubmit(num){
	       		if(num == 1){ // 수정하기 클릭 시
	       			$("#postForm").attr("action", "updateForm.cm").submit();
	       		}else{ // 삭제하기 클릭 시
	       			$("#postForm").attr("action", "delete.cm").submit();
	       		}
	       	}
       </script>

            <div id="noticeLine"></div>

            <div id="cm_content">
                ${ cm.cmContent }
            </div>
        </div>
        
        

        <div id="noticeLine"></div>

        <!-- 커뮤니티 댓글 영역 -->
        <div id="cm_commentArea">

            <div id="cm_conmment" align="center">
            
                <!-- 댓글 등록 영역 -->
                <c:choose>
                	<c:when test="${ !empty loginUser }">
		                <div id="enrollComment" class="enrollComment">
		                    <div style="color:rgb(83, 83, 83);">user23</div>
		                    <textarea name="" id="" cols="90" rows="3"  placeholder="댓글을 남겨보세요"></textarea>
		                    <a href="" class="btn btn-success btn-sm" >등록</a>
		                </div>
	                </c:when>
	                <c:otherwise>
		                <div id="enrollComment" align="center">
		                    <textarea name="" id="" cols="90" rows="3"  placeholder="로그인이 필요한 서비스 입니다" readonly></textarea>
		                    <a href="" class="btn btn-success btn-sm disabled" >등록</a>
		                </div>
	                </c:otherwise>
                </c:choose>

                <div id="noticeLine"></div>

                <div id="commentCount" align="left" >
                    <div><i class="far fa-comment-dots"></i> 댓글 <b style="color:gray;">2</b></div>
                </div>
                
                <div id="commentList" align="left" style="width:800px;">
                
                    <table style="margin-top: 20px;" id="commentArea" >
                        <!-- 댓글만 있는 버전 -->
                        <tr>
                            <td colspan="2" id="commentArea1" > <b style="color: rgb(116, 152, 107);">user10</b> <small style="color:gray"> &nbsp;&nbsp; 2021-05-23 17:58</small> &nbsp;
                            <!-- 댓글 작성자와 글 작성자가 일치할 경우 보여지는 span -->
                            <!-- <span class="writerBtn">작성자</span></td> -->
                        </tr>
                        <tr>
                            <td colspan="2" id="commentArea2"> 처음이 어려운 것 같아요! 멋있습니다~!</td>
                        </tr>
                        <tr>
                            <td colspan="2" id="commentArea3" >
                                <a href="javascript:return false;" onclick="reCommentOpen();">댓글</a>
                                <!-- 댓글 작성자와 글 작성자가 일치하지 않을 경우 보여지는 신고 a태그  -->
                                / <a href="" data-toggle="modal" data-target="#reportModal">신고</a>
                                <!-- 댓글 작성자와 글 작성자가 일치할 경우 보여지는 수정,삭제 a태그 -->
                                <!-- / <a href="">수정</a>
                                / <a href="">삭제</a> -->
                                <div id="commentLine"></div>
                            </td>
                        </tr>

                        <!-- 댓글(+대댓글) 버전 -->
                        <tr>
                            <td colspan="2" id="commentArea1" > <b style="color: rgb(116, 152, 107);">user10</b> <small style="color:gray"> &nbsp;&nbsp; 2021-05-23 17:58</small> &nbsp;
                            <!-- 댓글 작성자와 글 작성자가 일치할 경우 보여지는 span -->
                            <!-- <span class="writerBtn">작성자</span></td> -->
                        </tr>
                        <tr>
                            <td colspan="2" id="commentArea2"> 처음이 어려운 것 같아요! 멋있습니다~!</td>
                        </tr>
                        <tr>
                            <td colspan="2" id="commentArea3" >
                                <a href="javascript:return false;" onclick="reCommentOpen();">댓글</a>
                                <!-- 댓글 작성자와 글 작성자가 일치하지 않을 경우 보여지는 신고 a태그  -->
                                / <a href="" data-toggle="modal" data-target="#reportModal">신고</a>
                                <!-- 댓글 작성자와 글 작성자가 일치할 경우 보여지는 수정,삭제 a태그 -->
                                <!-- / <a href="">수정</a>
                                / <a href="">삭제</a> -->

                                <!-- 댓글 버튼 클릭시 노출되는 대댓글 등록 div -->
                                <div id="reComment" align="center" >
                                    <div style="color:rgb(83, 83, 83);">user23</div>
                                    <textarea name="" id="" cols="90" rows="3"  placeholder="댓글을 남겨보세요" ></textarea>
                                    <a class="btn btn-success btn-sm" style="margin-left:670px;" onclick="reCommentClose();">취소</a>
                                    <a href="" class="btn btn-success btn-sm" style="margin-left:5px;">등록</a>
                                </div>

                                <!-- 대댓글 클릭 시 댓글창 열리도록-->
                                <script>
                                    function reCommentOpen(){
                                        // $(this).after("<div>hello</div>");
                                        // $(this).after("<div>hello</div>");
                                        // $(this).wrap("<div class='enrollComment'></div>");
                                        // alert("클릭");
                                        // $("tr:odd").css("backgroundColor", "yellow"); 
                                        // $("tr:last").css({backgroundColor:"red", color:"white"});

                                        // var test = $(".enrollComment").clone(true);
                                        // $("tr:last").append(test);
                                        // $("tr:last").parent().css( 'backgroundColor', 'green' );
                                        // $(this).parent().append(test);
                                    }
                                    function reCommentClose(){
                                        $("#reComment").hide();
                                        // alert("클릭");
                                    }
                                </script>

                                <div id="commentLine"></div>
                            </td>
                        </tr>
                        </tr>
                       
                    </table>
                    
                    <!-- 댓글 버튼 클릭시 노출되는 대댓글 등록 div -->
                    <!-- <div id="reComment" align="center" >
                        <textarea name="" id="" cols="90" rows="3"  placeholder="댓글을 작성해주세요" ></textarea>
                        <a href="" class="btn btn-success" style="margin-left: 670px;">취소</a>
                        <a href="" class="btn btn-success" >등록</a>
                    </div> -->

                </div>
            </div>
            
        </div>

        <div id="btnArea" align="center">
            <span id="btnArea1">
                <a href="enrollForm.cm" class="btn btn-success">글쓰기</a>
            </span>
            <span id="btnArea2" style="margin-left: 700px;">
                <a href="list.cm" class="btn btn-success">목록</a>
                <a href="#cm_titleArea"" class="btn btn-success"><i class="fas fa-caret-up"></i> TOP</a>
            </span>
        </div>
	
		
		<!-- 댓글 신고 -->
        
        <!-- The Modal : 신고-->
        <div class="modal" id="reportModal">
            <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">회원 신고하기</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body">
                    <div class="form-group">
                        <label for="sel1">신고 유형</label>
                        <select class="form-control" id="sel1">
                        <option value="광고">광고</option>
                        <option value="분란조장">분란조장</option>
                        </select>
                    </div>
                    <br>
                    <div class="form-group">
                        <label for="comment">신고 사유</label>
                        <textarea class="form-control" rows="5" id="comment" name="reportContent" style="resize:none"></textarea>
                    </div>
                </div>
        
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="submit" class="btn btn-danger">신고하기</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                </div>
        
            </div>
            </div>
        </div>
        
    </div>
    
    <!-- 푸터 포함 -->
    <jsp:include page="../common/footer.jsp"/>

</body>
</html>