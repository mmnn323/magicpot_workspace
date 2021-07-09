<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>단계2</title>
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
    .step-state.step2 ul li:nth-child(-n+2):before{
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
    .step-state.step2 ul li:nth-child(2) p:before{
        position: absolute;
        top: -13px;
        background:#ddd;
    }

    /* content */
    #content1{padding-left: 50px}
    #summary{
        margin-top: -5px;
        color: #757575;
    }
    #beforeBtn{
        float: left;
        width: 100px;
        height: 35px;
        border: none;
        border-radius: 5px;
        background-color: #c7c7c7;
        font-size: 18px;
        font-weight: 600;
        color: white;
    }
    #afterBtn{
        width: 100px;
        height: 35px;
        border: none;
        border-radius: 5px;
        background-color: rgb(116, 152, 107);
        font-size: 18px;
        font-weight: 600;
        color: white;
    }
    #levelSummary{
        margin-top: -3px;
        color: #757575
    }
    #level{
        color: black;
        font-weight: 900;
    }  
</style>
</head>
<body>
    <div class="wrap">
		<jsp:include page="basicTemplateMenuDisabled.jsp"/>   
		<div id="content">
			<!-- 상태바 : preview에선 안보이는데 페이지에서는 보임 -->
			<div class="step-box">
				<div class="step-state step2">
					<ul>
						<li><p></p></li>
						<li><p></p></li>
						<li><p></p></li>
						<li><p></p></li>
					</ul>
				</div>
			</div>
			<div id="content1">
				<h3 style="font-weight:600;">프로젝트는 4단계에 걸쳐 오픈됩니다.</h3>
				<h5 id="summary">
					아래와 같은 4단계의 진행과정을 통해 프로젝트가 오픈됩니다.<br>
					투명하고 신뢰도 있는 프로젝트를 오픈하기 위해 꼭 필요한 절차이니 차근차근 진행해주세요.
				</h5>
				<br><br>

				<h5 id="level">1단계 : 펀딩 준비 작성</h5>
				<h6 id="levelSummary">펀딩 준비 메뉴들의 필수항목을 모두 작성하여 제출해주세요.</h6>
				<br>

				<h5 id="level">2단계 : 요건 확인 진행</h5>
				<h6 id="levelSummary">
                	        크리에이터님이 작성하신 항목들을 토대로 매직팟 펀딩을 진행하기 위한 기본 요건이 충족되는지 확인합니다.<br>
                        (영업일 기준 3~5일 소요)
				</h6>
				<br>

				<h5 id="level">3단계 : 콘텐츠 확인 진행</h5>
				<h6 id="levelSummary">
            	            요건 확인 완료 시, 프로젝트의 핵심인 스토리를 중심으로 콘텐츠를 확인합니다.<br>
             	           필요 시, 매직팟 담당자가 피드백을 반영 요청할 수 있습니다.
				</h6>
				<br>
                    
				<h5 id="level">4단계 : 펀딩 오픈</h5>
				<h6 id="levelSummary">모든 준비가 완료되면 오픈이 승인됩니다. 크리에이터님이 직접 '바로 오픈' 혹은 '오픈 예약' 할 수 있습니다.</h6>

				<br><br><br>
				<button type="button" id="beforeBtn" onclick="location.href='level1.pro'">이전</button> 
				&nbsp;
				<button type="button" id="afterBtn" onclick="location.href='level3.pro'">다음</button>
			</div>
		</div>
    </div>
</body>
</html>