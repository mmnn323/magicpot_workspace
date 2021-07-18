<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펀딩 신청 상세조회(리워드 설계)</title>
<!-- css -->
<link rel="stylesheet" href="resources/css/funding/fundingManage4.css">
<style>
	#approvalBtn, #cancelBtn{
    width: 60px;
    height: 30px;
    border: none;
    border-radius: 5px;
    color: white;
	}
	#approvalBtn{background-color: rgb(116, 152, 107);}
	#cancelBtn{background-color: #d36e6e;}
</style>
</head>
<body>
    <jsp:include page="../common/adminPageTemplate2.jsp"/>
    <div id="content">
        <div id="content1" style="margin-left:-50px;">
            <div id="contentTitleArea">
                <span id="title1">펀딩 신청 상세 조회</span>
                <span id="title2">리워드 설계</span>
            </div>
            <hr style="clear: both;margin-bottom: 30px;">
            <br><br><br><br>
            <div id="rewards">
            		<c:forEach var="r" items="${ reward }">
	                	<div id="reward">
							<p id="rewardPrice">${ r.rewardPrice }원</p>
	                        <p id="quantityLimit">제한 수량 ${ r.quantityLimit }개</p>
	                        <hr>
	                        <p id="rewardTitle">${ r.rewardTitle }</p>
	                        <p id="rewardExplain">${ r.rewardExplain }</p>
	                        <p id="rewardCate">배송비</p>
	                        <p id="shipPrice" style="line-height:25px;">${ r.project.proShipPrice }원</p>
	                        <p id="rewardCate" style="clear:both;">리워드 발송 시작일</p>
	                        <p id="deliveryStart" style="line-height:25px;">${ r.deliveryStart }</p>
	               		</div>
	               	</c:forEach>
            </div>
            <br><br><br>
            <div id="btns" style="width:750px;">
                <button type="button" id="beforeBtn" onclick="location.href='fundingDetail3.ad?pno=${ pno }'" style="float:left">이전으로</button>
                <div align="right" >
                    <button type="button" id="approvalBtn" data-toggle="modal" data-target="#approval">승인</button>
                    <button type="button" id="cancelBtn" data-toggle="modal" data-target="#cancel">취소</button>
                </div>   
            </div>
            <br><br><br>
        </div>
        <!-- 전환 승인 여부 -->
        <!-- The Modal -->
	        <div class="modal fade" id="approval">
	            <div class="modal-dialog modal-sm">
	                <div class="modal-content">
	                
	                    <!-- Modal Header -->
	                    <div class="modal-header">
	                    <h4 class="modal-title">펀딩 승인</h4>
	                    <button type="button" class="close" data-dismiss="modal">&times;</button>
	                    </div>
	                    
	                    <!-- Modal body -->
	                    <div class="modal-body">
	                        <p id="p1">승인 하시겠습니까?</p>
	                    </div>
	                    
	                    <!-- Modal footer -->
	                    <div class="modal-footer">
	                        <!-- 네 하면 승인으로 바꾸는거 연결 -->
	                        <button type="button" id="yes" class="btn btn-secondary" onclick="location.href='funApproval?pno=${ pno }'">네</button>
	                        <button type="button" id="no" class="btn btn-secondary" data-dismiss="modal">아니오</button>
	                    </div>
	                    
	                </div>
	            </div>
	        </div>

        <!-- 전환 취소 여부 -->
	        <div class="modal fade" id="cancel">
	            <div class="modal-dialog modal-sm">
	                <div class="modal-content">
	                
	                    <!-- Modal Header -->
	                    <div class="modal-header">
	                    <h4 class="modal-title">펀딩 승인 취소</h4>
	                    <button type="button" class="close" data-dismiss="modal">&times;</button>
	                    </div>
	                    
	                    <!-- Modal body -->
	                    <div class="modal-body">
	                        <p id="p1">승인 취소 하시겠습니까?</p>
	                    </div>
	                    
	                    <!-- Modal footer -->
	                    <div class="modal-footer">
	                        <!-- 네 하면 취소로 바꾸는거 연결 -->
	                        <button type="button" id="yes" class="btn btn-secondary" onclick="location.href='funCancel?pno=${ pno }'">네</button>
	                        <button type="button" id="no" class="btn btn-secondary" data-dismiss="modal">아니오</button>
	                    </div>
	                </div>
	            </div>
	        </div> 
    </div>
</body>
</html>