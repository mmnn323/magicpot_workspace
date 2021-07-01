<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>크리에이터 등록</title>
<link rel="preconnect" href="https://fonts.gstatic.com/%22%3E">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- include libraries(jQuery, bootstrap) -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<!-- css -->
<link rel="stylesheet" href="resources/css/funding/creatorEnrollForm.css">
<style>
    /* 체크박스 이미지 변경 */
    input[type="checkbox"] {
        display: none;
    }
    input[type="checkbox"]+label {
    display: inline-block;
    padding-left:30px;
    width: 200px;
    height: 20px;
    background: url('resources/images/common/check-mark.png') no-repeat 0 0px / contain;
    }
    input[type='checkbox']:checked+label {
        background: url('resources/images/common/checked.png') no-repeat 0 1px / contain;
    }

    #submitBtn{
        width: 180px; 
        height: 40px; 
        border: none;
        color: white;
        border-radius: 3px;
        background-color: rgb(116, 152, 107);
        font-size: 17px;
        font-weight: 600;
    }
</style>
</head>
<body>
    <div class="wrap">
        <div id="logo" align="center">
            <!-- 이미지 클릭시 메인화면으로 이동 -->
            <img src="resources/images/common/mainLogo.png" width="200px" height="80px">
        </div>
        <br><br>
        <div id="content">
            <div id="content_1">
                <h2 style="font-weight:600;">크리에이터 정보</h2>
                <p id="p1">
                                     크리에이터님, 본격적인 프로젝트 제작을 시작하기 전에 간단한 정보를 입력한 뒤  크리에이터 승인을 받아주세요.
                </p>
            </div>
            <br>
            <div id="content_2">
                <form action="" id="creatorInput">
                    <p id="category">크리에이터(기업)명</p>
                    <p id="p2">법인사업자는 법인등기부상 법인명 / 개인사업자는 주민등록상 성명 또는 상호 / 개인은 주민등록상 성명을 입력하세요.</p>
                    <input type="text" name="creatorName" required>
                    
                    <br><br>
                    
                    <p id="category">개인 / 사업자 구분</p>
                    <select name="CreBusiness" required>
                        <option value="">사업자 구분 선택</option>
                        <option value="1">개인</option>
                        <option value="2">개인 사업자</option>
                        <option value="3">법인 사업자</option>
                    </select>

                    <br><br>

                    <p id="category">관리자 명</p>
                    <input type="text" value="대장" disabled>

                    <br><br>

                    <p id="category">관리자 이메일</p>
                    <input type="email" value="daejang@naver.com" disabled>
                    <p id="p3">관리자명과 이메일 주소는 로그인 아이디와 연동되어 있으므로 변경을 원할 경우 회원 정보 설정에서 변경하세요.</p>

                    <br>

                    <p id="category">관리자 이메일 인증</p>
                    <input type="text" name="certEmail" id="emailInput" value="daejang@naver.com" required>
                    <button id="certBtn">인증하기</button>

                    <br><br><br>
                    
                    <input type="checkbox" id="privacyCheck">
                    <label for="privacyCheck" style="color: rgb(63, 62, 62);">(필수) 개인 정보 수집 동의</label>

                    <br><br>
                    
                    <!-- 신청시 알람 -> alertify? -->
                    <button type="submit" id="submitBtn">크리에이터 신청하기</button>
                </form>
            </div>
        </div>
        <br><br><br><br><br><br>
    </div>
</body>
</html>