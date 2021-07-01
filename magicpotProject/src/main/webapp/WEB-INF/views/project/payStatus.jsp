<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 현황</title>
<!-- css -->
<link rel="stylesheet" href="resources/css/funding/payStatus.css">
</head>
<body>
    <div class="wrap">
        <jsp:include page="basicTemplateMenuAllAbled.jsp"/>
        <div id="content">
          <div id="content1">
              <h3 style="font-weight: 600;">결제 현황</h3>
              <h5 id="summary">서포터의 결제 상태 및 결제 금액 확인해주세요.</h5>
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
              <select name="orDelivery" id="orDelivery">
                  <option value="">결제 상태 : 전체</option>
                  <option value="결제예약">결제예약</option>
                  <option value="결제">결제</option>
              </select>
              <br><br>
              <!-- 10개씩 보이고 클릭 필요x -->
              <div id="payList">
                  <table id="payListTable" class="table table-hover">
                      <thead align="center">
                        <tr>
                          <th>서포터 아이디</th>
                          <th>결제금</th>
                          <th>결제 상태</th>
                          <th>선택 리워드 명</th>
                        </tr>
                      </thead>
                      <tbody align="center">
                        <tr>
                          <td>user01</td>
                          <td>23,000</td>
                          <td>결제예약</td>
                          <td>[얼리버드] 밥그릇</td>
                        </tr>
                        <tr>
                          <td>user01</td>
                          <td>23,000</td>
                          <td>결제예약</td>
                          <td>[얼리버드] 밥그릇</td>
                        </tr>
                        <tr>
                          <td>user01</td>
                          <td>23,000</td>
                          <td>결제예약</td>
                          <td>[얼리버드] 밥그릇</td>
                        </tr>
                        <tr>
                          <td>user01</td>
                          <td>23,000</td>
                          <td>결제예약</td>
                          <td>[얼리버드] 밥그릇</td>
                        </tr>
                        <tr>
                          <td>user01</td>
                          <td>23,000</td>
                          <td>결제예약</td>
                          <td>[얼리버드] 밥그릇</td>
                        </tr>
                        <tr>
                          <td>user01</td>
                          <td>23,000</td>
                          <td>결제예약</td>
                          <td>[얼리버드] 밥그릇</td>
                        </tr>
                        <tr>
                          <td>user01</td>
                          <td>23,000</td>
                          <td>결제예약</td>
                          <td>[얼리버드] 밥그릇</td>
                        </tr>
                        <tr>
                          <td>user01</td>
                          <td>23,000</td>
                          <td>결제예약</td>
                          <td>[얼리버드] 밥그릇</td>
                        </tr>
                        <tr>
                          <td>user01</td>
                          <td>23,000</td>
                          <td>결제예약</td>
                          <td>[얼리버드] 밥그릇</td>
                        </tr>
                        <tr>
                          <td>user01</td>
                          <td>23,000</td>
                          <td>결제예약</td>
                          <td>[얼리버드] 밥그릇</td>
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
      </div>
    </div>
</body>
</html>