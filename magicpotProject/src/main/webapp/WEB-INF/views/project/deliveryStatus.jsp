<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송 현황</title>
<!-- 폰트어섬, 폰트 -->
<script src="https://kit.fontawesome.com/dd18300701.js" crossorigin="anonymous"></script>
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
<link rel="stylesheet" href="resources/css/deliveryStatus.css">
</head>
<body>
    <div class="wrap">
        <div id="header">
            <!-- 나가기 클릭시 메인페이지로 이동 -->
            <div id="logo"><img src="resources/images/logo1.png" width="120px" height="45px;"></div>
            <div id="creatorName">돈조 매직팟 님</div>
            <div id="outPage" style="cursor:pointer;">나가기</div>
        </div>
        <div id="menuContent">
            <div id="menu">
                <div id="creProfile">
                    <p id="p1">펀딩 준비 작성 중</p>
                    <p id="p2">돈조매직팟의<br>멋진 프로젝트</p>
                    <p id="p3">프로젝트 번호 1</p>
                </div>
                <div id="menubar">
                    <div id="accordian">
                        <ul>
                            <li>
                                <h4 id="ready" style="cursor:pointer;">
                                    <p id="menu_title" style="display:inline;">펀딩 준비</p>
                                    <i id="btn" class="fas fa-angle-down" style="margin-left:93px"></i>
                                </h4>
                                <ul id="subMenu">
                                    <li><a href="">기본 요건</a></li>
                                    <li><a href="">기본 정보</a></li>
                                    <li><a href="">스토리 작성</a></li>
                                    <li><a href="">리워드 설계</a></li>
                                </ul>
                            </li>
                            <li>
                                <h4 id="fundingStatus" align="left">
                                    <a href="">펀딩 현황</a>
                                </h4>
                            </li>
                            <li>
                                <h4 id="fundingStatus" align="left">
                                    <a href="">결제 현황</a>
                                </h4>
                            </li>
                            <li>
                                <h4 id="fundingStatus" align="left">
                                    <a href="">배송 현황</a>
                                </h4>
                            </li>
                            <li>
                                <h4><a href="" id="abled">자료 및 도움말</a><span style="margin-left:80px"></span></h4>
                            </li>
                        </ul>
                    </div>	
                    <script>            
                        $(function(){
                            $("#accordian h4").click(function(){
                                $("#accordian ul ul").slideUp();
                                $("#menu_title").css("color", "")
                                $("#btn").removeClass("fas fa-angle-up");
                                $("#btn").addClass("fas fa-angle-down");
                                if(!$(this).next().is(":visible"))
                                {
                                    $(this).next().slideDown();
                                    $("#btn").removeClass("fas fa-angle-down");
                                    $("#menu_title").css("color", "rgb(116, 152, 107)")
                                    $("#btn").addClass("fas fa-angle-up");
                                }
                            })
                        })
                    </script>
                </div>
            </div>
            <div id="content">
                <div id="content1">
                    <h3 style="font-weight: 600;">배송 현황</h3>
                    <h5 id="summary">서포터별 결제 상태와 리워드 구성을 확인하고 발송 관리를 해주세요.</h5>
                    <br><br>
                    <div id="payStatus">
                        <div id="order" align="center">
                            <p id="title">펀딩 결제 예약 금액</p>
                            <h3 id="price">480,000 원</h3>
                        </div>
                        <div id="order" align="center">
                            <p id="title">펀딩 결제 완료 금액</p>
                            <h3 id="price">0 원</h3>
                        </div>
                    </div>
                    <div id="select">
                        <select name="orDelivery" id="orDelivery">
                            <option value="">결제 상태 : 전체</option>
                            <option value="결제예약">결제예약</option>
                            <option value="결제">결제</option>
                        </select>
                        <select name="deliveryStatus" id="deliveryStatus">
                            <option value="">배송 상태 : 전체</option>
                            <option value="미배송">미배송</option>
                            <option value="배송중">배송중</option>
                            <option value="배송완료">배송완료</option>
                            <option value="환불신청">환불신청</option>
                            <option value="환불완료">환불완료</option>
                        </select>
                    </div>
                    <br><br>
                    <!-- 10개씩 보이고 클릭시 배송 상태 변경 -->
                    <div id="deliveryList">
                        <table id="deliveryListTable" class="table table-hover">
                            <thead align="center">
                              <tr>
                                <th>서포터 아이디</th>
                                <th>결제 상태</th>
                                <th>배송 상태</th>
                                <th>리워드 구성</th>
                                <th>배송 현황</th>
                              </tr>
                            </thead>
                            <tbody align="center">
                              <tr data-toggle="modal" data-target="#myModal">
                                <td>user01</td>
                                <td>결제에약</td>
                                <td>미배송</td>
                                <td>[얼리버드] 밥그릇</td>
                                <td></td>
                              </tr>
                              <tr>
                                <td>user01</td>
                                <td>결제에약</td>
                                <td>미배송</td>
                                <td>[얼리버드] 밥그릇</td>
                                <td></td>
                              </tr>
                              <tr>
                                <td>user01</td>
                                <td>결제에약</td>
                                <td>미배송</td>
                                <td>[얼리버드] 밥그릇</td>
                                <td>020490234203</td>
                              </tr>
                              <tr>
                                <td>user01</td>
                                <td>결제에약</td>
                                <td>미배송</td>
                                <td>[얼리버드] 밥그릇</td>
                                <td>020490234203</td>
                              </tr>
                              <tr>
                                <td>user01</td>
                                <td>결제에약</td>
                                <td>미배송</td>
                                <td>[얼리버드] 밥그릇</td>
                                <td>020490234203</td>
                              </tr>
                              <tr>
                                <td>user01</td>
                                <td>결제에약</td>
                                <td>미배송</td>
                                <td>[얼리버드] 밥그릇</td>
                                <td></td>
                              </tr>
                              <tr>
                                <td>user01</td>
                                <td>결제에약</td>
                                <td>미배송</td>
                                <td>[얼리버드] 밥그릇</td>
                                <td>020490234203</td>
                              </tr>
                              <tr>
                                <td>user01</td>
                                <td>결제에약</td>
                                <td>미배송</td>
                                <td>[얼리버드] 밥그릇</td>
                                <td>020490234203</td>
                              </tr>
                              <tr>
                                <td>user01</td>
                                <td>결제에약</td>
                                <td>미배송</td>
                                <td>[얼리버드] 밥그릇</td>
                                <td>020490234203</td>
                              </tr>
                              <tr>
                                <td>user01</td>
                                <td>결제에약</td>
                                <td>미배송</td>
                                <td>[얼리버드] 밥그릇</td>
                                <td>020490234203</td>
                              </tr>
                            </tbody>
                        </table>
                    </div>
                    <br>
                    <div id="pagingArea" align="center">
                        <ul class="pagination">
                            <li class="page-item"><a class="page-link" href="#">&lt;</a></li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><a class="page-link" href="#">4</a></li>
                            <li class="page-item"><a class="page-link" href="#">5</a></li>
                            <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
                        </ul>
                    </div>
                    <br><br><br>
                </div>
                <!-- The Modal -->
                <div class="modal fade" id="myModal">
                    <div class="modal-dialog">
                        <div class="modal-content">
                        
                            <!-- Modal Header -->
                            <div class="modal-header">
                            <h4 class="modal-title">배송 상태 변경</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            
                            <!-- Modal body -->
                            <div class="modal-body">
                                <form id="changeDeli" action="">
                                    <p id="span1">서포터 아이디</p>
                                    <p id="span1">user01</p>
                                    <br><br style="clear: both;">
                                    <span id="span1">배송 상태</span>
                                    <select name="deliveryStatus" id="deliveryStatus2">
                                        <option value="미배송">미배송</option>
                                        <option value="배송중">배송중</option>
                                        <option value="배송완료">배송완료</option>
                                        <option value="환불신청">환불신청</option>
                                        <option value="환불완료">환불완료</option>
                                    </select>
                                    <br style="clear: both;"><br>
                                    <p id="span1">운송장 번호</p>
                                    <input type="text">
                                </form>
                            </div>
                            
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <div id="btns">
                                    <button type="button" id="resetBtn" data-dismiss="modal">취소</button>
                                    <button type="button" id="submitBtn" form="changeDeli" data-dismiss="modal">등록</button>
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