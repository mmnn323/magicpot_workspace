<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>단계3</title>
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
    .step-state.step3 ul li:nth-child(-n+3):before{
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

    /* content */
    #content1{padding-left:50px}
    #summary{color:#757575;margin-bottom: -3px;}
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
    #level_summary{margin-top:-3px;color:#757575}
    #level{color:black;font-weight:900;}
</style>
</head>
<body>
    <div class="wrap">
    	<jsp:include page="basicTemplateMenuDisabled.jsp"/>  
		<div id="content">
			<!-- 상태바 : preview에선 안보이는데 페이지에서는 보임 -->
			<div class="step-box">
				<div class="step-state step3">
					<ul>
						<li><p></p></li>
						<li><p></p></li>
						<li><p></p></li>
						<li><p></p></li>
					</ul>
				</div>
			</div>
			<div id="content1">
				<h5 id="summary">프로젝트가 성공적으로 종료되면</h5>
				<h3 style="font-weight:600;">아래와 같은 프로세스로 진행됩니다.</h3>
				<br><br>
                    
				<h5 id="level">펀딩 종료 및 결제 진행</h5>
				<h6 id="level_summary">결제는 종료일 +1영업일로부터 최대 4영업일까지 진행됩니다.</h6>
				<br>

				<h5 id="level">바로 정산</h5>
				<h6 id="level_summary">펀딩이 성공적으로 종료 후, 최종 결제 금액의 일부가 정산금으로 지급됩니다.</h6>
				<br>

				<h5 id="level">리워드 발송</h5>
				<h6 id="level_summary">크리에이터는 리워드 준비 및 발송을 진행하며 발송 후에는 발송 정보에 대한 발송 상태를 변경해야합니다.</h6>
				<br>

				<h5 id="level">펀딩금 반환 <p style="display: inline;font-size:12px;color:#757575">(신청한 서포터가 있는 경우에 한함)</p></h5>
				<h6 id="level_summary">펀딩한 서포터는 리워드 하자 및 배송 지연에 대한 펀딩금 반환을 신청할 수 있습니다.</h6>
				<br>

				<h5 id="level">최종 정산</h5>
				<h6 id="level_summary">리워드 발송과 펀딩금 반환이 모두 완료되면 최종정산이 진행됩니다.</h6>

				<br><br><br>
				<button type="button" id="before_btn" onclick="location.href='level2.pro'">이전</button> 
				&nbsp;
				<button type="button" id="after_btn" onclick="location.href='level4.pro'">다음</button>
			</div>
		</div>
	</div>
</body>
</html>