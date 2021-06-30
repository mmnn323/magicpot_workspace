<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스토리 작성</title>
<link rel="stylesheet" href="resources/css/funding/stroyEnrollForm.css">
<style>
    /* checkbox */
    input[type="checkbox"] {
        display: none;
    }
    input[type="checkbox"]+label {
    display: inline-block;
    padding-left:32px;
    height: 23px;
    background: url('resources/images/common/check-mark.png') no-repeat 0 0px / contain;
    }
    input[type='checkbox']:checked+label {
        background: url('resources/images/common/checked.png') no-repeat 0 1px / contain;
    }
    label{
        font-size:17px;
        font-weight:600;
        margin-bottom:0px;
    }
    
	/* modal 쪽 css */
	fieldset{
	    padding: 15px 20px 0px 20px;
	    border: 2px solid #d8d8d8;
	    border-radius: 5px;
	}
	#checkSummary{
	    font-size: 15px;
	    color: #919191;
	}
	#count{
	    float: left;
	    font-weight: 600;
	    color: #4b4b4b;
	}
	#agreeContent{
	    margin-left: 30px;
	    color: #4b4b4b;
	}
</style>
</head>
<body>
    <div class="wrap">
        <jsp:include page="basicTemplateMenuAbled.jsp"/>
        <div id="content">
            <div id="content1">
                <p id="category" style="color:#a1a0a0">펀딩 준비 > <span style="color:#353535">기본 정보</span></p>
                <h3 style="font-weight:600;">스토리 작성</h3>
                <h5 id="summary">
                    크리에이터님의 프로젝트를 소개해보세요.<br>
                    스토리에는 크리에이터님의 진심이 잘 녹여질 수 있도록 명확하고, 솔직하게, 친근한 어투로 작성하세요.
                </h5>
                <br><br>
                <form action="" method="post">
                    
                    <h5>소개 사진 등록</h5>
                    <p id="p5">프로젝트 페이지 상단에 노출될 사진을 올려주세요.</p>
                    <label id="imageUpfile" for="proImage"><i class="fas fa-camera"></i> 등록하기</label>
                    <input type="file" id="proImage" class="form-control-file border" name="proImage" style="display:none;">
                    <p id="p6">
                        2MB 이하의 JPEG, JPG, GIF, PNG 파일<br>
                        사이즈 : 최소 630X400 픽셀 이상
                    </p>
                    <br><br>
                    
                    <h5>프로젝트 요약</h5>
                    <p id="p5">프로젝트 상단에 노출됩니다.</p>
                    <textarea name="rewardPlan" id="rewardPlan" cols="80" rows="5" maxlength="250" style="resize: none;width: 70%;" onkeyup="fn_checkByte(this)"></textarea><br>
                    <p id="counter">250자 남음</p>
                    <br><br>

                    <h5>프로젝트 광고 심의 동의</h5>
                    <p id="p5">
                        스토리 작성 전, 매직팟에서 제공하는 광고 심의 가이드라인을 반드시 확인하세요. <br>
                        동의를 진행해야 스토리 작성이 가능합니다. 오픈예정 스토리도 적용됩니다.
                    </p>
                    <p id="p6" style="color:rgb(116, 152, 107);margin-top:-15px">공통 표시/광고 가이드 라인</p>
                    <button type="button" id="agreeBtn1"  data-toggle="modal" data-target="#agree"><i class="fas fa-check"></i> 동의하기</button>
                    <!-- <button type="button" id="agreeBtn"  data-toggle="modal" data-target="#agree2"><i class="fas fa-check"></i> 동의하기</button> -->
                    <!-- 모달로 처리, 동의 여부 확인 -> 동의 N일땐 #agree / Y일땐 #agree2 -->
                    <br><br><br><br>

                    

                    <h5>스토리 작성</h5>
                    <p id="p5">
                        진성정 있고 매력적인 스토리로 서포터분들의 마음을 움직여볼까요?<br>
                        <i class="fas fa-info-circle"></i>
                        스토리 필수 항목을 누락할 경우 오픈이 지연될 수 있으며, 
                        제3자의 지식 재산권을 침해할 경우 프로젝트가 중단/취소될 수 있으니 유의해주세요
                    </p>
                    <p id="p6" style="color:rgb(116, 152, 107);margin-top:-15px">
                        바로 상단의 스토리 광고 심의 동의를 진행해주세요!<br>
                        매직팟 심의 가이드라인을 우선 확인 후, 스토리 광고 심의 관련 
                        동의를 진행하여 스토리 작성이 가능합니다.
                    </p>
                    <!-- 스크립트로 동의 후 상단 내용 삭제 + disabled해제 -->
                    <div id="story">
                        <textarea id="summernote" name="editordata">
                            ※ 항목별로 미리 기재되어 있는 내용은 크리에이터님이 필수 항목을 쉽게 작성하실 수 있도록 돕는 가이드 문구이므로, 참고 후 삭제 부탁드립니다.<br><br>
                            <br>
                            <h3>리워드 핵심 포인트 및 소개</h3>
                            도입부에 리워드의 매력 포인트와 차별점을 3줄로 정리하여 서포터분들에게 소개해 주세요.<br><br>
                            (예시)
                            <ul>
                                <li>리워드의 장점은 무엇인가요?</li>
                                <li>매직팟에서만 적용되는 혜택은 무엇인가요?</li>
                                <li>어떤 서포터분들을 위한 리워드인가요?</li>
                            </ul>
                            <br>
                            이어서 리워드의 상세 정보를 안내해 주세요.<br><br>
                            리워드의 이름은 무엇이고, 어떤 용도로 사용하는 제품/서비스인가요?<br> 
                            서포터분들은 리워드를 직접 보고 펀딩할 수 없으므로 사진, 영상과 같은 다양한 시각 자료를 삽입해 주세요.<br><br>
                            리워드 품목에 따라 서포터분들이 꼭 알아야 하는 상세 스펙(특징, 사양, 사이즈, 사용법, 주의 사항 등)을 빠짐없이 알려 주세요.<br><br>
                            <br>
                            <h3>크리에이터 소개</h3><br>
                            서포터분들과 직접 소통하듯, 친근한 인사말과 함께 크리에이터님을 소개해 주세요. 오랜 기간 리워드를 기다리는 서포터분들에게 신뢰를 줄 수 있도록 크리에이터님/팀원들의 모습이 잘 드러나는 사진을 함께 삽입해 주세요.
                            <br><br><br>
                            <h3>매직팟 펀딩 이유</h3><br>
                            매직팟 펀딩 진행 이유와 펀딩금 사용 계획을 작성해 주세요. 이는 서포터분들의 지지와 관심, 펀딩으로 이어지도록 하는 중요한 내용입니다.<br><br>
                            <ul>
                                <li>매직팟에서 크라우드펀딩을 진행하는 이유는 무엇인가요?</li>
                                <li>펀딩금은 어떻게 사용하실 계획인가요?</li>
                            </ul>
                            ※ 펀딩금을 기부나 후원과 같이 의미 있는 곳에 사용하실 계획이라면, 서포터분들에게 펀딩금 사용 현황/내역을 공유할 수 있는 방법을 함께 안내해 주세요.<br><br>
                            <br>
                            <h3>리워드 리스트</h3>
                            <br>
                            리워드의 명칭과 구성, 금액, 혜택을 한눈에 확인할 수 있도록 리스트를 삽입해 주세요. 아래와 같이 테이블 기능을 활용하여 표 형식으로 정리해도 좋습니다.<br><br>
                            ※ 반드시 <b>펀딩 준비 > 리워드 설계</b> 화면의 리워드명, 구성, 혜택, 순서와 일치할 수 있도록 확인해 주세요.<br><br>
                            (예시)
                            <table border:1px solid black>
                                <tr>
                                    <th>리워드명</th>
                                    <th>구성</th>
                                    <th>금액</th>
                                    <th>혜택</th>
                                </tr>
                                <tr>
                                    <td>[울트라얼리버드]매직팟 텀블러</td>
                                    <td>텀블러 1개, 코스터 1개</td>
                                    <td>21,000원</td>
                                    <td>30% 가격 혜택 + 무료 배송</td>
                                </tr>
                                <tr>
                                    <td>[슈퍼얼리버드]매직팟 텀블러</td>
                                    <td>텀블러 1개 코스터 1개</td>
                                    <td>24,000</td>
                                    <td>20% 가격 혜택</td>
                                </tr>
                                <tr>
                                    <td>[얼리버드]매직팟 텀블러</td>
                                    <td>텀블러 1개</td>
                                    <td>25,500원</td>
                                    <td>15% 가격 혜택</td>
                                </tr>
                            </table>
                            <br><br>
                            <h3>리워드 발송 정보</h3><br>
                            발송 정보는 서포터분들이 궁금해하는 항목이므로 아래 내용을 상세히 작성해 주세요.<br>
                            <ul>
                                <li>발송 방법: 택배, 우편 발송 등</li>
                                <li>발송 일정: 0월 0일 발송 시작</li>
                                <li>
                                    도서/산간 지역 발송 안내<br>
                                    - 도서/산간 지역 배송 가능 여부<br>
                                    - 추가 배송비: 00 <br>
                                    - 지불 방법: 다음 세 가지 방법 중 한 가지를 선택해 주세요.<br>
                                    <ol>
                                        <li>펀딩 시 후원금 더하기에 추가 배송비를 입력해 주세요.</li>
                                        <li>펀딩 시 도서/산간 추가 배송비 리워드를 함께 펀딩해 주세요. (단, 펀딩 준비 > 리워드 설계 화면에서 추가 배송비 리워드 별도 생성 필수)</li>
                                        <li>최종 결제일 이후 서포터분들에게 개별 안내해 드리는 계좌로 추가 배송비를 직접 입금해 주세요.</li>
                                    </ol>
                                </li>
                                <li>배송 시 포장 상태</li>
                                <li>문의 채널과 문의 가능한 시간: 카카오 채널, 크리에이터에게 문의하기, 메일, 전화번호 등</li>
                                <li>수령 후 보관 시 유의 사항: </li>
                            </ul>
                            <br><br><br>
                            ※ 아래 내용은 스토리 최하단에 필수로 삽입해 주세요.
                            <br><br><br><br>
                            <h2>서포터 안내</h2>
                            <hr>
                            <ul>
                                <li>단순 변심으로 인한 펀딩금 반환은 불가합니다.</li>
                                <li>펀딩 성공 직후에 결제가 진행되지 않습니다.</li>
                                <li>결제는 프로젝트 종료일 다음 날부터 4영업일간 진행됩니다.</li>
                                <li>
                                    리워드 옵션/배송지/카드 정보는 펀딩 마감일까지<br>
                                    <b>마이 페이지>펀딩하기>펀딩 내역</b>페이지에서 수정 가능합니다.
                                </li>
                                <li>
                                    펀딩 마감 이후 불가피한 사유로 배송지를 변경해야 하는 분은<br>
                                    해당 페이지 내 <b>크리에이터에게 문의하기</b>를 통해서 문의해 주세요.
                                </li>
                            </ul>
                        </textarea>
                    </div>
                    <br><br>
                    <script>
                        $(function(){
                            // 심의 동의 해야 disabled해제
                            $('#summernote').summernote({
                                height:400,
                                minHeight:400,
                                maxHeight:400,
                                lang:"ko-KR",                                    
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
                                $('#summernote').summernote('disable');
                        })
                    </script>
                    
                    <!-- 전부 입력 되어야 disabled 해제 -->
                    <button id="submit_btn" type="submit">저장하기</button>
                </form>
                <br><br> <br><br><br><br><br><br>
                <!-- 광고 심의 동의 모달 -->
                <div class="modal fade" id="agree">
                    <div class="modal-dialog modal-lg">
                      <div class="modal-content">
                      
                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">광고 심의 동의를 진행하고 스토리 작성을 시작하세요.</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        
                        <!-- Modal body -->
                        <div class="modal-body">
                            <h6 style="color:#7a7a7a">
                                매직팟은 처음 시작하는 크리에이터님을 위해 스토리 광고 심의에 대한 가이드를 제공하고 있습니다.
                                모든 사항을 꼼꼼히 확인하세요.
                            </h6>
                            <br>
                            <fieldset>
                                <input type="checkbox" id="check1" name="checkOne"> 
                                <label for="check1">매직팟 심의 가이드 라인을 숙지하여야합니다.</label>
                                <hr>
                                <p id="checkSummary">
                                    개설자(이하 "크리에이터")는 매직팟플랫폼(주)(이하 "매직팟")가 게시 및 안내하는 심의 가이드라인을 확인하고 이를 숙지하여야 합니다.
                                    이를 확인하지 않거나 오인하여 발생한 손해에 대한 책임은 크리에이터가 부담하여야 합니다.
                                </p>
                            </fieldset>
                            <br>
                            <fieldset>
                                <input type="checkbox" id="check2" name="checkOne"> 
                                <label for="check2">매직팟 심의 가이드 라인을 숙지하여야합니다.</label>
                                <hr>
                                <p id="checkSummary">
                                    개설자(이하 "크리에이터")는 매직팟플랫폼(주)(이하 "매직팟")가 게시 및 안내하는 심의 가이드라인을 확인하고 이를 숙지하여야 합니다.
                                    이를 확인하지 않거나 오인하여 발생한 손해에 대한 책임은 크리에이터가 부담하여야 합니다.
                                </p>
                            </fieldset>
                            <br>
                            <fieldset>
                                <input type="checkbox" id="check3" name="checkOne"> 
                                <label for="check3">매직팟은 담당기관의 해석을 우선시합니다.</label>
                                <hr>
                                <p id="checkSummary">
                                    매직팟에서 제공하는 가이드라인은 심의를 담당하는 기관 및 기관 담당자에 따라 해석이 달라질수 있으며,
                                    이 경우 매직팟은 해당 기관 및 기관 담당자의 해석을 우선시합니다.
                                    또한 매직팟이 기관 및 기관 담당자를 통해 직접 삭제 또는 수정 권고를 받은 경우 매직팟은 임의 삭제 또는 수정 등의 조치를 할 수 있습니다.
                                </p>
                            </fieldset>
                            <br>
                            <fieldset>
                                <input type="checkbox" id="check4" name="checkOne"> 
                                <label for="check4">제 3자의 지적재산권을 침해하지 않아야 합니다.</label>
                                <hr>
                                <p id="checkSummary">
                                    크리에이터는 개설한 프로젝트 및 구성 리워드가 제 3자의 지식재산권을 침해하거나 침해할 가능성이 없음을 진술 및 보증하여야 합니다.
                                    매직팟 지식재산권 보호정책을 위반하여 제 3자의 권리를 침해하거나 침해할 가능성이 있는 경우,
                                    크리에이터는 이와 관련된 법적 책임을 지며 매직팟의 해당 프로젝트 중단/취소 등의 제한 조치에 응할 것을 확인합니다.
                                </p>
                            </fieldset>
                            <br>
                            <div id="allCheck" align="right">
                                <input type="checkbox" id="checkAll" name="checkAll"> 
                                <label for="checkAll" style="color:rgb(116, 152, 107);">전체 선택</label>
                            </div>
                            <br>
                            <input type="checkbox" id="agreeCheck" name="agreeCheck"> 
                            <label for="agreeCheck">본인은 스토리 작성에 있어 광고 심의에 대한 설명 및 전문을 제공 받고 그 내용을 충분히 이해하였으며, 동의합니다.</label>
                        </div>
                        
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <!-- disabled에서 전체 체크박스 선택이 되면 abled되도록 + 클릭시 심의동의 여부 Y로 변경해서 story작성 가능하도록 -->
                            <div class="btn" style="margin:auto">
                                <button type="button" id="agreeBtn2" data-dismiss="modal" onclick="click1();" style="width: 170px;">스토리 작성 시작하기</button>
                            </div>
                        </div>
                      </div>
                    </div>
                </div>

                <!-- 광고 심의 동의 모달 동의 Y -->
                <div class="modal fade" id="agree2">
                    <div class="modal-dialog modal-lg">
                      <div class="modal-content">
                      
                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">동의서</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        
                        <!-- Modal body -->
                        <div class="modal-body">
                            <h6 style="color:#7a7a7a">
                                본 서약의 목적은 매직팟플랫폼 주식회사(이하 “회사”)가 운영하는 인터넷사이트<br>
                                http://www.magicpot.kr (이하 “사이트”)에 크라우드펀딩 프로젝트 개설자(이하 “크리에이터”)가
                                프로젝트 개설을 위한 스토리 등의 컨텐츠(이하 “스토리”)를 작성함에 있어 제반 되는 의무를 정함에 있습니다.
                                <br><br>
                                크리에이터는 스토리 작성에 있어 회사의 관련 규정을 성실히 준수하여야 하며, 다음 각 호의 사항에 동의합니다.
                            </h6>
                            <br>
                            <div id="agreeSummary">
                                <div id="count"><p>1</p></div>
                                <div id="agreeContent" style="margin-left:30px">
                                    개설자(이하 "크리에이터")는 매직팟플랫폼(주)(이하 "매직팟")이 게시 및 안내하는 심의 가이드라인을 확인하고 이를 숙지하여야 합니다.
                                    이를 확인하지 않거나 오인하여 발생한 손해에 대한 책임은 크리에이터가 부담하여야 합니다.
                                </div>
                            </div>
                            <br><br>
                            <div id="agreeSummary">
                                <div id="count"><p>2</p></div>
                                <div id="agreeContent" style="margin-left:30px">
                                    매직팟에서 제공하는 가이드라인은 심의를 담당하는 기관 및 기관 담당자에 따라 해석이 달라질수 있으며, 이 경우 매직팟는 해당 기관 및 기관 담당자의 해석을 우선시합니다.
                                    또한 매직팟이 기관 및 기관 담당자를 통해 직접 삭제 또는 수정 권고를 받은 경우 매직팟은 임의 삭제 또는 수정 등의 조치를 할 수 있습니다.
                                </div>
                            </div>
                            <br><br>
                            <div id="agreeSummary">
                                <div id="count"><p>3</p></div>
                                <div id="agreeContent" style="margin-left:30px">
                                    크리에이터는 표시광고의 공정화에 관한 법률, 전기용품 및 생활용품 안전관리법, 상표법, 저작권법 등 스토리 작성과 관련하여 법령이 요구하는 사항을 준수해야 하며, 법령을 준수하지 않아 발생하는 손해에 대한 책임은 크리에이터가 부담하여야 합니다.
                                    매직팟은 크리에이터가 법령을 준수하지 않음으로써 브랜드 이미지 실추 등의 손해를 입을 수 있는 바, 이를 대비하기 위해 법령을 준수하지 않은 사항에 대하여 임의 삭제 또는 수정 등의 조치를 할 수 있습니다.
                                </div>
                            </div>
                            <br><br>
                            <div id="agreeSummary">
                                <div id="count"><p>4</p></div>
                                <div id="agreeContent" style="margin-left:30px">
                                    크리에이터는 개설한 프로젝트 및 구성 리워드가 제 3자의 지식재산권을 침해하거나 침해할 가능성이 없음을 진술 및 보증하여야 합니다. 
                                    매직팟 지식재산권 보호정책을 위반하여 제 3자의 권리를 침해하거나 침해할 가능성이 있는 경우,
                                    크리에이터는 이와 관련된 법적 책임을 지며 매직팟의 해당 프로젝트 중단/취소 등의 제한 조치에 응할 것을 확인합니다.
                                </div>
                            </div>
                            <br><br>
                            <p style="color:#7a7a7a;" align="center">본 동의서에서 정하지 않은 사항은 회사와 크리에이터 사이에 별도 합의한 약정 내용 및 이용약관을 따릅니다.</p>
                        
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <div class="btn">
                                <button type="button" id="agreeBtn3" data-dismiss="modal" onclick="click1();" style="width: 100px;">확인</button>
                            </div>
                        </div>
                      </div>
                    </div>
                </div>
                <script>

                    // 글자 입력 아이디 안쓰고 하는거 방법 찾아서 하나로 줄이기 next왜안되냐고~!~!
                    function fn_checkByte(obj){
                        const maxByte = 250; //최대 1500바이트
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
                        
                        let currentByte = 250-totalByte;
                        if(totalByte>maxByte){
                            alert('최대 200Byte까지만 입력가능합니다.');
                            
                            document.getElementById("counter").innerText = currentByte+"자 남음";
                            document.getElementById("counter").style.color = "red";
                        }else{
                            document.getElementById("counter").innerText = currentByte+"자 남음";
                            document.getElementById("counter").style.color = "green";
                        }
                    }

                    // 체크박스 스크립트
                    function allCheckFunc( obj ) {
                        $("[name=checkOne]").prop("checked", $(obj).prop("checked") );
                    }
                    /* 체크박스 체크시 전체선택 체크 여부 */
                    function oneCheckFunc( obj )
                    {
                        var allObj = $("[name=checkAll]");
                        var objName = $(obj).attr("name"); // checkOne

                        if( $(obj).prop("checked") )
                        {
                            checkBoxLength = $("[name="+ objName +"]").length; // [name=checkOne] 전체 체크박스 개수
                            checkedLength = $("[name="+ objName +"]:checked").length; // [name=checkOne]:checked 전체 체크된 체크박스 개수
                            // check된 경우 안된경우 다른 길이로 비교

                            if( checkBoxLength == checkedLength ) { // [name=checkOne]
                                allObj.prop("checked", true); // checkAll의 checked true
                            } else { // [name=checkOne] == [name=checkOne]:checked
                                allObj.prop("checked", false); // checkAll의 checked false
                            }
                        }
                        else
                        {
                            allObj.prop("checked", false);
                        }
                    }

                    $(function(){
                        $("[name=checkAll]").click(function(){
                            allCheckFunc( this ); // checkAll
                            // console.log($("[name=checkAll]").is(":checked"));

                            // checkAll 되었을때 disabled 삭제!
                            if($("[name=checkAll").is(":checked") == true){
                                // console.log($("[name=checkAll]").is(":checked"));
                                $("#after_btn").removeAttr("disabled");
                            }else{
                                $("#after_btn").attr("disabled", true);
                                // console.log($("[name=checkAll]").is(":checked"));
                            }
                        });

                        $("[name=checkOne]").each(function(){
                            $(this).click(function(){
                                oneCheckFunc( $(this) ); // checkOne
                                
                                // 계속 반복해서 전체 선택이 된 경우에 disabled삭제! 
                                if($("[name=checkAll]").is(":checked") == true){
                                    $("#after_btn").removeAttr("disabled");
                                    console.log($("[name=checkAll]").is(":checked"));
                                }else{
                                    $("#after_btn").attr("disabled", true);
                                    console.log($("[name=checkAll]").is(":checked"));
                                }
                            });
                        });
                    });

                    function click1(){
                        console.log("클릭됨")
                    }
                </script>
            </div>
            <div id="content2"></div>
        </div>
    </div>
</body>
</html>