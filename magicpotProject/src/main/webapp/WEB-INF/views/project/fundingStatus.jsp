<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 현황</title>
<!-- css -->
<link rel="stylesheet" href="resources/css/funding/fundingStatus.css">
</head>
<body>
    <div class="wrap">
        <jsp:include page="basicTemplateMenuAllAbled.jsp"/>
        <div id="content">
            <div id="content1">
                <h3 style="font-weight:600;">펀딩 현황</h3>
                <h5 id="summary">현재 프로젝트의 현황과 결제 예약 현황을 확인해 프로젝트의 상황을 파악해보세요.</h5>
                <br><br>
                <h5>프로젝트 번호 : ${ pro.proNo }</h5>
                <br>
                <h5><i class="far fa-clipboard"></i> ${ pro.category.caName }</h5>
                <br>
                <h5><i class="fas fa-briefcase"></i> ${ proPrice } 원 목표</h5>
                <br>
                <h5><i class="far fa-calendar"></i> ${ pro.openDate }~${ pro.closeDate } 자정마감</h5>
                
                <hr>
                <br>
                <div id="proStatus">
                    <h4>프로젝트 현황</h4>
                    <div id="supporter" align="center">
                        <p id="title">서포터 응원</p>
                        <h3 id="qty">${ map.supCount }개</h3>
                    </div>
                    <div id="review" align="center">
                        <p id="title">체험 리뷰</p>
                        <h3 id="qty">${ map.reviewCount }개</h3>
                    </div>
                </div>
                <hr>
                <br>
                <div id="orderStatus">
                    <h4>펀딩 결제 예약 현황</h4>
                    <div id="reservation" align="center">
                        <p id="title2">펀딩 후원 금액</p>
                        <h4>${ proFunPrice } 원</h4>
                    </div>
                    <div id="achievement" align="center">
                        <p id="title2">펀딩 달성률</p>
                        <h4>${Math.round(pro.proFundPrice div pro.proPrice*100)} %</h4>
                    </div>
                    <div id="count" align="center">
                        <p id="title2">펀딩 건 수</p>
                        <h4>${ map.orderCount }건</h4>
                    </div>
                </div>
            </div>
            <div id="content2"></div>
        </div>
    </div>
</body>
</html>