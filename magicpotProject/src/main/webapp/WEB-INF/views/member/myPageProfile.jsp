<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MyPage_like</title>
    <!-- 글씨체 -->
<link rel="preconnect" href="https://fonts.gstatic.com/%22%3E">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/dd18300701.js" crossorigin="anonymous"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
    div, form, input{ box-sizing: border-box;}
    div, p, form, a, input {font-family: 'Noto Sans KR', sans-serif;}
    div{box-sizing: border-box;  }
    .wrap{
        background-color: white;
        margin: auto;
        width: 1000px;
        height: 1150px;
    }
    .content{
        width: 100%;
        height: 100%;
        background-color: rgba(220, 221, 206, 0.25);
        
        
    }

    .profilContent{
        border:1px solid lightgray;
        background-color: white;
        width:450px;
        height: 1070px;
        margin:auto;
        padding:60px 40px;
      
    }

    #logoImg{
        margin-top: -40px;
        margin-left: 75px;
        width: 200px;

    }
    #userId{
        width: 350px;
    }

    #address_input_1{
        width: 110px;
    }
    #postLine{
        float: left;
        margin-bottom: -20px;
    }

    #addInput{
        background-color: rgb(225, 212, 169);
        border: none;
        margin-top: 6px;
        font-size: small;
        text-align: center;
        height: 30px;
        width: auto;
    }

    .form-control {
        height: 35px;
        font-size: small;
 
    }

    .btns{
        margin-left: -50px;
    }
    .btns >button{
        width: 150px;
        height: 45px;
        margin-left: 20px;
        border: none;
    }

    #cancel{
        background-color: rgb(94, 94, 94);
    }
    
    #check{
        background-color: rgb(225, 212, 169);
    }
    
    .deleteBtn> a{
        background-color: rgb(225, 212, 169);
        border: none;
        width: 90px;
        height: 40px;
    }

    .deleteBtn> button{
        background-color: rgb(225, 212, 169);
        border: none;
        width: 90px;
        height: 40px;
    }
    .modal-content_2{
        height: 150px;
        width: 350px;
        background-color: white;
        margin: auto;

    }

    .modal-content_2>h5{
        margin-left: 50px;
        
    }
    .deleteBtn{
        margin-left: 130px;
        margin-top: 2px;
    }

	#adGoBtn{
		background-color: rgb(225, 212, 169);
        border: none;
        width: 90px;
        height: 40px;
        margin-left: 85px;
        margin-top:20px;
	}
	#adNoBtn{
		background-color: rgb(94, 94, 94);
        border: none;
        width: 90px;
        height: 40px;
        margin-top:20px;
	}
    
</style>
<body>
	
	<jsp:include page="../common/header.jsp"/>

    <div class="wrap">
        <div class="content">
            <br><br>
            <div class="profilContent">
                <img src="resources/images/common/logo.png" id="logoImg">

                <br><br>
                <h5><b>개인정보 수정</b></h5>

                <br>
                <form action="update.me" method="post" id="editForm">
                    <table class="form-content">
                        <tr>
                            <td colspan="2">
                                <label for="userId"><b>ID</b> </label>
                                <input type="text" class="form-control" id="userId" name="memId" value="${loginUser.memId }" readonly  required><br>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">     
                                <label for="name"><b>이름</b> </label>
                                <input type="text" class="form-control" id="name" name="memName" value="${loginUser.memName }" required ><br>
                            </td>
                            
                        
                        </tr>
                        
                        <tr>
                            <td  colspan="2">
                               
                                <label for="pwd"> <b>비밀번호</b> </label>
                                <input type="password" class="form-control" id="pwd" name="memPwd" placeholder="현재 혹은 변경할 비밀번호 " required  minlength="8">
                                <p><small>* 8글자 이상</small></p>
                                <input type="password" class="form-control" id="pwdCheck" name="pwdCheck" placeholder="비밀번호 입력확인" required> <br>
                            </td>
                            
                        </tr>
                        <tr>
                            <td colspan="2">
                                <label for="phone"> <b>전화번호</b> </label>
                                <input type="tel" class="form-control" id="phone" name="phone" value="${loginUser.phone }" required>
                                <p><small>* -포함 ex)010-1111-2222</small></p> 
                            </td>
                        </tr>

                        <tr>
                            <td colspan="2">
                                <label for="email"> <b>이메일</b> </label>
                                <input type="email" class="form-control" id="email" name="email" value="${loginUser.email }" required><br>
        
                            </td>
                        </tr>
                        <tr id="postLine">
                            <td >
                                <label for="post"> <b>주소</b> </label>
                                <input type="text" class="form-control" id="address_input_1"  name="memPost" value="${add.adPost }" readonly ><br>

                            </td>
                            <td >
                                <button type="button" id="addInput" class="btn btn-success" data-toggle="modal" data-target="#deleteModal2" onclick="" >우편번호</button>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="text" class="form-control" id="address_input_2" name="memRoad" value="${add.adRoad }" readonly>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="text" class="form-control" id="address_input_3" name="memDetail" value="${add.adDetail }"  readonly><br>
                            </td>
                        </tr>
                    </table>
                    <br>
                    <div class="btns" align="center">
                        <button type="button" id="cancel" class="btn btn-success" data-toggle="modal" data-target="#deleteModal">회원탈퇴</button>
                        <button type="submit" id="check" class="btn btn-success"> 확인</button>
                    </div>
					
                </form>
            </div>
            <!-- 회원탈퇴 모달 -->
            <div class="modal" id="deleteModal">
                <div class="modal-dialog2">
                    <div class="modal-content_2">

                        <b style="margin-left: 75px;">
			                            탈퇴 후 복구가 불가능합니다. <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                            정말로 탈퇴 하시겠습니까?
                        </b>                      
                       
                        
                        <form action="delete.me">
                            <br>&nbsp;&nbsp;
                            	비밀번호:
                            <input type="password" name="memPwd" required>
                            <div class="deleteBtn">
                                <button type="submit" class="btn btn-success" style="height: 40px;">탈퇴확인</button>
                            </div>
                        </form>
                       
                        
                    </div>
                </div>
            </div>       
        </div>

    </div>
    
    <jsp:include page="../common/footer.jsp"/>
    
	<!-- The Modal -->
	<div class="modal" id="deleteModal2">
		<div class="modal-dialog2">
			<div class="modal-content_2">
			<br>
				<h5 style="margin-left:20px;"><b>배송지 목록으로 이동하시겠습니까?</b></h5>
									                   
									                    
									                   
				<div class="addressBtn">
					<a href="address.me" id="adGoBtn" class="btn btn-success">이동</a>
					<button type="reset" id="adNoBtn" class="btn btn-success" data-dismiss="modal">취소</button>
				</div>
									                    
									                   
									                    
			 </div>
		</div>
	</div>
				
				                       
    
    <script>
    
    	// 주소찾기
    	function execution_daum_address(){
 
		    new daum.Postcode({
		        oncomplete: function(data) {
		        	 var addr = ''; // 주소 변수
		                var extraAddr = ''; // 참고항목 변수
		 
		                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }
		 
		                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		                if(data.userSelectedType === 'R'){
		                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있고, 공동주택일 경우 추가한다.
		                    if(data.buildingName !== '' && data.apartment === 'Y'){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                    if(extraAddr !== ''){
		                        extraAddr = ' (' + extraAddr + ')';
		                    }
		                    // 조합된 참고항목을 해당 필드에 넣는다.
		                    addr += extraAddr;
		                
		                } else {
		                	addr += ' ';
		                }
		 
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                $("#address_input_1").val(data.zonecode);
		                $("#address_input_2").val(addr);
		                // 커서를 상세주소 필드로 이동한다.
		                $("#address_input_3").attr("readonly",false);
		                $("#address_input_3").focus();
		 
		        }
		    }).open();    
	 
		}
    	
    	/* 비밀번호 일치확인*/
    	$(function(){
    		$('#pwdCheck').on("propertychange change keyup paste input", function(){
    			 
    		    var pw = $('#pwd').val();
    		    var pwck = $('#pwdCheck').val();
    		    if(pw == pwck){
    		        $('#pwdCheck').css('border','1px solid green');
    		        $("#check").attr("disabled", false);
    		       
    		    }else{
    		    	 $('#pwdCheck').css('border','1px solid red');
    		    	 $("#check").attr("disabled", true);
    		        
    		    }        
    		        
    		    
    		});
    	})
    	
    </script>
    
    
</body>
</html>