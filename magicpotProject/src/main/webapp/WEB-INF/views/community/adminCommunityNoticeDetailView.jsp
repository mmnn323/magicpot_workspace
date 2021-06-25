<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- css -->
    <link rel="stylesheet" type="text/css" href="resources/css/community/adminCommunityNoticeDetailView.css"> 

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
        
        <div id="contentTitleArea">
            <span id="title1">커뮤니티 관리</span>
            <span id="title2">커뮤니티 공지사항 상세보기</span>
        </div>

        <br><br>

        
        <!-- 커뮤니티 내용 영역 -->
        <div id="cm_contentArea" align="center">
            <div id="cm_infoArea">
                <div id="cm_category">
                    공지사항
                </div>
                <div id="cm_title">
                    매직팟 커뮤니티 에티켓 안내
                </div>
                <div id="cm_info">
                    매직팟 &nbsp | &nbsp  2021-05-11 13:56
                </div>
            </div>

            <!-- <div id="noticeLine"></div> -->

            <div id="cm_content">
                <pre style="text-align: left;">
                    안녕하세요 :)
                    제로웨이스트 기반 펀딩 서비스 매직팟입니다.

                    매직팟 커뮤니티에서 환경을 위한 작은 발걸음을 공유해보세요!
                    커뮤니티 이용 시 서로의 불편함과 피해를 막기 위해 간단한 규칙을 마련하였습니다.

                    - 카테고리 성격에 맞는 글 기재
                    - 욕설, 비방 금지
                    - 개인의 이익을 위한 홍보 금지

                    매직팟 커뮤니티가 잘 운영될 수 있도록 협조 부탁드리겠습니다!
                    감사합니다:)
                </pre>
            </div>
        </div>

        <!-- <div id="noticeLine"></div> -->

        

        <div id="btnArea" align="center">
            <span id="btnArea1">
                <a href="#" class="btn btn-success" data-toggle="modal" data-target="#enrollBtn">글쓰기</a>
            </span>
            <span id="btnArea2" style="margin-left: 500px;">
                <a href="#" class="btn btn-success" data-toggle="modal" data-target="#enrollBtn">목록</a>
                <a href="#" class="btn btn-success" data-toggle="modal" data-target="#enrollBtn"><i class="fas fa-caret-up"></i> TOP</a>
            </span>
        </div>

        
    </div>

</body>
</html>