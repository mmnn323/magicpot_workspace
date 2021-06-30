<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <h5>프로젝트 번호 : 11473</h5>
                <br>
                <h5><i class="far fa-clipboard"></i> LIVING</h5>
                <br>
                <h5><i class="fas fa-briefcase"></i> 3,000,000 원 목표</h5>
                <br>
                <h5><i class="far fa-calendar"></i> 2021.05.27~2021.10.27 자정마감</h5>
                <div id="fundingDate">
                    <span id="fundingDate1">진행중</span>
                    <span id="fundingDate2">(120일 남음)</span>
                </div>
                <hr>
                <br>
                <div id="proStatus">
                    <h4>프로젝트 현황</h4>
                    <div id="supporter" align="center">
                        <p id="title">서포터 응원</p>
                        <h3 id="qty">27개</h3>
                    </div>
                    <div id="review" align="center">
                        <p id="title">체험 리뷰</p>
                        <h3 id="qty">6개</h3>
                    </div>
                </div>
                <hr>
                <br>
                <div id="orderStatus">
                    <h4>펀딩 결제 예약 현황</h4>
                    <div id="reservation" align="center">
                        <p id="title2">펀딩 결제 예약 금액</p>
                        <h4>480,000 원</h4>
                        <p id="change">오늘 230,000 원 <i class="fas fa-arrow-up"></i></p>    
                    </div>
                    <div id="achievement" align="center">
                        <p id="title2">펀딩 달성률</p>
                        <h4>16 %</h4>
                        <p id="change">오늘 7.666 % <i class="fas fa-arrow-up"></i></p>
                    </div>
                    <div id="count" align="center">
                        <p id="title2">펀딩 건 수</p>
                        <h4>22건</h4>
                        <p id="change">오늘 10건 <i class="fas fa-arrow-up"></i></p>
                    </div>
                </div>
            </div>
            <div id="content2"></div>
        </div>
    </div>
</body>
</html>