<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리워드 설계</title>
<!-- css -->
<link rel="stylesheet" href="resources/css/funding/rewardEnrollForm.css">
</head>
<body>
    <div class="wrap">
        <jsp:include page="basicTemplateMenuAbled.jsp"/>
        <div id="content">
            <div id="content1">
                <p id="category" style="color:#a1a0a0">펀딩 준비 > <span style="color:#353535">리워드 설계</span></p>
                <h3 style="font-weight:600;">리워드 설계</h3>
                <h5 id="summary">
                    서포터에게 제공할 리워드 내용을 입력하세요.<br>
                    서포터가 쉽게 펀딩할 수 있는 저렴한 리워드부터 서포터의 보다 빠른 펀딩을 유도할 수 있는 얼리버드 리워드까지 다양한 리워드를 구성하세요.
                </h5>
                <br>
                <div id="field">
                    <fieldset>
                        <h4 style="font-weight: 600;">리워드 설계 조건</h4>
                        <br>
                        <div>
                            <div id="condition"><p>제한 수량</p></div>
                            <div id="conSummary" style="margin-left:105px">
                                혜택이 높은 순으로 나오도록 정렬 순서를 등록하세요.
                            </div>
                        </div>
                        <br>
                        <div style="clear:both">
                            <div id="condition"><p>정렬 순서</p></div>
                            <div id="conSummary" style="margin-left:105px">
                                생산 및 제공할 수 있는 리워드의 총 수량으로 해당 수량이 모두 펀딩되면 더 이상 펀딩 불가합니다.
                            </div>
                        </div>
                        <br>
                        <div style="clear:both">
                            <div id="condition"><p>발송 시작일</p></div>
                            <div id="conSummary">
                                프로젝트 종료일 이후부터 11개월 이내로 설계 가능합니다.
                            </div>
                            <div id="deliSummary">
                                <div style="float:left;"><p>- &nbsp;</p></div>
                                <div style="margin-left:15px;">
                                    설정한 발송 시작일까지 리워드가 발송되지 않을 경우, 서포터가 펀딩금 반환을 신청할 수 있으니 신중하게 선택하세요.
                                </div>
                                <div style="float:left;"><p>- &nbsp;</p></div>
                                <div style="margin-left:15px;">
                                    종료일+11개월까지 발송이 시작되지 않은 경우, 미발송 상태인 서포터의 펀딩금 반환이 자동으로 반환(결제취소)되니 유의하세요.
                                </div>
                            </div>
                        </div>
                        <br>
                        <div style="clear:both">
                            <div id="condition"><p>발송 시작일</p></div>
                            <div id="conSummary">
                                옵션(사이즈, 색상 등)이 필요한 경우. 옵션을 추가하세요.
                            </div>
                        </div>
                    </fieldset>
                </div>
                <br>
                <!-- 등록하기는 reward값이 아예 없을때, 추가 된 후에는 추가하기로 변경 -->
                <c:choose>
                	<c:when test="${ empty project.closeDate }">
                		<button type="button" id="rewardEnrollBtn" data-toggle="modal" data-target="#rewardEnrollForm" style="cursor: default" disabled>+ 등록하기</button>
		                <br>
		                <!-- 등록 버튼 disabled였다가 기본정보 등록 되어있으면 disabled해제 + i ~~어쩌구 지우기 / 만약 리워드 존재 -> + 추가하기로 바꿈 -->
		                <div style="margin-top:10px;">
		                    <div style="float:left;"><i class="fas fa-info-circle"></i></div>
		                    <div style="margin-left:25px">
		                        리워드를 추가하기 전에 프로젝트 종료일을 설정해주세요.<br>
		                        프로젝트 종료일은 펀딩준비 > <a href="" style="color:rgb(116, 152, 107);">기본정보</a> 에서 설정할 수 있습니다.
		                    </div>
		                </div>
                	</c:when>
                	<c:otherwise>
                		<button type="button" id="rewardEnrollBtn" data-toggle="modal" data-target="#rewardEnrollForm">+ 등록하기</button>
                		<br>
                	</c:otherwise>
                </c:choose>
                <br>
                <div id="rewards">
	                <c:forEach var="r" items="${ projectReward }">
	                	<div id="reward">
							<p id="rewardPrice">${ r.rewardPrice }원</p>
	                        <p id="quantityLimit">제한 수량 ${ r.quantityLimit }개</p>
	                        <hr>
	                        <p id="rewardTitle">${ r.rewardTitle }</p>
	                        <p id="rewardExplain" style="height:50px;">${ r.rewardExplain }</p>
	                        <p id="rewardCate">배송비</p>
	                        <p id="shipPrice" style="line-height:25px;">${ r.project.proShipPrice }원</p>
	                        <p id="rewardCate" style="clear:both;">리워드 발송 시작일</p>
	                        <p id="deliveryStart" style="line-height:25px;">${ r.deliveryStart }</p>
	                        <div id="btns">
	                        	<button type="button" data-toggle="modal" data-target="#updateEnrollForm${ r.rewardNo }">편집</button>
	                        	<button type="button" onclick="location.href='deleteReward.pro?rno=${ r.rewardNo }'">삭제</button>
	                        <!-- 
	                        	리워드 편집이 비효율적이지만 모르겠어서 일단 리워드 생성 수 만큼 모달을 만드는걸로?
	                            <button type="button" data-toggle="modal" data-target="#updateEnrollForm" 
	                            data-rewardPrice="${ r.rewardPrice }" data-quantityLimit="${ r.quantityLimit }" data-rewardTitle="${ r.rewardTitle }"
	                            data-rewardExplain="${ r.rewardExplain }" data-deliveryStart="${ r.deliveryStart }" data-rewardNo="${ r.rewardNo }"
	                            data-optionType="${ r.optionType }" data-choiceOption="${ r.choiceOption }" data-inputOption="${ r.inputOption }">편집</button>
	                            <button type="button">삭제</button>
	                         -->
	                        </div>
	               		</div>
	               		<!-- 리워드 수정 modal -->
		                <form id="updateReward" action="updateReward.pro">
			                <div class="modal fade" id="updateEnrollForm${ r.rewardNo }">
			                    <div class="modal-dialog modal-lg">
			                        <div class="modal-content">
			                      
			                            <!-- Modal Header -->
			                            <div class="modal-header">
			                                <h4 class="modal-title">리워드 추가</h4>
			                                <button type="button" class="close" data-dismiss="modal">&times;</button>
			                            </div>
			                            
			                            <!-- Modal body -->
			                            <div class="modal-body">
		                                   	<input type="hidden" name="rewardNo" value="${ r.rewardNo }">
		                                    <div>
		                                        <p id="title">금액</p>
		                                        <input type="text" name="rewardPrice" id="rewardPrice" placeholder="금액 입력"  value="${ r.rewardPrice }" required>
		                                        <span>원</span>
		                                    </div>
		                                    <br>
		                                    <div>
		                                        <p id="title">리워드명</p>
		                                        <input type="text" name="rewardTitle" id="rewardTitle" placeholder="타이틀 입력 ex) [얼리버드] 기본 리워드" style="width:80%;" onkeyup="fn_checkByte1(this);" value="${ r.rewardTitle }" required>
		                                        <p id="counter1">150자 남음</p>
		                                    </div>
		                                    <br>
		                                    <div>
		                                        <p id="title">상세설명</p>
		                                        <textarea name="rewardExplain" id="rewardExplain" cols="40" rows="10" placeholder="제공하는 리워드가 무엇인지 간략하게 제시해주세요." style="resize: none;width: 80%; font-size: 15px;" onkeyup="fn_checkByte2(this);" required>${ r.rewardExplain }</textarea>
		                                        <p id="counter2">400자 남음</p>
		                                    </div>
		                                    <br>
		                                    <div>
		                                        <p id="title">옵션 조건</p>
		                                        <select name="optionType" id="optionType${ r.rewardNo }">
		                                            <option value="">옵션 조건 유형을 선택하세요.</option>
		                                            <option value="1">옵션 없음</option>
		                                            <option value="2">선택 옵션(사이즈, 색상 등)</option>
		                                            <option value="3">직접 입력 옵션(각인, 메시지 등)</option>
		                                            <option value="4">선택 옵션과 직접 입력 옵션</option>
		                                        </select>
		                                        <script>
		                                        	// 선택 옵션에서 값 지우기 제대로 안됨 + 모달을 각 번호마다 생성해서 각 스크립트 쓰는 id도 전부 번호 넣어줘야함 모달 값 보내는거 알면 수정 data-어쩌구 하는건 안됨
		                                        	$(function(){
								                		$("#optionType${ r.rewardNo } option[value=" + ${ r.optionType } + "]").attr('selected', 'selected');
								                		if($("#optionType${ r.rewardNo }").val() == 2){
								                			$("#choiceOptionArea${ r.rewardNo }").css('display','block');
								                		}else if($("#optionType${ r.rewardNo}").val() == 3){
								                			$("#inputOptionArea${ r.rewardNo }").css('display', 'block');
								                		}else if($("#optionType${ r.rewardNo }").val() == 4){
								                			$("#choiceOptionArea${ r.rewardNo }").css('display','block');
								                			$("#inputOptionArea${ r.rewardNo }").css('display', 'block');
								                		}
								                	});
		                                        
		                                            $(function(){
		                                                $("#optionType${ r.rewardNo }").on("change", function(){
		                                                    var option = $("#optionType${ r.rewardNo }").val();
		                                                    if(option == 1){
		                                                        $("#choiceOptionArea${ r.rewardNo }").css('display','none');
		                                                        $("#inputOptionArea${ r.rewardNo }").css('display', 'none');
		                                                        $("#choiceOption${ r.rewardNo }").val(''); // 값 비우기
		                                                        $("#inputOption${ r.rewardNo }").val('');
		                                                    }else if(option == 2){
		                                                        $("#choiceOptionArea${ r.rewardNo }").css('display','block');
		                                                        $("#inputOptionArea${ r.rewardNo }").css('display', 'none');
		                                                        $("#inputOption${ r.rewardNo }").val('');
		                                                    }else if(option == 3){
		                                                        $("#inputOptionArea${ r.rewardNo }").css('display', 'block');
		                                                        $("#choiceOptionArea${ r.rewardNo }").css('display', 'none');
		                                                        $("#choiceOption${ r.rewardNo }").val('');
		                                                    }else if(option == 4){
		                                                        $("#choiceOptionArea${ r.rewardNo }").css('display','block');
		                                                        $("#inputOptionArea${ r.rewardNo }").css('display', 'block');
		                                                    }
		                                                })
		                                            })
		                                        </script>
		                                        <!-- 1은 변화 x -->
		                                        <!-- 2 선택 옵션 -->
		                                        <div id="choiceOptionArea${ r.rewardNo }" style="clear:both; display:none;margin-left: 110px">
		                                            <p style="margin-bottom:3px;">옵션 설정</p>
		                                            <textarea name="choiceOption" id="choiceOption${ r.rewardNo }" cols="30" rows="10" placeholder="옵션 값을 입력하세요.&#10;옵션 값은 /로 구분 됩니다.&#10;ex) 블랙, M/화이트, L" style="resize: none;width: 80%;">${ r.choiceOption }</textarea>
		                                            <p style="font-size:14px;margin-bottom: 3px;">옵션 미리보기</p>
		                                            <select name="optionBox" id="optionBox${ r.rewardNo }">
		                                                <option value="">옵션 선택</option>
		                                            </select>
		                                        </div>
		                                        <script>
		                                            $(function(){
		                                                $("#choiceOption${ r.rewardNo }").on("change", function(){
		                                                    var selectOption = $("#choiceOption${ r.rewardNo }").val();
		                                                    var selectOpSplit = selectOption.split('/');
		                                                    
		                                                    if(selectOption == ''){
		                                                        console.log("실행1");
		                                                        for(var i in selectOpSplit){
		                                                            $("#optionBox${ r.rewardNo } option").remove();
		                                                            $("#optionBox${ r.rewardNo }").append('<option value="">옵션 선택</option>');
		                                                        }
		                                                    }
		                                                    for(var i in selectOpSplit){
		                                                        console.log("실행2");
		                                                        $("#optionBox${ r.rewardNo }").append('<option value=' + selectOpSplit[i] + '>' + selectOpSplit[i] + '</option>');
		                                                    }
		                                                })
		                                            })       
		                                        </script>
		                                        <br>
		                                        <!-- 3 직접 입력 옵션 -->
		                                        <div id="inputOptionArea${ r.rewardNo }" style="clear:both; display:none; margin-left: 110px;">
		                                            <input type="text" id="inputOption${ r.rewardNo }" name="inputOption" placeholder="입력 옵션을 작성해주세요." value="${ r.inputOption }" style="width: 80%; margin-left: 0px;">
		                                            <p style="font-size:13px;color:#8a8a8a;margin-top:3px;">예시) 한글 10자, 영문 15자 이내 각인 메시지를 입력하세요.</p>
		                                        </div>
		                                        <!-- 4 선택 & 직접 옵션 -->
		                                    </div>
		                                    <br>
		                                    <div>
		                                        <p id="title">제한수량</p>
		                                        <input type="number" name="quantityLimit" placeholder="수량 입력" value="${ r.quantityLimit }">
		                                        <span>&nbsp;&nbsp;&nbsp;개</span>
		                                    </div>
		                                    <br>
		                                    <div>
		                                        <p id="title">발송시작일</p>
		                                        <select name="deliveryStartDate1" id="deliveryStartDate${ r.rewardNo }">
		                                            <option value="">연도/월</option>
		                                            <!-- 날짜 더하기 힘들어서 일단 이거 -->
		                                            <c:forEach var="i" begin="1" end="12">
		                                                <c:set var="now" value="<%=new Date()%>" />
		                                                <c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set> 
		                                                <option value="${ sysYear }/${i>9?i:'0'}${i>9?'':i}">${ sysYear }/${i>9?i:'0'}${i>9?'':i}</option>
		                                            </c:forEach>
		                                            <!-- jsp로 변경해서 for문 이용하기 -->
		                                        </select>
		                                        <select name="deliveryStartDate2" id="deliveryStart${ r.rewardNo }">
		                                            <option value="">시기</option>
		                                            <option value="초(1~10일)">초(1~10일)</option>
		                                            <option value="중순(11~20일)">중순(11~20일)</option>
		                                            <option value="말(21~말일)">말(21~말일)</option>
		                                        </select>
		                                        <script>
		                                        // 이건 왜 select가 안될까
		                                        	$(function(){
		                                        		$("#deliveryStartDate${ r.rewardNo } option[value=" + ${ r.deliveryStartDate1 } + "]").attr('selected', 'selected');
		                                        		$("#deliveryStart${ r.rewardNo } option[value=" + ${ r.deliveryStartDate2 } + "]").attr('selected', 'selected');
		                                        	})
		                                        </script>
		                                    </div>
		                                    <br>
		                                    <div>
		                                        <p id="ref">- 설정한 발송 시작일까지 리워드가 발송되지 않을 경우, 서포터가 펀딩금 반환을 신청할 수 있으니 신중하게 선택하세요.</p>
		                                        <p id="ref">
		                                            - 종료일+11개월(2022-04-29)까지 리워드 발송이 시작되지 않은 경우, 
		                                            2022-04-21에 미발송 상태인 서포터의 펀딩금이 자동으로 완료 처리(결제 취소)되니 유의하세요.
		                                        </p>
		                                    </div>
		                                </div>
		                                <!-- Modal footer -->
		                                <div class="modal-footer">
		                                    <div class="btn" style="margin:auto;">
		                                        <button type="reset" id="resetBtn" data-dismiss="modal">취소</button>
		                                        <button type="submit" id="submitBtn">등록</button>
		                                    </div>
		                                </div>
			                        </div>
			                    </div>
			                </div>
			            </form>
	                </c:forEach>
                </div>
                <br><br>
                <div style="clear:both;">
                    <button id="submitBtn" type="button" style="width:170px;" onclick="location.href='fundingHome2.pro?pno=${ pno }'">펀딩 준비 홈 가기</button>
                </div>
                <br><br><br><br><br><br>

                <!-- 리워드 등록 modal -->
                <form id="insertReward" action="insertReward.pro">
	                <div class="modal fade" id="rewardEnrollForm">
	                    <div class="modal-dialog modal-lg">
	                        <div class="modal-content">
	                      
	                            <!-- Modal Header -->
	                            <div class="modal-header">
	                                <h4 class="modal-title">리워드 추가</h4>
	                                <button type="button" class="close" data-dismiss="modal">&times;</button>
	                            </div>
	                            
	                            <!-- Modal body -->
	                            <div class="modal-body">
                                    <div>
                                        <p id="title">금액</p>
                                        <input type="text" name="rewardPrice" id="rewardPrice" placeholder="금액 입력" required>
                                        <span>원</span>
                                    </div>
                                    <br>
                                    <div>
                                        <p id="title">리워드명</p>
                                        <input type="text" name="rewardTitle" id="rewardTitle" placeholder="타이틀 입력 ex) [얼리버드] 기본 리워드" style="width:80%;" onkeyup="fn_checkByte1(this);" required>
                                        <p id="counter1">150자 남음</p>
                                    </div>
                                    <br>
                                    <div>
                                        <p id="title">상세설명</p>
                                        <textarea name="rewardExplain" id="rewardExplain" cols="40" rows="10" placeholder="제공하는 리워드가 무엇인지 간략하게 제시해주세요." style="resize: none;width: 80%; font-size: 15px;" onkeyup="fn_checkByte2(this);" required></textarea>
                                        <p id="counter2">400자 남음</p>
                                    </div>
                                    <br>
                                    <div>
                                        <p id="title">옵션 조건</p>
                                        <select name="optionType" id="optionType">
                                            <option value="">옵션 조건 유형을 선택하세요.</option>
                                            <option value="1">옵션 없음</option>
                                            <option value="2">선택 옵션(사이즈, 색상 등)</option>
                                            <option value="3">직접 입력 옵션(각인, 메시지 등)</option>
                                            <option value="4">선택 옵션과 직접 입력 옵션</option>
                                        </select>
                                        <script>
                                        // 선택 옵션에서 값 지우기 제대로 안됨
                                            $(function(){
                                                $("#optionType").on("change", function(){
                                                    var option = $("#optionType").val();
                                                    if(option == 1){
                                                        $("#choiceOptionArea").css('display','none');
                                                        $("#inputOptionArea").css('display', 'none');
                                                        $("#choiceOption").val(''); // 값 비우기
                                                        $("#inputOption").val('');
                                                    }else if(option == 2){
                                                        $("#choiceOptionArea").css('display','block');
                                                        $("#inputOptionArea").css('display', 'none');
                                                        $("#inputOption").val('');
                                                    }else if(option == 3){
                                                        $("#inputOptionArea").css('display', 'block');
                                                        $("#choiceOptionArea").css('display', 'none');
                                                        $("#choiceOption").val('');
                                                    }else if(option == 4){
                                                        $("#choiceOptionArea").css('display','block');
                                                        $("#inputOptionArea").css('display', 'block');
                                                    }
                                                })
                                            })
                                        </script>
                                        <!-- 1은 변화 x -->
                                        <!-- 2 선택 옵션 -->
                                        <div id="choiceOptionArea" style="clear:both; display:none;margin-left: 110px">
                                            <p style="margin-bottom:3px;">옵션 설정</p>
                                            <textarea name="choiceOption" id="choiceOption" cols="30" rows="10" placeholder="옵션 값을 입력하세요.&#10;옵션 값은 /로 구분 됩니다.&#10;ex) 블랙, M/화이트, L" style="resize: none;width: 80%;"></textarea>
                                            <p style="font-size:14px;margin-bottom: 3px;">옵션 미리보기</p>
                                            <select name="optionBox" id="optionBox">
                                                <option value="">옵션 선택</option>
                                            </select>
                                        </div>
                                        <script>
                                            $(function(){
                                                $("#choiceOption").on("change", function(){
                                                    var selectOption = $("#choiceOption").val();
                                                    var selectOpSplit = selectOption.split('/');
                                                    
                                                    if(selectOption == ''){
                                                        console.log("실행1");
                                                        for(var i in selectOpSplit){
                                                            $("#optionBox option").remove();
                                                            $("#optionBox").append('<option value="">옵션 선택</option>');
                                                        }
                                                    }
                                                    for(var i in selectOpSplit){
                                                        console.log("실행2");
                                                        $("#optionBox").append('<option value=' + selectOpSplit[i] + '>' + selectOpSplit[i] + '</option>');
                                                    }
                                                })
                                                
                                            })                                        
                                        </script>
                                        <br>
                                        <!-- 3 직접 입력 옵션 -->
                                        <div id="inputOptionArea" style="clear:both; display:none; margin-left: 110px;">
                                            <input type="text" id="inputOption" name="inputOption" placeholder="입력 옵션을 작성해주세요." style="width: 80%; margin-left: 0px;">
                                            <p style="font-size:13px;color:#8a8a8a;margin-top:3px;">예시) 한글 10자, 영문 15자 이내 각인 메시지를 입력하세요.</p>
                                        </div>
                                        <!-- 4 선택 & 직접 옵션 -->
                                    </div>
                                    <br>
                                    <div>
                                        <p id="title">제한수량</p>
                                        <input type="number" name="quantityLimit" placeholder="수량 입력">
                                        <span>&nbsp;&nbsp;&nbsp;개</span>
                                    </div>
                                    <br>
                                    <div>
                                        <p id="title">발송시작일</p>
                                        <select name="deliveryStartDate1" id="deliveryStartDate">
                                            <option value="">연도/월</option>
                                            <!-- 날짜 더하기 힘들어서 일단 이거 -->
                                            <c:forEach var="i" begin="1" end="12">
                                                <c:set var="now" value="<%=new Date()%>" />
                                                <c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set> 
                                                <option>${ sysYear }/${i>9?i:'0'}${i>9?'':i}</option>
                                            </c:forEach>
                                            <!-- jsp로 변경해서 for문 이용하기 -->
                                        </select>
                                        <select name="deliveryStartDate2" id="deliveryStart">
                                            <option value="">시기</option>
                                            <option value="초(1~10일)">초(1~10일)</option>
                                            <option value="중순(11~20일)">중순(11~20일)</option>
                                            <option value="말(21~말일)">말(21~말일)</option>
                                        </select>
                                    </div>
                                    <br>
                                    <div>
                                        <p id="ref">- 설정한 발송 시작일까지 리워드가 발송되지 않을 경우, 서포터가 펀딩금 반환을 신청할 수 있으니 신중하게 선택하세요.</p>
                                        <p id="ref">
                                            - 종료일+11개월(2022-04-29)까지 리워드 발송이 시작되지 않은 경우, 
                                            2022-04-21에 미발송 상태인 서포터의 펀딩금이 자동으로 완료 처리(결제 취소)되니 유의하세요.
                                        </p>
                                    </div>
                                </div>
                                <!-- Modal footer -->
                                <div class="modal-footer">
                                    <div class="btn" style="margin:auto;">
                                        <button type="reset" id="resetBtn" data-dismiss="modal">취소</button>
                                        <button type="submit" id="submitBtn">등록</button>
                                    </div>
                                </div>
	                        </div>
	                    </div>
	                </div>
	            </form>
                <script>
                    function fn_checkByte1(obj){
                        const maxByte = 150; //최대 1500바이트
                        const text_val = obj.value; //입력한 문자
                        const text_len = text_val.length; //입력한 문자수
                            
                        let totalByte = 0;
                        for(let i=0; i<text_len; i++){
                            const each_char = text_val.charAt(i);
                            const uni_char = escape(each_char) //유니코드 형식으로 변환

                            // console.log(uni_char);
                            // console.log(uni_char.length);

                            if(uni_char.length>4){
                                // 한글 : 2Byte
                                totalByte += 2;
                            }else{
                                // 영문,숫자,특수문자 : 1Byte
                                totalByte += 1;
                            }
                        }
                            
                        let currentByte = 150-totalByte;
                        if(totalByte>maxByte){
                            alert('최대 1500Byte까지만 입력가능합니다.');
                                
                            document.getElementById("counter1").innerText = currentByte+"자 남음";
                            document.getElementById("counter1").style.color = "red";
                        }else{
                            document.getElementById("counter1").innerText = currentByte+"자 남음";
                            document.getElementById("counter1").style.color = "green";
                        }
                    }

                    function fn_checkByte2(obj){
                        const maxByte = 400; //최대 1500바이트
                        const text_val = obj.value; //입력한 문자
                        const text_len = text_val.length; //입력한 문자수
                            
                        let totalByte = 0;
                        for(let i=0; i<text_len; i++){
                            const each_char = text_val.charAt(i);
                            const uni_char = escape(each_char) //유니코드 형식으로 변환

                            // console.log(uni_char);
                            // console.log(uni_char.length);

                            if(uni_char.length>4){
                                // 한글 : 2Byte
                                totalByte += 2;
                            }else{
                                // 영문,숫자,특수문자 : 1Byte
                                totalByte += 1;
                            }
                        }
                            
                        let currentByte = 400-totalByte;
                        if(totalByte>maxByte){
                            alert('최대 1500Byte까지만 입력가능합니다.');
                                
                            document.getElementById("counter2").innerText = currentByte+"자 남음";
                            document.getElementById("counter2").style.color = "red";
                        }else{
                            document.getElementById("counter2").innerText = currentByte+"자 남음";
                            document.getElementById("counter2").style.color = "green";
                        }
                    }
					/*                    
                    var rewardNo="";
                    var rewardTitle="";
                    var rewardPrice="";
                    var rewardExplain="";
                    var optionType="";
                    var choiceOption="";
                    var inputOption="";
                    var quantityLimit="";
                    var deliveryStart="";

                    $(document).ready(function() {     
                        $('#updateReward').on('show.bs.modal', function(event) {          
                        	rewardNo = $(event.relatedTarget).data('rewardNo');
                        	rewardTitle = $(event.relatedTarget).data('rewardTitle');
                        	rewardExplain = $(event.relatedTarget).data('rewardExplain');
                        	optionType = $(event.relatedTarget).data('optionType');
                        	choiceOption = $(event.relatedTarget).data('choiceOption');
                        	inputOption = $(event.relatedTarget).data('inputOption');
                        	quantityLimit = $(event.relatedTarget).data('quantityLimit');
                        	deliveryStart = $(event.relatedTarget).data('deliveryStart');
                        	
                        	console.log(deliveryStart);
                        	console.log(quantityLimit);
                        	console.log(inputOption);
                        	console.log(choiceOption);
                        	console.log(optionType);
                        	console.log(rewardExplain);
                        	console.log(rewardPrice);
                        	console.log(rewardTitle);
                        	console.log(rewardNo);
                        	
                        });
                    });
                    */
                </script>
            </div>
            <div id="content2"></div>
        </div>
    </div>
</body>
</html>