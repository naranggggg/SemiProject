<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    
<!DOCTYPE html>
<html>

	<head>
	
		<!-- 라이브러리 + 링크  -->
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    	<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
		integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" 
		crossorigin="anonymous">
		
		<meta charset="UTF-8">
	    
		<title>늴리리</title>
	
		<style>
		
			#footer{
			margin-top: 60px;
			color: gray;
			
			}
			
			#f_text{
			    padding-top: 40px;
			
			}
			
			.list-area{
			    border-top: 3px solid #313131;
			    border-bottom: 3px solid #313131;
			    text-align: center;
			    width: 1000px;
			    margin-top: 150px;
			}
			
			#title1{
			    width:150px;
			    height:100px;
			    /* border:1px solid green; */
			    float:left;

			    /* font-family: 'Nanum Gothic', sans-serif; */
			    font-family: 'Noto sans KR' sans-serif;
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
			
			#title2{
			    width:240px;
			    height:100px;
			    /* border:1px solid red; */
			    float:left;

			    font-size: 34px;
			    /* font-family: 'Nanum Gothic', sans-serif; */
			    font-family: 'Noto sans KR' sans-serif;
			    font-size: 30px;
			    font-weight: 800;
			    display: flex;
			    justify-content: center;
			    align-items: center;
			    margin-top: 30px;
			}
			
			div{

			    /* font-family: 'Nanum Gothic', sans-serif; */
			    font-family: 'Noto sans KR' sans-serif;
			    font-weight: 400;
			}
			
			
			td{
			    height: 70px;
			}
			
			#tdtitle{
			    width: 50px;
			
			}
			
			th{
			    text-align: left;
			    padding-left: 20px;
			    
			}
			
			#trtitle{
			    border-bottom: 1px solid #DDDDDD;
			}
			
			#bottondiv{
			    padding-top: 40px;
			    
			}
			
			#button1{
			    width: 160px;
			    height: 50px;
			    background-color: #fff;
			    border: 0.5px solid #000;
			    font-weight: 600;
			}
			
			#button2{
			    width: 160px; 
			    height: 50px; 
			    background-color: #A12B2B; 
			    color: #ffffff;
			    border: none;
			    font-weight: 1000px;
			
			}
			
			#list{
			    border: 1px solid #D2D2D2;
			    font-size: 13px;
			    margin-left: 900px;
			}
			
			.reply-area{
			    /* border: 1px solid #000; */
			    /* background-color: #D2D2D2; */
			    width: 1000px;
			    margin-top: 50px;
			    margin-left: 460px;
			    
			}
			
			#replywrite{
			    background-color: #D2D2D2;
			    /* border-bottom: 1px solid #444444; */
			}
			
			
			#replyinput{
			    margin-left: 20px;
			    width: 860px;
			    height: 40px;
			    font-size: 14px;
			
			}
			
			#replybutton{
			    width: 90px;
			    height: 40px;
			    margin-right: 20px;
			    background-color: black;
			    color: white;
			    font-size: 14px;
			}
			
			  #replylist{
			    width: 1000px;
			    font-size: 14px;
			    /* background-color: #e4e4e4; */
			    
			}
			
			#replylist-tr{
			    border-bottom: 1px solid #DDDDDD;
			}
			
			</style>
	</head>
	
	<body>
		
	
	
		<div class="wrap">
		
			<!-- 헤더바 -->
			<%@ include file="/views/common/headerBar.jsp" %>
			
			<br>
			
			<!--공지사항 로고 1-->
			<div id="title1">서울 여행 정보 공유 사이트</div>
			
			<!--게시판 타이틀-->
			<div id="title2">늴리리 공지사항</div>
			
			<!--게시글 상세보기 테이블-->
			<table class="list-area" align="center">
			
				<thead>
					<tr id="trtitle">
		            	<th>여행공유</th>
		                <td>${n.boardCategory }</td>
						<th width="80">제목</th>
		                <td>${n.boardTitle }</td>
				    </tr>
				    <tr id="trtitle">
				    	<th>작성자</th>
				        <td>${n.boardWriter }</td>
						<th>작성일</th>
				        <td>${n.regiDate }</td>
				    </tr>
				    <tr id="trtitle">
				    	<th width="100" height="280">내용</th>
				        <td colspan="4">${n.boardContent }</td>
				    </tr>
				</thead>
				
				<tbody>
					<tr>
					    <th width="100" height="50">첨부파일</th>
			            <td colspan="4" >
			            <c:choose>
							<c:when test="${ empty at }">
								첨부파일이 없습니다.						
							</c:when>
							<c:otherwise>
								<a download="${at.originName }" href="${contextPath}${at.filePath}${at.changeName}">${at.originName }</a>						
							</c:otherwise>
						</c:choose>
			            </td>
					</tr>
				</tbody>
				
			
			</table>
			
			
			<br>
			
			<!--목록으로 이동하는 버튼-->
			<div align="center">
			    <button id="list" onclick="location.href='${header.referer}'">목록으로</button>
			</div>
			
			<!--수정하기/삭제하기 버튼 관리자 아이디로 로그인했을때만 보임-->
			<div align="center" id="bottondiv">
			    
				<c:if test="${loginMember.memberId eq 'admin'}">
					<button id="button2" onclick="location.href='${contextPath}/update.no?nno=${n.boardNo }'">수정하기</button>
					<button id="button1" onclick="confirmDelete()">삭제하기</button>
				</c:if>
			         
			</div>
			
				
			<!--푸터영역-->
			<div id="footer" align="center">
				<hr>
				    
				<span id="f_text">
			        고객문의  |  이용약관  | 개인정보취급방침  |  사이트맵
			        <br><br>
			        서울시 영등포구 선유동 2로 57 이레빌딩 20층 E강의장  TEL 1544-9970
			        <br>
			        COPYRIGHT ⓒ  1988-2023 KH IEI ALL Right Reserved
				</span>
			</div>
			
		</div>
		
			
		<!----------------------------- SCRIPT 구문 ----------------------------->			
		
		
		<!-- 글 삭제하기 함수 -->
		<script>
			function confirmDelete() {
			    var confirmDelete = confirm('정말 삭제하시겠습니까?');
			    if (confirmDelete) {
			        // 사용자가 확인을 선택한 경우에만 삭제 요청을 보내고 페이지를 이동
			        location.href = '${contextPath}/delete.no?nno=${n.boardNo}';
			    } else {
			        // 사용자가 취소를 선택한 경우, 아무 동작도 수행하지 않습니다.
			        // 필요에 따라 다른 동작을 추가할 수 있습니다.
			    }
			}
		</script>
		
	</body>
</html>

