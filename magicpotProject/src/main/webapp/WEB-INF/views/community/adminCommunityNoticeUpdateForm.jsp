<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
    <link rel="stylesheet" type="text/css" href="resources/css/community/adminCommunityNoticeUpdateForm.css">  

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com/%22%3E">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="outer">
        
        <div id="contentTitleArea" >
            <span id="title1">커뮤니티 관리</span>
            <span id="title2">커뮤니티 공지사항 수정</span>
        </div>

        <br><br><br>
		
        <div class="enrollForm" >
            <form action="">
                <table align="center" id="enrollTable">
                    <tr>
                        <td><div>제목</div></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="text" name="title" size="100" placeholder="제목을 입력해주세요" value="매직팟 커뮤니티 이용 안내" required>
                        </td>
                    </tr>
                    <tr>
                        <td><div>내용</div></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <textarea name="" id="" cols="103" rows="20" style="resize:none; text-align: left;" placeholder="내용을 입력해주세요" >안녕하세요 매작팟 입니다:)</textarea>
                        </td>
                    </tr>
                </table>
            </form>
        </div>

        <!-- 버튼 영역 -->
        <div id="cm_btnArea">
            <div id="cm_btn">
                <a href="" class="btn btn-success" id="cm_enrollBtn">수정</a>
                <a href="" class="btn btn-danger" id="cm_backBtn">목록</a>
            </div>
        </div>

		
    </div>
    
</body>
</html>