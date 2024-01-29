<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@회원가입 후 인덱스입니다@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Fuggles&family=Merriweather:wght@900&family=Noto+Sans+KR:wght@100&family=Roboto:wght@300&display=swap"
	rel="stylesheet">
<title>늴리리</title>
<style>

/*헤더 바로밑 이미지 높이값*/
#top {
	height: 641px;
}

#top_bg {
	position: absolute;
	/*헤더 밑 메인TOP 이미지 부분*/
}

a {
	text-decoration: none;
}
/*-------------------------------헤더 끝 ---------------------------------------*/
/*콘텐츠 타이을 영역 설정*/
#title {
	position: relative;
	/* border: 1px solid black; */
	height: 168px;
	text-align: center;
}
/*콘텐츠 타이틀 스타일, 영역(중앙정렬) 설정*/
#contitle {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 30px;
	font-weight: 800;
	margin: 0 30 auto;
}
/*--------------------- 콘텐츠영역------------------------------------*/
#content {
	position: relative;
	text-align: center;
}

#textBox {
	width: 715px;
	height: 192px;
	border: 1px solid #999999;
	margin: 0 auto;
	text-align: center;
	font-family: 'Noto Sans ', sans-serif;
	font-size: 30px;
	font-weight: 900;
	padding-top: 64px;
	color: #333333;
}

#textBox p {
	font-family: 'Noto Sans KR', sans-serif;;
	font-size: 22px;
	color: #333333;
}

#content button {
	font-family: 'Noto Sans KR' sans-serif;
	font-size: 16px;
	font-weight: 800;
	width: 195px;
	height: 53px;
	background-color: #a90000;
	color: #f9dede;
	margin: 0 auto;
	border: none;
	margin-top: 60px;
}

/*-------------------------------------------푸터영역--------------------------------------*/
#footer {
	margin-top: 60px;
	color: gray;
}

#f_text {
	padding-top: 40px;
}
</style>
</head>
<%@ include file="../common/headerBar.jsp"%>
<body>
	


	<!--헤더 영역 상단 블랙 라인이랑 로고 까지가 헤더영역입니다 ~-->

	<!--*************************헤더 영역 끄으으으으으으읕***********************-->
	<!--서브페이지 타이틀 -->
	<div id="title">
		<br>
		<hr>
		<p id="contitle">회원가입</p>
	</div>
	<!--*******************************콘텐츠 영역********************************* -->
	<div id="content">

		<div id="textBox">
			WELCOME
			<p>회원가입 완료되었습니다.</p>
		</div>
		<button type="button" id="loginBtn">로그인하기</button>

	</div>
	<!--*****************푸우우ㅜ우우우ㅜㅇ터어어어어어ㅓ어어어어어*******************-->
	<%@ include file="../common/footerBar.jsp"%>


</body>

<script>
//홈페이지로 가게 하는 함수
$(function(){
	
	$("#loginBtn").click(function(){
		
		 window.location.href = 'http://localhost:8888/semi/';
		
	});
	
	
});




</script>



</html>