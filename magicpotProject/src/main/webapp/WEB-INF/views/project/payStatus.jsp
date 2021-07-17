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
                  <c:choose>
					 <c:when test="${ empty funPrice }">
	                  	 <div id="order" align="center">
		                      <p id="title">펀딩 후원 금액</p>
		                      <h3 id="price">0 원</h3>
						</div>
                  	</c:when>
                  	<c:otherwise>
                  		<div id="order" align="center">
	                      <p id="title">펀딩 후원 금액</p>
	                      <h3 id="price">${ funPrice } 원</h3>
	                  </div>
                  	</c:otherwise>
                  </c:choose>
                  
                  <c:choose>
					 <c:when test="${ empty returnPrice }">
	                  	 <div id="order" align="center">
                      <p id="title">펀딩 환불 금액</p>
                      <h3 id="price">0 원</h3>
                  </div>
                  	</c:when>
                  	<c:otherwise>
                  		<div id="order" align="center">
	                      <p id="title">펀딩 환불 금액</p>
	                      <h3 id="price">${ returnPrice } 원</h3>
	                  </div>
                  	</c:otherwise>
                  </c:choose>
              </div>
              <select name="orDelivery" id="orDelivery">
                  <option value="">결제 상태 : 전체</option>
                  <option value="1">예약</option>
                  <option value="2">결제</option>
              </select>
              <script>
             	$(function(){
        			$("#orDelivery option[value=" + ${ cate } + "]").attr('selected', 'selected');
        		});
              
              	$(function(){
              		$("#orDelivery").on('change', function(){
              			var cate = $("#orDelivery").val();
              			location.href='payStatus.pro?cate=' + cate;
              		})
              	})
              </script>
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
                      <tbody style="cursor:pointer;" align="center">
						<c:forEach var="pay" items="${ payStatusList }">
							<tr>
								<td>${ pay.member.memId }</td>
								<td>${ pay.orSum }</td>
								<td>${ pay.orDelivery }</td>
								<td>${ pay.projectReward.rewardTitle }</td>
							</tr>
						</c:forEach>
					 </tbody>
                  </table>
              </div>
              <br>
              <div id="pagingArea" align="center">
                  <ul class="pagination">
                      <c:choose>
							<c:when test="${ pi.currentPage eq 1}">
						<li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
							</c:when>
							<c:otherwise>						
						<li class="page-item"><a class="page-link" href="payStatus.pro?currentPage=${ pi.currentPage-1 }&cate=${ cate }">&lt;</a></li>
							</c:otherwise>
						</c:choose>
						
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<c:choose>
								<c:when test="${ pi.currentPage eq p }">
									<li class="page-item disabled"><a class="page-link" href="#">${ p }</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="payStatus.pro?currentPage=${ p }&cate=${ cate }">${ p }</a></li>	
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<c:choose>
							<c:when test="${ pi.currentPage eq pi.maxPage }">
								<li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="payStatus.pro?currentPage=${ pi.currentPage+1 }&cate=${ cate }">&gt;</a></li>
							</c:otherwise>
						</c:choose>
                  </ul>
              </div>
              <br><br><br>
          </div>
      </div>
    </div>
</body>
</html>