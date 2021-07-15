<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MagicPot 커뮤니티 공지사항</title>
<!-- css -->
<link rel="stylesheet" type="text/css" href="resources/css/community/communityNoticeDetailView.css"> 
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
                  	  공지사항
                </div>
                <div id="cm_title">
                    	${ cn.cmNoticeTitle }
                </div>
                <div id="cm_info">
                    	매직팟 &nbsp | &nbsp  ${ cn.enrollDate }
                </div>
            </div>

            <div id="cm_content">
                <pre style="text-align:left; margin:20px;">${ cn.cmNoticeContent }</pre>
            </div>
        </div>

        <div id="btnArea" align="center">
        	<c:if test="${ loginUser.status == 'A' }">
	            <span id="btnArea1">
	                <a class="btn btn-success" onclick="postFormSubmit(1);">수정</a>
	                <a class="btn btn-success" data-toggle="modal" data-target="#cmDeleteBtn">삭제</a>
	            </span>
	         </c:if>
            <span id="btnArea2">
                <a href="list.cm" class="btn btn-success">목록으로</a>
                <a href="#cm_titleArea" class="btn btn-success"><i class="fas fa-caret-up"></i> TOP</a>
            </span>
        </div>
        
        <form id="postForm" action="" method="post">
        	<input type="hidden" name="cnno" value="${ cn.cmNoticeNo }">
        	
    		<!-- The Modal : 공지사항 삭제-->
            <div class="modal fade" id="cmDeleteBtn" align="center">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">

                        <!-- Modal body -->
                        <br>
                        <div class="modal-body">
                            	공지사항을 삭제하시겠습니까?
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
	       			$("#postForm").attr("action", "updateForm.cn").submit();
	       		}else{ // 삭제하기 클릭 시
	       			$("#postForm").attr("action", "delete.cn").submit();
	       		}
	       	}
       </script>
        
    </div>
	
	<!-- 푸터 포함 -->
	<jsp:include page="../common/footer.jsp"/>
	
</body>
</html>