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

    /* 카테고리 타이틀 영역 */
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
    #provisionListArea{ margin-top:50px; text-align:center;}
    #provisionList{width:800px;}
    #provisionList>tbody a{
        color:black;
        text-decoration: none;
    }
    #provisionList>tbody>tr:hover{
        background-color: rgb(215, 231, 212);
    }

    /* 이용약관 작성 문구 영역 */
    #pro_enrollFormTitle{
        height: 35px;
        width: 140px;
        margin: 30px;
        margin-left:42%;
        border-bottom: 3px solid rgb(116, 152, 107);
        font-family: 'Noto Sans KR', sans-serif;
        color: rgb(116, 152, 107);
        font-size: 20px;
        font-weight:bold
    }

    /* 이용약관 테이블 영역 */
    #pro_listArea2{
        border:1px solid lightgray;
        /* border-radius: 4px; */
        width:105%;
        height: 700px;
        padding:10px;
        padding-top: 25px;
    }

    #pro_enrollTable select, #pro_title{
        margin-bottom:5px;
        /* border-radius: 4px; */
        border:1px solid lightgray;
        padding:7px;
    }

    #pro_title{width:100%}

    .note-editor.note-airframe, .note-editor.note-frame {
        border: 1px solid rgba(0,0,0,.2);
        border-radius: 0;
    }

    /* 글 버튼 등록 영역 */
    #pro_enrollBtn{width:95%;}
    #pro_modifyBtn{
        border:none;
        width:80px;
        margin-top: 15px;
        padding:7px;
        margin-left: 10px;
        background-color: rgb(63, 121, 247);
    }
    #pro_modifyBtn:hover{
        background-color: rgb(41, 89, 248);
    }
    #pro_listBtn{
        border:none;
        width:80px;
        margin-top: 15px;
        padding:7px;
        margin-left: 10px;
        background-color: rgb(160, 160, 160);
    }
    #pro_listBtn:hover{
        background-color: rgb(128, 128, 128);
    }

    /* 공지사항 등록 모달 */
    .modal-content{width:400px;}
    #proModalFooter{margin-top: 4px; margin-bottom: 25px;}
    #proOkBtn{width:150px; margin-right:10px; padding:8px; background-color: rgb(63, 121, 247); border:none;}
    #proOkBtn, #proCancleBtn{
        color:white;
        width:150px;
        margin-right:10px;
        padding:8px;
    }
    #proOkBtn:hover{background-color: rgb(41, 89, 248);}
	
</style>
</head>
<body>

	<jsp:include page="../common/adminPageTemplate.jsp"/>
	
	 <div class="outer" >
        
        <div id="contentTitleArea">
            <span id="title1">이용약관 관리</span>
        </div>

            
        <!-- 커뮤니티 카테고리 영역 -->
        <div id="pro_enrollFormTitle" align="center">
            	이용약관 수정
        </div>

        <!-- 이용약관 글 수정 영역 -->
        <div id="pro_listArea" align="center">
            <form action="" id="enrollForm" method="post" enctype="">
                <div id="pro_listArea2" >
                    <table id="pro_enrollTable">
                        <tr>
                            <td colspan="2">
                                <input type="text" name="title" id="pro_title" placeholder="기존 이용약관 제목" required>
                            </td> 
                        </tr>
                        <tr>
                            <td colspan="2" >
                                <textarea id="summernote" name="editordata">기존 이용약관 내용</textarea>
                            </td>
                        </tr>
                    </table>
                </div>
                <!-- 버튼 영역 -->
                <div id="pro_btnArea" align="center">
                    <a href="#" id="pro_modifyBtn" class="btn btn-success" data-toggle="modal" data-target="#proModifyBtn">수정하기</a>
                    <a href="" id="pro_listBtn" class="btn btn-success">목록으로</a>
                </div>
                <br><br>
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
         <div class="modal fade" id="proModifyBtn" align="center">
          <div class="modal-dialog modal-dialog-centered">
              <div class="modal-content" >

                  <!-- Modal body -->
                  <br>
                  <div class="modal-body">
                      	이용약관을 수정 하시겠습니까?
                  </div>
                  
                  <!-- Modal footer -->
                  <div id="proModalFooter">
                      <button id="proOkBtn" class="btn btn-warning">수정</button>
                      <button id="proCancleBtn" data-dismiss="modal" class="btn btn-secondary">취소</button>
                  </div>
              </div>
          </div>
      </div>
	
</body>
</html>