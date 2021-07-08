<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>단계1</title>
</head>
<style>
	.wrap{
	    width: 1000px;
	    height: 800px;
	    margin: auto;
	    font-family: 'Noto Sans KR', sans-serif;
	}

	/* 상태바 */
	ul{list-style: none} /* ul표시 없앰 */
    .step-state ul:after{
        content:'';
        display:block;
        clear:both
    }
    .step-state ul li{
        float:left;
        position:relative;
        width:25%; /* 4개 진행바를 4등분*/
        padding-top:50px; /* 진행바 영역 확보*/
        /* border:1px solid pink; */
    }
    /* 회색 진행바 */
    .step-state ul li:before{
        /* border:1px solid pink; */
        position:absolute;
        top:-13px;
        left:-43px;
        right:0;
        height:3px; /* 진행바 두께 */
        background:#ddd;
        content:'';
    }
    /* 활성화 상태바 표시 */
    .step-state.step1 ul li:nth-child(1):before{
        background:rgb(116, 152, 107);
    }
    /* 1/2영역 비활성화 */
    .step-state ul li p:before{
        position:absolute;
        top:35px;
        left:50%;
        right:0;
        height:3px;
        content:'';
    }
    /* content */
    #content1{padding-left: 50px}
    h5{color: #757575}
    #content #btn{
        width: 100px;
        height: 35px;
        border: none;
        border-radius: 5px;
        background-color: rgb(116, 152, 107);
        font-size: 18px;
        font-weight: 600;
        color: white;
    }
</style>
<body>
    <div class="wrap">
    	<jsp:include page="basicTemplateMenuDisabled.jsp"/>
		<div id="content">
			<!-- 상태바 : preview에선 안보이는데 페이지에서는 보임 -->
			<div class="step-box">
				<div class="step-state step1">
					<ul>
						<li><p></p></li>
						<li><p></p></li>
						<li><p></p></li>
						<li><p></p></li>
					</ul>
				</div>
			</div>
			<div id="content1">
				<h3 style="font-weight:600;">${ creator.creName } 님, 반갑습니다!</h3>
					<h5>프로젝트 개설을 축하드리며, <br>
                                         서포터에게 잊지 못할 프로젝트 경험을 선사하고 크리에이터님의 성공적인 펀딩을 위해
                                         매직팟이 함께 협력할 수 있기를 기대합니다.
					</h5>
				<br><br>
				<h5>자 시작해볼까요?</h5>
				<br>
				<button type="button" id="btn" onclick="location.href='level2.pro'">다음</button>
				<!-- level2로 이동 -->
			</div>
		</div>
    </div>

</body>
</html>