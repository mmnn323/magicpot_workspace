<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.js"></script>
	<link rel="preconnect" href="https://fonts.gstatic.com/%22%3E">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<!-- include libraries(jQuery, bootstrap) -->
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    
   <!-- 써머노트 -->
	<link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.0/jquery.js"></script> 
	<script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js" defer></script>
 

<style>
	div, form, input{ box-sizing: border-box;}
    div, p, form, a, input {font-family: 'Noto Sans KR', sans-serif;}
    div{box-sizing: border-box;  }
    .wrap{
        background-color: white;
        margin: auto;
        width: 1000px;
        height: 1300px;
    }

    .wrap>div{width:100%}
    .content_1{height: 240px; background-color: rgb(225, 212, 169);}
    .content_2{
        height: 1000px;
    }

    #textArea{
        margin-top: 50px;
    }

    #textArea_1>p{
        color: hsl(51, 89%, 50%);
        font-size: 30px;
        padding: 70px 60px;
    }

    #textArea_1>p>b{
        color: white;
        font-size: 30px;
    }
    #textArea_2>p{
        color: white;
        font-size: 18px;
        margin-top: -90px;
        margin-left: 62px;
    }

    #guideLogo{
        margin-left: 450px;
        margin-top: -130px;
    }

    .content_2>div{
        float: left;
    }
    .mainContent{
        border: 1px solid lightgray;
        height: auto;
        width: 700px;
        margin-top: 20px;       
        box-shadow: 10px 10px 5px grey;

    }

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
    #pro_modifyBtn{
        border:none;
        width:90px;
        margin-top: 15px;
        padding:10px;
        margin-left: 10px;
        background-color: rgb(63, 121, 247);
        font-size: 15px;
    }
    #pro_modifyBtn:hover{
        background-color: rgb(41, 89, 248);
    }
    #pro_listBtn{
        border:none;
        width:90px;
        margin-top: 15px;
        padding:10px;
        margin-left: 10px;
        background-color: rgb(160, 160, 160);
        font-size: 15px;
    }
    #pro_listBtn:hover{
        background-color: rgb(128, 128, 128);
    }

    /* 공지사항 등록 모달 */
    .modal-content{width:200px;}
    #proModalFooter{margin-top: 4px; margin-bottom: 25px;}
    #proOkBtn{background-color: rgb(63, 121, 247); border:none;}
    #proOkBtn, #proCancleBtn{
        color:white;
        width:80px;
        margin-right:10px;
        padding:8px;
        font-size: 15px;
    }
    #proOkBtn:hover{background-color: rgb(41, 89, 248);}
	
</style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp"/>
	
    <div class="wrap">
        <div class="content_1">
            <div id="textArea_1">
                <p>
                    <b>이용약관</b> Terms of service
                </p>
            </div>
            <div id="textArea_2">
                <p>
                    	매직팟 이용약관에 대해 안내해드립니다. 
                </p>
            </div>

            <img src="resources/image/guideLogo.png" id="guideLogo">
                                            
        </div>

        <div id="content">
            <div class="outer" >
    
                <div id="contentTitleArea">
                    <span id="title1">이용약관 관리</span>
                </div>

                
                <!-- 커뮤니티 카테고리 영역 -->
                <div id="pro_enrollFormTitle" align="center">
                    	이용약관 수정
                </div>

                <!-- 이용약관 글 등록 영역 -->
                <div id="pro_listArea" align="center">
                  <form action="proModify.gu" id="modifyForm" method="post">                  	
                        <div id="pro_listArea2" >
                            <table id="pro_enrollTable">
                                <tr>
                                    <td colspan="2" >
                                        <textarea id="summernote" name="gu_provision">${provision}</textarea>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <!-- 버튼 영역 -->
                        <div id="pro_btnArea" align="center">
                            <a href="" id="pro_modifyBtn" class="btn btn-success" data-toggle="modal" data-target="#proModifyBtn">수정하기</a>
                            <a href="#" id="pro_listBtn" class="btn btn-success" onClick="history.back();">뒤로가기</a>
                        </div>
                        <br><br>
                    
                </div>

                <script>
                    $(function() {
                  
                        $('#summernote').summernote({
                            width:900,
                            height: 500,                 // 에디터 높이
                            minHeight: 600,              // 최소 높이
                            maxHeight: 500,              // 최대 높이
                            focus: false,                // 에디터 로딩후 포커스를 맞출지 여부
                            lang: "ko-KR",			     // 한글 설정                  
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
                            fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36']
                            });                   	
                    });
                    
                	// 모달 수정 버튼 클릭 => DB에 수정된 이용약관 넘겨주기
                	$(function(){
                		
                		var summernotePro = $('#summernote').val();
                		//console.log(summernotePro);
                		$("#gu_provision").val(summernotePro);
                    		
                		var isChange = false;
                		$("textarea").change(function(){
                			isChange = true;
                		});
                		
                		$(window).on("beforeunload", function(){
                			if(isChange){
                				return "";
                			}
                		});
                		
                		$("#proOkBtn").click(function(){
                			isChange = false;
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
                        <div class="modal-body" style="font-size:15px;">
                            	이용약관을 수정 하시겠습니까?
                        </div>
                        
                        <!-- Modal footer -->
                        <div id="proModalFooter">
                            <button type="submit" id="proOkBtn" class="btn btn-warning">수정</button>
                            <button id="proCancleBtn" data-dismiss="modal" class="btn btn-secondary">취소</button>
                        </div>
                    </div>
                </div>
            </div>  
            <!-- Modal 끝 -->
        </form>
           
                           
        </div>
    </div>
	
	
</body>
</html>