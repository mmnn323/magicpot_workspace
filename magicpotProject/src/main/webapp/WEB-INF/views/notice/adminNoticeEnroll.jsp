<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 써머노트 -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<style>
	.outer {
		/* height: 700px; */
		/* border: 1px solid red; */
		width: 900px;
		margin: 30px;
		float: left;
	}
	
	/* 컨텐트 카테고리 타이틀 영역 */
	#contentTitleArea {
		font-family: 'Noto Sans KR', sans-serif;
		width: 900px;
		border-bottom: 2px solid lightgray;
		padding: 10px;
		margin: 20px;
		margin-top: 0;
	}
	
	#title1 {
		font-size: 25px;
		font-weight: bold;
	}
	
	#title2 {
		font-size: 16px;
		background-color: gray;
		color: white;
		margin-left: 10px;
		border: 1px solid gray;
		border-radius: 5px;
		padding: 3px;
	}
	
	#cm_listArea {
		margin-left: 30px;
	}
	
	#cm_enrollTable select, #cm_title {
		margin-bottom: 5px;
		/* border-radius: 4px; */
		border: 1px solid lightgray;
		padding: 7px;
	}
	
	#cm_title {
		width: 100%
	}
	
	#thumbnailUpfile {
		margin-bottom: 5px;
		/* border-radius: 4px; */
		border: 1px solid lightgray;
		padding: 4px;
		color: gray;
	}
	
	.note-editor.note-airframe, .note-editor.note-frame {
		border: 1px solid rgba(0, 0, 0, .2);
		border-radius: 0;
	}
	
	/* 글 버튼 등록 영역 */
	#cm_enrollBtn {
		width: 95%;
	}
	
	#cm_enrollBtn a {
		/* height: 400px; */
		border: none;
		width: 80px;
		margin-top: 15px;
		padding: 7px;
		margin-left: 10px;
		background-color: rgb(116, 152, 107);
	}
	
	#cm_enrollBtn a:hover {
		background-color: rgb(225, 212, 169);
	}
	
	/* 공지사항 등록 모달 */
	.modal-content {
		width: 400px;
	}
	
	#cmModalFooter {
		margin-top: 4px;
		margin-bottom: 25px;
	}
	
	#cmOkBtn {
		width: 150px;
		margin-right: 10px;
		padding: 8px;
		background-color: rgb(116, 152, 107);
		border: none;
	}
	
	#cmOkBtn, #cmCancleBtn {
		color: white;
		width: 150px;
		margin-right: 10px;
		padding: 8px;
	}
	
	#cmOkBtn:hover {
		background-color: rgb(225, 212, 169);
	}
</style>
</head>
<body>


	<!-- adminPageTemplate -->
	<jsp:include page="../common/adminPageTemplate.jsp"/>

	<div id="content">
		<div class="outer">

			<div id="contentTitleArea">
				<span id="title1">고객 센터 관리</span> <span id="title2">공지사항 작성</span>
			</div>

			<br>
			<br>
			<br>
			<br>
			<br>

			<!-- 글 등록 영역 -->
			<div id="cm_listArea" align="center">
				<form action="" id="enrollForm" method="post" enctype="">
					<div id="cm_listArea2">
						<table id="cm_enrollTable">
							<tr>
								<td colspan="2"><input type="text" name="title"
									id="cm_title" placeholder="제목을 입력해주세요" required></td>
							</tr>
							<tr>
								<td colspan="2"><input type="file" name=""
									id="thumbnailUpfile"></td>
							</tr>
							<tr>
								<td colspan="2"><textarea id="summernote"
										name="editordata"></textarea></td>
							</tr>
						</table>
					</div>
					<!-- 버튼 영역 -->
					<div id="cm_enrollBtn" align="right">
						<a href="#" class="btn btn-success" data-toggle="modal"
							data-target="#cmEnrollBtn">등록</a> <a href=""
							class="btn btn-success">목록으로</a>
					</div>
					<br>
					<br>
				</form>
			</div>

			<script>
                    $(document).ready(function() {
                        //여기 아래 부분
                        $('#summernote').summernote({
                            width:900,
                            height: 500,                 // 에디터 높이
                            minHeight: 500,             // 최소 높이
                            maxHeight: 500,             // 최대 높이
                            focus: false,                  // 에디터 로딩후 포커스를 맞출지 여부
                            lang: "ko-KR",					// 한글 설정
                            placeholder: '내용을 입력해주세요',	//placeholder 설정
                            toolbar: [
                                ['fontname', ['fontname']],
                                ['fontsize', ['fontsize']],
                                ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
                                ['color', ['forecolor','color']],
                                ['table', ['table']],
                                ['para', ['ul', 'ol', 'paragraph']],
                                ['height', ['height']],
                                ['insert',['picture','link','video']],
                                ['view', ['fullscreen', 'help']]
                            ],
                            fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
                            fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
                                });
                    });
                </script>
		</div>


		<!-- The Modal -->
		<div class="modal fade" id="cmEnrollBtn" align="center">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">

					<!-- Modal body -->
					<br>
					<div class="modal-body">글을 등록하시겠습니까?</div>

					<!-- Modal footer -->
					<div id="cmModalFooter">
						<button id="cmOkBtn" class="btn btn-warning">OK</button>
						<button id="cmCancleBtn" data-dismiss="modal"
							class="btn btn-secondary">Cancle</button>
					</div>
				</div>
			</div>
		</div>
</body>
</html>