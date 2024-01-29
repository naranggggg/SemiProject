<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
	<head>
	
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
	            font-family: 'Noto sans KR', sans-serif;
	            font-weight: 800;
	            display: flex;
	            justify-content: center;
	            align-items: center;
	            margin-top: 30px;
	        }
	
	        div{
	            /* font-family: 'Nanum Gothic', sans-serif; */
	            font-family: 'Noto sans KR', sans-serif;
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
	            /* margin-right: 683px; */
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
	
	        #imgth{
	            text-align: center;
	            padding-right: 30px;
	        }
	
	        #imgtext{
	            height: 30px;
	            font-size: 12px;
	            color: #5e5b5b;
	
	            display: flex;
	            justify-content: center;
	            align-items: center;
	            
	        }
	
	        #img{
	            margin-left: 23px;
	        }
	
	    </style>
	</head>
	
	<body>
		
		<div class="wrap">
			<!--헤더영역 블랙라인 + 로고 -->
	        <%@ include file="/views/common/headerBar.jsp"%>
			<br>
	
	        <!--게시판 로고 1-->
	        <div id="title1">서울 여행 정보 공유 사이트</div>
	
	        <!--게시판 로고 2-->
	        <div id="title2">늴리리 커뮤니티</div>
	
	        <!--게시글 작성 테이블-->
	        
	        <form action="${contextPath }/insert.bo" method="post" id="enroll-area" enctype="multipart/form-data">
	        
	        	<table class="list-area" align="center">
					<thead>
						<tr id="trtitle">
		                    <th width="30">카테고리</th>
		                    <td>
		                    	<!-- 카테고리 선택 말머리 -->
		                        <select name="tripselect" id="tripselect">
		                            <c:forEach items="${cList}" var="c">
										<option value="${c.categoryNo }">${c.categoryName }</option>
									</c:forEach>
		                        </select>
		                    </td>
							<th>제목</th>
		                    <td id="tdtitle" width="700"><input type="text" name="title" id="title"></td>
		                </tr>
	                	<tr>
		                    <th width="100" height="280">내용</th>
		                    <td colspan="4">
								<!-- summernote api -->
		                        <textarea name = "content" id="summernote" cols="30" 
		                         rows="10" style="resize: none;" ></textarea> 
		                    </td>
	                	</tr>
	           	    </thead>
	            	<tbody>
	 					
						<tr height="225">
							<th id="imgth">이미지 <br>첨부</th>
		                    
		                    <!-- 여행네컷 이미지툴 -->
							<td colspan="4">
		                    <div id="imgtext">이미지를 첨부해서 나만의 여행네컷을 만들어보세요.</div>
		                    
		                <div style="position: relative;">
		                    <img src="${contextPath }/resources/img/board/photoframe_nilili_2.png" alt="인생네컷" width="900" height="170">
		                    
		                    <div id="img" style="position: absolute; top: 10px;" >
		                    <img id="titleImg" width="182" height="150" style="margin-right: 20px;">
							<img id="contentImg1" width="182" height="150" style="margin-right: 20px;">
							<img id="contentImg2" width="182" height="150" style="margin-right: 20px;">
							<img id="contentImg3" width="182" height="150">
		                    </div>
		                    
		                </div>
		
							</td>
						</tr>
	  
	            	</tbody>
				</table>
				
				<br><br>
	
				<!-- 여행네컷 input 창 -->
				<div id="file-area">
	                <!--onchange : 변화가 일어났을때 발생하는 이벤트 
	                    선언석함수를 내부에 작성할때 해당 이벤트가 발생한시점에 요소객체를 전달하는 방법
	                    함수(this) 
	                -->
	                <!-- 이미지 4개 전부 required(필수첨부) / 4개 미만 첨부하면 수정이 불가하기 때문에 4개로 적용해야함-->
					<input type="file" id="file1" name="file1" onchange="loadImg(this,1)" required>
					<input type="file" id="file2" name="file2" onchange="loadImg(this,2)" required>
					<input type="file" id="file3" name="file3" onchange="loadImg(this,3)" required>
					<input type="file" id="file4" name="file4" onchange="loadImg(this,4)" required>
				
			    </div>
	
				<!-- 뒤로가기/작성하기 버튼 -->
		        <div align="center" id="bottondiv">
		            
		            <button type="button" id="button1" onclick="history.back();">뒤로가기</button>
		            
		            <button type="submit" id="button2">작성하기</button>
					
				</div>
			
	        </form>
	        
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
			
	
		<!-- 사진 첨부 스크립트 -->
		<script>
        
            $(function(){
                $("#file-area").hide(); //file input 숨기기
                //대표이미지를 클릭하면 input file 요소 1번이 클릭되게 하는 함수
                $("#titleImg").click(function(){
                    $("#file1").click();
                });
                $("#contentImg1").click(function(){
                    $("#file2").click();
                });
                $("#contentImg2").click(function(){
                    $("#file3").click();
                });
                $("#contentImg3").click(function(){
                    $("#file4").click();
                });

            });
	           
            
            //이미지를 읽어줄 함수 
            function loadImg(inputFile,num){
                //inputFile : 이벤트가 발생된 요소 객체 
                console.log(inputFile.files);
                //inputFile.files : 파일업로드 정보를 배열의 형태로 반환해주는 속성
                //파일을 선택하면 files속성의 length가 1이 반환됨
                if(inputFile.files.length == 1){ //파일이 등록되면 
                    //해당 파일을 읽어줄 FileReader라고 하는 자바스크립트 객체를 이용한다.
                    var reader = new FileReader();
                    //파일을 읽어줄 메소드 : reader.readAsDataURL(파일)
                    //해당 파일을 읽어서 고유한 url을 부여해주는 메소드 
                    //반환받은 url을 미리보기 화면에 넣어주면 된다. 
                    reader.readAsDataURL(inputFile.files[0]);

                    //해당 reader객체가 읽혀진 시점에 img src속성에 부여된 고유 url을 넣어주기
                    reader.onload = function(e){//e : event 객체
                        console.log(e);
                        //이벤트 객체에서 reader가 부여한 고유 url 정보 
                        //event.target.result 
                        console.log(e.target.result);

                        switch(num){
                            case 1: $("#titleImg").attr("src",e.target.result); break;
                            case 2: $("#contentImg1").attr("src",e.target.result); break;
                            case 3: $("#contentImg2").attr("src",e.target.result); break;
                            case 4: $("#contentImg3").attr("src",e.target.result); break;
                        }

                    }

                }else{//length가 1이 아니면 
                    switch(num){
                            case 1: $("#titleImg").attr("src",null); break;
                            case 2: $("#contentImg1").attr("src",null); break;
                            case 3: $("#contentImg2").attr("src",null); break;
                            case 4: $("#contentImg3").attr("src",null); break;
                        }

                }
            }
		</script>
		
	</body>
</html>