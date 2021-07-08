<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기본 요건</title>
<!-- css -->
<link rel="stylesheet" href="resources/css/funding/requireEnrollForm.css">
</head>
<body>
    <div class="wrap">
        <jsp:include page="basicTemplateMenuAbled.jsp"/>
        <div id="content">
            <div id="content1">
                <p id="category" style="color:#a1a0a0">펀딩 준비 > <span style="color:#353535">기본 요건</span></p>
                <h3 style="font-weight:600;">기본 요건</h3>
                <h5 id="summary" style="font-weight:400;">
                    펀딩 진행을 위한 기본 요건을 확인하고자 합니다. <br>
                    심사 시 확인하는 중요한 정보이므로 반드시 정확한 정보를 입력하세요. <br>
                    답변 내용이 사실과 다른 경우, 약정 위반에 따른 불이익이 발생할 수 있습니다.
                </h5>
                <br><br>
			<c:choose>
				<c:when test="${ ! empty proRequire }">
					<form action="updateRequire.pro" method="post">
				</c:when>
				<c:otherwise>
					<form action="insertRequire.pro" method="post">
				</c:otherwise>
			</c:choose>
                    <input type="hidden" name="proNo" value="${ project.proNo }">
                    
                    <h5>Q1. 현재까지 진행된 리워드의 준비 상태 및 앞으로의 계획을 구체적으로 설명해주세요.</h5>
                    <p id="p5">제작 공정에 따른 현재 리워드의 제작 상태 및 제조 시설명과 일일 최대 생산 가능량을 포함한 앞으로의 생산 계획을 작성해주세요.</p>
                    <textarea name="rewardPlan" id="rewardPlan" cols="80" rows="8" maxlength="1500" style="resize: none;width: 80%;" onkeyup="fn_checkByte(this)" required>${ proRequire.rewardPlan }</textarea><br>
                    <p id="counter">1500자 남음</p>
                    <br>
                    
                    <h5>Q2. 리워드의 전달 계획을 알려주세요.</h5>
                    <p id="p5">
                        1) 리워드의 전달 방법을 입력하고, 리워드 제작 및 전달 일정이 변동될 가능성이 있다면 사유를 알려주세요.<br>
                        2) 발송 업체명 및 일일 최대 발송 가능량을 입력해주세요.
                    </p>
                    <textarea name="rewardDelivery" id="rewardDelivery" cols="80" rows="8" maxlength="1500" style="resize: none;width: 80%;" onkeyup="fn_checkByte2(this)" required>${ proRequire.rewardDelivery }</textarea><br>
                    <p id="counter2">1500자 남음</p>
                    <br>
                    
                    <h5>Q3. 리워드 종류</h5>
                    <p id="p5">리워드 종류를 선택해 주세요.</p>
                    <input type="radio" id="rewardCategory1" name="rewardCategory" value=1 required><label for="rewardCategory1"><span>&nbsp;홈 리빙-생활잡화</span></label>
                    <p id="p7">
                        원활한 일상 생활을 위해 사용하는 모든 용품<br><br>
                        예시) 미용도구,헤어롤, 물수건, 빨대, 화장지, 면봉, 기저귀, 스포츠 용품(자전거,골프용품 등), 공구, 완구, 캠핑용품, 행거, 옷걸이, 호신용품, 원예용품,벽지, 패브릭,인테리어 소품, 수납/정리용품, 홈데코용품, 청소용품, 세정제, 제거제, 세탁세제, 표백제,섬유유연제, 광택코팅제, 특수목적코팅제, 녹 방지제, 다림질 보조제, 접착제, 접합제, 방향제, 자동차용 워셔액, 자동차용 부동액, 인쇄용 잉크/토너, 미용 접착제, 문신용 염료, 살균제, 가습기용 항균/소독제제, 습기 제거제, 향초, 탈취제 등
                    </p>
                    <br>
                    <input type="radio" id="rewardCategory2" name="rewardCategory" value=2 required><label for="rewardCategory2"><span>&nbsp;홈 리빙-가구, 주방, 욕실</span></label>
                    <p id="p7">
                        주방, 욕실, 거실 등 주거 환경에서 원활한 일상 생활을 위해 사용하는 모든 용품<br><br>
                        예시) 욕실용품, 가구, 침구류, 그릇/홈세트, 타일, 침구, 커튼, 쿠션, 주방용품, 조리기구, 주방세제, 헹굼보조제 등
                    </p>
                    <br>
                    <!-- 전부 입력 되어야 disabled 해제 -->
                    <c:choose>
                    	<c:when test="${ ! empty proRequire }">
                    		<button id="submit_btn" type="submit">수정하기</button>
                    	</c:when>
                    	<c:otherwise>
                    		<button id="submit_btn" type="submit">저장하기</button>
                    	</c:otherwise>
                    </c:choose>
                </form>
                <br><br><br><br><br><br><br><br>
                
                <script>
                    // 글자 입력 아이디 안쓰고 하는거 방법 찾아서 하나로 줄이기 next왜안되냐고~!~!
                    function fn_checkByte(obj){
                        const maxByte = 1500; //최대 1500바이트
                        const text_val = obj.value; //입력한 문자
                        const text_len = text_val.length; //입력한 문자수
                        
                        let totalByte = 0;
                        for(let i=0; i<text_len; i++){
                            const each_char = text_val.charAt(i);
                            const uni_char = escape(each_char) //유니코드 형식으로 변환

                            // console.log(uni_char);
                            // console.log(uni_char.length);

                            if(uni_char.length>4){
                                // 한글 : 2Byte
                                totalByte += 2;
                            }else{
                                // 영문,숫자,특수문자 : 1Byte
                                totalByte += 1;
                            }
                        }
                        
                        let currentByte = 1500-totalByte;
                        if(totalByte>maxByte){
                            alert('최대 1500Byte까지만 입력가능합니다.');
                            
                            document.getElementById("counter").innerText = currentByte+"자 남음";
                            document.getElementById("counter").style.color = "red";
                        }else{
                            document.getElementById("counter").innerText = currentByte+"자 남음";
                            document.getElementById("counter").style.color = "green";
                        }
                    }
                    
                    function fn_checkByte2(obj){
                        const maxByte = 1500; //최대 1500바이트
                        const text_val = obj.value; //입력한 문자
                        const text_len = text_val.length; //입력한 문자수
                        
                        let totalByte = 0;
                        for(let i=0; i<text_len; i++){
                            const each_char = text_val.charAt(i);
                            const uni_char = escape(each_char) //유니코드 형식으로 변환

                            // console.log(uni_char);
                            // console.log(uni_char.length);

                            if(uni_char.length>4){
                                // 한글 : 2Byte
                                totalByte += 2;
                            }else{
                                // 영문,숫자,특수문자 : 1Byte
                                totalByte += 1;
                            }
                        }
                        
                        let currentByte = 1500-totalByte;
                        if(totalByte>maxByte){
                            alert('최대 1500Byte까지만 입력가능합니다.');
                            document.getElementById("counter2").innerText = currentByte+"자 남음";
                            document.getElementById("counter2").style.color = "red";
                        }else{
                            document.getElementById("counter2").innerText = currentByte+"자 남음";
                            document.getElementById("counter2").style.color = "green";
                        }
                    }
                    
                    // 리워드 카테고리 값 존재할 때 입력 체크
                    $(function(){
                    	$("input[value=${ proRequire.rewardCategory }]").attr("checked", true);
                    })
                </script>
            </div>
            <div id="content2"></div>
        </div>
    </div>
</body>
</html>