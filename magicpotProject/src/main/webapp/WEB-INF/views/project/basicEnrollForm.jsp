<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기본 정보</title>
<!-- css -->
<link rel="stylesheet" href="resources/css/funding/basicEnrollForm.css">
</head>
<body>
<div class="wrap">
	<jsp:include page="basicTemplateMenuAbled.jsp"/>
    <div id="content">
        <div id="content1">
            <p id="category" style="color:#a1a0a0">펀딩 준비 > <span style="color:#353535">기본 정보</span></p>
            <h3 style="font-weight:600;">기본 정보</h3>
            <h5 id="summary">프로젝트를 대표할 주요 기본 정보를 입력하세요.</h5>
            <br>
            <form action="updateBasic.pro" id="updatetBasic" method="post" enctype="multipart/form-data">
                <h5>프로젝트 제목</h5>
                <input type="text" name="proTitle" placeholder="제목 입력" onkeyup="fn_checkByte(this)" value="${ project.proTitle }" required>
                <p id="counter">200자 남음</p>
                <br>
                
                <h5>작가의 말</h5>
                <p id="p5">서포터들에게 크리에이터 소개를 해주세요!</p>

                <div id="createrWord">
                    <textarea id="summernote" name="createWord" required>${ project.createWord }</textarea>
                </div>
                <br><br>
                <script>
                    $(function(){
                        $('#summernote').summernote({
                            height:400,
                            minHeight:400,
                            maxHeight:400,
                            lang:"ko-KR",                                    
                            placeholder:"내용을 입력하세요.",
                            toolbar: [
                                    // [groupName, [list of button]]
                                    ['fontname', ['fontname']],
                                    ['fontsize', ['fontsize']],
                                    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
                                    ['color', ['forecolor','color']],
                                    ['table', ['table']],
                                    ['para', ['ul', 'ol', 'paragraph']],
                                    ['height', ['height']],
                                    ['insert',['picture','link','video']],
                                    ['view', ['help']]
                                ],
                                fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
                                fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
	                        	callbacks: {
		                        	onImageUpload : function(files, editor, welEditable) {
		                        		console.log("sss");
		                                // 파일 업로드(다중업로드를 위해 반복문 사용)
		                                for (var i = files.length - 1; i >= 0; i--) {
		                                	uploadSummernoteImageFile(files[i],this);
		        			            }
		               				}
	                     		}
	                 	 });
	                });
	                
	                function uploadSummernoteImageFile(file, el) {
	        			data = new FormData();
	        			data.append("file", file);
	        			$.ajax({
	        				data : data,
	        				type : "POST",
	        				url : "uploadSummernoteImageFile2",
	        				contentType : false,
	        				enctype : 'multipart/form-data',
	        				processData : false,
	        				success : function(data) {
	        					console.log(data.responseCode);
	        					$(el).summernote('editor.insertImage', data.url);
	        				}
	        			});
	        		} 
                </script>
                <h5>목표 금액</h5>
                <p id="p5">최소 50만원 ~ 최대 1억 원으로 설정하세요.</p>
                <input type="number" name="proPrice" min="500000" max="100000000" placeholder="ex) 5000000" value="${ project.proPrice }" required>
                <br><br><br>
                
                <h5>목표 금액</h5>
                <p id="p5">최소 50만원 ~ 최대 1억 원으로 설정하세요.</p>
                <input type="number" name="proShipPrice" placeholder="금액 입력 ex) 3000" value="${ project.proShipPrice }" required>
                <br><br><br>

				<!-- 기존 값 저장이 불가능 수정 시 문제 있어 -->
                <h5>대표 이미지</h5>
                <label id="imageUpfile" for="proImage"><i class="fas fa-camera"></i> 등록하기</label>
                <input type="file" id="proImage" class="form-control-file border" name="upfile" style="display:none;">&nbsp;&nbsp;
                <c:choose>
                	<c:when test="${ ! empty project.proImage }">
                		<span id="proImageTitle" style="font-weight:400;">${ project.proImage }</span>
                	</c:when>
                	<c:when test="${ empty project.proImage }">
                		<span id="proImageTitle" style="font-weight:400;">선택된 대표이미지 없음</span>
                	</c:when>
                </c:choose>

                <p id="p6">
                    3MB 이하의 JPEG, PNG 파일<br>
		                    해상도 1200x675 픽셀 이상<br>
		                    텍스트 및 로고 삽입 금지
                </p>
                
                <!-- 대표이미지 등록 시 파일명 노출 -->
			    <script>
			         $(document).ready(function(){ 
			             var fileTarget = $('#proImage'); 
			             fileTarget.on('change', function(){ // 값이 변경되면
			                 var cur=$("#proImage").val();
			             $("#proImageTitle").html(cur);
			             }); 
			         }); 
			    </script>
                <br>

                <h5>카테고리</h5>
                <select name="caNo" id="caNo" required>
                    <option value="">카테고리 선택</option>
                    <option value="1">OFFICE</option>
                    <option value="2">KITCHEN</option>
                    <option value="3">TRAVEL</option>
                    <option value="4">BATHROOM</option>
                    <option value="5">LIVING</option>
                </select>
                <br><br><br>
                <script>
                	$(function(){
                		$("#caNo option[value=" + ${ project.caNo } + "]").attr('selected', 'selected');
                	});
                </script>

                <h5>프로젝트 종료일</h5>
                <p id="p5">요건 / 콘텐츠 확인 및 프로젝트 진행 일정과 리워드 발송 일정을 함께 고려하여 종료일을 설정해주세요.</p>
                <input type="date" id="closeDate" name="closeDate" value="${ project.closeDate }" required>
                <p id="p6">
		                    펀딩 결제일 <span id="dateSpan">ex) 2021.06.23 - 2021.06.28</span><br>
		                    펀딩이 성공 종료 된 후 결제가 +4 영업일 동안 진행됩니다.
                </p>
                <br>
                <script>
                   	// closeDate 값 가져오기 -> 그로부터 +4일 해서 dateSpan에 띄우기
					$(function(){ // 기존 값 있는 경우
						var closeDate = new Date($("#closeDate").val()); // 기준 일자
						var d = closeDate.getDate(); 
	                   	var m = closeDate.getMonth(); m += 1; // JavaScript months are 0-11 
	                   	var y = closeDate.getFullYear(); 
	                   	var closeDate2 = y + "." + m + "." + d;
	                   	
	                   	closeDate.setDate(closeDate.getDate() + 4); // 결제 일자
	                   	var d = closeDate.getDate(); 
	                   	var m = closeDate.getMonth(); m += 1; 
	                   	var y = closeDate.getFullYear(); 
	                   	var payDate = y + "." + m + "." + d;

						$("#dateSpan").html(closeDate2 + ' - ' + payDate)
					})
                   	
					$("#closeDate").on("change", function(){
						var closeDate = new Date($("#closeDate").val()); // 기준 일자
						var d = closeDate.getDate(); 
	                   	var m = closeDate.getMonth(); m += 1; // JavaScript months are 0-11 
	                   	var y = closeDate.getFullYear(); 
	                   	var closeDate2 = y + "." + m + "." + d;
	                   	
	                   	closeDate.setDate(closeDate.getDate() + 4); // 결제 일자
	                   	var d = closeDate.getDate(); 
	                   	var m = closeDate.getMonth(); m += 1; 
	                   	var y = closeDate.getFullYear(); 
	                   	var payDate = y + "." + m + "." + d;

						$("#dateSpan").html(closeDate2 + ' - ' + payDate)
					})
                </script>
                
                <c:choose>
                	<c:when test="${ ! empty project.proTitle }">
                		<!-- proTitle 존재 = 기본 정보를 입력했다 -->
                		<button id="submitBtn" type="submit">수정하기</button>
                	</c:when>
                	<c:otherwise>
                		<button id="submitBtn" type="submit">저장하기</button>
                	</c:otherwise>
                </c:choose>
            </form>
            <br><br>
            <script>
                // 글자 입력 아이디 안쓰고 하는거 방법 찾아서 하나로 줄이기 next왜안되냐고~!~!
                function fn_checkByte(obj){
                    const maxByte = 200; //최대 1500바이트
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
                    
                    let currentByte = 200-totalByte;
                    if(totalByte>maxByte){
                        alert('최대 200Byte까지만 입력가능합니다.');
                        
                        document.getElementById("counter").innerText = currentByte+"자 남음";
                        document.getElementById("counter").style.color = "red";
                    }else{
                        document.getElementById("counter").innerText = currentByte+"자 남음";
                        document.getElementById("counter").style.color = "green";
                    }
                }
            </script>
            <br><br><br><br><br><br>
        </div>
    </div>
</div>
</body>
</html>