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
    /* 카테고리 타이틀 글작성 버튼 */
    #contentTitleArea a{
        border:none;
        width:80px;
        padding:7px;
        margin-right: 10px;
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
    #pro_btnArea a{
        border:none;
        width:80px;
        padding:7px;
        margin-right: 10px;
    }
    #pro_enrollBtn{
        background-color: rgb(116, 152, 107);
        margin-left: 70px;
    }
    #pro_enrollBtn:hover{
        background-color: rgb(93, 121, 86);
    }
    #pro_modifyBtn{
        background-color: rgb(63, 121, 247);
    }
    #pro_modifyBtn:hover{
        background-color: rgb(41, 89, 248);
    }
    #pro_deleteBtn{
        background-color: rgb(252, 99, 99);
    }
    #pro_deleteBtn:hover{
        background-color: rgb(216, 66, 66);
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

    
    /* 공지사항 삭제 모달 */
    .modal-content{width:400px;}
    #proModalFooter{
        margin-top: 4px; 
        margin-bottom: 25px;
    }
    #proOkBtn{
        width:150px; 
        margin-right:10px; 
        padding:8px; 
        background-color: rgb(252, 99, 99); 
        border:none;
    }
    #proOkBtn, #proCancleBtn{
        color:white;
        width:150px;
        margin-right:10px;
        padding:8px;
    }
    #proOkBtn:hover{background-color: rgb(216, 66, 66);}
	
</style>
</head>
<body>

	<jsp:include page="../common/adminPageTemplate.jsp"/>
	
	    <div class="outer" >
    
           <div id="contentTitleArea">
               <span id="title1">이용약관 관리</span>
               <a href="" class="btn btn-success" id="pro_enrollBtn" style="color: white; margin-left:520px;">글작성</a>
           </div>
           
           
           <!-- 이용약관 리스트 영역 -->
           <div id="provisionListArea" >
                   <table class="table" id="provisionList" align="center">
                   <thead class="thead-light" >
                       <tr>                       
                       <th width="700">글제목</th>
                       <th width="250">작성일</th>
                       <th width="250">수정일</th>
                       <th width="490">비고</th>
                       </tr>
                   </thead>
                   <tbody>
                       <tr>
                       <td><a href="">매직팟 이용약관 관리</a></td>
                       <td>2021-06-02</td>
                       <td>2021-06-02</td>
                       <td>
                           <div id="pro_btnArea">
                               <a href="" class="btn btn-primary" id="pro_modifyBtn" style="color: white;">글수정</a>
                               <a href="" class="btn btn-danger" id="pro_deleteBtn" data-toggle="modal" data-target="#proDeleteBtn" style="color: white;">삭제</a>
                           </div>
                       </td>
                       </tr>
                   
                   </tbody>
                   </table>
           </div>

       </div>
       
         <!-- 이용약관 삭제 모달 -->
         <div class="modal fade" id="proDeleteBtn" align="center">
             <div class="modal-dialog modal-dialog-centered">
                 <div class="modal-content" >

                     <!-- Modal body -->
                     <br>
                     <div class="modal-body">
			                         이용약관을 삭제 하시겠습니까? <br>
			                         삭제된 내용은 복구되지 않습니다.
                     </div>
                     
                     <!-- Modal footer -->
                     <div id="proModalFooter">
                         <button id="proOkBtn" class="btn btn-warning">삭제</button>
                         <button id="proCancleBtn" data-dismiss="modal" class="btn btn-secondary">취소</button>
                     </div>
                 </div>
             </div>
         </div>
       

</body>
</html>