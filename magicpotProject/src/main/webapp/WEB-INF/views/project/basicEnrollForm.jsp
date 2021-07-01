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
            <form action="" method="post">
                
                <h5>프로젝트 제목</h5>
                <input type="text" placeholder="제목 입력" onkeyup="fn_checkByte(this)" required>
                <p id="counter">200자 남음</p>
                <br>
                
                <h5>작가의 말</h5>
                <p id="p5">서포터들에게 크리에이터 소개를 해주세요!</p>

                <div id="createrWord">
                    <textarea id="summernote" name="editordata"></textarea>
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
                                fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
                            });
                    })
                </script>
                <h5>목표 금액</h5>
                <p id="p5">최소 50만원 ~ 최대 1억 원으로 설정하세요.</p>
                <input type="number" placeholder="ex) 5000000" required>
                <br><br><br>

                <h5>대표 이미지</h5>
                <label id="imageUpfile" for="proImage"><i class="fas fa-camera"></i> 등록하기</label>
                <input type="file" id="proImage" class="form-control-file border" name="proImage" style="display:none;">
                <p id="p6">
                    3MB 이하의 JPEG, PNG 파일<br>
                    해상도 1200x675 픽셀 이상<br>
                    텍스트 및 로고 삽입 금지
                </p>
                <br>

                <h5>카테고리</h5>
                <select name="category" id="category" required>
                    <option value="x">카테고리 선택</option>
                    <option value="LIVING">LIVING</option>
                    <option value="KITCHEN">KITCHEN</option>
                    <option value="BATHROOM">BATHROOM</option>
                    <option value="OFFICE">OFFICE</option>
                    <option value="TRAVEL">TRAVEL</option>
                </select>
                <br><br><br>

                <h5>프로젝트 종료일</h5>
                <p id="p5">요건 / 콘텐츠 확인 및 프로젝트 진행 일정과 리워드 발송 일정을 함께 고려하여 종료일을 설정해주세요.</p>
                <input type="date" id="closeDate" name="closeDate" required>
                <p id="p6">
                    펀딩 결제일 <span>2021.06.23 - 2021.06.28</span><br>
                    펀딩이 성공 종료 된 후 결제가 +4 영업일 동안 진행됩니다.
                </p>
                <br>
                <script>
                    // 펀딩 결제일 날짜 선택시 나오도록 추가
                </script>
                <!-- 전부 입력 되어야 disabled 해제 -->
                <button id="submitBtn" type="submit">저장하기</button>
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