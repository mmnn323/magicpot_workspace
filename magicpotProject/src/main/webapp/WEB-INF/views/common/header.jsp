<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css -->
<link rel="stylesheet" type="text/css" href="resources/css/common/header.css">

<link rel="preconnect" href="https://fonts.gstatic.com/%22%3E">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/dd18300701.js" crossorigin="anonymous"></script>
<style>

          .wrap {
                border: 1px solid lightgray;
              width: 300px;
                
                }

        #font{ color:rgb(116, 152, 107);
        font-size: 30px;}
    
       /* 아이디/비밀번호 찾기*/
        .find {margin-top: 10px;
               font-size: 13px;}

        /*아이디, 비밀번호 입력*/
        #idPwd {width: 250px;
                padding: 5px;
                border-radius: 5px;
                border: 2px solid rgb(116, 152, 107);
                }
        
      /* 로그인 버튼 */
        #btn1 {width: 250px;
                height: 35px;
                color:white; 
                background-color: rgb(116, 152, 107);
                margin-top: 30px;
                border-radius: 5px;
                border: none;
                }

        /* 회원가입 a태그*/
        .join {font-size: 13px;}
        a { font-size: 13px; color: rgb(116, 152, 107);}
</style>
</head>
<body>

    <!-- 로고 영역 -->
    <div id="header">
        <div id="header_1">
            <a href=""><img src="../../../resources/images/common/logo2.png" alt=""></a>
        </div>

        <!-- 카테고리 영역-->
        <div id="header_2">
            <ul>
                <li><a href="">펀딩하기</a></li>
                <li><a href="">프로젝트 올리기</a></li>
                <li><a href="">이용가이드</a></li>
                <li><a href="">커뮤니티</a></li>
            </ul>
        </div>

        <!-- 검색 영역 -->
        <div id="header_3">
            <form action="" id="search_form">
                <div class="input-group mb-3" id="search_text">
                    <input type="text" class="form-control">
                    <div class="input-group-append">
                      <button class="btn btn-success" type="submit" ><i class="fas fa-search fa-sm" style="padding:2px;"></i>
                      </button>
                    </div>
                </div>
            </form>
        </div>
	
	
		<div id="header_4">
			
			<c:choose>
	        	 <c:when test="${ empty loginUser }"> 
	                  <a data-toggle="modal" data-target="#loginModal">로그인</a> <h style="color:rgb(116, 152, 107)"> &nbsp;</h> 
	                  <a href="">회원가입</a>
	        	  </c:when>
		          <c:when test="${ !empty loginUser and loginUser.memId eq 'admin' }">
			          	 <b>${ loginUser.memName }</b> <h style="color:rgb(116, 152, 107)">님</h>
			          	<abbr title="관리자페이지"><a href="" class="afterLogin"><i class="fas fa-cog fa-2x"></i></a></abbr>
			          	<a href="logout.me">로그아웃</a>
		          </c:when>
		          <c:otherwise>
	                   <b>${ loginUser.memName }</b> <h style="color:rgb(116, 152, 107)">님</h>
		               <abbr title="마이페이지"><a href="" class="afterLogin"><i class="fas fa-user fa-2x " style="margin-top: 20px;"></i></a></abbr>
		               <abbr title="좋아하는 프로젝트"><a href="" class="afterLogin"><i class="fas fa-heart fa-2x"></i></a></abbr>
		          </c:otherwise>
	      	</c:choose>   
       </div> 
    </div>

    
    <!--  로그인 모달 - 홍희나  -->
<div class="modal fade" align="center" id="loginModal">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
        <!-- Modal Header -->
        <div class="modal-header">
            <h3  id="font">로그인</h4>
            
        </div>

        <form action="login.me" method="post">
            <!-- Modal Body -->
            <div class="modal-body">
             
                <input id="memId" type="text" name="memId" class="form-control mb-2 mr-sm-2" placeholder="아이디를 입력하세요." > <br>
                <br>
                <input id="memPwd" type="password" name="memPwd" class="form-control mb-2 mr-sm-2" placeholder="비밀번호를 입력하세요." >
            </div>
            
            <div class="find">
                <tr>
                    <td><input type="checkbox" id="id" > 아이디 저장</td>
                    &nbsp;&nbsp;
                    <th>아이디 / 비밀번호 찾기</th>
                </tr>
            </div>

            <div class="join">
               <br><br> 또는 <br><br>
                아직 MagicPot 계정이 없으신가요? &nbsp;&nbsp; <a href=""><b>회원가입</b></a>
    
            </div>  

            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="submit" id="btn1" class="btn btn-primary">로그인</button>
            </div>
        </form>
        </div>
    </div>
</div>
    
</body>
</html>