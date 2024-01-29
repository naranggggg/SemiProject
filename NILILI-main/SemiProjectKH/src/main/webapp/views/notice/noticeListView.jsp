<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
	<head>
	
		<!-- 라이브러리 + 링크  -->
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
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
			    text-align: center;
			}
			
			.list-area>tbody tr:hover{
				background-color:#DADEE8;
				cursor : pointer;
			}
	
			td{
				border-bottom: 1px solid #DDDDDD;
			    height: 46px;
			}
			
			th{
			    height: 54px;
			    text-align: center;
			}
			
			
			#title1{
			    width:150px;
			    height:100px;
			    /* border:1px solid green; */
			    float:left;
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
			
			#title2{
			    width:240px;
			    height:100px;
			    /* border:1px solid red; */
			    float:left;
			    font-size: 34px;
			    /* font-family: 'Nanum Gothic', sans-serif; */
			    font-family: 'Noto sans KR' sans-serif;
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
			
			#write{
			    padding-top: 30px;
			    padding-left: 850px;
			}
			
			table{
			    width: 1000px;
			    margin-top: 150px;
			}
			
			#insertNo{
				width: 110px; 
				height: 40px
			}
			
			  .pageBtn {
			    background-color: transparent;
			    border: 0px solid black;
			    color: black; /* 버튼 텍스트 색상 지정 (흰색 예시) */
			    text-decoration: none;
			    cursor: pointer;
			    font-size: 16px;
			}
		</style>
	</head>
	
	<body>
		
	
		<div class="wrap">
	
			<!-- 헤더바 -->		
			<%@ include file="/views/common/headerBar.jsp" %>	
			<br>
			
			<!-- 공지사항 로고 1 -->
	        <div id="title1">서울 여행 정보 공유 사이트</div>
	        
			<!-- 공지사항 로고 2 -->
	        <div id="title2">늴리리 공지사항</div>
	
			<table class="list-area" align="center">
				<thead>
					<tr>
						<th width="50">번호</th>
						<th width="100">카테고리</th>
						<th width="400">제목</th>
						<th width="100">작성자</th>
						<th width="150">등록일</th>
						<th width="50">조회수</th>
					</tr>
				</thead>
				
				<tbody>
				
					<!-- 리스트가 비어있는 경우 -->
	                <c:choose>
	                	<c:when test="${empty list}">
							<tr>
								<td colspan='6'>게시글이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list}" var="n">
								<tr>
									<td>${n.boardNo}</td>
									<td>${n.boardCategory}</td>
									<td>${n.boardTitle}</td>
									<td>${n.memberId}</td>
									<td>${n.regiDate}</td>
									<td>${n.count}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
	            </tbody>
			</table>
			
				
			<!-- 글작성 버튼은 관리자만 볼 수 있도록 작업 -->
			
			<div align="center" id="write">
				<c:if test="${loginMember.memberId eq 'admin'}">
				    <!-- admin일 경우 링크 표시 -->
					<a id="insertNo" class="btn btn-dark" href="${contextPath }/insert.no">글작성</a>
				</c:if>
			</div>
			
			
			
	        <!-- 페이징바 -->
	        <div align="center" class="paging-area">
				
				<!-- 이전/다음 버튼 만들기 (1페이지에서는 이전버튼 비활성화) 마지막 페이지에서는 다음버튼 비활성화-->
				
				<!-- 이전 -->
				<c:choose>
					<c:when test="${pi.currentPage eq 1}">
						<button disabled class="pageBtn">
							<img src="${contextPath }/resources/board/left_Icon.png" alt="방향아이콘">
						</button>
					</c:when>
					<c:otherwise>
						<button onclick="location.href='list.bo?currentPage=${pi.currentPage-1}'" class="pageBtn">
							<img src="${contextPath }/resources/board/left_Icon.png" alt="방향아이콘">
						</button>
					</c:otherwise>
				</c:choose>
				
				<c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage }">
					
					<button onclick="location.href='list.bo?currentPage=${i}'" class="pageBtn">${i}</button>
				
				</c:forEach>
				
				<!-- 다음 -->
				<c:choose>
					<c:when test="${pi.currentPage eq pi.maxPage}">
						<button disabled class="pageBtn">
							<img src="${contextPath }/resources/board/right_Icon.png" alt="방향아이콘">
						</button>
					</c:when>
					<c:otherwise>
						<button onclick="location.href='list.bo?currentPage=${pi.currentPage-1}'" class="pageBtn">
							<img src="${contextPath }/resources/board/right_Icon.png" alt="방향아이콘">
						</button>
					</c:otherwise>
				</c:choose>
			
			</div>
				
			<!-- 푸터영역 -->
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
		
		<!-- 게시글 눌렀을때 해당하는 게시글번호의 디테일뷰 호출 -->
		<script>
	       	$(function(){
	       		//테이블에 tbody -> tr이 클릭되었을때 해당 글번호를 추출하여 detail.no?nno=글번호
	       		$(".list-area>tbody>tr").click(function(){
	       			//$(this).children().eq(0).text() : 글번호 추출
	       			location.href="detail.no?nno="+ $(this).children().eq(0).text();
	       		});
	       	});
		</script>
	</body>
</html>

