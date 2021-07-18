<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펀딩 준비 홈</title>
<!-- css -->
<link rel="stylesheet" href="resources/css/funding/fundinghome.css">
<style>
	#field1{
	    width: 70%;
	    padding-left:20px;
	    padding-right:15px;
	    padding-bottom:10px;
	    border: 2px solid #b4b4b4;
	    border-radius: 5px;
	}
	#linkField{
	    width: 70%;
	    height: 70px;
	    padding-left:20px;
	    padding-right:15px;
	    padding-bottom:10px;
	    border: 2px solid #b4b4b4;
	    border-radius: 5px;
	}
</style>
</head>
<body>
    <div class="wrap">
    	<c:choose>
    		<c:when test="${ ! empty project.openDate }">
    		 	<jsp:include page="basicTemplateMenuAllAbled.jsp"/>
    		</c:when>
    		<c:when test="${ empty project.openDate }">
    			<jsp:include page="basicTemplateMenuAbled.jsp"/>
    		</c:when>
    	</c:choose>
        <div id="content">
            <div id="content1">
                <h3 style="font-weight:600;">펀딩 준비</h3>
                <h5 id="summary">본격적으로 펀딩을 오픈하기 위해 프로젝트에 대한 필수항목을 작성하세요.</h5>
                <br><br>
                
                <fieldset id="field1">
                    <!-- 단계별로 내용 바뀜 -> 프로젝트 상태로 -->
                    <h4 style="font-weight:600;margin-top:25px">프로젝트 준비 상태</h4>
                    <c:choose>
                    	<c:when test="${ project.proStep eq '펀딩준비' }">
		                    <p id="p5">펀딩 준비 작성 중</p>
		                    <p id="p6">필수 항목을 모두 작성 후 저장하기 버튼을 클릭해주세요. 작성 중 > 작성 완료 상태로 변경되어야 최종 제출이 가능합니다.</p>
                    	</c:when>
                    	<c:when test="${ project.proStep eq '요건확인' }">
		                    <p id="p5">요건 확인 중</p>
		                    <p id="p6">펀딩 진행을 위한 기본 요건을 충족하는지, 누락된 사항은 없는지 등을 확인하는 단계입니다.</p>
                    	</c:when>
                    	<c:when test="${ project.proStep eq '콘텐츠확인' }">
		                    <p id="p5">콘텐츠 확인 중</p>
		                    <p id="p6">요건 확인 완료 시, 프로젝트의 핵심인 스토리를 중심으로 콘텐츠를 확인합니다.</p>
                    	</c:when>
                    	<c:when test="${ project.proStep eq '펀딩오픈' }">
		                    <p id="p5">펀딩 오픈</p>
		                    <p id="p6">오픈이 승인되었습니다. 크리에이터님이 직접 '바로 오픈' 혹은 '오픈 예약' 할 수 있습니다.</p>
                    	</c:when>
                    	<c:when test="${ project.proStep eq '펀딩취소' }">
                			<p id="p5">펀딩 취소</p>
		                    <p id="p6">펀딩이 취소되었습니다. 크리에이터님의 이메일로 발송된 취소 사유를 확인하고 새 프로젝트 생성 후 재신청해주십시오.</p>
                		</c:when>
                    </c:choose>
                    
                </fieldset>
                <br>

                <fieldset id="linkField">
                    <c:choose>
                    	<c:when test="${ project.proStep ne '펀딩준비' }">
                    		<h4>기본 요건</h4>
		                    <p id="p7">&nbsp;&nbsp;작성 완료</p>
		                    <button id="linkBtn" onclick="location.href='requireEnroll.pro'" disabled>제출완료</button>
                    	</c:when>
                    	<c:when test="${ ! empty proRequire }">
                    		<h4>기본 요건</h4>
		                    <p id="p7">&nbsp;&nbsp;작성 완료</p>
		                    <button id="linkBtn" onclick="location.href='requireEnroll.pro'">수정하기</button>
                    	</c:when>
                    	<c:otherwise>
                    		<h4>기본 요건</h4>
		                    <p id="p7">&nbsp;&nbsp;작성 중</p>
		                    <button id="linkBtn" onclick="location.href='requireEnroll.pro'">작성하기</button>
                    	</c:otherwise>
                    </c:choose>
                </fieldset>
                <br>

                <fieldset id="linkField">
                    <c:choose>
                    	<c:when test="${ project.proStep ne '펀딩준비' }">
                    		<h4>기본 정보</h4>
		                    <p id="p7">&nbsp;&nbsp;작성 완료</p>
		                    <button id="linkBtn" onclick="location.href='basicEnroll.pro'" disabled>제출완료</button>
                    	</c:when>
                    	<c:when test="${ ! empty project.proTitle }">
                    		<h4>기본 정보</h4>
		                    <p id="p7">&nbsp;&nbsp;작성 완료</p>
		                    <button id="linkBtn" onclick="location.href='basicEnroll.pro'">수정하기</button>
                    	</c:when>
                    	<c:otherwise>
                    		<h4>기본 정보</h4>
		                    <p id="p7">&nbsp;&nbsp;작성 중</p>
		                    <button id="linkBtn" onclick="location.href='basicEnroll.pro'">작성하기</button>
                    	</c:otherwise>
                    </c:choose>
                </fieldset>
                <br>
				
                <fieldset id="linkField">
                	<c:choose>
                		<c:when test="${ project.proStep ne '펀딩준비' }">
                    		<h4>스토리 작성</h4>
		                    <p id="p7">&nbsp;&nbsp;작성 완료</p>
		                    <button id="linkBtn" onclick="location.href='storyEnroll.pro'" disabled>제출완료</button>
                    	</c:when>
                    	<c:when test="${ ! empty project.proSummary }">
                    		<h4>스토리 작성</h4>
		                    <p id="p7">&nbsp;&nbsp;작성 완료</p>
		                    <button id="linkBtn" onclick="location.href='storyEnroll.pro'">수정하기</button>
                    	</c:when>
                    	<c:otherwise>
                    		<h4>스토리 작성</h4>
		                    <p id="p7">&nbsp;&nbsp;작성 중</p>
		                    <button id="linkBtn" onclick="location.href='storyEnroll.pro'">작성하기</button>
                    	</c:otherwise>
                    </c:choose>
                </fieldset>
                <br>
				<!-- 리스트 조회가 이상함 같은 값만 나옴 !empty가 안먹힘 -->
                <fieldset id="linkField">
                	<c:choose>
                		<c:when test="${ project.proStep ne '펀딩준비' }">
                    		<h4>리워드 작성</h4>
		                    <p id="p7">&nbsp;&nbsp;작성 완료</p>
		                    <button id="linkBtn" onclick="location.href='rewardEnroll.pro'" disabled>제출완료</button>
                    	</c:when>
                    	<c:when test="${ ! empty proReward }">
                    		<h4>리워드 작성</h4>
		                    <p id="p7">&nbsp;&nbsp;작성 완료</p>
		                    <button id="linkBtn" onclick="location.href='rewardEnroll.pro'">수정하기</button>
                    	</c:when>
                    	<c:otherwise>
                    		<h4>리워드 작성</h4>
		                    <p id="p7">&nbsp;&nbsp;작성 중</p>
		                    <button id="linkBtn" onclick="location.href='rewardEnroll.pro'">작성하기</button>
                    	</c:otherwise>
                    </c:choose>
                </fieldset>
                <br>

                <!-- 작성 다해야 제출가능 -> select으로 값 다 있으면 ㄱ?/ 단계따라서 버튼 바꾸기 제출완료, 오픈예약+바로오픈, 오픈완료 -->
                <br>
                <c:choose>
                	<c:when test="${ project.proStep eq '펀딩준비' && ! empty proRequire && ! empty project.proTitle && ! empty project.proSummary  && ! empty proReward }">
                		<button id="submitBtn" data-toggle="modal" data-target="#agreeCheck">제출하기</button>
                		<form id="updateStep" action="updateStep.pro" method="post">
	                		<!-- The Modal -->
							<div class="modal fade" id="agreeCheck">
								<div class="modal-dialog modal-sm">
									<div class="modal-content">
										<!-- Modal Header -->
								        <div class="modal-header">
											<h4 class="modal-title">제출하시겠습니까?</h4>
											<button type="button" class="close" data-dismiss="modal">&times;</button>
										</div>
								        
								        <!-- Modal body -->
								        <div class="modal-body">
								        	<h5 style="color:#636363;">제출 후 수정이 불가능 합니다.</h5>
								        </div>
								        
								        <!-- Modal footer -->
								        <div class="modal-footer">
											<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
											<button type="submit" class="btn btn-success">제출</button>
								        </div>
									</div>
								</div>
							</div>
						</form>
                	</c:when>
                	<c:when test="${ project.proStep eq '펀딩준비' }">
                		<button id="submitBtn" disabled>제출하기</button>
                	</c:when>
                	<c:when test="${ project.proStep eq '요건확인' || project.proStep eq '콘텐츠확인' }">
                		<button id="submitBtn" disabled>승인대기</button>
                	</c:when>
                	<c:when test="${ project.proStep eq '펀딩오픈' && ! empty project.openDate }">
                		<button id="submitBtn" disabled>지정완료</button>
                	</c:when>
                	<c:when test="${ project.proStep eq '펀딩오픈' }">
                		<button id="submitBtn" data-toggle="modal" data-target="#direct">바로오픈</button>
                		<button id="submitBtn" data-toggle="modal" data-target="#reservation">오픈예약</button>
                		
                		<!-- 둘다 펀딩 홈 못가게하고 펀딩상태로 이동 -->
                		<form id="updateOpenDateDir" action="updateOpenDateDir?pno=${ project.proNo }" method="post">
	                		<!-- The Modal -->
							<div class="modal fade" id="direct">
								<div class="modal-dialog modal-sm">
									<div class="modal-content">
										<!-- Modal Header -->
								        <div class="modal-header">
											<h4 class="modal-title">바로 오픈</h4>
											<button type="button" class="close" data-dismiss="modal">&times;</button>
										</div>
								        
								        <!-- Modal body -->
								        <div class="modal-body">
								        	<h5 style="color:#636363;">확인 후 수정이 불가능 합니다.</h5>
								        </div>
								        
								        <!-- Modal footer -->
								        <div class="modal-footer">
											<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
											<button type="submit" class="btn btn-success">확인</button>
								        </div>
									</div>
								</div>
							</div>
						</form>
						
						<form id="updateOpenDateRes" action="updateOpenDateRes?pno=${ project.proNo }" method="post">
	                		<!-- The Modal -->
							<div class="modal fade" id="reservation">
								<div class="modal-dialog modal-sm">
									<div class="modal-content">
										<!-- Modal Header -->
								        <div class="modal-header">
											<h4 class="modal-title">오픈 예약</h4>
											<button type="button" class="close" data-dismiss="modal">&times;</button>
										</div>
								        
								        <!-- Modal body -->
								        <div class="modal-body">
								        	<h5 style="color:#636363;font-size:17px;">제출 후 수정이 불가능 합니다.</h5>
								        	<input type="date" id="openDate" name="openDate">
								        </div>
								        
								        <!-- Modal footer -->
								        <div class="modal-footer">
											<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
											<button type="submit" class="btn btn-success">제출</button>
								        </div>
									</div>
								</div>
							</div>
						</form>
                	</c:when>
                	<c:when test="${ project.proStep eq '펀딩취소' }">
                		<button id="submitBtn" disabled>펀딩취소</button>
                	</c:when>
                </c:choose>
            </div>
        </div>
    </div>
</body>
</html>