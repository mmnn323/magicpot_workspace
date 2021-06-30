<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송 현황</title>
<!-- css -->
<link rel="stylesheet" href="resources/css/funding/deliveryStatus.css">
</head>
<body>
    <div class="wrap">
        <jsp:include page="basicTemplateMenuAllAbled.jsp"/>
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
</body>
</html>