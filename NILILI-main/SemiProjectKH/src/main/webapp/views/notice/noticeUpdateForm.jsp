<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
    
<!DOCTYPE html>
<html>
	<head>
	      
		<!-- 링크 + 라이브러리 -->
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
	            border-bottom: 3px solid #313131;
	            text-align: center;
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
	
	
	        table{
	            width: 1000px;
	            margin-top: 150px;
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
	
	        #title{
	            justify-content: left;
	            display: flex;
	            width: 580px;
	            height: 46px;
	            border: 1px solid #D2D2D2;
	            margin-left: 15px;
	        }
	
	        #tripselect{
	            justify-content: left;
	            display: flex;
	            width: 250px;
	            height: 46px;
	            border: 1px solid #D2D2D2;
	
	        }
	
	        #content{
	            justify-content: left;
	            display: flex;
	            width: 900px;
	            border: 1px solid #D2D2D2;
	            
	        }
	        
	        #file{
	            border: 1px solid #D2D2D2;
	            width: 120px;
	            height: 35px;
	            padding-top: 7px;
	            font-size: 13px;
	            font-weight: 600;
	            margin-right: 683px;
	            margin-bottom: 15px;
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
	            font-weight: 500;
	
	        }
	
	    </style>
	</head>
	
	<body>
		
		<div class="wrap">
	
			<%@ include file="/views/common/headerBar.jsp" %>	
			
			<br>
	       
	        <!-- 공지사항 로고 1 -->
	        <div id="title1">서울 여행 정보 공유 사이트</div>
	
	        <!-- 공지사항 로고 2 -->
	        <div id="title2">늴리리 공지사항</div>
	
	        <!--공지사항 수정 테이블-->
	        
	        <form action="${contextPath }/update.no" method="post" id="update-area" enctype="multipart/form-data">
		        <input type="hidden" name="boardNo" value="${n.boardNo }">
		        
		        <table class="list-area" align="center">
					<thead>
						<tr id="trtitle">
		                    <th width="30">공지유형</th>
		                    <td>
		                        <select name="tripselect" id="tripselect">
		                            <c:forEach items="${cList}" var="c">
										<option value="${c.categoryNo }">${c.categoryName }</option>
									</c:forEach>
		                        </select>
		                        
		                    </td>
							<th>제목</th>
		                    <td id="tdtitle" width="700"><input type="text" name="title" id="title" value="${n.boardTitle }" required></td>
		                </tr>
		                
		                <tr>
		                    <th width="100" height="280">내용</th>
		                    <td colspan="4">
		                        <textarea name = "content" id="summernote" cols="30"
		                        rows="10" style="resize: none;">${n.boardContent }</textarea>
		                    </td>
		                </tr>
		            </thead>
		            
		            <tbody>
		                <tr>
		                	<td colspan="4" >
		                    	<c:if test="${at != null }">
									<%--첨부파일이 있다면 해당 정보를 보여줘야한다. --%>
									${at.originName }
									<%--원본파일의 파일번호와 수정명을 서버에 전달하기(원본파일에 대한 처리를 위해) --%>
									<input type="hidden" name="originFileNo" value="${at.fileNo }">
									<input type="hidden" name="originFileName" value="${at.changeName }">
								</c:if>
		                        <label for="input-file" id="file">첨부하기</label>
		                        <input type="file" name="reUploadFile" id="input-file" style="display: none;">   
		                	</td>
		            	</tr>
		        	</tbody>
					
		
			    </table>
				
				<div align="center" id="bottondiv">
		            
		            <button type="button" id="button1" onclick="history.back();">뒤로가기</button>
		            
		            <button type="submit" id="button2">수정하기</button>
				</div>
			
	        </form>
	        
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
		
		
		<!-- 기존 카테고리 가져오는 함수 -->
		<script>	
		
			$(function(){
				//비교대상 : Board 객체에 담겨있는 category(카테고리이름)
				//select option 목록에서 똑같은 카테고리이름인 요소를 선택하기 
				var choose =  "${n.boardCategory}"; //Board 객체에 담겨있는 category(카테고리이름)
				
				$("#update-area option").each(function(){
					
					//데이터베이스에서 조회해온 게시글의 카테고리와 카테고리목록중 텍스트가 같은 요소
					if($(this).text()==choose){ // 비교대상이 같다면 
						$(this).attr("selected",true);//해당 요소객체의 selected속성을 true값으로 변경
						//선택되어짐
						return false; //break; 역할 
					}
				});
			});
								
		</script>
		
		
		<!-- summernote(게시글 내용) 스크립트 -->
		<script>
			
			$(document).ready(function() {
	 			$('#summernote').summernote({
					  height: 300,                 // 에디터 높이
	 				  minHeight: null,             // 최소 높이
					  maxHeight: null,             // 최대 높이
	 				  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
	 				  lang: "ko-KR",					// 한글 설정
	 				  placeholder: '최대 2048자까지 작성 가능합니다.',	//placeholder 설정
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
	 				    ['view', ['fullscreen', 'help']]
	 				  ],
	 				fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
	 				fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
			          
	 			});
				
			});
			
		</script>
	</body>
</html>