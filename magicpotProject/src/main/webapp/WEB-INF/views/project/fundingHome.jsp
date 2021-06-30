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
</head>
<body>
    <div class="wrap">
        <jsp:include page="basicTemplateMenuAbled.jsp"/>
        <div id="content">
            <div id="content1">
                <h3 style="font-weight:600;">펀딩 준비</h3>
                <h5 id="summary">본격적으로 펀딩을 오픈하기 위해 프로젝트에 대한 필수항목을 작성하세요.</h5>
                <br><br>
                
                <fieldset>
                    <!-- 단계별로 내용 바뀜 -> select로 전부 내용있으면 작성 완료로 변경, 그외는 프로젝트 상태로 -->
                    <h4 style="font-weight:600;margin-top:25px">프로젝트 준비 상태</h4>
                    <p id="p5">펀딩 준비 작성 중</p>
                    <p id="p6">필수 항목을 모두 작성 후 저장하기 버튼을 클릭해주세요. 작성 중 > 작성 완료 상태로 변경되어야 최종 제출이 가능합니다.</p>
                </fieldset>
                <br>

                <fieldset id="linkField">
                    <!-- 작성 중 작성 완료 단계 변경 필요 -->
                    <h4>기본 요건</h4>
                    <p id="p7">&nbsp;&nbsp;작성 중</p>
                    <button id="linkBtn">작성하기</button>
                </fieldset>
                <br>

                <fieldset id="linkField">
                    <!-- 작성 중 작성 완료 단계 변경 필요 -->
                    <h4>기본 정보</h4>
                    <p id="p7">&nbsp;&nbsp;작성 중</p>
                    <button id="linkBtn">작성하기</button>
                </fieldset>
                <br>

                <fieldset id="linkField">
                    <!-- 작성 중 작성 완료 단계 변경 필요 -->
                    <h4>스토리 작성</h4>
                    <p id="p7">&nbsp;&nbsp;작성 중</p>
                    <button id="linkBtn">작성하기</button>
                </fieldset>
                <br>

                <fieldset id="linkField">
                    <!-- 작성 중 작성 완료 단계 변경 필요 -->
                    <h4>리워드 작성</h4>
                    <p id="p7">&nbsp;&nbsp;작성 중</p>
                    <button id="linkBtn">작성하기</button>
                </fieldset>
                <br>

                <!-- 작성 다해야 제출가능 -> select으로 값 다 있으면 ㄱ?/ 단계따라서 버튼 바꾸기 제출완료, 오픈예약+바로오픈, 오픈완료 -->
                <br>
                <button id="submitBtn" disabled>제출하기</button>
            </div>
        </div>
    </div>
</body>
</html>