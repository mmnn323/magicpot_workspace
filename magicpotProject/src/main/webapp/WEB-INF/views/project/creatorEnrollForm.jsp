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
            <img src="resources/images/common/mainLogo.png" width="200px" height="80px" style="cursor: pointer;"onclick="location.href='/magicpot'">
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
                <form action="insert.cre" method="post" id="creatorInput">
                	<input type="hidden" name="memNo" value="${ loginUser.memNo }">
                	
                    <p id="category">크리에이터(기업)명</p>
                    <p id="p2">법인사업자는 법인등기부상 법인명 / 개인사업자는 주민등록상 성명 또는 상호 / 개인은 주민등록상 성명을 입력하세요.</p>
                    <input type="text" name="creName" id="creName" required>
                    
                    <br><br>
                    
                    <p id="category">개인 / 사업자 구분</p>
                    <select name="creBusiness" required>
                        <option value="">사업자 구분 선택</option>
                        <option value="1">개인</option>
                        <option value="2">개인 사업자</option>
                        <option value="3">법인 사업자</option>
                    </select>

                    <br><br>

                    <p id="category">관리자 명</p>
                    <input type="text" name="creName" value=${ loginUser.memName } disabled>

                    <br><br>

					<!-- 길상씨 최고 -->
                    <p id="category">관리자 이메일 인증</p>
                    <input type="text" name="email" id="email" value=${ loginUser.email } style="width: 84%;" disabled>
                    <button type="button" id="authBtn" data-toggle="modal" data-target="#authModal">인증하기</button>
                    <p id="p3">관리자명과 이메일 주소는 로그인 아이디와 연동되어 있으므로 변경을 원할 경우 회원 정보 설정에서 변경하세요.</p>

                    <br><br>
                    
                    <input type="checkbox" id="privacyCheck">
                    <label for="privacyCheck" style="color: rgb(63, 62, 62);">(필수) 개인 정보 수집 동의</label>
					<input type="hidden" name="crePrivacy" id="crePrivacy" value="N">
                    <br><br>
                    
                    <!-- 신청시 알람 -> alertify? -->
                    <p id="p2">신청 후 수정이 불가하니 신중히 제출해주세요.</p>
                    <button type="submit" id="submitBtn" disabled>크리에이터 신청하기</button>
               		
                </form>

				<!-- 이메일 인증 모달 -->
				<div class="modal fade" id="authModal">
					<div class="modal-dialog">
						<div class="modal-content">
	                  
							<!-- Modal Header -->
	                        <div class="modal-header">
	                       	 	<h4 class="modal-title">이메일 인증</h4>
	                        	<button type="button" class="close" data-dismiss="modal">&times;</button>
	                        </div>
	                      
	                        <!-- Modal body -->
	                        <div class="modal-body">
	                        	<p style="font-size: 17px;">이메일이 발송되었습니다.</p>
								<input type="text" id="authNumCC" maxlength="7" placeholder="인증번호를 입력해주세요" required>
								<span id="mailCheckInput"></span>
	                        </div>
	                      
	                        <!-- Modal footer -->
	                        <div class="modal-footer">
	                            <div id="btns">
	                                <button type="button" id="submitBtn2" data-dismiss="modal">확인</button>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
            </div>
            
            <script>
            	$(function(){
        			var code = "";

        	    	/* 인증번호 발송 */
        			$("#authBtn").click(function(){
        				var email = $("#email").val();
        				console.log(email);
        				
        				$.ajax({
        			        type:"GET",
        			        url:"mailCheck2?email=" + email,
        			        success:function(data){
        			        	code = data;
        			        },error:function(){
        			        	console.log(email);
        			        }
        			    });
        			});
        			
        			/* 인증번호 비교 */
        			$("#authNumCC").blur(function(){
        				var inputCode = $("#authNumCC").val();        // 입력코드    
        			    var checkResult = $("#mailCheckInput");    // 비교 결과     
        			    
        			    if(inputCode == code){                            // 일치할 경우
        			        checkResult.html("인증번호가 일치합니다.");
        			        checkResult.attr("class", "correct");
        			        $("#authBtn").html("인증완료");
        			        $("#authBtn").attr("disabled", true);
        			    } else {                                            // 일치하지 않을 경우
        			        checkResult.html("인증번호를 다시 확인해주세요.");
        			        checkResult.attr("class", "incorrect");
        			        $("#authBtn").html("인증하기");
        			        $("#authBtn").attr("disabled", false);
        			    }    
        			});
        		});
        		
        		// 개인정보 동의해야 disabled해제
        		$(function(){
            		$("#privacyCheck").click(function(){
						if($("#privacyCheck").is(":checked") == true && $("#authBtn").attr("disabled")){
							// 이메일 인증 + 개인정보 동의한 경우 button disabled해제
							$("#submitBtn").removeAttr("disabled");
							$("#crePrivacy").val("Y");
							// console.log($("#crePrivacy").val());	
						}else if($("#authBtn").is("disabled") == false){ // 이메일 인증해야 동의할 수 있도록 함
							alert("이메일 인증이 필요합니다.");
							$("#privacyCheck").prop("checked", false);
						}else{ // 동의 안하면 disabled 다시 설정
							$("#submitBtn").attr("disabled", true);
							$("#crePrivacy").val("N");
							// console.log($("#crePrivacy").val());
							// check 생성
						}	
						// 인증하고 체크박스 누르고 다시 체크박스 눌렀을 때 신청하기 버튼 disabled안되었고, alert가 뜨는 문제 있음
						// 차후 수정해보기
					});
            	});
			</script>
        </div>
        <br><br><br><br><br><br>
    </div>
</body>
</html>