<%@page import="com.nilili.member.vo.Member"%>
<%@page import="com.nilili.recommend.model.vo.Recommend"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>

<!-- 메타코드 -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="Woodangtang">
<meta name="kewords" content="늴리리">
<meta name="description" content="늴리리">

<%
	
	Member loginMember = (Member)session.getAttribute("loginMember");

%>

<!--카톡 공유-->
<!-- 
    <meta property="og:url" content=""/>
    <meta property="og:title" content="늴리리 여행추천"/>
    <meta property="og:type" content="website"/>
    <meta property="og:image" content="${contextPath }resources/img/mainPh.jpg"/>
    <meta property="og:description" content="늴리리 여행추천"/>
     -->

<!--favicon-->
<link rel="shortcut icon"
	href="${contextPath }resources/img/favicon.ico" type="image/x-icon" />
<link rel="apple-touch-icon-precomposed"
	href="${contextPath }resources/img/favicon.ico" type="image/x-icon" />

<title>늴리리</title>

<!-- jQuery
<script src="resources/js/code.jquery.com_jquery-3.7.1.min.js"></script>
 -->
 
<!-- 링크들 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${contextPath }resources/css/defaultReco.css" />
<link rel="stylesheet" href="${contextPath }resources/css/mainReco.css" />
<link rel="stylesheet" href="${contextPath }resources/css/qnaReco.css" />

<link rel="stylesheet"
	href="${contextPath }resources/css/animationReco.css" />
<link rel="stylesheet"
	href="${contextPath }resources/css/resultReco.css" />
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<style>
@import 
url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap');

#container {
	width: 100%;
}

#qnaCenter {
	display: flex;
	justify-content: center;
	align-items: center;
}


	    
	    
</style>

<!-- kakao api 위한 토큰 -->
<script>
        Kaka o.init('bc244e477ffd76b0d8b9614c1a0ecb6a');
        Kakao.isInitialized();
      </script>
</head>
<body>

	<div class="wrap">
	<%@ include file="../common/headerBar.jsp"%> 
	<div id="container" class="container" >

		<section id="main" class="mx-auto my-5 py-5 px-3">

			<h2>
				<b>서울 여행지 추천받기</b>
			</h2>

			<div class="col-lg-10 col-md-10 col-sm-6 col-12 mx-auto py-5">
				<img src="${contextPath }/resources/img/recoImg/seoulBotanicPark2.jpg" alt="mainImage"
					class="img-fluid">
			</div>

			<p>
				누구와 무엇을 계획하고 계신가요? 늴리리에서 여행지를 추천해 드립니다. <br> 알아보기 버튼을 눌러
				확인해보세요!
			</p>
			<!--  class="btn btn-outline-danger mt-3"  -->
			<input type="hidden" name="memberNO" value="<%=loginMember.getMemberNO()%>">
	     
			<button type="button" class="start-btn" onclick="js:begin()">알아보기</button>

		</section>

		<section id="qna" class="my-auto">

			<div style="margin-top: 100px;">

				<!-- 
					
                    <div class="status mx-auto mt-5" style="margin-bottom: 100px;">
                        <div class="statusBar">
                            
                        </div>
                    </div>
                    
                     -->
				<div class="depth" style="margin-bottom: 100px;">
					<div class="depthTextBox">
					
					<!-- 	<p class="depthText korean"
							style="font-size: 28px; color: #A90000;"><span id="depthNo"></span>단계 선택하기</p>
					 -->		
					</div>
				</div>

				<div class="qBox my-5 py-3 mx-auto"></div>
				<div class="answerBox"></div>
			</div>

		</section>

		<section id="result" class="mx-auto my-5 py-5 px-3">

			<h2>
				<b>여행지를 추천해드릴게요</b>

			</h2>
 			<div class="resultname">

<%-- 				${r.plName } --%>
<%-- 				<c:choose> --%>
<%-- 				    <c:when test="${not empty r}"> --%>
<%-- 				        ${r.plName} --%>
<%-- 				    </c:when> --%>
<%-- 				    <c:otherwise> --%>
<!-- 				        No data available -->
<%-- 				    </c:otherwise> --%>
<%-- 				</c:choose> --%>



			</div>

			<div id="resultImg"
				class="my-3 col-lg-12 col-md-6 col-sm-6 col-12 mx-auto py-5"></div>
			<div class="resultDesc"></div>

			<div class="homeBtnBox">
				<!--
                <p>
                    <br><br>
                    공유하기 버튼을 눌러 친구들에게 결과를 공유해보세요!
                </p>
                
                 <button type="button" class="btn btn-warning mt-3 py-2 px-3" onclick="js:kakaoShare();"><b>공유하기</b></button> -->
				&nbsp;&nbsp;
				<p class="homeBtn">
					<a href="<%=contextPath%>" class="homeBtnText">홈으로</a>
				</p>
			</div>
		</section>

		<script src="${contextPath }/resources/js/dataReco.js" charset="UTF-8" ></script>
		<script src="${contextPath }/resources/js/startReco.js" charset="UTF-8"></script>
		<script src="${contextPath }/resources/js/share.js" charset="utf-8"></script>
	</div>
	<%@ include file="../common/footerBar.jsp"%>
	</div>

</body>
</html>