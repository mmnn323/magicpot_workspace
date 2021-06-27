<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펀딩 관리</title>
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
<!-- css -->
<link rel="stylesheet" href="../resources/css/admin/fundingManage.css">
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
                                    <li><a href="">메이커 관리</a></li>
                                    <li><a href="">메이커 전환 관리</a></li>
                                </ul>
                            </li>
                            <li>
                                <h4>
                                    <a href="" id="abled">결제관리</a><span style="margin-left:110px"></span></h4>
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
                    <div class="outer" >
        
                        <div id="contentTitleArea">
                            <span id="title1">펀딩 관리</span>
                        </div>
                
                        <br><br><br><br><br>
                
                        <!-- 검색바 + 버튼 영역 (오븐에서 한 줄에 있길래 하나의 div안에 넣었어요!) -->
                        <div id="searchBtnArea" >
                            <!-- 커뮤니티 검색바 -->
                            <div id="searchArea" >
                                <select name="" id="searchCtg" >
                                    <option value="userId">관리자 ID</option>
                                <option value="userName">프로젝트</option>
                                <option value="email">크리에이터(기업)명</option>
                                </select>
                                <input id="keyword" type="text" placeholder=" Search">
                            </div>
                    
                            <!-- 버튼 영역 -->
                            <div id="btnArea">
                                <a href="" class="btn btn-success" id="enrollBtn" data-toggle="modal" data-target="#approval">승인</a>
                                <a href="" class="btn btn-danger" id="deleteBtn" data-toggle="modal" data-target="#cancel">취소</a>
                            </div>
                        </div>
                        
                        <!-- 리스트 영역 -->
                        <!-- 
                            mybatis 수업시간에 제목에 a태그 달아서 제목만 클릭 시 상세보기로 넘어갔는데 일단 그렇게 적용했어요!
                            이 부분은 기능구현 부분이니 tr 클릭 시 요청하고 싶으신 분들은 그렇게 수정해주셔도 될 것 같아요~!
                         -->
                        <div id="fundingList" >
                              <table class="table" id="fundingListTable" align="center">
                                <thead class="thead-light" >
                                    <tr>
                                        <th></th>
                                        <th>번호</th>
                                        <th>아이디</th>
                                        <th>프로젝트</th>
                                        <th>크리에이터(기업)명</th>
                                        <!-- 프로젝트 오픈일은 승인이 나야 들어가서 빼둠 -->
                                        <th>목표금액</th>
                                        <th>승인현황</th>
                                      </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <input type="checkbox" name="deleteCheck" id="deleteCheck">
                                        </td>
                                        <td>10</td>
                                        <td>user01</td>
                                        <td>버려진 종이컵과 나무로 만들어진 업사이클링 감성 달력</td>
                                        <td>제로제로</td>
                                        <td>800,000</td>
                                        <td>심사</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox" name="deleteCheck" id="deleteCheck">
                                        </td>
                                        <td>10</td>
                                        <td>user01</td>
                                        <td>버려진 종이컵과 나무로 만들어진 업사이클링 감성 달력</td>
                                        <td>제로제로</td>
                                        <td>800,000</td>
                                        <td>심사</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox" name="deleteCheck" id="deleteCheck">
                                        </td>
                                        <td>10</td>
                                        <td>user01</td>
                                        <td>버려진 종이컵과 나무로 만들어진 업사이클링 감성 달력</td>
                                        <td>제로제로</td>
                                        <td>800,000</td>
                                        <td>심사</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox" name="deleteCheck" id="deleteCheck">
                                        </td>
                                        <td>10</td>
                                        <td>user01</td>
                                        <td>버려진 종이컵과 나무로 만들어진 업사이클링 감성 달력</td>
                                        <td>제로제로</td>
                                        <td>800,000</td>
                                        <td>심사</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox" name="deleteCheck" id="deleteCheck">
                                        </td>
                                        <td>10</td>
                                        <td>user01</td>
                                        <td>버려진 종이컵과 나무로 만들어진 업사이클링 감성 달력</td>
                                        <td>제로제로</td>
                                        <td>800,000</td>
                                        <td>심사</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox" name="deleteCheck" id="deleteCheck">
                                        </td>
                                        <td>10</td>
                                        <td>user01</td>
                                        <td>버려진 종이컵과 나무로 만들어진 업사이클링 감성 달력</td>
                                        <td>제로제로</td>
                                        <td>800,000</td>
                                        <td>심사</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox" name="deleteCheck" id="deleteCheck">
                                        </td>
                                        <td>10</td>
                                        <td>user01</td>
                                        <td>버려진 종이컵과 나무로 만들어진 업사이클링 감성 달력</td>
                                        <td>제로제로</td>
                                        <td>800,000</td>
                                        <td>심사</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox" name="deleteCheck" id="deleteCheck">
                                        </td>
                                        <td>10</td>
                                        <td>user01</td>
                                        <td>버려진 종이컵과 나무로 만들어진 업사이클링 감성 달력</td>
                                        <td>제로제로</td>
                                        <td>800,000</td>
                                        <td>심사</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox" name="deleteCheck" id="deleteCheck">
                                        </td>
                                        <td>10</td>
                                        <td>user01</td>
                                        <td>버려진 종이컵과 나무로 만들어진 업사이클링 감성 달력</td>
                                        <td>제로제로</td>
                                        <td>800,000</td>
                                        <td>심사</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox" name="deleteCheck" id="deleteCheck">
                                        </td>
                                        <td>10</td>
                                        <td>user01</td>
                                        <td>버려진 종이컵과 나무로 만들어진 업사이클링 감성 달력</td>
                                        <td>제로제로</td>
                                        <td>800,000</td>
                                        <td>심사</td>
                                    </tr>
                                </tbody>
                              </table>
                        </div>
                
                        <!-- 페이징 영역 -->
                
                        <div id="pagingArea" align="center">
                            
                            <div id="paging" >
                                <ul class="pagination pagination">
                                    <li class="page-item" ><a class="page-link" href="#">&laquo;</a></li>
                                    <li class="page-item"><a class="page-link" href="#">&lt;</a></li>
                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                                    <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
                                    <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
                                  </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>