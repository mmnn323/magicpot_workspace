<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펀딩 신청 상세 조회(기본 정보)</title>
<!-- css -->
<link rel="stylesheet" href="resources/css/funding/fundingManage1.css">
</head>
<body>
    <jsp:include page="../common/adminPageTemplate2.jsp"/>
    <div id="content" style="font-family: 'Noto Sans KR', sans-serif;margin-left:50px;">
        <div id="content1">
            <div id="contentTitleArea">
                <span id="title1">펀딩 신청 상세 조회</span>
                <span id="title2">기본 정보</span>
            </div>
            <hr style="clear: both;margin-bottom: 30px;">
            <br><br><br><br>
            <form action="" method="post">
                
                <h4>프로젝트 제목</h4>
                <p id="p2">버려진 종이컵과 나무로 만들어진 업사이클링 감성 달력</p>
                <br><br>
                
                <h4>작가의 말</h4>
                <div id="createrWord">
                    <textarea id="summernote" name="editordata">
                        자연의 아름다운 순간은 많지만<br><br>필라로이드의 세계관을 담아 본질적인 아름다움을,<br><br>화려함보다는 단순하고 직관적인 느낌을 담으려 노력했습니다.
                        자연의 아름다운 순간은 많지만<br><br>필라로이드의 세계관을 담아 본질적인 아름다움을,<br><br>화려함보다는 단순하고 직관적인 느낌을 담으려 노력했습니다.
                        자연의 아름다운 순간은 많지만<br><br>필라로이드의 세계관을 담아 본질적인 아름다움을,<br><br>화려함보다는 단순하고 직관적인 느낌을 담으려 노력했습니다.
                        자연의 아름다운 순간은 많지만<br><br>필라로이드의 세계관을 담아 본질적인 아름다움을,<br><br>화려함보다는 단순하고 직관적인 느낌을 담으려 노력했습니다.
                    </textarea>
                </div>
                <br><br>
                <script>
                    $(function(){
                        $('#summernote').summernote({
                            height:400,
                            minHeight:400,
                            maxHeight:400,
                            lang:"ko-KR",                                    
                            placeholder:"내용을 입력하세요.",
                            toolbar: [
                                    // [groupName, [list of button]]
                                    ['fontname', ['fontname']],
                                    ['fontsize', ['fontsize']],
                                    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
                                    ['color', ['forecolor','color']],
                                    ['table', ['table']],
                                    ['para', ['ul', 'ol', 'paragraph']],
                                    ['height', ['height']],
                                    ['insert',['picture','link','video']],
                                    ['view', ['help']]
                                ],
                                fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
                                fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
                            });
                        $('#summernote').summernote('disable');
                    })
                </script>
                <h4>목표 금액</h4>
                <p id="p2">1,000,000 원</p>
                <br><br><br>

                <h4>대표 이미지</h4>
                <img src="resources/images/funding/89734.jpg" alt="">
                <br><br><br>

                <h4>카테고리</h4>
                <select name="category" id="category" required>
                    <option value="LIVING">LIVING</option>
                    <option value="KITCHEN">KITCHEN</option>
                    <option value="BATHROOM">BATHROOM</option>
                    <option value="OFFICE">OFFICE</option>
                    <option value="TRAVEL">TRAVEL</option>
                </select>
                <br><br><br>

                <h4>프로젝트 종료일</h4>
                <p id="p2">2021-06-13</p>
                
                <br><br>
                <!-- 다음페이지 연결 -->
                <button type="button" id="nextBtn">다음으로</button>
            </form>
            <br><br><br><br><br>
        </div>
    </div>
</body>
</html>