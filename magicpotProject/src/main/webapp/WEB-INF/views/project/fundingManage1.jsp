<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펀딩 신청 상세 조회(기본 정보)</title>
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
<link rel="stylesheet" href="../resources/css/admin/fundingManage1.css">
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
                        <span id="title2">기본 정보</span>
                    </div>
                    <hr style="clear: both;margin-bottom: 30px;">
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
                        <img src="../resources/images/89734.jpg" alt="">
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
                    <br><br>
                    
                    <br><br><br>
                </div>
            </div>
        </div>
    </div>
</body>
</html>