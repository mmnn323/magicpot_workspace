<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펀딩 신청 상세 조회(스토리 작성)</title>
<!-- css -->
<link rel="stylesheet" href="resources/css/funding/fundingManage3.css">
<style>
	#agreeBtn{
	    height: 40px;
	    padding-left: 3px;
	    padding-bottom: 2px;
	    border: none;
	    border-radius: 4px;
	    background-color: rgb(116, 152, 107);
	    font-size: 17px;
	    font-weight: 400;
	    color: white;
	    cursor: pointer;
	}
</style>
</head>
<body>
    <jsp:include page="../common/adminPageTemplate2.jsp"/>
            <div id="content">
                <div id="content1" style="margin-left:-50px;">
                    <div id="contentTitleArea">
                        <span id="title1">펀딩 신청 상세 조회</span>
                        <span id="title2">스토리 작성</span>
                    </div>
                    <hr style="clear: both;margin-bottom: 30px;">
                    <br><br><br><br>
                    <form action="" method="post">

                        <h4>프로젝트 광고 심의 동의</h4>
                        <p id="p3" style="color:rgb(116, 152, 107);">공통 표시/광고 가이드 라인</p>
                        <button type="button" id="agreeBtn"><i class="fas fa-check"></i> 동의완료</button>
                        <br><br><br><br>
                        
                        <h4>프로젝트 요약</h4>
                        <p id="p2">프로젝트 상단에 노출됩니다.</p>
                        <textarea name="rewardPlan" id="rewardPlan" cols="80" rows="5" maxlength="250" style="resize: none;width: 70%;">${ pro.proSummary }</textarea>
                        <br><br><br>

                        <h4>스토리 작성</h4>
                        <!-- 스크립트로 동의 후 상단 내용 삭제 + disabled해제 -->
                        <div id="story">
                            <textarea id="summernote" name="editordata">${ pro.proStory }</textarea>
                        </div>
                        <br><br>
                        <script>
                            $(function(){
                                $('#summernote').summernote({
                                    height:400,
                                    minHeight:400,
                                    maxHeight:400,
                                    lang:"ko-KR",                                    
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
                    </form>
                    <br>
                    <div id="btns">
		                <!-- 이전 페이지 연결 -->
		                <button type="button" id="beforeBtn" onclick="location.href='fundingDetail2.ad?pno=${ pno }'">이전으로</button>
		                <!-- 다음페이지 연결 -->
		                <button type="button" id="nextBtn" onclick="location.href='fundingDetail4.ad?pno=${ pno }'">다음으로</button>
		            </div>
                </div>
                <br><br><br><br><br><br>
            </div>
</body>
</html>