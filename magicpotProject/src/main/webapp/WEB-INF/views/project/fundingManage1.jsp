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
        <div id="content1" style="margin-left:-50px;">
            <div id="contentTitleArea">
                <span id="title1">펀딩 신청 상세 조회</span>
                <span id="title2">기본 정보</span>
            </div>
            <hr style="clear: both;margin-bottom: 30px;">
            <br><br><br><br>
            <form action="" method="post">
                
                <h4>프로젝트 제목</h4>
                <p id="p2">${ pro.proTitle }</p>
                <br><br>
                
                <h4>작가의 말</h4>
                <div id="createrWord">
                    <textarea id="summernote" name="editordata">${ pro.createWord }</textarea>
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
                <p id="p2">${ proPrice } 원</p>
                <br><br><br>
                
                <h5>배송비</h5>
                <p id="p2">${ pro.proShipPrice } 원</p>
                <br><br><br>

                <h4>대표 이미지</h4>
                <img src="${ pro.proImage }" width="30%" height="30%">
                <br><br><br>

                <h4>카테고리</h4>
                <!-- 그냥 p태그로 하자 -->
                <p id="p2">${ pro.category.caName }</p>
                <br><br><br>

                <h4>프로젝트 종료일</h4>
                <p id="p2">${ pro.closeDate }</p>
                
                <br><br>
                <!-- 다음페이지 연결 -->
                <button type="button" id="nextBtn" onclick="location.href='fundingDetail2.ad?pno=${ pno }'">다음으로</button>
            </form>
            <br><br><br><br><br>
        </div>
    </div>
</body>
</html>