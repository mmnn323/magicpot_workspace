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
        height: 890px;
    }

   

    .addContent > div{
        float: left;
    }

    .mainContent{
        border: 1px solid lightgray;
        height: 230px;
        width: 600px;

    }

    .list{
        border: 1px solid lightgray;
        height: 110px;
        width: 600px;
        padding: 12px 18px;
        

    }

    .list>div{
        float: left;
    }

    .listBtn{
        margin-top: -10px;
        margin-left: 250px;
        font-size: 20px;
        color: gray;
        cursor: pointer;
    }

    #adContent{
        font-size: small;
    }

    .fa-exclamation-circle{
        margin-top: 35px;
        margin-left: 280px;
        color: lightgray;
    }
    .mainContent> p{
        margin-top: 20px;
        margin-left: 220px;
        color: lightgray;
    }

    .plusBtn{
        background-color: white;
        border: none;
        color: skyblue;
        margin-left: 550px;
    }
    .plusBtn:hover{
        font-weight: bold;
    }

    .side{
        border: 1px solid lightgray;
        height: 180px;
        width: 300px;
        margin-left: 40px;
        padding: 10px;

    }

    .side>p{
        font-size: 15px;
        color: gray;
    }

    .side>a{
        font-size: 15px;
    }

    .modal-content{
        margin: auto;
        width: 425px;
        height: 650px;
        padding: 50px 40px;
        box-shadow : rgba(0,0,0,0.5) 0 0 0 9999px;
        z-index : 100;
    }

    #name{
        width: 350px;
    }

    .form-control{
        height: 35px;
        font-size: small;
 
    }

    #post{
        width: 110px;
    }
    #postLine > td{
        float: left;
        margin-bottom: -45px;
    }

    #addInput{
        background-color: rgb(225, 212, 169);
        border: none;
        margin-top: 35px;
        font-size: small;
        text-align: center;
        height: 30px;
        width: auto;
    }

  

    #enrollBtn{
        background-color: rgb(225, 212, 169);
        border: none;
        width: 350px;
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
        margin-top: 50px;
    }

    .deleteBtn> a{
        background-color: rgb(225, 212, 169);
        border: none;
        width: 90px;
        height: 40px;
    }

    .deleteBtn> button{
        background-color: rgb(94, 94, 94);
        border: none;
        width: 90px;
        height: 40px;
    }

    #editBtn:hover, #deleteBtn:hover{
        color: black;
    }    
    




</style>
</head>
<body>
	
    <div class="modal-content">
                
                    
        <h4><b>배송지 수정</b></h4>
        <br><br>
        <form action="address.fi" method="post" id="adList">
        
        
            <table class="form-content">
                <tr>
                    <td colspan="2">     
                        <label for="name">받는 사람 </label>
                        <input type="text" class="form-control" id="name" name="adName" value="${a.adName }"  required ><br>
                        <input type="hidden" name="adNo" value="${a.adNo }">
                       
                    </td>
                </tr>
                <tr id="postLine">
                    <td >
                        <label for="post"> 주소 </label>
                        <input type="text" class="form-control" id="post" name="adPost" value="${a.adPost }" required readonly><br><br>
                        
                    </td>
                    <td >
                        <button type="button" id="addInput" class="btn btn-success" onclick="execution_daum_address()">우편번호</button>
                    </td>
                </tr>
                <tr id="adDetail">
                    <td colspan="2">
                        
                        <input type="text" class="form-control" id="address" name="adRoad"  value="${a.adRoad }" required readonly>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        
                        <input type="text" class="form-control" id="address_input_3" name="adDetail" value="${a.adDetail }" readonly required><br>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label for="phone"> 전화번호</label>
                        <input type="tel" class="form-control" id="phone" name="adPhone" value="${a.adPhone }"  required><br>    
                    </td>
                </tr>
                <c:choose>
					<c:when test="${ a.adDefault ne 'Y' }">    
		                <tr>
		                    <td colspan="2">
		                        <input type="checkbox" id="check" name="adDefault" value='Y' onclick="check();" > 기본배송지 등록
		                        <input type="hidden" name="adDefault" value='N' id="input_check_hidden1"/>
		                        
		                    </td>
		                </tr>
              		</c:when>
              	</c:choose>  
            </table>
      
            <br>
            <button type="submit" class="btn btn-success" id="enrollBtn">수정 하기</button>

        </form>
       
    
    
    
    </div>
    
     <script>
    
	    	// 배송지 추가 모달에서 주소찾기
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
			                $("#post").val(data.zonecode);
			                $("#address").val(addr);
			                // 커서를 상세주소 필드로 이동한다.
			                $("#address_input_3").attr("readonly",false);
			                $("#address_input_3").focus();
			 
			        }
			    }).open();    
		 
			}
	    	
	    	
	    	
			$(function (){
	    	
				 $("#check").change(function(){
		                if($(this).prop("checked")){
		                    $("#input_check_hidden1").attr("disabled", true);
		                }
		            })

			})
	
	    	
	</script>
    
</body>
</html>