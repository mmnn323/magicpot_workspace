<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
                      <!-- <input type="checkbox" class="custom-control-input" id="customCheck" onclick="showAndHide();"> -->
                      <input type="checkbox" class="custom-control-input" id="customCheck" onclick="showAndHide();">
                      <label class="custom-control-label" for="customCheck">공지 숨기기</label>
                    </div>
                </form>
            </div>
            
            <!-- * 스크립트 : 공지사항 숨기기, 체크박스 쿠키값 7일 동안 저장 -->
            <script>
            
	            function showAndHide(){
	            	noticeProcess();
	            }
	            
	            // 공지사항 숨기기 체크 박스 체크 여부 확인, 쿠키 저장, 쿠키 삭제
	            function noticeProcess(){
	            	var isChecked = $("#customCheck").is(":checked"); // 체크박스가 체크되었는지 (true/false)
	            	//alert(isChecked);
	            	if(isChecked){ // 체크박스가 체크된 경우
	            		$("#cm_noticeArea2").hide();
	            		setCookie("Cookie_notice", isChecked, 7);
	            	}else{
	            		$("#cm_noticeArea2").show();
	            		deleteCookie("Cookie_notice");
	            	}
	            };
	            
	            // 쿠키값 읽어오기
	            $(function(){
	            	var istrue = getCookie("Cookie_notice");
	            	if(istrue){
	            		$("#customCheck").attr("checked", true);
	            		$("#cm_noticeArea2").hide();
	            	}else{
	            		$("#customCheck").attr("checked", false);
	            		$("#cm_noticeArea2").show();
	            	}
	            });
	            
	            // 쿠키값 저장
	            function setCookie(cookieName, value, exdays){
	            	var exdate = new Date();
	            	exdate.setDate(exdate.getDate() + exdays);
	            	var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	            	document.cookie = cookieName + "=" + cookieValue;
	            }
	            
	            // 쿠키값 조회
	            function getCookie(cookieName) { 
	            	cookieName = cookieName + '='; 
	            	var cookieData = document.cookie; 
	            	var start = cookieData.indexOf(cookieName); 
	            	var cookieValue = ''; 
	            	if(start != -1){ 
	            		start += cookieName.length; 
	            		var end = cookieData.indexOf(';', start); 
	            		if(end == -1)end = cookieData.length; 
	            		cookieValue = cookieData.substring(start, end); 
	            		} 
	            	return unescape(cookieValue); 
	            }
				
	            // 쿠키값 지우기
	            function deleteCookie(cookieName){ 
	            	var expireDate = new Date(); 
	            	expireDate.setDate(expireDate.getDate() - 1); 
	            	document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString(); 
	            }
        	</script>
        	

            <div id="noticeLine"></div>

            <div id="cm_noticeArea2">
                <table class="table">
                    <tbody>
                    	<c:forEach var="cn" items="${ cnList }">
	                      <tr>
	                      	<input class="cmNoticeNo" type="hidden" value="${ cn.cmNoticeNo }">
	                        <td><span class="noticeBtn">공지</span></td>
	                        <td class="cm_noticeTitle">${ cn.cmNoticeTitle }</td>
	                        <td>매직팟</td>
	                        <td>${ cn.enrollDate }</td>
	                      </tr>
                      	</c:forEach>
                    </tbody>
                </table>
            </div>
            
            <!-- 스크립트 :  커뮤니티 공지사항 상세보기 -->
            <script>
            	$(function(){
            		$(".cm_noticeTitle").click(function(){
            			location.href="detail.cn?cnno=" + $(this).siblings(".cmNoticeNo").val();
            		})
            	})
            </script>
            
            <!-- 로그인&&관리자일 경우 노출되는 공지 작성하기 버튼 -->
            <c:if test="${ !empty loginUser and loginUser.status eq 'A' }">
	            <div id="cm_enrollBtn2" >
	                <a href="enrollForm.cn" class="btn btn-success">공지사항 작성하기</a>
	            </div>
            </c:if>
            
        </div>
        
        
        <!-- 커뮤니티 카테고리 영역 -->
        <div id="cm_categoryArea" align="center">
            <div id="cm_categoryArea1" >
                <ul>
                    <li><a href="list.cm" id="ctgAll">전체</a></li>
                    <li><a href="list.cm?ctg=1" id="ctgFree">자유수다</a></li>
                    <li><a href="list.cm?ctg=2" id="ctgInfo">정보나눔</a></li>
                    <li><a href="list.cm?ctg=3" id="ctgChall">#용기내</a></li>
                </ul>
            </div>
        </div>
         
       <script>
	       	$(function(){
	       		switch(${ctg}){
	       		case 0:
	       			$("#ctgAll").css("border-bottom", "3px solid rgb(116, 152, 107)").css("rgb(116, 152, 107)");
	       			break;
	       		case 1:
	       			$("#ctgFree").css("border-bottom", "3px solid rgb(116, 152, 107)").css("rgb(116, 152, 107)");
	       			break;
	       		case 2:
	       			$("#ctgInfo").css("border-bottom", "3px solid rgb(116, 152, 107)").css("rgb(116, 152, 107)");
	       			break;
	       		case 3:
	       			$("#ctgChall").css("border-bottom", "3px solid rgb(116, 152, 107)").css("rgb(116, 152, 107)");
	       			break;
	       		};
	       	});
       </script>

        <!-- 커뮤니티 검색바 -->
        <div id="cm_searchArea" align="center">
            <form action="search.cm">
                <select name="condition" id="cm_SearchCtg" >
                    <option value="title" >제목</option>
                    <option value="content">내용</option>
                    <option value="titleContent">제목+내용</option>
                    <option value="writer">작성자</option>
                </select>
                <input id="cm_keyword" type="text" name="cmKeyword" value="${ cmKeyword }" placeholder=" Search">
                <input type="hidden" name="ctg" value="${ ctg }">
                <button type="submit" class="btn btn-success"><i class="fas fa-search fa-sm" style="padding: 2px 7px 2px 7px;"></i></button>
            </form>
        </div>
        
        <!-- requestScope의 condition의 키값으로 존재하는 값이 있을 경우에 실행할 script (검색을 했을 경우)-->
        <c:if test="${ !empty condition }">
        	<script>
        	$(function(){
        		$("#cm_searchArea option[value=${condition}]").attr("selected", true);
        	})
        	</script>
        </c:if>
        

        <!-- 커뮤니티 리스트 보기 스타일 영역 -->
        <!-- 
        <c:if test="${fn:length(cList) gt 0}">
	        <div id="cm_btnArea" >
	            <div id="listStyle">
	                <a onclick="selectStyle(1);"><i class="fas fa-bars fa-2x"></i></a> 
	                <a onclick="selectStyle(2);"><i class="fas fa-th-large fa-2x"></i></a>
	            </div>
	        </div>
        </c:if>
		-->

        <!-- 커뮤니티 글 리스트 영역 -->
        <div id="cm_listArea">
        	
        	<c:choose>
        		<c:when test="${fn:length(cList) gt 0}">
	        		<c:forEach var="c" items="${ cList }">
			            <div class="cm_thumbnail" >
			            	<input type="hidden" name="cmNo" value="${ c.cmNo }">
			            	<c:choose>
			            		<c:when test="${ empty c.cmImage }">
			            			<img src="resources/images/community/cmNoImage.png">	
			            		</c:when>
			            		<c:otherwise>
			                		<img src="${ c.cmImage }">
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
            	</c:when>
            	<c:otherwise>
            		<div id="noSearchResult">
	               		등록된 게시글이 없습니다.
	            	</div>
            	</c:otherwise>
        	</c:choose>
        	
        	
        	<script>
        		var value = "";
       			function selectStyle(style){
       				if(style==1){
       					alert("글 형식 클릭")
       					
       				}else{
       					alert("썸네일 형식 클릭 ");
       				}
       			};
        	</script>
			
            
            <script>
            	$(function(){
            		$(".cm_thumbnail").click(function(){
            			//alert("클릭됨");
            			location.href='detail.cm?cmNo=' + $(this).children().eq(0).val();
            		})
            	})
            </script>
        </div>
        
        <!-- 로그인한 회원일 경우 보여지는 글 등록 버튼 영역 -->
        <c:if test="${ !empty loginUser }">
            <div id="cm_enrollBtn" >
                <a href="enrollForm.cm" class="btn btn-success">글쓰기</a>
            </div>
        </c:if>

        <!-- 페이징 영역 -->
        <!-- 검색 후 페이징바 보완 : 검색 전, 후 페이징바 따로 만들어두고 조건 검색으로 해당 버튼 노출 -->
        <!-- 검색 전 : list.cm 요청, currentPage, cgt값 넘기기 -->
        <!-- 검색 후 : search.cm로 요청, currentPage, ctg, condition, cmKeyword 값 넘기기 -->
        <c:if test="${fn:length(cList) gt 0}">
	        <div id="cm_pagingArea" align="center">
	            <div id="cm_paging" >
	                <ul class="pagination pagination">
	                   
	                   <c:choose>
	                		<c:when test="${ pi.currentPage eq 1 }">
		                    	<li class="page-item disabled" ><a class="page-link" href="#">&laquo;</a></li>
		                    </c:when>
		                    <c:otherwise>
		                    	<c:choose>
		                    		<c:when test="${ empty condition }">
		                    			<li class="page-item" ><a class="page-link" href="list.cm?currentPage=1&ctg=${ctg}">&laquo;</a></li>
		                    		</c:when>
		                    		<c:otherwise>
		                    			<li class="page-item" ><a class="page-link" href="search.cm?currentPage=1&ctg=${ctg}&condition=${condition}&cmKeyword=${cmKeyword}">&laquo;</a></li>
		                    		</c:otherwise>
		                    	</c:choose>
		                    </c:otherwise>
	                    </c:choose>
	                    
	                    <c:choose>
	                    	<c:when test="${ pi.currentPage eq 1 }">
		                    	<li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
		                    </c:when>
		                    <c:otherwise>
		                    	<c:choose>
		                    		<c:when test="${ empty condition }">
		                    			<li class="page-item"><a class="page-link" href="list.cm?currentPage=${ pi.currentPage-1 }&ctg=${ctg}">&lt;</a></li>	                    			
		                    		</c:when>
		                    		<c:otherwise>
		                    			<li class="page-item" ><a class="page-link" href="search.cm?currentPage=${ pi.currentPage-1 }&ctg=${ctg}&condition=${condition}&cmKeyword=${cmKeyword}">&laquo;</a></li>
		                    		</c:otherwise>
		                    	</c:choose>
		                    </c:otherwise>
	                    </c:choose>
	
	                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	                    	<c:choose>
	                    		<c:when test="${pi.currentPage eq p }">
	                    			<li class="page-item disabled"><a class="page-link" href="#" style="background-color: rgb(116, 152, 107); color:white;">${ p }</a></li>
	                    		</c:when>
	                    		<c:otherwise>
	                    			<c:choose>
			                    		<c:when test="${ empty condition }">
			                    			<li class="page-item"><a class="page-link" href="list.cm?currentPage=${ p }&ctg=${ctg}">${ p }</a></li>
			                    		</c:when>
			                    		<c:otherwise>
			                    			<li class="page-item" ><a class="page-link" href="search.cm?currentPage=${ p }&ctg=${ctg}&condition=${condition}&cmKeyword=${cmKeyword}">${ p }</a></li>
		                    			</c:otherwise>
		                    		</c:choose>
	                    		</c:otherwise>
	                    	</c:choose>
	                    </c:forEach>
	                    
	                    <c:choose>
	                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
		                    	<li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
		                    </c:when>
		                    <c:otherwise>
		                    	<c:choose>
		                    		<c:when test="${ empty condition }">
		                    			<li class="page-item"><a class="page-link" href="list.cm?currentPage=${ pi.currentPage+1 }&ctg=${ctg}">&gt;</a></li>
		                    		</c:when>
		                    		<c:otherwise>
		                    			<li class="page-item" ><a class="page-link" href="search.cm?currentPage=${ pi.currentPage+1 }&ctg=${ctg}&condition=${condition}&cmKeyword=${cmKeyword}">&gt;</a></li>
	                    			</c:otherwise>
	                    		</c:choose>
		                    </c:otherwise>
	                    </c:choose>
	                    
	                    <c:choose>
	                    	<c:when test=" ${ pi.currentPage eq pi.maxPage }">
		                    	<li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
		                    </c:when>
		                    <c:otherwise>
		                    	<c:choose>
		                    		<c:when test="${ empty condition }">
		                    			<li class="page-item"><a class="page-link" href="list.cm?currentPage=${ pi.maxPage }&ctg=${ctg}">&raquo;</a></li>
		                    		</c:when>
		                    		<c:otherwise>
		                    			<li class="page-item" ><a class="page-link" href="search.cm?currentPage=${ pi.maxPage }&ctg=${ctg}&condition=${condition}&cmKeyword=${cmKeyword}">&raquo;</a></li>
	                    			</c:otherwise>
	                    		</c:choose>
		                    </c:otherwise>
	                    </c:choose>
	                    
	                  </ul>
	            </div>
	        </div>
        </c:if>
        
    </div>
    
    <!-- 푸터 포함 -->
    <jsp:include page="../common/footer.jsp"/>

</body>
</html>