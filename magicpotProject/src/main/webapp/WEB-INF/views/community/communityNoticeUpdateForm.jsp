<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
<link rel="stylesheet" type="text/css" href="resources/css/community/communityNoticeUpdateForm.css">  
</head>

<body>
	
	<!-- 헤더 포함-->
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

        

        <!-- 커뮤니티 카테고리 영역 -->
        <div id="cm_enrollFormTitle" align="center">
            커뮤니티 공지사항 수정
        </div>

        
        <!-- 커뮤니티 글 등록 영역 -->
        <div id="cm_listArea" align="center" >
            <form action="update.cn" id="updateForm" method="post">
                <div id="cm_listArea2"  >
                	<input type="hidden" name="cmNoticeNo" value="${ cn.cmNoticeNo }">
                    <table id="cm_updateTable">
                        <tr>
                            <td><div>제목</div></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="width:900px">
                                <input type="text" name="cmNoticeTitle" id="cm_title" placeholder="제목을 입력해주세요" value="${ cn.cmNoticeTitle }" required>
                            </td> 
                        </tr>
                        <tr>
                            <td><div>내용</div></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <textarea name="cmNoticeContent" id="cm_content" cols="121" rows="23" style="resize:none;" placeholder="내용을 입력해주세요">${ cn.cmNoticeContent }</textarea>
                            </td>
                        </tr>
                    </table>
                </div>
                 <!-- 버튼 영역 -->
                <div id="cm_btnArea">
                    <div id="cm_btn">
                        <a href="" class="btn btn-success" id="cm_updateBtn" data-toggle="modal" data-target="#cmUpdateBtn">수정</a>
                        <a href="list.cm" class="btn btn-danger" id="cm_backBtn">목록으로</a>
                    </div>
                </div>
                <br><br>

                <!-- The Modal : 공지사항 수정 -->
                <div class="modal fade" id="cmUpdateBtn" align="center">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">

                            <!-- Modal body -->
                            <br>
                            <div class="modal-body">
                                	공지사항을 수정하시겠습니까?
                            </div>
                            
                            <!-- Modal footer -->
                            <div id="cmModalFooter">
                                <button type="submit" id="cmOkBtn" class="btn btn-warning">OK</button>
                                <button id="cmCancleBtn" data-dismiss="modal" class="btn btn-secondary">Cancle</button>
                            </div>
                        </div>
                    </div>
                </div>
                
                <script>
	                $(function(){
	                	var isChange = false;
	                	$("input, textarea").change(function(){
	                		isChange  = true;
	                	});
	
	                	$(window).on("beforeunload", function(){
		                	if(isChange){
		                		return "";
		                	}
	                	});
	
	                	$("#cmOkBtn").click(function(){
	                	isChange = false;
	                	});
	                });
                </script> 
                
                
            </form>
        </div>

    </div>


	<!-- 푸터 포함 -->
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>