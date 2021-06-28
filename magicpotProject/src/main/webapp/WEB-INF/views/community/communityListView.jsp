<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MagicPot 매직팟 커뮤니티</title>
<!-- css -->
<link rel="stylesheet" type="text/css" href="resources/css/community/communityListView.css">  
</head>
<body>
	
	<!-- 헤더 포함 -->
	<jsp:include page="../common/header.jsp"/>

    <div id="outer">

        <!-- 커뮤니티 타이틀 영역 -->
        <div id="cm_titleArea">
            <div id="cm_titleArea1">
                <div>
                    <img src="resources/images/community/cmLogo.png" alt="">
                </div>
                <div>
                    <b>커뮤니티</b>
                    <p>
			                        지속 가능한 지구를 위해 제로웨이스트에 대한 <br>
			                        다양한 정보와 활동을 자유롭게 공유하는 공간입니다.
                    </p>
                </div>
            </div>
        </div>

        <!-- 커뮤니티 공지사항 영역 -->
        <div id="cm_noticeArea">
            <div id="cm_noticeArea1" align="right">
                <form>
                    <div class="custom-control custom-checkbox">
                      <input type="checkbox" class="custom-control-input" id="customCheck" name="example1" onclick="showAndHide();">
                      <label class="custom-control-label" for="customCheck">공지 숨기기</label>
                    </div>
                  </form>
            </div>

            <div id="noticeLine"></div>

            <div id="cm_noticeArea2">
                <table class="table">
                    <tbody>
                    	<c:forEach var="cn" items="${ cnList }">
	                      <tr>
	                        <td><span class="noticeBtn">공지</span></td>
	                        <td class="cm_noticeTitle">${ cn.cmNoticeTitle }</td>
	                        <td>매직팟</td>
	                        <td>${ cn.enrollDate }</td>
	                      </tr>
                      	</c:forEach>
                    </tbody>
                  </table>
            </div>
            
            <!-- 로그인&&관리자일 경우 노출되는 공지 작성하기 버튼 -->
            <c:if test="${ !empty loginUser and loginUser.status eq 'A' }">
	            <div id="cm_enrollBtn2" >
	                <a href="enrollForm.cn" class="btn btn-success">공지사항 작성하기</a>
	            </div>
            </c:if>
            
        </div>

        <script>
            // 공지사항 숨기기 클릭 시 공지사항 테이블 숨기기
            function showAndHide(){
                if($("#cm_noticeArea2").is(':visible')){
                    $("#cm_noticeArea2").hide(100);
                } else{
                    $("#cm_noticeArea2").show(100);
                }
            }
        </script>

        <!-- 커뮤니티 카테고리 영역 -->
        <div id="cm_categoryArea" align="center">
            <div id="cm_categoryArea1" >
                <ul >
                    <li><a href="" style="border-bottom: 3px solid rgb(116, 152, 107); color: rgb(116, 152, 107);">전체</a></li>
                    <li><a href="" >자유수다</a></li>
                    <li><a href="" >정보나눔</a></li>
                    <li><a href="" >#용기내</a></li>
                </ul>
            </div>
        </div>

        <!-- 커뮤니티 검색바 -->
        <div id="cm_searchArea" align="center">
            <select name="" id="cm_SearchCtg" >
                <option value="" >제목</option>
                <option value="">내용</option>
                <option value="">제목+내용</option>
            </select>
            <input id="cm_keyword" type="text" onkeyup="enterkey();" placeholder=" Search">
        </div>

        
        <div id="cm_btnArea" >
            <div id="listStyle">
                <a href=""><i class="fas fa-bars fa-2x"></i></a> 
                <a href=""><i class="fas fa-th-large fa-2x"></i></a>
            </div>
        </div>


        <!-- 커뮤니티 글 리스트 영역 -->
        <div id="cm_listArea">
			
			<c:forEach var="c" items="${ cList }">
	            <div class="cm_thumbnail" >
	            	<c:choose>
	            		<c:when test="${ empty c.cmImage }">
	            			<img src="resources/images/community/cmNoImage.png">	
	            		</c:when>
	            		<c:otherwise>
	                		<img src="${ empty c.cmImage }">
	                	</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${ c.cmCategory eq 1 }">
		                	<small id="cm_Ctg">자유수다</small> <br>
						</c:when>
						<c:when test="${ c.cmCategory eq 2 }">
							<small id="cm_Ctg">정보나눔</small> <br>
						</c:when>
						<c:otherwise>
							<small id="cm_Ctg">#용기내</small> <br>
						</c:otherwise>
					</c:choose>
	                
	                <div id="cm_title">
                    	<b>${ c.cmTitle }</b>
                	</div>
	                
	                <div id="progress_status" style="margin-bottom: 5px;">
	                    <small>${ c.memId }</small> <br>
	                    <small>${ c.enrollDate } &nbsp&nbsp|&nbsp&nbsp 조회 ${ c.count }</small>
	                </div>
	            </div>
            </c:forEach>
        </div>
        
        <!-- 로그인한 회원일 경우 보여지는 글 등록 버튼 영역 -->
        <c:if test="${ !empty loginUser }">
            <div id="cm_enrollBtn" >
                <a href="" class="btn btn-success">글쓰기</a>
            </div>
        </c:if>

        <!-- 페이징 영역 -->

        <div id="cm_pagingArea" align="center">
            
            <div id="cm_paging" >
            
                <ul class="pagination pagination">
                	
                	<c:choose>
                		<c:when test="${ pi.currentPage eq 1 }">
	                    	<li class="page-item disabled" ><a class="page-link" href="#">&laquo;</a></li>
	                    </c:when>
	                    <c:otherwise>
	                    	<li class="page-item" ><a class="page-link" href="list.cm?currentPage=1">&laquo;</a></li>
	                    </c:otherwise>
                    </c:choose>
                    
                    <c:choose>
                    	<c:when test="${ pi.currentPage eq 1 }">
	                    	<li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
	                    </c:when>
	                    <c:otherwise>
	                    	<li class="page-item"><a class="page-link" href="list.cm?currentPage=${ pi.currentPage-1 }">&lt;</a></li>
	                    </c:otherwise>
                    </c:choose>
                    
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    	<c:choose>
                    		<c:when test="${pi.currentPage eq p }">
                    			<li class="page-item disabled"><a class="page-link" href="#" style="background-color: rgb(116, 152, 107); color:white;">${ p }</a></li>
                    		</c:when>
                    		<c:otherwise>
                    			<li class="page-item"><a class="page-link" href="list.cm?currentPage=${ p }">${ p }</a></li>
                    		</c:otherwise>
                    	</c:choose>
                    </c:forEach>
                    
                    <c:choose>
                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
	                    	<li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
	                    </c:when>
	                    <c:otherwise>
	                    	<li class="page-item"><a class="page-link" href="list.cm?currentPage=${ pi.currentPage+1 }">&gt;</a></li>
	                    </c:otherwise>
                    </c:choose>
                    
                    <c:choose>
                    	<c:when test=" ${ pi.currentPage eq pi.maxPage }">
	                    	<li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
	                    </c:when>
	                    <c:otherwise>
	                    	<li class="page-item"><a class="page-link" href="list.cm?currentPage=${ pi.maxPage }">&raquo;</a></li>
	                    </c:otherwise>
                    </c:choose>
                  </ul>
                  
            </div>
        </div>
    </div>
    
    <!-- 푸터 포함 -->
    <jsp:include page="../common/footer.jsp"/>

</body>
</html>