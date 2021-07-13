<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
            /* height: 700px; */
            /* border: 1px solid red; */
            width: 900px;
            margin: 30px;
            float: left;
        }
    #title{font-size: 25px; font-weight: bold;}

    #title2{
            font-size:16px;
            background-color: gray;
            color:white;
            margin-left: 10px;
            border:1px solid gray;
            border-radius: 5px;
            padding:3px;
        }

        /* 컨텐트 카테고리 타이틀 영역 */
    .guideTitle{
        font-family: 'Noto Sans KR', sans-serif;
        width:900px;
        border-bottom: 2px solid lightgray;
        padding:10px;
        margin:20px;
        margin-top: 0;
        
    }

    .explainContent{
        width: 700px;
        height: 500px;
        border: 2px solid lightgray;
        margin-left: 50px;
        border-radius: 10px;

    }

    .btnArea{
        margin-top: 20px;
        margin-left: 300px;
    }

    #editBtn{
        background-color: rgb(116, 152, 107);
        
        width: 95px;
        height: 45px;
        border: none;
    }
    #editBtn:hover{
         background-color: rgb(93, 121, 86);
    }
    #cancelBtn{
        background-color: gray;
        width: 95px;
        height: 45px;
        border: none;
        margin-left: 15px;
     }
     #cancelBtn:hover{
         background-color: rgb(105, 104, 104);
    }

</style>
</head>
<body>
	<jsp:include page="../common/adminPageTemplate2.jsp"/>
		<div id="content">
			<div class="outer">
				<div class="guideTitle">
					<span id="title">이용가이드 관리</span>
                    <span id="title2">${gu.guTitle}</span>
				</div>
                <div class="explainArea" >
                	<br>
                    <form action="update.adGu" id="guideContent">  
                    	<div class="explainContent">
                        	<br>
                            <textarea name="guContent" rows="20" cols="95" >${gu.guContent }</textarea>
                            <input type="hidden" name="guTitle" value="${gu.guTitle }">
                    	</div>

                        <div class="btnArea">
                        	<button type="submit" class="btn btn-success" id="editBtn" onclick="confirm();">수정</button>
                        	<button type="button" class="btn btn-success" id="cancelBtn" onclick="history.back();">취소</button>
                        </div>

                    </form>
				</div>


			</div>
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		</div>
	
	<script>
		function confirm(){
			alert("수정완료");
		}
	</script>
</body>
</html>