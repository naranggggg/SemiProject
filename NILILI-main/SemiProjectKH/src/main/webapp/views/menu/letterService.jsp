<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Fuggles&family=Merriweather:wght@900&family=Noto+Sans+KR:wght@100&family=Roboto:wght@300&display=swap" rel="stylesheet">
    <title>늴리리</title>
    <style>
   
        /*헤어 영역 사이즈값 (높이/세로영역)*/
    
        /*-------------------------------헤더 끝 ---------------------------------------*/

        /*콘텐츠 타이을 영역 설정*/
        #title{
       	    margin-top : 
            position: relative;
            /* border: 1px solid black; */
            height: 200px;
            text-align: center;
         
        
        }


        /*콘텐츠 타이틀 스타일, 영역(중앙정렬) 설정*/
        #contitle{
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 30px;
            font-weight:800;
            margin-top: 150px;
           
          
         }

         /*--------------------- 콘텐츠영역------------------------------------*/
         #content{
            position: relative;
            text-align: center;
         }
			#MemberIntroduce{
				margin-left: 50px;
			
		}


/*-------------------------------------------푸터영역--------------------------------------*/


    </style>
</head>
<body>
	
	<div class="wrap">
<%@ include file="../common/headerBar.jsp"%> 

         <!--서브페이지 타이틀 -->
         <div id="title">
            <br>
            <hr>

            <p id="contitle" >여행 추천 구독지</p>
			</div>
  <br><br><br><br>  
  
  
         <!--*******************************콘텐츠 영역********************************* -->
      <h3 style="font-family: 'Noto sans KR', sans-serif;"><mark><span id="MemberIntroduce">${loginMember.memberName}님 안녕하십니까 이번달 구독레터는 아래와 같습니다</span></mark></h3>  
         
         <br><br><br><br>
<div id="content">


 <img src="../../resources/mainIndex/img.png" alt="구독지레터">



</div>
		
<!--*****************푸우우ㅜ우우우ㅜㅇ터어어어어어ㅓ어어어어어*******************-->
     	<%@ include file="../common/footerBar.jsp"%>
</div>
</body>
</html>