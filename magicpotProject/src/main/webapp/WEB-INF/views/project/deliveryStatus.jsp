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
                  	<c:when test="${ empty finishPrice }">
                  		<div id="order" align="center">
	                      <p id="title">펀딩 배송 완료 금액</p>
	                      <h3 id="price">0 원</h3>
	                  </div>
                  	</c:when>
                  	<c:otherwise>
                  		<div id="order" align="center">
	                      <p id="title">펀딩 배송 완료 금액</p>
	                      <h3 id="price">${ finishPrice } 원</h3>
	                  </div>
                  	</c:otherwise>
                  </c:choose>
              </div>
              <div id="select">
                  <select name="deliveryStatus" id="deliveryStatus">
                    <option value="">배송 상태 : 전체</option>
                    <option value="1">미배송</option>
                    <option value="2">배송중</option>
                    <option value="3">배송완료</option>
                    <option value="4">환불신청</option>
                    <option value="5">환불완료</option>
                  </select>
              </div>
              <script>
	            $(function(){
	         		$("#deliveryStatus option[value=" + ${ cate } + "]").attr('selected', 'selected');
	       		})
              
              	$(function(){
              		$("#deliveryStatus").on('change', function(){
              			var cate = $("#deliveryStatus").val();
              			location.href='deliStatus.pro?cate=' + cate;
              		})
              	})
              </script>
              <br><br>
              <!-- 10개씩 보이고 클릭시 배송 상태 변경 -->
              <div id="deliveryList">
                  <table id="deliveryListTable" class="table table-hover">
                      <thead align="center">
                        <tr>
                            <th>서포터 아이디</th>
                            <th>배송 상태</th>
                            <th>리워드 구성</th>
                            <th>운송장 번호</th>
                        </tr>
                      </thead>
                      <tbody style="cursor:pointer;" align="center">
						<c:forEach var="deli" items="${ deliStatusList }">
							<tr data-toggle="modal" data-target="#deliverChange${ deli.orNo }">
								<td>${ deli.member.memId }</td>
								<td>${ deli.deliveryStatus }</td>
								<td>${ deli.projectReward.rewardTitle }</td>
								<td>${ deli.deliveryNo }</td>
							</tr>
							<!-- 배송상태 변경 모달 -->
				            <form action="deliverChange" method="post">
                                <div class="modal fade" id="deliverChange${ deli.orNo }">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                        
                                            <!-- Modal Header -->
                                            <div class="modal-header">
	                                            <h4 class="modal-title">배송 상태 변경</h4>
	                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            </div>
                                            
                                            <!-- Modal body -->
                                            <div class="modal-body">
                                                <p id="span1">서포터 아이디</p>
                                                <p id="span1">${ deli.member.memId }</p>
                                                <br><br style="clear: both;">
                                                <span id="span1">배송 상태</span>
                                                <select name="deliveryStatus" id="deliveryStatus2" required>
                                                    <option value="미배송">미배송</option>
                                                    <option value="배송중">배송중</option>
                                                    <option value="배송완료">배송완료</option>
                                                    <option value="환불신청">환불신청</option>
                                                    <option value="환불완료">환불완료</option>
                                                </select>
                                                <script>
	                                                $(function(){
	                                        			$("#deliveryStatus2 option[value=" + ${ deli.deliveryStatus } + "]").attr('selected', 'selected');
	                                        		});
                                                </script>
                                                <br style="clear: both;"><br>
                                                <p id="span1">운송장 번호</p>
                                                <input type="hidden" name="orNo" value="${ deli.orNo }">
                                                <input type="text" name="deliveryNo" value="${ deli.deliveryNo }">
                                            </div>
                                            
                                            <!-- Modal footer -->
                                            <div class="modal-footer">
                                                <div id="btns">
                                                    <button type="button" id="resetBtn" data-dismiss="modal">취소</button>
                                                    <button type="submit" id="submitBtn">등록</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
				          </form>
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
						<li class="page-item"><a class="page-link" href="deliStatus.pro?currentPage=${ pi.currentPage-1 }&cate=${ cate }">&lt;</a></li>
							</c:otherwise>
						</c:choose>
						
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<c:choose>
								<c:when test="${ pi.currentPage eq p }">
									<li class="page-item disabled"><a class="page-link" href="#">${ p }</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="deliStatus.pro?currentPage=${ p }&cate=${ cate }">${ p }</a></li>	
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<c:choose>
							<c:when test="${ pi.currentPage eq pi.maxPage }">
								<li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="deliStatus.pro?currentPage=${ pi.currentPage+1 }&cate=${ cate }">&gt;</a></li>
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