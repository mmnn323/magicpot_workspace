<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
<link rel="stylesheet" type="text/css" href="resources/css/community/communityEnrollForm.css">  

<!-- 써머노트 -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js" defer></script>
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

        

        <!-- 커뮤니티 카테고리 영역 -->
        <div id="cm_enrollFormTitle" align="center">
            커뮤니티 글 등록
        </div>

        
        <!-- 커뮤니티 글 등록 영역 -->
        <div id="cm_listArea" align="center">
            <form action="enroll.cm" id="enrollForm" method="post" enctype="multipart/form-data">
	            <input type="hidden" name="memNo" value="${ loginUser.memNo }">
	            <input type="hidden" name="memId" value="${ loginUser.memId }">
                <div id="cm_listArea2" >
                    <table id="cm_enrollTable">
                        <tr>
                            <td colspan="2">
                                <select name="cmCategory" id="cmCategory" required>
                                    <option value="" disabled selected>카테고리 선택</option>
                                    <option value="1">자유수다</option>
                                    <option value="2">정보나눔</option>
                                    <option value="3">#용기내</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="text" name="cmTitle" id="cm_title" placeholder="제목을 입력해주세요" required>
                            </td> 
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div id="imageUpfileArea" style="border:1px solid lightgrey; float: left;">
                                    <label id="imageUpfile" for="cmImage" ><i class="fas fa-camera"></i>대표이미지 등록</label>
                                    <input type="file" id="cmImage" class="form-control-file border" name="upfile" style="display:none;">
                                </div>
                                <input type="text" id="cmImageTitle" value="선택된 대표이미지 없음" readonly>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" >
                                <textarea id="summernote" name="cmContent"></textarea>
                            </td>
                        </tr>
                    </table>
                </div>
                <!-- 버튼 영역 -->
                <div id="cm_enrollBtn" align="right">
                    <a href="" id="cmEnrollBtn1" class="btn btn-success" data-toggle="modal" onclick="return checkValidation();" data-target="#cmEnrollBtn">등록</a>
                    <a href="list.cm" class="btn btn-success">목록으로</a>
                </div>
                <br><br>
                
                <!-- The Modal : 커뮤니티 글 등록 모달-->
			    <div class="modal fade" id="cmEnrollBtn" align="center">
			        <div class="modal-dialog modal-dialog-centered">
			            <div class="modal-content" >
			
			                <!-- Modal body -->
			                <br>
			                <div class="modal-body">
			                    	글을 등록하시겠습니까?
			                </div>
			                
			                <!-- Modal footer -->
			                <div id="cmModalFooter">
			                    <button id="cmOkBtn" type="submit" class="btn btn-warning">OK</button>
			                    <button id="cmCancleBtn" data-dismiss="modal" class="btn btn-secondary">Cancle</button>
			                </div>
			            </div>
			        </div>
			    </div>
			    
            </form>
        </div>
    </div>
    
    <!-- 유효성 검사 후 등록 모달 띄우기(카테고리 선택, 제목/내용 입력 확인) -->
    <script>
   	 	function checkValidation(){
	   	 	if($('#cmCategory option:selected').val() == '' 
	   	 			|| $("#cm_title").val().trim() == '' 
	   	 			|| $("#summernote").val().trim() == ''){
	   	 		if($('#cmCategory option:selected').val() == ''){
	   	 			swal("", "카테고리를 선택해주세요.", "warning");
	   	 		}else if($("#cm_title").val().trim() == '') {
	   	 			swal("", "제목을 입력해주세요.", "warning");
	   	 		}else if($("#summernote").val().trim() == ''){
		 			swal("", "내용을 입력해주세요.", "warning");
	   	 		}
	   	 		$("#cmEnrollBtn1").attr("data-target", false);
	   	 	} else{
	   	 		$("#cmEnrollBtn1").attr("data-target", "#cmEnrollBtn");
	   	 	}
   	 	}
    </script>
    
    
     <!-- 대표이미지 등록 시 파일명 노출 -->
    <script>
         $(document).ready(function(){ 
             var fileTarget = $('#cmImage'); 
             fileTarget.on('change', function(){ // 값이 변경되면
                 var cur=$("#imageUpfileArea input[type='file']").val();
             $("#cmImageTitle").val(cur);
             }); 
         }); 
    </script>


	<!-- 썸머노트 -->
	<script>
        $(document).ready(function() {
            $('#summernote').summernote({
                width:900,						// 에디터 너비
                height: 500,                 	// 에디터 높이
                minHeight: 500,             		// 최소 높이
                maxHeight: 500,             		// 최대 높이
                focus: false,               		// 에디터 로딩후 포커스를 맞출지 여부
                lang: "ko-KR",					// 한글 설정
                placeholder: '내용을 입력해주세요',	// placeholder 설정
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
                fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
                callbacks: {
                	onImageUpload : function(files, editor, welEditable) {
                		//console.log("sss");
                        // 파일 업로드(다중업로드를 위해 반복문 사용)
                        for (var i = files.length - 1; i >= 0; i--) {
                        	uploadSummernoteImageFile(files[i],this);
			            }
       				}
             	}
          });
        });
        
        function uploadSummernoteImageFile(file, el) {
			data = new FormData();
			data.append("file", file);
			$.ajax({
				data : data,
				type : "POST",
				url : "uploadSummernoteImageFile",
				contentType : false,
				enctype : 'multipart/form-data',
				processData : false,
				success : function(data) {
					console.log(data.responseCode);
					$(el).summernote('editor.insertImage', data.url);
				}
			});
		}
   </script>
   


	<!-- 푸터 포함 -->
    <jsp:include page="../common/footer.jsp"/>

</body>
</html>