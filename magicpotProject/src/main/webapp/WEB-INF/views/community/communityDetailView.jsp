<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Community Detail View</title>

<!-- css -->
<link rel="stylesheet" type="text/css" href="resources/css/community/communityDetailView.css">  

</head>
<body>

	<!-- 헤더 포함 -->
	<jsp:include page="../common/header.jsp"/>
	
    <div id="outer">

        <!-- 커뮤니티 타이틀 영역 -->
        <div id="cm_titleArea">
            <div id="cm_titleArea1">
                <div>
                    <img src="resources/images/community/cmLogo.png" alt="">
                </div>
                <div>
                    <b>커뮤니티</b>
                    <p>
			                        지속 가능한 지구를 위해 제로웨이스트에 대한 <br>
			                        다양한 정보와 활동을 자유롭게 공유하는 공간입니다.
                    </p>
                </div>
            </div>
        </div>

        <!-- 커뮤니티 내용 영역 -->
        <div id="cm_contentArea" align="center">
            <div id="cm_infoArea">
                <div id="cm_category">
                    <c:choose>
                    	<c:when test="${ cm.cmCategory == 1 }">
                    		자유수다
                    	</c:when>
                    	<c:when test="${ cm.cmCategory == 2 }">
                    		정보나눔
                    	</c:when>
                    	<c:otherwise>
                    		#용기내
                    	</c:otherwise>
                    </c:choose>
                </div>
                <div id="cm_title">
                    ${ cm.cmTitle }
                </div>
                <div id="cm_info">
                    ${ cm.memId } &nbsp | &nbsp  ${ cm.enrollDate }
                </div>
            </div>
            
            <!-- 로그인 && 로그인 유저=글쓴이인 경우 보이는 수정/삭제 버튼, 로그인 && 로그인 유저 = 관리자일 경우 삭제 버튼 -->
            <c:if test="${ !empty loginUser}">
            	<c:if test="${ loginUser.memId eq cm.memId }">
		        <div id="WriterBtnArea" align="center">
		                <span id="WriterBtnArea2" style="margin-left: 800px;">
		                    <a class="btn btn-success" onclick="postFormSubmit(1);">수정</a>
		                    <a class="btn btn-success" data-toggle="modal" data-target="#cmDeleteBtn">삭제</a>
		                </span>
		         </div>
		         </c:if>
		         <c:if test="${ loginUser.memId ne cm.memId and loginUser.memId == 'admin' }">
		        <div id="WriterBtnArea" align="center">
		                <span id="WriterBtnArea2" style="margin-left: 800px;">
		                    <a class="btn btn-success" data-toggle="modal" data-target="#cmDeleteBtn">삭제</a>
		                </span>
		         </div>
		         </c:if>
	         </c:if>
	         
	         <form id="postForm" action="" method="post">
        		<input type="hidden" name="cmNo" value="${ cm.cmNo }">
        		<input type="hidden" name="filePath" value="${ cm.cmImage }">
        	
	    		<!-- The Modal : 공지사항 삭제-->
	            <div class="modal fade" id="cmDeleteBtn" align="center">
	                <div class="modal-dialog modal-dialog-centered">
	                    <div class="modal-content">
	                        <!-- Modal body -->
	                        <br>
	                        <div class="modal-body">
	                            	커뮤니티 게시글을 삭제하시겠습니까?
	                        </div>
	                        <!-- Modal footer -->
	                        <div id="cmModalFooter">
	                            <button id="cmOkBtn" class="btn btn-warning" onclick="postFormSubmit(2);">OK</button>
	                            <button id="cmCancleBtn" data-dismiss="modal" class="btn btn-secondary">Cancle</button>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </form>
        
	        <script>
		       	function postFormSubmit(num){
		       		if(num == 1){ // 수정하기 클릭 시
		       			$("#postForm").attr("action", "updateForm.cm").submit();
		       		}else{ // 삭제하기 클릭 시
		       			$("#postForm").attr("action", "delete.cm").submit();
		       		}
		       	}
	        </script>

            <div id="noticeLine"></div>

            <div id="cm_content">
                ${ cm.cmContent }
            </div>
        </div>

        <div id="noticeLine"></div>

		<!-- 커뮤니티 댓글 영역 -->
        <div id="cm_commentArea">

            <div id="cm_conmmentArea_1" align="center">

                <!--댓글 수 노출 -->
                <div id="commentCount" align="left">
                    <div><i class="far fa-comment-dots"></i> 댓글 <span id="rcount"><b style="color:gray;">0</b></span></div>
                </div>
                
                <!-- 댓글 리스트 -->
                <div id="commentList" align="left" style="width:800px;">
                
                </div>
                
                <!-- 댓글 등록 영역 -->
                <c:choose>
                <c:when test="${ !empty loginUser }">
	                <div id="enrollComment" class="enrollComment">
	                    <div style="color:rgb(83, 83, 83);">${ loginUser.memId }</div>
	                    <textarea style="border:none;"id="enrollContent" class="reCoContent" cols="90" rows="3"  placeholder="댓글을 남겨보세요"></textarea>
	                    <!-- <a class="btn btn-success btn-sm" onclick="addComment(0, 0, 11);">등록</a> -->
	                    <a class="btn btn-success btn-sm" id="enrollTest" onclick="beforeEnrollContent();">등록</a>
	                </div>
                </c:when>
                <c:otherwise>
	                <div id="enrollComment" align="center">
	                    <textarea name="" id="" cols="90" rows="3"  placeholder="로그인이 필요한 서비스 입니다" readonly></textarea>
	                    <a class="btn btn-success btn-sm disabled" >등록</a>
	                </div>
                </c:otherwise>
                </c:choose>
				
				<!-- 스크립트 : 댓글 관련 -->
                <script>
                	
                	// 댓글 작성 : 유효성 검사 후 댓글 작성 함수 addComment() 호출
                	function beforeEnrollContent(){
                		var cmCommentContent = $("#enrollContent").val();
                		//alert(cmCommentContent);
                		if(cmCommentContent.trim().length != 0){
                			addComment(0, 0, cmCommentContent);
                		} else{
                			swal("", "내용을 입력해주세요.", "warning");
                		}
                	}
                
                	// 댓글 리스트 조회
	                $(function(){
	                	selectCmCommentList();
	            		
	            		// 실시간 댓글 반영 => 댓글리스트 조회를 주기적으로 하면 된다!
	            		// 1초 간격으로 매번 댓글 리스트를 조회해옴
	            		//setInterval(selectCmCommentList, 1000);
	            		// => 메인페이지 : 실시간 리스트
	            	})
            	
	            	// ajax : 댓글 등록
	            	function addComment(cmCommentNo, cmCommentDepth, cmCommentContent){
						
	        			var cmCommentNo 	 = parseInt(cmCommentNo);		// 댓글번호 담기     (댓글 등록 시 CMCO_REF가 된다)
	        			var cmCommentDepth 	 = parseInt(cmCommentDepth);	// 댓글의 깊이 담기 (댓글 등록시 댓글깊이 +1로 insert!)
	            		var cmCommentContent = cmCommentContent				// 댓글 내용 담기
	        			
			    		if($(".reCoContent").val().trim().length != 0){ 	// 댓글이 작성 유효성 검사 : 공백을 제외한 텍스트 길이가 0 이상일 경우 댓글 등록 ajax 실행
			    			
			    			$.ajax({
			    				url:"rinsert.cm",
			    				data:{
			    					memNo:"${ loginUser.memNo }",			// 로그인한 회원의 회원번호 (댓글 작성자 번호)
			    					cmNo:${cm.cmNo},						// 커뮤니티 게시글 번호       (해당 댓글이 어느 게시글에 달린 건지)
			    					memId:"${ loginUser.memId }",			// 로그인한 회원의 아이디    (댓글 작성자 아이디)
			    					cmCommentRef:cmCommentNo, 				// 참조댓글번호                  (원글0  || 실제참조댓글번호)
			    					cmCommentDepth:cmCommentDepth+1,		// 댓글의 깊이                    (원글1,대댓글2,대대댓글3,..) => 현재 댓글 깊이의 +1
			    					cmCommentContent:cmCommentContent		// 댓글 내용
			    				},
			    				success:function(status){					// 댓글 등록 성공 => 댓글창 비우기, 갱신된 댓글 리스트 조회
			    					if(status == "success"){			
			    						$("#enrollContent").val("");
			    						selectCmCommentList();
			    					}
			    				},error:function(){
			    					console.log("댓글 작성용 ajax 통신 실패");
			    				}
			    			})
			    		
			    		}else{ 												// 댓글 미작성 => alert
			    			swal("", "내용을 입력해주세요.", "warning");		
			    		}
			    		
			    	}
            	
	                 // ajax : 댓글 리스트 조회
	                 function selectCmCommentList(){
	                	 
	             		$.ajax({
	             			url:"rlist.cm",
	             			data:{cmNo:${ cm.cmNo }},	// 커뮤니티 게시글 번호
	             			success:function(list){
	             				
	             				var value="";						// 응답데이터로 돌려줄 댓글 리스트 변수
	             				var status="";						// * 임시 (참조된 댓글일 경우 삭제 시 : '삭제된 댓글입니다'로 표현하고 싶음)
	             				$.each(list, function(i,obj){
	             					status = obj.status;			// * 임시 (참조된 댓글일 경우 삭제 시 : '삭제된 댓글입니다'로 표현하고 싶음)
	             					value += "<div class='cmComment'";
	             					
	             					if('${loginUser.memId}' == obj.memId){ // 내가 쓴 댓글일 경우 css 적용
	             						value += "style='background-color:rgba(238, 238, 238, 0.349); border-radius:5px;'"
	             					}
	             					
	             					value  += 	"><input type='hidden' value=" + obj.cmCommentNo + ">"							// hidden : 댓글번호
	             						   + 	"<input type='hidden' value=" + obj.cmCommentDepth + ">"						// hidden : 댓글깊이
	             						   + 	"<input type='hidden' value=" + obj.memId + ">" 								// hidden : 댓글작성자 아이디 (위치 탐색해서 쓰면 되는데 탐색 못하겠음,,)
	             						   + 	"<input type='hidden' value='" + obj.cmCommentContent + "'>" 					// hidden : 댓글내용 (위치 탐색해서 쓰면 되는데 탐색 못하겠음,,)
	             					       +	"<div id='commentArea' style='margin-left:" + obj.cmCommentDepth*20 +"px;'>"	// 대댓글일 경우 div위치 조정
	             					       +		"<div id='commentArea1'>";
	             					
									if(obj.cmCommentRef > 0){ // 대댓글일 경우 화살표 아이콘 추가
	             						value += 		"<span><i class='fas fa-reply fa-rotate-180' style='color:rgb(92, 121, 85);'></i></span> &nbsp"
	             					}
	             					     
									value +=			"<b style='color: rgb(116, 152, 107);'>" + obj.memId + "</b>"					// 댓글 작성자 아이디
	             					       +			"<small style='color:gray'> &nbsp;&nbsp;" + obj.enrollDate + "</small> &nbsp;";	// 댓글 작성일
	             					    
	             					if('${cm.memId}' == obj.memId && status == 'Y'){ // 커뮤니티 게시글 작성자 == 댓글 작성자 일 경우 작성자 아이콘 추가
	             						value += 		"<span class='writerBtn'>작성자</span>"
	             					}
	             						   
	             					value += 		"</div>"
		          						   + 	 	"<div id='commentArea2'>" + obj.cmCommentContent + "</div>";	// 댓글 내용
		          						   
									if(${ !empty loginUser } ){ // 로그인했을 경우에만 댓글/신고/수정/삭제 버튼 노출
	             						value += 	"<div id='commentArea3'>"
									          +   		"<a class='reComment'> 댓글</a>";
	             						if('${loginUser.memId}' != obj.memId){	// 내가 쓴 댓글이 아닐 경우 : 신고 버튼 노출
	             							value += 	" / <a href='' data-toggle='modal' data-target='#reportModal'> 신고</a>"
	             						}
	             						if('${loginUser.memId}' == obj.memId){  // 내가 쓴 댓글일 경우 : 수정/삭제 버튼 노출
	             							value += 	" / <a class='updateCommentForm'> 수정</a>"
	             								   + 	" / <a class='deleteComment'> 삭제</a>"
	             						}else if('${loginUser.memId}' == 'admin'){
	             							value += 	" / <a class='deleteComment'> 삭제</a>"
	             						}
	             						value += 	"</div>";
	             					}
	             					value += 	"</div>"
	             					      +  "</div>";
	             				})
	             				$("#commentList").html(value);  // 댓글 리스트
	             				$("#rcount").text(list.length); // 댓글 수 
	             				
	             			},error:function(){
	             				console.log("댓글 리스트 조회용 ajax 통신 실패");
	             			}
	             		})
	             	}
                </script>
                
                
                <script>
                	var a = 0;					// 대댓글 창 열고 닫기 위한 변수
                	var cmCommentNo = 0;		// 참조하고있는 댓글 번호를 담을 변수
                	var cmCommentDepth = 0;		// 참조하고있는 댓글 깊이를 담을 변수
                	var cmCommentContent = "";	// 
                	
	             	// 대댓글 창 열기 (동적으로 만들어진 댓글리스트 내에 댓글 버튼 클릭 시 해당 댓글에 대한 대댓글 창 열기)
	         		$(document).on("click", ".reComment", function(){
						//alert("클릭됨");
						cmCommentNo 	= $(this).parents(".cmComment").children().eq(0).val();
						cmCommentDepth 	= $(this).parents(".cmComment").children().eq(1).val();
						cmMemId 		= $(this).parents(".cmComment").children().eq(2).val();
						
	         			var reCommentVar = "";
						reCommentVar += "<div id='reComment' align='center' style='margin-top:10px; background-color:white;'>"
					                  + 	"<div style='color:rgb(83, 83, 83);'>" + "${loginUser.memId}" + "</div>"
					                  + 	"<textarea class='reCoContent' style='width:90%;' rows='3' placeholder='댓글을 남겨보세요' >"+ " @" + cmMemId + "&nbsp;" + "</textarea>"
					                  + 	"<a class='btn btn-success btn-sm reCommentClose' style='margin-left:80%;' >취소</a>"
					                  + 	"<a class='btn btn-success btn-sm addComment2' style='margin-left:5px;' >등록</a> </div>";
					                  + "</div>";      
					                  
					   if(a == 0){ // 전역변수 a를 활용하여 대댓글창 열고 닫기
						   $(this).parent().append(reCommentVar);
							a++;
					   }else if(a == 1){
						   $("#reComment").remove();
						   a--;
					   }
					   
					});
					
	             	// 대댓글 창 제거(대댓글 창 안 취소 버튼 클릭 시)
					$(document).on("click", ".reCommentClose", function(){
						$("#reComment").remove();
					});
	             	
	             	// 대댓글 등록
	             	$(document).on("click", ".addComment2", function(){
	             		cmCommentContent = $(this).siblings(".reCoContent").val();
	             		//alert(cmCommentContent);
	             		addComment(cmCommentNo, cmCommentDepth, cmCommentContent);
	             	})
	             	
	             	// ajax : 댓글 삭제
	             	$(document).on("click", ".deleteComment", function(){
	             		cmCommentNo = $(this).parents(".cmComment").children().eq(0).val();
	             		//alert(cmCommentNo);
	             		
	             		$.ajax({
			    			url:"rdelete.cm",
			    			data:{cmCommentNo:cmCommentNo},
			    			success:function(status){
			    				//console.log(list);
			    				if(status == "success"){
				    				swal("Success!", "댓글이 삭제되었습니다.", "success");
				    				selectCmCommentList();
			    				}else if(status ="hasComment")
			    					swal("", "답글이 있는 댓글은 삭제할 수 없습니다", "warning");
			    			},error:function(){
			    				console.log("댓글 삭제용 ajax 통신 실패");
			    			}
		    			})
		    			
	             	})
	             	
	             	// 댓글 수정 화면으로 변환
	             	$(document).on("click", ".updateCommentForm", function(){
	             		//alert("수정 클릭");
	             		cmCommentNo  = $(this).parents(".cmComment").children().eq(0).val();
	             		oldComment   = $(this).parents(".cmComment").children().eq(3).val();
						//alert(oldComment);
	             		var reCommentUpdateVar = "";
	             		reCommentUpdateVar += "<div id='reComment' align='center' style='margin-top:10px;'>"
	             							+ 	"<input type='hidden' value=" + cmCommentNo + ">" // 댓글번호
							                + 	"<div style='color:rgb(83, 83, 83);'>" + "${loginUser.memId}" + "</div>"
							                + 	"<textarea class='reCoContent2' id='updateContent' cols='90' rows='3'  placeholder='댓글을 남겨보세요' >"+ oldComment + "</textarea>"
							                + 	"<a class='btn btn-success btn-sm cancelUpdate' style='margin-left:670px;' >취소</a>"
							                + 	"<a class='btn btn-success btn-sm updateComment2' style='margin-left:5px;' >수정</a> </div>"
							                + "</div>";
						//$('#rid' + rid).replaceWith(htmls);
						$(this).parents(".cmComment").replaceWith(reCommentUpdateVar);
						//$('.reCoContent2').focus(); // => *보완필요 : 커서 끝으로 이동시키고 싶음
	             	
						var len = $(this).parents(".cmComment").children().eq(3).val().length;
						$('.reCoContent2').focus(); // => *보완필요 : 커서 끝으로 이동시키고 싶음
						$('.reCoContent2')[0].setSelectionRange(len, len);
	             	})
	             	
	             	// 댓글 수정 취소
	             	$(document).on("click", ".cancelUpdate", function(){
	             		//alert("수정취소");
	             		selectCmCommentList();
	             	})
	             	
	             	// ajax : 댓글 수정
	             	$(document).on("click", ".updateComment2", function(){
	             		updateContent = $("#updateContent").val();
	             		cmCommentNo = $(this).parents("#reComment").children().eq(0).val();
	             		//alert(updateContent);
	             		//alert(cmCommentNo);
	             		if(updateContent.trim().length != 0){
	             		
		             		$.ajax({
				    			url:"rupdate.cm",
				    			data:{
				    					cmCommentNo:cmCommentNo, 
				    					cmCommentContent:updateContent
				    			},
				    			success:function(status){
				    				
				    				if(status == "success"){
					    				swal("Success!", "댓글이 수정되었습니다.", "success");
					    				selectCmCommentList();
				    				}else if(status ="hasComment")
				    					swal("", "댓글 수정을 실패했습니다.", "warning");
				    				
				    			},error:function(){
				    				console.log("댓글 삭제용 ajax 통신 실패");
				    			}
			    			})
	             		}else{
	             			swal("", "내용을 입력해주세요.", "warning");
	             		}
	             	})
						
                </script>

            </div>
        </div>

        <div id="btnArea" align="center">
        	<c:if test="${ !empty loginUser }">
	            <span id="btnArea1">
	                <a href="enrollForm.cm" class="btn btn-success">글쓰기</a>
	            </span>
            </c:if>
            <span id="btnArea2" style="margin-left: 700px;">
                <a href="list.cm" class="btn btn-success">목록</a>
                <a href="#cm_contentArea"" class="btn btn-success"><i class="fas fa-caret-up"></i> TOP</a>
            </span>
        </div>
	
		
		<!-- 댓글 신고 -->
        
        <!-- The Modal : 신고-->
        <div class="modal" id="reportModal">
         <form action="newReport.re" method="post">
            <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">회원 신고하기</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body">
                    <div class="form-group">
                        <label for="sel1">신고 유형</label>
                        <select class="form-control" id="type" name="type">
	                        <option value="광고">광고</option>
	                        <option value="분란조장">분란조장</option>
                        </select>
                    </div>
                    <br>
                    <div class="form-group">
                        <label for="comment">신고 사유</label>
                        <textarea class="form-control" rows="5" id="reportContent" name="reportContent" style="resize:none"></textarea>
                    </div>
                </div>
        
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="submit" class="btn btn-danger" id="reportBtn">신고하기</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                </div>
        
            </div>
            </div>
          </form>
        </div>
        
        <script>
        	$(document).on("click", "#reportBtn", function(){
        		
        		var cmCommentNo = $(".cmComment").children().eq(0).val();
        		var reportType = $("select[name=type]").val();
        		var reMemId = $(".cmComment").children().eq(2).val();
        		/*
        		console.log(cmCommentNo);
				console.log($("#reportContent").val());
				console.log(reportType);
				console.log(${ loginUser.memNo });
				console.log(reMemId);
				*/
        		
        		$.ajax({
					url : "newReport.re",
					data: {
						
    					cmcoNo:cmCommentNo,
    					reportContent:$("#reportContent").val(),
    					reportType:reportType,
						memNo:"${ loginUser.memNo }",		
						reMemId:reMemId
						
					}, success : function(result){
						
						if(result == "success"){
							swal("Success!", "신고 접수 되었습니다. 관리자 확인 후 처리 됩니다.", "success");
							location.reload();
						} 
						
					}, error : function(){
						console.log("ajax 통신 실패");
					}
        		});
        	})
        </script>
        
    </div>
    
    <!-- 푸터 포함 -->
    <jsp:include page="../common/footer.jsp"/>

</body>
</html>