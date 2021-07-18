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
        <div class="outer" style="margin-left:-20px">
            <div id="contentTitleArea">
                <span id="title1">펀딩 관리</span>
            </div>
            <br><br><br><br><br>
            <!-- 검색바 + 버튼 영역 (오븐에서 한 줄에 있길래 하나의 div안에 넣었어요!) -->
            <div id="searchBtnArea" >
                <div id="searchBtnArea">
					<form action="searchFun.ad" id="searchArea" method="get">
						<input type="hidden" name="currenPage"  value="1">
							<select name="searchCtg" id="searchCtg" >
		                        <option value="userId">관리자 ID</option>
			                    <option value="project">프로젝트</option>
			                    <option value="creator">크리에이터(기업)명</option>
		                    </select> 
						<input name="keyWord" id="keyWord" type="text" placeholder=" Search">
					</form>
				</div>
            </div>
            
            <!-- 리스트 영역 -->
            <!-- 검색 페이지 만들가 jsp -->
            <div id="fundingList" >
                  <table class="table" id="fundingListTable" align="center">
                    <thead class="thead-light">
                        <tr>
                            <th>번호</th>
                            <th>아이디</th>
                            <th>프로젝트</th>
                            <th>크리에이터(기업)명</th>
                            <!-- 프로젝트 오픈일은 승인이 나야 들어가서 빼둠 -->
                            <th>목표금액</th>
                            <th>승인현황</th>
                          </tr>
                    </thead>
                    <tbody style="cursor:pointer;">
						<c:forEach var="p" items="${ list }">
						<tr>
							<td class="pno">${ p.proNo }</td>
							<td>${ p.member.memId }</td>
							<td>${ p.proTitle }</td>
							<td>${ p.creator.creName }</td>
							<td>${ p.proPriceForm }</td>
							<td>${ p.proStatus }</td>
						</tr>
						</c:forEach>
					</tbody>
                  </table>
            </div>
            <script>
            	$(function(){
            		$("#fundingListTable tbody tr").click(function(){
            			location.href="fundingDetail.ad?pno=" + $(this).children(".pno").text();
            		})
            	})
            </script>
            <!-- 페이징 영역 -->
    
            <div id="pagingArea" align="center">
                <div id="paging" >
                    <ul class="pagination pagination">
                        <c:choose>
							<c:when test="${ pi.currentPage eq 1}">
								<li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
							</c:when>
							<c:otherwise>						
								<li class="page-item"><a class="page-link" href="fundingManage.ad?currentPage=${ pi.startPage }">&laquo;</a></li>
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${ pi.currentPage eq 1}">
						<li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
							</c:when>
							<c:otherwise>						
						<li class="page-item"><a class="page-link" href="fundingManage.ad?currentPage=${ pi.currentPage-1 }">&lt;</a></li>
							</c:otherwise>
						</c:choose>
						
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<c:choose>
								<c:when test="${ pi.currentPage eq p }">
									<li class="page-item disabled"><a class="page-link" href="#">${ p }</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="fundingManage.ad?currentPage=${ p }">${ p }</a></li>	
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<c:choose>
							<c:when test="${ pi.currentPage eq pi.maxPage }">
								<li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="fundingManage.ad?currentPage=${ pi.currentPage+1 }">&gt;</a></li>
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${ pi.currentPage eq pi.maxPage }">
								<li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="fundingManage.ad?currentPage=${ pi.maxPage }">&raquo;</a></li>
							</c:otherwise>
						</c:choose>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</body>
</html>