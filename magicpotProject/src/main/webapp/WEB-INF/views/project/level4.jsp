<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>단계4</title>
<style>
    /* 상태바 */
	ul{list-style: none} /* ul표시 없앰 */
    .step-state ul:after{
        content: '';
        display: block;
        clear: both
    }
    .step-state ul li{
        float: left;
        position: relative;
        width: 25%; /* 4개 진행바를 4등분*/
        padding-top: 50px; /* 진행바 영역 확보*/
    }
    /* 회색 진행바 */
    .step-state ul li:before{
        /* border:1px solid pink; */
        position: absolute;
        top: -13px;
        left: -43px;
        right: 0;
        height: 3px; /* 진행바 두께 */
        background: #ddd;
        content: '';
    }
    /* 활성화 상태바 표시 */
    .step-state.step4 ul li:nth-child(-n+4):before{
        background: rgb(116, 152, 107);
    }
    /* 1/2영역 비활성화 */
    .step-state ul li p:before{
        position:  absolute;
        top:35px;
        left:50%;
        right: 0;
        height: 3px;
        content: '';
    }
    .step-state.step2 ul li:nth-child(3) p:before{
        position: absolute;
        top: -13px;
        background:#ddd;
    }

    /* content */
    #content1{padding-left:50px}
    #summary{color:#757575;margin-top: -3px;}
    #before_btn{
        font-size: 18px;
        font-weight: 600;
        color:white;
        background-color:#c7c7c7;
        width: 100px;
        height: 35px;
        border:none;
        border-radius: 5px;
        float:left;
    }
    #after_btn{
        font-size: 18px;
        font-weight: 600;
        color:white;
        background-color:rgb(116, 152, 107);
        width: 100px;
        height: 35px;
        border:none;
        border-radius: 5px;
    }
    
    /* checkbox */
    input[type="checkbox"] {
        display: none;
    }
    input[type="checkbox"]+label {
    display: inline-block;
    padding-left:32px;
    height: 23px;
    background: url('resources/images/common/check-mark.png') no-repeat 0 0px / contain;
    }
    input[type='checkbox']:checked+label {
        background: url('resources/images/common/checked.png') no-repeat 0 1px / contain;
    }
    label{font-size: 17px;}
</style>
</head>
<body>
    <div class="wrap">
    	<jsp:include page="basicTemplateMenuDisabled.jsp"/>
		<div id="content">
			<!-- 상태바 : preview에선 안보이는데 페이지에서는 보임 -->
			<div class="step-box">
				<div class="step-state step4">
					<ul>
						<li><p></p></li>
						<li><p></p></li>
						<li><p></p></li>
						<li><p></p></li>
					</ul>
				</div>
			</div>
			<div id="content1">
				<h3 style="font-weight:600;">마지막으로 기본 사항을 확인하세요.</h3>
				<h5 id="summary">
					크리에이터님의 프로젝트를 등록하려면 일정 기준에 부합해야합니다.<br>
	                            프로젝트를 작성하기 전에 다음 기준을 충족하는지 확인해보세요.
				</h5>
		     	<br><br>
	                    
				<input type="checkbox" id="check1" name="checkOne">
				<label for="check1">펀딩 진행 중에는 제공할 리워드를 다른 온/오프라인에서 펀딩하거나 판매하지 않습니다.</label>
				<br><br>
			
				<input type="checkbox" id="check2" name="checkOne">
				<label for="check2">제공할 리워드는 현금, 지분 등의 수익이 아닌 제품 또는 서비스입니다.</label>
				<br><br>
	
				<input type="checkbox" id="check3" name="checkOne">
				<label for="check3">
	                        진행할 프로젝트 및 리워드가 제 3자의 지식재산권을 침해하지 않으며, <br>
	                        매직팟이 침해 사실을 인지하는 경우 해당 프로젝트를 중단/취소할 수 있습니다.
				</label>
				<br><br>
	
				<input type="checkbox" id="check4" name="checkOne">
				<label for="check4">서포터에게 프로젝트 진행 과정을 안내하고, 배송 약속을 지킬 수 있습니다.</label>
				<br><br>
	
				<input type="checkbox" id="check5" name="checkOne">
				<label for="check5">
	                        서포터와의 신뢰를 위해 펀딩 진행 리워드 제작 배송 등 모든 과정에서 겪는 어려움들을 <br>
	                        서포터에게 진솔하게 전달하고 문제를 해결합니다.
				</label>
				<br><br>
	
				<input type="checkbox" id="check6" name="checkOne">
				<label for="check6">리워드의 관계 법령 및 관련 광고 심의 규정을 준수하여 스토리를 작성하겠습니다.</label>
				<br><br><br>
		
				<input type="checkbox" id="checkAll" name="checkAll">
				<label for="checkAll" style="color:rgb(116, 152, 107);">전체 선택</label>
				<br><br>
	
				<script>
					function allCheckFunc( obj ) {
						$("[name=checkOne]").prop("checked", $(obj).prop("checked") );
	                }
					/* 체크박스 체크시 전체선택 체크 여부 */
				    function oneCheckFunc( obj ) {
						var allObj = $("[name=checkAll]");
						var objName = $(obj).attr("name"); // checkOne
	
						if( $(obj).prop("checked") ){
							checkBoxLength = $("[name="+ objName +"]").length; // [name=checkOne] 전체 체크박스 개수
							checkedLength = $("[name="+ objName +"]:checked").length; // [name=checkOne]:checked 전체 체크된 체크박스 개수
							// check된 경우 안된경우 다른 길이로 비교
				
							if( checkBoxLength == checkedLength ) { // [name=checkOne]
								allObj.prop("checked", true); // checkAll의 checked true
	                        } else { // [name=checkOne] == [name=checkOne]:checked
								allObj.prop("checked", false); // checkAll의 checked false
							}
						}else{
							allObj.prop("checked", false);
						}
					}
			
					$(function(){
						$("[name=checkAll]").click(function(){
							allCheckFunc( this ); // checkAll
							// console.log($("[name=checkAll]").is(":checked"));
	
							// checkAll 되었을때 disabled 삭제!
							if($("[name=checkAll").is(":checked") == true){
								// console.log($("[name=checkAll]").is(":checked"));
								$("#after_btn").removeAttr("disabled");
							}else{
								$("#after_btn").attr("disabled", true);
								// console.log($("[name=checkAll]").is(":checked"));
							}
						});
	
					$("[name=checkOne]").each(function(){
						$(this).click(function(){
							oneCheckFunc( $(this) ); // checkOne
	                                    
							// 계속 반복해서 전체 선택이 된 경우에 disabled삭제! 
							if($("[name=checkAll]").is(":checked") == true){
								$("#after_btn").removeAttr("disabled");
									console.log($("[name=checkAll]").is(":checked"));
								}else{
									$("#after_btn").attr("disabled", true);
									console.log($("[name=checkAll]").is(":checked"));
								}
							});
						});
					});
				</script>
	
				<br>
				<button type="button" id="before_btn" onclick="location.href='level3.pro'">이전</button> 
				&nbsp;
				<!-- 전체 선택 되어야 넘어가고 전체 선택 안되어있으면 버튼 클릭안됨 -->
				<!-- session에 ranNo있을때 fundingHome1.pro -->
				<button type="button" id="after_btn" onclick="location.href='fundingHome1.pro'" disabled>다음</button>
			</div>
		</div>
	</div>
</body>
</html>