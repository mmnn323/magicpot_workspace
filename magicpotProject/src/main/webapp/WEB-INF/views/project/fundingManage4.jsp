<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펀딩 신청 상세 조회(스토리 작성)</title>
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
<!-- summernote -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<!-- css -->
<link rel="stylesheet" href="../resources/css/admin/fundingManage4.css">
</head>
<body>
    <div class="wrap">
        <div id="header">
            <!-- 나가기 클릭시 메인페이지로 이동 -->
            <div id="logo"><img src="../resources/images/logo1.png" width="120px" height="45px;"></div>
            <div id="adminId">admin1</div>
            <div id="logout" style="cursor:pointer;padding-right:0px;">로그아웃</div>
            <div id="bar" style="cursor:pointer;padding-right:0px;">|</div>
            <div id="outPage" style="cursor:pointer;padding-left:0px;">홈페이지</div>
        </div>
        <div id="menu_content">
            <div id="menu">
                <div id="menubar">
                    <div id="accordian">
                        <ul>
                            <li>
                                <h4 id="user" style="cursor:pointer;">
                                    <p id="p4" style="display:inline;">회원관리</p>
                                    <i id="btn1" class="fas fa-angle-down" style="margin-left:93px"></i>
                                </h4>
                                <ul id="subMenu">
                                    <li><a href="">일반회원 관리</a></li>
                                    <li><a href="">크리에이터 관리</a></li>
                                    <li><a href="">크리에이터 전환 관리</a></li>
                                </ul>
                            </li>
                            <li>
                                <h4>
                                    <a href="" id="abled">결제관리</a><span style="margin-left:110px"></span></h4>
                                </h4>
                            </li>
                            <li>
                                <h4>
                                    <a href="" id="abled">쿠폰관리</a><span style="margin-left:110px"></span></h4>
                                </h4>
                            </li>
                            <li>
                                <h4>
                                    <a href="" id="abled">펀딩관리</a><span style="margin-left:110px"></span></h4>
                                </h4>
                            </li>
                            <li>
                                <h4>
                                    <a href="" id="abled">이용약관 관리</a><span style="margin-left:80px"></span></h4>
                                </h4>
                            </li>
                            <li>
                                <h4 id="comm" style="cursor:pointer;">
                                    <p id="abled" style="display:inline;">커뮤니티 관리</p>
                                    <i id="btn2" class="fas fa-angle-down" style="margin-left:53px"></i>
                                </h4>
                                <ul id="subMenu">
                                    <li><a href="">커뮤니티 공지사항<br>관리</a></li>
                                    <li><a href="">커뮤니티 글 관리</a></li>
                                </ul>
                            </li>
                            <li>
                                <h4 id="support" style="cursor:pointer;">
                                    <p id="abled" style="display:inline;">고객센터 관리</p>
                                    <i id="btn3" class="fas fa-angle-down" style="margin-left:53px"></i>
                                </h4>
                                <ul id="subMenu">
                                    <li><a href="">공지사항 관리</a></li>
                                    <li><a href="">FAQ 관리</a></li>
                                    <li><a href="">1:1 상담관리</a></li>
                                    <li><a href="">신고 관리</a></li>
                                </ul>
                            </li>
                            
                        </ul>
                    </div>	
                    <script>            
                        $(function(){
                            $("#accordian h4").click(function(){
                                $("#accordian ul ul").slideUp();
                                $(this).css("color", "")
                                $(this).children("i").removeClass("fas fa-angle-up");
                                $(this).children("i").addClass("fas fa-angle-down");
                                if(!$(this).next().is(":visible"))
                                {
                                    $(this).next().slideDown();
                                    $(this).css("color", "rgb(116, 152, 107)")
                                    $(this).children("i").removeClass("fas fa-angle-down");
                                    $(this).children("i").addClass("fas fa-angle-up");
                                }
                            })
                        })
                    </script>
                </div>
            </div>
            <div id="content">
                <div id="content1">
                    <div id="contentTitleArea">
                        <span id="title1">펀딩 신청 상세 조회</span>
                        <span id="title2">스토리 작성</span>
                    </div>
                    <hr style="clear: both;margin-bottom: 30px;">
                    <form action="" method="post">
                        
                        <h4>소개 사진 등록</h4>
                        <p id="p2">프로젝트 페이지 상단에 노출될 사진을 올려주세요.</p>
                        <img src="../resources/images/89734.jpg" alt="">
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
            </div>
        </div>
    </div>
</body>
</html>