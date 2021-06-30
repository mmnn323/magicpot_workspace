<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펀딩 신청 상세 조회(스토리 작성)</title>
<!-- css -->
<link rel="stylesheet" href="resources/css/funding/fundingManage4.css">
</head>
<body>
    <jsp:include page="../common/adminPageTemplate2.jsp"/>
            <div id="content">
                <div id="content1">
                    <div id="contentTitleArea">
                        <span id="title1">펀딩 신청 상세 조회</span>
                        <span id="title2">스토리 작성</span>
                    </div>
                    <hr style="clear: both;margin-bottom: 30px;">
                    <br><br><br><br>
                    <form action="" method="post">
                        
                        <h4>소개 사진 등록</h4>
                        <p id="p2">프로젝트 페이지 상단에 노출될 사진을 올려주세요.</p>
                        <img src="resources/images/funding/89734.jpg" alt="">
                        <br><br><br>

                        <h4>프로젝트 광고 심의 동의</h4>
                        <p id="p3" style="color:rgb(116, 152, 107);">공통 표시/광고 가이드 라인</p>
                        <button type="button" id="agreeBtn"><i class="fas fa-check"></i> 동의완료</button>
                        <br><br><br><br>
                        
                        <h4>프로젝트 요약</h4>
                        <p id="p2">프로젝트 상단에 노출됩니다.</p>
                        <textarea name="rewardPlan" id="rewardPlan" cols="80" rows="5" maxlength="250" style="resize: none;width: 70%;">
지구가 좋아하는 [웰보우 밀빨대], 밀을 수확하고 남은 밀대를 소금물로 열탕 소독, 고온건조하여 만들었어요!
                        </textarea>
                        <br><br><br>

                        <h4>스토리 작성</h4>
                        <!-- 스크립트로 동의 후 상단 내용 삭제 + disabled해제 -->
                        <div id="story">
                            <textarea id="summernote" name="editordata">
                                <h2>열탕세척과 고온건조하여 만든 자연빨대</h2><br>밀빨대는 19세기에 이미 사용된 빨대랍니다.<br>당시는 밀짚 특유의 냄새와 빨대 안의 잔여물때문에 잘 활용하지 못했는데요.<br><br>여러분들이 잘아시는 브랜드 ‘무지’의 디자인 콘테스트에서 이 밀빨대가 재등장합니다. <br><br>소금물로 열탕 세척하고 자외선 건조하는 방식을 개발하면서 밀빨대가 다시 제품화 되기 시작하죠.
                                <h2>열탕세척과 고온건조하여 만든 자연빨대</h2><br>밀빨대는 19세기에 이미 사용된 빨대랍니다.<br>당시는 밀짚 특유의 냄새와 빨대 안의 잔여물때문에 잘 활용하지 못했는데요.<br><br>여러분들이 잘아시는 브랜드 ‘무지’의 디자인 콘테스트에서 이 밀빨대가 재등장합니다. <br><br>소금물로 열탕 세척하고 자외선 건조하는 방식을 개발하면서 밀빨대가 다시 제품화 되기 시작하죠.
                                <h2>열탕세척과 고온건조하여 만든 자연빨대</h2><br>밀빨대는 19세기에 이미 사용된 빨대랍니다.<br>당시는 밀짚 특유의 냄새와 빨대 안의 잔여물때문에 잘 활용하지 못했는데요.<br><br>여러분들이 잘아시는 브랜드 ‘무지’의 디자인 콘테스트에서 이 밀빨대가 재등장합니다. <br><br>소금물로 열탕 세척하고 자외선 건조하는 방식을 개발하면서 밀빨대가 다시 제품화 되기 시작하죠.
                                <h2>열탕세척과 고온건조하여 만든 자연빨대</h2><br>밀빨대는 19세기에 이미 사용된 빨대랍니다.<br>당시는 밀짚 특유의 냄새와 빨대 안의 잔여물때문에 잘 활용하지 못했는데요.<br><br>여러분들이 잘아시는 브랜드 ‘무지’의 디자인 콘테스트에서 이 밀빨대가 재등장합니다. <br><br>소금물로 열탕 세척하고 자외선 건조하는 방식을 개발하면서 밀빨대가 다시 제품화 되기 시작하죠.
                                <h2>열탕세척과 고온건조하여 만든 자연빨대</h2><br>밀빨대는 19세기에 이미 사용된 빨대랍니다.<br>당시는 밀짚 특유의 냄새와 빨대 안의 잔여물때문에 잘 활용하지 못했는데요.<br><br>여러분들이 잘아시는 브랜드 ‘무지’의 디자인 콘테스트에서 이 밀빨대가 재등장합니다. <br><br>소금물로 열탕 세척하고 자외선 건조하는 방식을 개발하면서 밀빨대가 다시 제품화 되기 시작하죠.
                                <h2>열탕세척과 고온건조하여 만든 자연빨대</h2><br>밀빨대는 19세기에 이미 사용된 빨대랍니다.<br>당시는 밀짚 특유의 냄새와 빨대 안의 잔여물때문에 잘 활용하지 못했는데요.<br><br>여러분들이 잘아시는 브랜드 ‘무지’의 디자인 콘테스트에서 이 밀빨대가 재등장합니다. <br><br>소금물로 열탕 세척하고 자외선 건조하는 방식을 개발하면서 밀빨대가 다시 제품화 되기 시작하죠.
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
                    <br><br>
                    <div id="btns">
                        <!-- 이전 페이지 연결 -->
                        <button type="button" id="beforeBtn">이전으로</button>
                    </div>
                    <div align="right">
                        <!-- 전부 체크박스 선택 되어야 disabled 풀리도록 -->
                        <button type="button" id="approvalBtn" data-toggle="modal" data-target="#approval">승인</button>
                        <button type="button" id="cancelBtn" data-toggle="modal" data-target="#cancel">취소</button>
                    </div>
                    <br><br><br>
                </div>
                <!-- 전환 승인 여부 -->
                    <!-- The Modal -->
                    <div class="modal fade" id="approval">
                        <div class="modal-dialog modal-sm">
                            <div class="modal-content">
                            
                                <!-- Modal Header -->
                                <div class="modal-header">
                                <h4 class="modal-title">펀딩 승인</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                
                                <!-- Modal body -->
                                <div class="modal-body">
                                    <p id="p1">승인 하시겠습니까?</p>
                                </div>
                                
                                <!-- Modal footer -->
                                <div class="modal-footer">
                                    <!-- 네 하면 승인으로 바꾸는거 연결 -->
                                    <button type="button" id="yes" class="btn btn-secondary" data-dismiss="modal">네</button>
                                    <button type="button" id="no" class="btn btn-secondary" data-dismiss="modal">아니오</button>
                                </div>
                                
                            </div>
                        </div>
                    </div>

                    <!-- 전환 취소 여부 -->
                    <!-- The Modal -->
                    <div class="modal fade" id="cancel">
                        <div class="modal-dialog modal-sm">
                            <div class="modal-content">
                            
                                <!-- Modal Header -->
                                <div class="modal-header">
                                <h4 class="modal-title">펀딩 승인 취소</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                
                                <!-- Modal body -->
                                <div class="modal-body">
                                    <p id="p1">승인 취소 하시겠습니까?</p>
                                </div>
                                
                                <!-- Modal footer -->
                                <div class="modal-footer">
                                    <!-- 네 하면 취소로 바꾸는거 연결 -->
                                    <button type="button" id="yes" class="btn btn-secondary" data-dismiss="modal">네</button>
                                    <button type="button" id="no" class="btn btn-secondary" data-dismiss="modal">아니오</button>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
</body>
</html>