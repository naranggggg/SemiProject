<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html lang="ko">
<head>

	<!-- 메타코드 -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Woodangtang">
    <meta name="kewords" content="늴리리">
    <meta name="description" content="늴리리">

    <!--카톡 공유-->
    <meta property="og:url" content=""/>
    <meta property="og:title" content="늴리리 여행추천"/>
    <meta property="og:type" content="website"/>
    <meta property="og:image" content="${contextPath }/resources/img/mainPh.jpg"/>
    <meta property="og:description" content="늴리리 여행추천"/>
    
    <!--favicon-->
    <link rel="shortcut icon" href="${contextPath }/resources/img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon-precomposed" href="${contextPath }/resources/img/favicon.ico" type="image/x-icon">
    
    <title>늴리리</title>
    
    <!-- 링크들 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link rel="stylesheet" href="${contextPath }resources/css/default.css">
    <link rel="stylesheet" href="${contextPath }resources/css/main.css">
    <link rel="stylesheet" href="${contextPath }resources/css/qna.css">
    <link rel="stylesheet" href="${contextPath }resources/css/animation.css">
    <link rel="stylesheet" href="${contextPath }resources/css/result.css">
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
        #container{
			width: 100%;
		}
        }
        #qnaCenter{

            display: flex;
            justify-content: center;
            align-items: center;

        }
        
        .start-btn {
			width: 120px;
			height: 44px;
			background-color: #e1e1e1;
			border-radius: 5px;
			cursor: pointer;
			border:2px solid #A90000;
		}

		.start-btn:hover {
			cursor: pointer;
			background-color: #A90000;
			color: white;
		}
		

    </style>
    
    
    
    
    
    <!-- kakao api 위한 토큰 -->
    <script>
        Kakao.init('bc244e477ffd76b0d8b9614c1a0ecb6a');
        Kakao.isInitialized();
      </script>
</head>
<body>
		<!-- 전체영역잡는 wrap 이어서 페이지에 들어갈 내용들 밑에있는 div 영역에 집어넣으시길 바랍니다 -->

<div class="wrap">
<%@ include file="../common/headerBar.jsp"%> 
    <div id="container" class="container" style="margin-bottom: 125px;">
      
            <section id="main" class="mx-auto my-5 py-5 px-3">
                <h2><b>나만을 위한 서울 여행지는?</b></h2>
               
                <div class="col-lg-6 col-md-6 col-sm-6 col-12 mx-auto py-5">
                    <img src="${contextPath }/resources/img/mainPh.jpg" alt="mainImage" class="img-fluid">
                </div>
                
                <p>
                    질문에 따른 답변을 통해 여행 취향을 알아봅니다. <br><br>
                    각자의 취향에 맞게 선별된 여행지를 탐험하며,<br>
                    여행의 즐거움을 더욱 풍부하게 만들어보세요. <br><br>
                    시작하기 버튼을 눌러주세요!
                </p>
                
                <button type="button" class="start-btn" onclick="js:begin()">시작하기</button>
                
            </section>

            <section id="qna" class="my-auto">
                
                <div style="margin-top: 125px;">

                    <div class="status mx-auto mt-5" style="margin-bottom: 100px;">
                        <div class="statusBar">
                            
                        </div>
                    </div>
                    <div class="qBox my-5 py-3 mx-auto">
                        
                    </div>
                    <div class="answerBox">
                        
                    </div>
                </div>
                
                    
            </section>

            <section id="result" class="mx-auto my-5 py-5 px-3">

                <h2><b>당신의 결과는?!</b></h2>
                    <div class="resultname"></div>
                <div id="resultImg" class="my-3 col-lg-6 col-md-6 col-sm-6 col-12 mx-auto py-5">
                    
                </div>
                <div class="resultDesc"></div>
                
                <p>
                    <br><br>
                    공유하기 버튼을 눌러 친구들에게 결과를 공유해보세요!
                </p>
                
                <button type="button" class="btn btn-warning mt-3 py-2 px-3" onclick="js:kakaoShare();"><b>공유하기</b></button>
				&nbsp;&nbsp;
				<a href="<%=contextPath%>" class="btn btn-dark mt-3 py-2 px-3">홈으로</a>
            </section>

            <script src="${contextPath }/resources/js/data.js" charset="UTF-8"></script>
            <script src="${contextPath }/resources/js/start.js" charset="UTF-8"></script>
            <script src="${contextPath }/resources/js/share.js" charset="utf-8"></script>
        </div>
        
        <%@ include file="../common/footerBar.jsp"%>
   
</div>
    
</body>
</html>