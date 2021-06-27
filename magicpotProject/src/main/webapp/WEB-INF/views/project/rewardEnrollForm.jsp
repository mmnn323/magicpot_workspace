<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리워드 설계</title>
<!-- 폰트어섬, 폰트 -->
<script src="https://kit.fontawesome.com/dd18300701.js" crossorigin="anonymous"></script>
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
<link rel="stylesheet" href="resources/css/rewardEnrollForm.css">
</head>
<body>
    <div class="wrap">
        <div id="header">
            <!-- 나가기 클릭시 메인페이지로 이동 -->
            <div id="logo"><img src="resources/images/logo1.png" width="120px" height="45px;"></div>
            <div id="creatorName">돈조 매직팟 님</div>
            <div id="outPage" style="cursor:pointer;">나가기</div>
        </div>
        <div id="menuContent">
            <div id="menu">
                <div id="creProfile">
                    <p id="p1">펀딩 준비 작성 중</p>
                    <p id="p2">돈조매직팟의<br>멋진 프로젝트</p>
                    <p id="p3">프로젝트 번호 1</p>
                </div>
                <div id="menubar">
                    <div id="accordian">
                        <ul>
                            <li>
                                <h4 id="ready" style="cursor:pointer;">
                                    <p id="menu_title" style="display:inline;">펀딩 준비</p>
                                    <i id="btn" class="fas fa-angle-down" style="margin-left:93px"></i>
                                </h4>
                                <ul id="subMenu">
                                    <li><a href="">기본 요건</a></li>
                                    <li><a href="">기본 정보</a></li>
                                    <li><a href="">스토리 작성</a></li>
                                    <li><a href="">리워드 설계</a></li>
                                </ul>
                            </li>
                            <li>
                                <h4>
                                    <p id="lock">펀딩 현황</p>
                                    <i class="fas fa-lock" style="margin-left:90px"></i>
                                </h4>
                            </li>
                            <li>
                                <h4>
                                    <p id="lock">결제 현황</p>
                                    <i class="fas fa-lock" style="margin-left:90px"></i>
                                </h4>
                            </li>
                            <li>
                                <h4>
                                    <p id="lock">배송 현황</p>
                                    <i class="fas fa-lock" style="margin-left:90px"></i>
                                </h4>
                            </li>
                            <li>
                                <h4><a href="" id="abled">자료 및 도움말</a><span style="margin-left:80px"></span></h4>
                            </li>
                        </ul>
                    </div>	
                    <script>            
                        $(function(){
                            $("#accordian h4").click(function(){
                                $("#accordian ul ul").slideUp();
                                $("#menu_title").css("color", "")
                                $("#btn").removeClass("fas fa-angle-up");
                                $("#btn").addClass("fas fa-angle-down");
                                if(!$(this).next().is(":visible"))
                                {
                                    $(this).next().slideDown();
                                    $("#btn").removeClass("fas fa-angle-down");
                                    $("#menu_title").css("color", "rgb(116, 152, 107)")
                                    $("#btn").addClass("fas fa-angle-up");
                                }
                            })
                        })
                    </script>
                </div>
            </div>
            <div id="content">
                <div id="content1">
                    <p id="category" style="color:#a1a0a0">펀딩 준비 > <span style="color:#353535">리워드 설계</span></p>
                    <h3 style="font-weight:600;">리워드 설계</h3>
                    <h5 id="summary">
                        서포터에게 제공할 리워드 내용을 입력하세요.<br>
                        서포터가 쉽게 펀딩할 수 있는 저렴한 리워드부터 서포터의 보다 빠른 펀딩을 유도할 수 있는 얼리버드 리워드까지 다양한 리워드를 구성하세요.
                    </h5>
                    <br>
                    <div id="field">
                        <fieldset>
                            <h4 style="font-weight: 600;">리워드 설계 조건</h4>
                            <br>
                            <div>
                                <div id="condition"><p>제한 수량</p></div>
                                <div id="conSummary" style="margin-left:105px">
                                    혜택이 높은 순으로 나오도록 정렬 순서를 등록하세요.
                                </div>
                            </div>
                            <br>
                            <div style="clear:both">
                                <div id="condition"><p>정렬 순서</p></div>
                                <div id="conSummary" style="margin-left:105px">
                                    생산 및 제공할 수 있는 리워드의 총 수량으로 해당 수량이 모두 펀딩되면 더 이상 펀딩 불가합니다.
                                </div>
                            </div>
                            <br>
                            <div style="clear:both">
                                <div id="condition"><p>발송 시작일</p></div>
                                <div id="conSummary">
                                    프로젝트 종료일 이후부터 11개월 이내로 설계 가능합니다.
                                </div>
                                <div id="deliSummary">
                                    <div style="float:left;"><p>- &nbsp;</p></div>
                                    <div style="margin-left:15px;">
                                        설정한 발송 시작일까지 리워드가 발송되지 않을 경우, 서포터가 펀딩금 반환을 신청할 수 있으니 신중하게 선택하세요.
                                    </div>
                                    <div style="float:left;"><p>- &nbsp;</p></div>
                                    <div style="margin-left:15px;">
                                        종료일+11개월까지 발송이 시작되지 않은 경우, 미발송 상태인 서포터의 펀딩금 반환이 자동으로 반환(결제취소)되니 유의하세요.
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div style="clear:both">
                                <div id="condition"><p>발송 시작일</p></div>
                                <div id="conSummary">
                                    옵션(사이즈, 색상 등)이 필요한 경우. 옵션을 추가하세요.
                                </div>
                            </div>
                        </fieldset>
                    </div>
                    <br>
                    <button type="button" id="rewardEnrollBtn" data-toggle="modal" data-target="#rewardEnrollForm">+ 등록하기</button>
                    <br>
                    <!-- 등록 버튼 disabled였다가 기본정보 등록 되어있으면 disabled해제 + i ~~어쩌구 지우기 / 만약 리워드 존재 -> + 추가하기로 바꿈 -->
                    <div style="margin-top:10px;">
                        <div style="float:left;"><i class="fas fa-info-circle"></i></div>
                        <div style="margin-left:25px">
                            리워드를 추가하기 전에 프로젝트 종료일을 설정해주세요.<br>
                            프로젝트 종료일은 펀딩준비 > <a href="" style="color:rgb(116, 152, 107);">기본정보</a> 에서 설정할 수 있습니다.
                        </div>
                    </div>
                    <br>

                    <!-- 리워드 추가 되어있으면 + 추가하기 버튼으로 변경 -->
                    <!-- <button type="button" id="rewardEnrollBtn" data-toggle="modal" data-target="#rewardEnrollForm">+ 추가하기</button> -->
                    <div id="rewards">
                        <div id="reward">
                            <p id="rewardPrice">23,000원</p>
                            <p id="quantityLimit">제한 수량 300개</p>
                            <hr>
                            <p id="rewardTitle">[얼리버드] 밥그릇</p>
                            <p id="rewardExplain">지구를 살리기위해 만들어진 종이 폼롤러! 이번기회에 환경 친화적 폼롤러로 피부 걱정없이 홈트하자. 롤러 사고 나무심기 기부 캠페인에 참여하여 우리 지구 함께 살려요 :)</p>
                            <p id="rewardCate">배송비</p>
                            <p id="shipPrice" >3,000원</p>
                            <p id="rewardCate" style="clear:both;">리워드 발송 시작일</p>
                            <p id="deliveryStart">2021년 07월 중순(11~20일)</p>
                            <div id="btns">
                                <!-- 편집은 modal연결 / 삭제는 sql -->
                                <button type="button" data-toggle="modal" data-target="#rewardEnrollForm">편집</button>
                                <button type="button">삭제</button>
                            </div>
                        </div>
                        <div id="reward">
                            <p id="rewardPrice">23,000원</p>
                            <p id="quantityLimit">제한 수량 300개</p>
                            <hr>
                            <p id="rewardTitle">[얼리버드] 밥그릇</p>
                            <p id="rewardExplain">지구를 살리기위해 만들어진 종이 폼롤러! 이번기회에 환경 친화적 폼롤러로 피부 걱정없이 홈트하자. 롤러 사고 나무심기 기부 캠페인에 참여하여 우리 지구 함께 살려요 :)</p>
                            <p id="rewardCate">배송비</p>
                            <p id="shipPrice" >3,000원</p>
                            <p id="rewardCate" style="clear:both;">리워드 발송 시작일</p>
                            <p id="deliveryStart">2021년 07월 중순(11~20일)</p>
                            <div id="btns">
                                <button type="button" data-toggle="modal" data-target="#rewardEnrollForm">편집</button>
                                <button type="button">삭제</button>
                            </div>
                        </div>
                        <div id="reward">
                            <p id="rewardPrice">23,000원</p>
                            <p id="quantityLimit">제한 수량 300개</p>
                            <hr>
                            <p id="rewardTitle">[얼리버드] 밥그릇</p>
                            <p id="rewardExplain">지구를 살리기위해 만들어진 종이 폼롤러! 이번기회에 환경 친화적 폼롤러로 피부 걱정없이 홈트하자. 롤러 사고 나무심기 기부 캠페인에 참여하여 우리 지구 함께 살려요 :)</p>
                            <p id="rewardCate">배송비</p>
                            <p id="shipPrice" >3,000원</p>
                            <p id="rewardCate" style="clear:both;">리워드 발송 시작일</p>
                            <p id="deliveryStart">2021년 07월 중순(11~20일)</p>
                            <div id="btns">
                                <button type="button" data-toggle="modal" data-target="#rewardEnrollForm">편집</button>
                                <button type="button">삭제</button>
                            </div>
                        </div>
                        <div id="reward">
                            <p id="rewardPrice">23,000원</p>
                            <p id="quantityLimit">제한 수량 300개</p>
                            <hr>
                            <p id="rewardTitle">[얼리버드] 밥그릇</p>
                            <p id="rewardExplain">지구를 살리기위해 만들어진 종이 폼롤러! 이번기회에 환경 친화적 폼롤러로 피부 걱정없이 홈트하자. 롤러 사고 나무심기 기부 캠페인에 참여하여 우리 지구 함께 살려요 :)</p>
                            <p id="rewardCate">배송비</p>
                            <p id="shipPrice" >3,000원</p>
                            <p id="rewardCate" style="clear:both;">리워드 발송 시작일</p>
                            <p id="deliveryStart">2021년 07월 중순(11~20일)</p>
                            <div id="btns">
                                <button type="button" data-toggle="modal" data-target="#rewardEnrollForm">편집</button>
                                <button type="button">삭제</button>
                            </div>
                        </div>
                        <div id="reward">
                            <p id="rewardPrice">23,000원</p>
                            <p id="quantityLimit">제한 수량 300개</p>
                            <hr>
                            <p id="rewardTitle">[얼리버드] 밥그릇</p>
                            <p id="rewardExplain">지구를 살리기위해 만들어진 종이 폼롤러! 이번기회에 환경 친화적 폼롤러로 피부 걱정없이 홈트하자. 롤러 사고 나무심기 기부 캠페인에 참여하여 우리 지구 함께 살려요 :)</p>
                            <p id="rewardCate">배송비</p>
                            <p id="shipPrice" >3,000원</p>
                            <p id="rewardCate" style="clear:both;">리워드 발송 시작일</p>
                            <p id="deliveryStart">2021년 07월 중순(11~20일)</p>
                            <div id="btns">
                                <button type="button" data-toggle="modal" data-target="#rewardEnrollForm">편집</button>
                                <button type="button">삭제</button>
                            </div>
                        </div>
                    </div>
                    

                    <br><br>
                    <!-- 추가 되어야 disabled 해제 -->
                    <div style="clear:both;">
                        <button id="submitBtn" type="submit">저장하기</button>
                    </div>
                    <br><br><br><br><br><br>

                    <!-- 리워드 등록 modal -->
                    <div class="modal fade" id="rewardEnrollForm">
                        <div class="modal-dialog modal-lg">
                          <div class="modal-content">
                          
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">리워드 추가</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            
                            <!-- Modal body -->
                            <div class="modal-body">
                                <form id="rewardEnrollForm" action="">
                                    <div>
                                        <p id="title">금액</p>
                                        <input type="text" placeholder="금액 입력" required>
                                        <span>&nbsp;원</span>
                                    </div>
                                    <br>
                                    <div>
                                        <p id="title">리워드명</p>
                                        <input type="text" placeholder="타이틀 입력 ex) [얼리버드] 기본 리워드" style="width:80%;" onkeyup="fn_checkByte1(this);" required>
                                        <p id="counter1">150자 남음</p>
                                    </div>
                                    <br>
                                    <div>
                                        <p id="title">상세설명</p>
                                        <textarea name="" id="" cols="40" rows="10" placeholder="제공하는 리워드가 무엇인지 간략하게 제시해주세요." style="resize: none;width: 80%;" onkeyup="fn_checkByte2(this);" required></textarea>
                                        <p id="counter2">400자 남음</p>
                                    </div>
                                    <br>
                                    <div>
                                        <p id="title">옵션 조건</p>
                                        <select name="optionType" id="optionType">
                                            <option value="x">옵션 조건 유형을 선택하세요.</option>
                                            <option value="1">옵션 없음</option>
                                            <option value="2">선택 옵션(사이즈, 색상 등)</option>
                                            <option value="3">직접 입력 옵션(각인, 메시지 등)</option>
                                            <option value="4">선택 옵션과 직접 입력 옵션</option>
                                        </select>
                                        <!-- 1,2,3,4 선택마다 바뀌도록 jsp에서 el적용 -->
                                        <!-- 1은 변화 x -->
                                        <!-- 2 선택 옵션 -->
                                        <div id="selectOption1" style="clear:both;">
                                            <p style="margin-bottom:3px;">옵션 설정</p>
                                            <textarea name="selectOption" id="selectOption" cols="30" rows="10" placeholder="옵션 값을 입력하세요.&#10;옵션 값은 /로 구분 됩니다.&#10;ex) 블랙, M/" style="resize: none;width: 80%;" required></textarea>
                                            <p style="font-size:14px;margin-bottom: 3px;">옵션 미리보기</p>
                                            <select name="" id="">
                                                <option value="">옵션 선택</option>
                                            </select>
                                        </div>
                                        <br>
                                        <!-- 3 직접 입력 옵션 -->
                                        <div id="inputOption" style="clear:both;">
                                            <input type="text" placeholder="입력 옵션을 작성해주세요." style="width: 80%;" required>
                                            <p style="font-size:13px;color:#8a8a8a;margin-top:3px;">예시) 한글 10자, 영문 15자 이내 각인 메시지를 입력하세요.</p>
                                        </div>
                                        <!-- 4 선택 & 직접 옵션 -->
                                    </div>
                                    <br>
                                    <div>
                                        <p id="title">배송료</p>
                                        <input type="number" placeholder="금액 입력" required>
                                        <span>&nbsp;원</span>
                                    </div>
                                    <br>
                                    <div>
                                        <p id="title">제한수량</p>
                                        <input type="number" placeholder="수량 입력" required>
                                        <span>&nbsp;개</span>
                                    </div>
                                    <br>
                                    <div>
                                        <p id="title">발송시작일</p>
                                        <select name="deliveryStartDate" id="deliveryStartDate">
                                            <option value="x">연도/월</option>
                                            <!-- jsp로 변경해서 for문 이용하기 -->
                                        </select>
                                        <select name="deliveryStart" id="deliveryStart">
                                            <option value="x">시기</option>
                                            <option value="초(1~10일)">초(1~10일)</option>
                                            <option value="중순(11~20일)">중순(11~20일)</option>
                                            <option value="말(21~말일)">말(21~말일)</option>
                                        </select>
                                    </div>
                                    <br>
                                    <div>
                                        <p id="ref">- 설정한 발송 시작일까지 리워드가 발송되지 않을 경우, 서포터가 펀딩금 반환을 신청할 수 있으니 신중하게 선택하세요.</p>
                                        <p id="ref">
                                            - 종료일+11개월(2022-04-29)까지 리워드 발송이 시작되지 않은 경우, 
                                            2022-04-21에 미발송 상태인 서포터의 펀딩금이 자동으로 완료 처리(결제 취소)되니 유의하세요.
                                        </p>
                                    </div>
                                </form>
                            
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <div class="btn" style="margin:auto;">
                                    <button type="button" id="resetBtn" data-dismiss="modal">취소</button>
                                    <button type="submit" id="submitBtn" form="rewardEnrollForm" data-dismiss="modal">등록</button>
                                </div>
                            </div>
                          </div>
                        </div>
                    </div>
                </div>
                <script>
                    function fn_checkByte1(obj){
                        const maxByte = 150; //최대 1500바이트
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
                            
                        let currentByte = 150-totalByte;
                        if(totalByte>maxByte){
                            alert('최대 1500Byte까지만 입력가능합니다.');
                                
                            document.getElementById("counter1").innerText = currentByte+"자 남음";
                            document.getElementById("counter1").style.color = "red";
                        }else{
                            document.getElementById("counter1").innerText = currentByte+"자 남음";
                            document.getElementById("counter1").style.color = "green";
                        }
                    }

                    function fn_checkByte2(obj){
                        const maxByte = 400; //최대 1500바이트
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
                            
                        let currentByte = 400-totalByte;
                        if(totalByte>maxByte){
                            alert('최대 1500Byte까지만 입력가능합니다.');
                                
                            document.getElementById("counter2").innerText = currentByte+"자 남음";
                            document.getElementById("counter2").style.color = "red";
                        }else{
                            document.getElementById("counter2").innerText = currentByte+"자 남음";
                            document.getElementById("counter2").style.color = "green";
                        }
                    }
                </script>
                <div id="content2"></div>
            </div>
        </div>
    </div>
</body>
</html>