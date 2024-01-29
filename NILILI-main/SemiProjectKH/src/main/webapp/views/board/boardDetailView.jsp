<%@page import="com.nilili.board.model.vo.Board"%>
<%@page import="com.nilili.member.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 로그인 시 사용 가능한 기능이 포함되어 있어 필수 구문입니다. -->
<%
Member loginMember = (Member) session.getAttribute("loginMember");
Board b = (Board) request.getAttribute("b");
%>


<!DOCTYPE html>
<html>
	<head>
	
		<!-- 라이브러리 + 링크  -->
		<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
		<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
		crossorigin="anonymous">
	
		<meta charset="UTF-8">
	
		<title>늴리리</title>

		<style>
			
			#footer {
				margin-top: 60px;
				color: gray;
			}
			
			#f_text {
				padding-top: 40px;
			}
			
			.list-area {
				border-top: 3px solid #313131;
				border-bottom: 3px solid #313131;
				/* text-align: center; */
				width: 1000px;
				margin-top: 150px;
			}
			
			#title1 {
				width: 150px;
				height: 100px;
				/* border:1px solid green; */
				float: left;
				/* font-family: 'Nanum Gothic', sans-serif; */
				font-family: 'Noto sans KR', sans-serif;
				font-size: 12px;
				color: #A12B2B;
				display: flex;
				justify-content: center;
				align-items: center;
				margin-left: 750px;
				margin-top: 30px;
				padding-top: 10px;
				font-weight: 700;
			}
			
			#title2 {
				width: 240px;
				height: 100px;
				/* border:1px solid red; */
				float: left;
				font-size: 34px;
				/* font-family: 'Nanum Gothic', sans-serif; */
				font-family: 'Noto sans KR', sans-serif;
				font-weight: 800;
				display: flex;
				justify-content: center;
				align-items: center;
				margin-top: 30px;
			}
			
			div {
				/* font-family: 'Nanum Gothic', sans-serif; */
				font-family: 'Noto sans KR', sans-serif;
				font-weight: 400;
			}
			
			td {
				height: 70px;
				width: 400px;
				text-align: left;
			}
			
			th {
				text-align: left;
				padding-left: 20px;
				/* width : 100px; */
			}
			
			#trtitle {
				border-bottom: 1px solid #DDDDDD;
			}
			
			#bottondiv {
				padding-top: 40px;
			}
			
			#button1 {
				width: 160px;
				height: 50px;
				background-color: #fff;
				border: 0.5px solid #000;
				font-weight: 600;
			}
			
			#button2 {
				width: 160px;
				height: 50px;
				background-color: #A12B2B;
				color: #ffffff;
				border: none;
				font-weight: 1000px;
			}
			
			#list {
				border: 1px solid #D2D2D2;
				font-size: 13px;
				margin-left: 900px;
			}
			
			.reply-area {
				/* border: 1px solid #000; */
				/* background-color: #D2D2D2; */
				width: 1000px;
				margin-top: 50px;
				margin-left: 460px;
			}
			
			#replywrite {
				background-color: #D2D2D2;
				/* border-bottom: 1px solid #444444; */
			}
			
			#replyinput {
				margin-left: 20px;
				width: 860px;
				height: 40px;
				font-size: 14px;
			}
			
			#replybutton {
				width: 90px;
				height: 40px;
				margin-right: 20px;
				background-color: black;
				color: white;
				font-size: 14px;
			}
			
			#replylist {
				width: 1000px;
				font-size: 14px;
				/* background-color: #e4e4e4; */
			}
			
			#replylist-tr {
				border-bottom: 1px solid #DDDDDD;
			}
			
			#imgth {
				text-align: center;
				padding-right: 30px;
			}
			
			#imgtext {
				height: 30px;
				font-size: 12px;
				color: #5e5b5b;
				display: flex;
				justify-content: center;
				align-items: center;
			}
			
			#img {
				margin-left: 23px;
			}
			
			#contentImg2 {
				margin-left: 20px;
			}
			
			#contentImg3 {
				width: 182px;
				height: 150px;
				position: absolute;
				right: 726px;
				bottom: 0px;
			}
			
			#contentImg4 {
				width: 182px;
				height: 150px;
				position: absolute;
				right: 523px;
				bottom: 0px;
			}
			
			#imgframe {
				position: relative;
			}
			
			#rec_update {
				background: transparent;
				border: none;
				display: inline-block;
			}
		</style>
	</head>
	
	<body>
		<div class="wrap">
			<%@ include file="../common/headerBar.jsp"%> 
		<!-- 전체영역잡는 wrap 이어서 페이지에 들어갈 내용들 밑에있는 div 영역에 집어넣으시길 바랍니다 -->

	
			<!--게시판 로고 1-->
			<div id="title1">서울 여행 정보 공유 사이트</div>
	
			<!--게시판 로고 2-->
			<div id="title2">늴리리 커뮤니티</div>
	
			<!--게시글 상세보기 테이블-->
			<table class="list-area" align="center">
				<thead>
					<tr id="trtitle">
						<th>여행공유</th>
						<td>${b.boardCategory }</td>
						<th>제목</th>
						<td>${b.boardTitle }</td>
					</tr>
	
					<tr id="trtitle">
						<th>작성자</th>
						<td>${b.boardWriter }</td>
						<th>작성일</th>
						<td>${b.regiDate }</td>
					</tr>
	
					<tr id="trtitle">
						<th width="100" height="280">내용</th>
						<td colspan="4"
							style="vertical-align: top; padding-top: 20px; padding-bottom: 20px;">${b.boardContent }</td>
					</tr>
				</thead>
	
				<tbody>
	
					<tr height="225">
	
						<th id="imgth">
							이미지 <br>첨부
						</th>
						<td colspan="4">
							<c:if test="${ empty list }">
		                    	첨부된 이미지가 없습니다.      
	   	                    </c:if> 
	   	                    <c:forEach items="${list}" var="at" varStatus="vs">
								<c:choose>
									<c:when test="${vs.index eq 0 }">
										<div id="imgtext">이미지를 첨부해서 나만의 여행네컷을 만들어보세요.</div>
										
										<!-- 인생네컷 프레임 이미지 -->
										<div style="position: relative;">
											<img src="${contextPath }/resources/img/board/photoframe_nilili_2.png"
											id="imgframe" alt="인생네컷" width="900" height="170">
											
											<!-- 인생네컷 안에 들어가는 이미지 4개 -->
											<!-- titleImg 1개 -->
											<div id="img" style="position: absolute; top: 10px;">
												<img id="titleImg" src="${contextPath }${at.filePath}${at.changeName}" 
												width="182" height="150">
									</c:when>
				
									<c:otherwise>
												<!-- contentImg 3개 -->
												<img id="contentImg${vs.count}"
												src="${contextPath }${at.filePath}${at.changeName}"
												width="182" height="150">
					
											</div>
										</div>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</td>
					</tr>
	
				</tbody>
			</table>
	
			<br>
	
			<!--목록으로 이동하는 버튼-->
			<div align="center">
				<button id="list" onclick="location.href='${header.referer}'">목록으로</button>
			</div>
	
	
	
			<!-- 추천 기능 -->
			<!-- 로그인 안했을 시에 로그인 유도 -->
			<c:if test="${empty loginMember }">
		        글작성, 추천은
		        <button type="button" id="newLogin"onclick="redirectToAddress();">
					<b class="w3-text-blue">로그인</b>
				</button> 후 사용 가능합니다.<br>
			</c:if>
			<c:if test="${ loginMember != null }">
				<button class="btn" id="rec_update">
					<i class="bi bi-heart"></i>
					<div class="rec_count"></div>
				</button>
			</c:if>
















	
			
	
			<!-- 트라이캐치 : 로그인안한상태에서 커뮤니티에 들어갔을시에 뜨는 NullPointerException 예외처리-->
			<!-- 로그인한 유저가 글을 작성한 유저 아이디와 동일하거나 admin일 경우 글 수정 삭제가 가능-->
			<%
				try {
					if (b.getBoardWriter().equals(loginMember.getMemberId()) || loginMember.getMemberId().equals("admin")) {
			%>
					<div align="center" id="bottondiv">
						<button id="button1" onclick="confirmDelete()">삭제하기</button>
						<button id="button2" onclick="location.href='${contextPath}/update.bo?bno=${b.boardNo }'">수정하기</button>
					</div>
			<%
					} ;
			%>
			<%
				} catch (NullPointerException e) {
				}
			%> 
			
			<!-- boardNo와 memberNo 변수 생성-->
			<c:set var="boardNo" value="${b.boardNo}" />
			<c:set var="memberNo" value="${loginMember.memberNO}" />
	
			<!--댓글작성-->
			<table class="reply-area">
				<tbody id="replywrite">
					<tr>
						<td><input type="text" id="replyinput" placeholder="최대 50자까지 작성 가능합니다."></td>
						<td><button onclick="insertReply();" id="replybutton">댓글작성</button></td>
					</tr>
				</tbody>
	
			</table>
			
			<div id="reply">
				<table align="center" id="replylist">
					<tbody>
						<tr>
							<td width="70%" style="padding-left: 20px;">내용</td>
							<td width="15%">작성자</td>
							<td width="15%" style="padding-right: 20px;">작성일</td>
						</tr>
					</tbody>
				</table>
			</div>
	
	
			<!--푸터영역-->
			<div id="footer" align="center">
				<hr>
	
				<span id="f_text"> 고객문의 | 이용약관 | 개인정보취급방침 | 사이트맵 <br> <br>
					서울시 영등포구 선유동 2로 57 이레빌딩 20층 E강의장 TEL 1544-9970 <br> COPYRIGHT ⓒ
					1988-2023 KH IEI ALL Right Reserved
	
				</span>
			</div>
		</div>
		
		<!----------------------------- SCRIPT 구문 ----------------------------->
		
		<!-- 추천 기능에 쓰이는 함수들 -->
		<script>
		
			$(function(){
				likeCheck();
			});
		
			$(function(){
				// 추천버튼 클릭시(추천 추가 또는 추천 제거)
				$("#rec_update").click(function(){
					
					if($("#rec_update>i").hasClass('bi-heart bi')){
						console.log("chk");
						$("#rec_update>i").removeClass('bi bi-heart');
						$("#rec_update>i").addClass('bi bi-heart-fill');
					}else{
						$("#rec_update>i").removeClass('bi bi-heart-fill');
						$("#rec_update>i").addClass('bi bi-heart');
					}
					
					$.ajax({
						url: "likeInsert.bo",
						type: "POST",
						data: {bno : ${boardNo},
							   memberNo:"${memberNo}"
						},
						
						success: function (){
							
							console.log($("#rec_update>i").hasClass('bi bi-heart'));
							
							console.log("여기까진성공");
							
							recCount();
						},
						error: function(xhr, status, error) {
							console.error("AJAX 오류 발생: " + status, error);
							// 에러 발생 시 사용자에게 알림.
						}
					});
				});
				
				// 게시글 추천수
				function recCount() {
					$.ajax({
						url: "likeCount.bo",
						type: "POST",
						data: {
							bno: ${boardNo} // 적절한 방식으로 board_no를 가져와 사용
						},
						success: function (result) {
							$(".rec_count").html(result);
						},
						error: function(xhr, status, error) {
							console.error("AJAX 오류 발생: " + status, error);
							// 에러 발생 시 사용자에게 알림.
						}
					});
				};
				
				recCount(); // 처음 시작했을 때 실행되도록 해당 함수 호출
			});
		
		</script>
		
		<script>
			function likeCheck(){
				$.ajax({
					url: "likeCheck.bo",
					type: "POST",
					data: {
						bno: ${boardNo},
						memberNo: "${memberNo}"
					},
					success: function(result){
						if(result == "${memberNo}"){
							console.log("hi");
							$("#rec_update>i").removeClass('bi bi-heart');
							$("#rec_update>i").addClass('bi bi-heart-fill');
						}else{
							console.log("bye");
							$("#rec_update>i").removeClass('bi bi-heart-fill');
							$("#rec_update>i").addClass('bi bi-heart');
						}
					},
					error: function(){
						console.log("통신에러");
					}
				});
			}
		</script>
		
		<!-- 글삭제시 필요한 함수 -->
		<script>
	        function confirmDelete() {
	            var confirmDelete = confirm('정말 삭제하시겠습니까?');
	            if (confirmDelete) {
	                // 사용자가 확인을 선택한 경우에만 삭제 요청을 보내고 페이지를 이동
	                location.href = '${contextPath}/delete.bo?bno=${b.boardNo}';
	            } else {
	                // 사용자가 취소를 선택한 경우, 아무 동작도 수행하지 않습니다.
	                // 필요에 따라 다른 동작을 추가할 수 있습니다.
	            }
	        }
	    </script>
	    
	    
	    <!-- 댓글작성시 필요한 함수 -->
		<script>
	      
	        $(function(){
	        	selectReplyList();
	        });
	      
	         
	      
		    function selectReplyList(){ //댓글목록 조회 함수
			    //목록 조회해와서 tbody에 tr 만들어넣기 mapping 주소 : replyList.bo
			            
			    $.ajax({
				    url:"replyList.bo",
				    data : {bno : ${b.boardNo}},
				    success : function(result){
					    var str = "";
					                  
					    for (var i in result) {
					                      
						    str += "<tr id='replylist-tr'>" +
						    "<td width='70%' style='padding-left: 20px;'>" + result[i].replyContent + "</td>" +
						    "<td width='15%'>" + result[i].replyWriter + "</td>" +
					        "<td width='15%' style='padding-right: 20px;'>" + result[i].cdate + "</td>" +
					        "</tr>";
					        
				        }
				         
				        $("#reply tbody").html(str);
			        },
			        error : function(){
			        	console.log("통신오류");
			        }
		        });
	        }
	
	        function insertReply(){
	   
		        $.ajax({
		        	
			        url : "insertReply.bo",
			        data : {
				        content:$("#replyinput").val(),
				        bno : ${b.boardNo}
			        },
			        type : "post",
			        success : function(result){
				        if(result>0){//성공
							alert("댓글 작성 성공");
					        //추가된 댓글목록 재조회   
					        selectReplyList();
					        $("#replyinput").val("");
				        }else{//실패
				        	alert("댓글 작성 실패");
				  	    }
			        },
			        error : function(){
			        	console.log("통신오류");
			        }
			   
		   		});
	   
			}
		      
	    </script>
	      
	    <script>
	        function redirectToAddress() {
	            // 주소를 담고 이동할 URL
	            var address = "http://localhost:8888/semi/";
	            
	            // JavaScript의 window.location을 사용하여 페이지 이동
	            window.location.href = address;
	        }
		</script>
	
	
	</body>
</html>
