
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
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style>
    div, form, input{ box-sizing: border-box;}
    div, p, form, a, input {font-family: 'Noto Sans KR', sans-serif;}
    div{box-sizing: border-box;  }
    .wrap{
        background-color: white;
        margin: auto;
        width: 1000px;
        height: 1190px;
    }

    .wrap>div{width:100%}
    .content_1{height: 140px; border-bottom: 1px solid lightgray;}
    .content_2{
        height: 1150px;
        background-color: rgba(220, 221, 206, 0.25);
        
        
    }
    #logoImg{
        margin-top: 15px;
        margin-left: 40%;
    }

    .enrollContent{
        border:1px solid lightgray;
        width:480px;
        height: 1000px;
        margin:auto;
        padding:60px 40px;
        background:white;   

    }

    .form-control{
        height: 35px;
        font-size: small;
    }

    #userId{
        width: 400px;
    }
    #emailCheckYN, #emailCheckYN2{
        background-color: rgb(225, 212, 169);
        border: none;
        
        
    }
    #checkInput{
        display :none;
    }

 
    #email{
        width: 315px;
    }

    #join2CheckboxOuter{
        border-top: 1px solid lightgray;
    }

    .join2DetailBtn{
        margin-left: 150px;
        color: rgb(116, 152, 107);
        background-color: white;
        border: none;

    }

    #subBtn{
        width: 300px;
        margin-left: 50px;
        background-color: rgb(225, 212, 169);
        border: none;
    }

    #socialBtn{
        width: 300px;
        margin-left: 50px;
        background-color: white;
        border: 1px solid lightgray;
    }
    
 
	.correct{
	    color : green;
	}
	.incorrect{
	    color : red;
	}
	
	#mail_check_input, .mail_input_box_warn{
		font-size:0.8em
	}
	
	.pwck_input_re_1{
        color : green;
        display : none;    
	}
	.pwck_input_re_2{
	        color : red;
	        display : none;    
	}    


</style>
</head>
<body>
    <div class="wrap">
        <div class="content_1">
            <a href="">
                <img id="logoImg" src="resources/images/common/logo.png" width="200" height="100" >
            </a>
        </div>
        
        <div class="content_2">
            <br><br>
            <div class="enrollContent" >
                <h3><b>회원가입</b></h3>
                <br>
                <form action="insert.me" method="post" id="enrollForm">
                    <table class="form-content">
                        <tr>
                            <td colspan="2">
                                <input type="text" class="form-control" id="userId" name="memId" placeholder="아이디 입력" required><br>
                                <div id="checkResult" style="display:none; font-size:0.8em; margin-top:-15px"></div>
                            </td>
                        </tr>
                        <tr>
                            <td>     
                                <input type="email" class="form-control" id="email" name="email" placeholder="이메일 입력" required  readonly>
                                <sapn class="mail_input_box_warn"></sapn>
                            </td>
                            <td>
                                <button type="button" id="emailCheckYN" class="btn btn-success"  disabled >인증확인</button>
                            </td>
                        
                        </tr>
                        <tr id="checkInput">
                            
                            <td>     
                                <input type="text" class="form-control" id="emailCC" name="emailCC" placeholder="인증번호입력" required >
                                 <span id="mail_check_input"></span>
                            </td>
                            
                        
                        </tr>
                        
                        <tr>
                            <td colspan="2">
                                <br>
                                <input type="text" class="form-control" id="userName" name="memName" placeholder="사용할 이름" required readonly>
                                
                            </td>
                            
                        </tr>

                        <tr>
                            <td  colspan="2">
                                <br>
                                <input type="password" class="form-control" id="pwd" name="memPwd" placeholder="비밀번호 입력" required minlength="8">
                                <p><small>* 8글자 이상</small></p>
                                <input type="password" class="form-control" id="pwdCheck" name="pwdCheck" placeholder="비밀번호 입력확인" required> <br>
                               
                            </td>
                                 
                            
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="tel" class="form-control" id="phone" name="phone" placeholder="핸드폰 번호" required>
                                <p><small>* -포함 ex)010-1111-2222</small></p> 
                            </td>
                        </tr>
                        
                    </table>

                    <br>
                    <div id="join2CheckboxOuter">
                        <br>
                        <table class="join2Checkbox">
                            <tr>
                                <th colspan="2" >
                                    <input type="checkbox" id="allChecked"><label for="allChecked"> <b>전체동의</b></label>
                                </th>
                            </tr>
                            <tr>
                                <th>
                                    <input type="checkbox" class="agreeCheck" id="agree1"  required ><label for="agree1"> 이용약관 동의</label>
                                </th>
                                <td>
                                    <button type="button" class="join2DetailBtn" data-toggle="modal" data-target="#myModal">내용보기</button>
                                    
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <input type="checkbox"  class="agreeCheck" id="agree2"  required><label for="agree2"> 개인정보 취급 방침</label>
                                </th>
                                <td>
                                    <button type="button" class="join2DetailBtn" data-toggle="modal" data-target="#myModal_2">내용보기</button>
                                </td>
                            </tr>
                            <tr>
                                <th colspan="2">
                                    <input type="checkbox" class="agreeCheck" id="agree3" name="emailYN" required><label for="agree3"> 만 14세 이상입니다.</label>
                                </th>
                            </tr>
                        </table>
                        
        
                    </div>
                    <br>
                    <button type="submit" class="btn btn-success" id="subBtn">회원가입</button>

                </form>
                <br>
                <br>

                <img src="resources/images/common/bound.png" >

                <br><br>
                
            </div>
        </div>
        
        <jsp:include page="../common/footer.jsp"/>


        <div class="container">

            <!-- 이용약관 Modal -->
            <div class="modal" id="myModal">
            <div class="modal-dialog">
                <div class="modal-content">
                
                <!-- Modal Header -->
                <div class="modal-header">
                    <h3 class="modal-title">매직팟 이용약관</h3>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                
                <!-- Modal body -->
                <div class="modal-body">
                    <p>
                        이용약관 입력
                    </p>
                </div>
                
                
                
                </div>
            </div>
            </div>
            
        </div>

        <div class="container">

            <!-- 이용약관 Modal -->
            <div class="modal" id="myModal_2">
            <div class="modal-dialog">
                <div class="modal-content">
                
                <!-- Modal Header -->
                <div class="modal-header">
                    <h3 class="modal-title">개인정보 처리방침</h3>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                
                <!-- Modal body -->
                <div class="modal-body">
                    <p>
                        개인정보처리방침 입력
                    </p>
                </div>
                
                
                
                </div>
            </div>
            </div>
            
        </div>
    </div>
    <script>
    	
    
        $(function(){
              // 전체 동의 
            $("#allChecked").on("click",function(){
                //대표 checkbox 체크 여부
                var checked = $("#allChecked").is(":checked");
                                   
                if(checked){
                    $(".agreeCheck").prop("checked",true);
                }
                else{
                    $(".agreeCheck").prop("checked",false);
                }
            });
            $(".agreeCheck").on("click", function(){
                var selectedL = $(".agreeCheck:checkbox:checked").length;
                var checkedL = $(".agreeCheck:checkbox").length;
                              
                //전체동의 선택
                if(selectedL == checkedL){
                    $("#allChecked").prop("checked",true);
                }
                //전체동의 해제
                else{
                    $("#allChecked").prop("checked",false);
                }
                });
                           
        });
        
		
		
		/* 아이디 중복 확인*/
		
		$(function(){
    		var $idInput = $("#enrollForm input[name=memId]"); // 아이디를 입력하는 input요소 객체
    		
    		$idInput.keyup(function(){
    		
    			// 우선 최소5글자 이상으로 입력했을때만 ajax 요청해서 중복체크 하도록
    			if($idInput.val().length >= 5){
    				
    				$.ajax({
    					url:"idCheck.me",
    					data:{checkId:$idInput.val()},
    					success:function(result){
    						if(result == "N"){ // 사용불가능
    							 $('#userId').css('border','1px solid red');
    							$("#subBtn").attr("disabled", true);
    							
    						}else{// 사용가능
    							$('#userId').css('border','1px solid green');
    							$("#subBtn").attr("disabled", false);
    						}
    					}, error:function(){
    						console.log("아이디 중복체크용 ajax 통신 실패");
    					}
    				})
    				
    			}else { // 아이디가 5글자 미만일경우 => 비교할 가치도 없음 (애초에 유효하지 않음) => 다시 회원가입버튼 비활성화, 메세지 안보여지도록
    				$("#enrollBtn").attr("disabled", true);
    				$("#checkResult").hide();
    			}
    			
    		})
    		
    		
    	})
    	
    	/* 비밀번호 일치확인*/
    	$(function(){
    		$('#pwdCheck').on("propertychange change keyup paste input", function(){
    			 
    		    var pw = $('#pwd').val();
    		    var pwck = $('#pwdCheck').val();
    		    if(pw == pwck){
    		        $('#pwdCheck').css('border','1px solid green');
    		        $("#subBtn").attr("disabled", false);
    		       
    		    }else{
    		    	 $('#pwdCheck').css('border','1px solid red');
    		    	 $("#subBtn").attr("disabled", true);
    		        
    		    }        
    		        
    		    
    		});
    	})
    	
    
   		// 네이버로 회원가입 콜백
  		var naver_id_login = new naver_id_login("B9KN9Y8GGTbbNdrMWbIA", "http://localhost:8883/magicpot/naver.en");
            // 접근 토큰 값 출력
            // 네이버 사용자 프로필 조회
            naver_id_login.get_naver_userprofile("naverSignInCallback()");
            // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
            function naverSignInCallback() {
            	document.getElementById("userName").value = naver_id_login.getProfileData('name');
            	document.getElementById("email").value = naver_id_login.getProfileData('email');
              
            }  
  
  	
  	
   
	  
	    
  
                        
    </script>
    
</body>
</html>