<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펀딩 관리</title>
<!-- css -->
<link rel="stylesheet" href="resources/css/funding/fundingManage.css">
</head>
<body>
    <jsp:include page="../common/adminPageTemplate2.jsp"/>
    <div id="content">
        <div class="outer">
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
</body>
</html>