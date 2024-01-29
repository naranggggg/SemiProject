<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html> 
<html lang="en">
<head>
   <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous"> -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
   
   <meta charset="UTF-8">
   <title>늴리리</title>
   
   <style>
   
   	.wrap{
   		width: 1920px;
   		height: 1084px;
   	}
   
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
        text-align: left;
        width: 1000px;
        margin-top: 150px;
        align-items: center;
        
    }

    #title1{
        width:150px;
        height:100px;
        float:left;
        font-family: 'Noto sans KR', sans-serif;
        font-size: 12px;
        color: #A12B2B;
        display: flex;
        justify-content: center;
        align-items: center;
        margin-left: 770px;
        margin-top: 30px;
        padding-top: 10px;
        font-weight: 700;
        

    }

    #title2{
        width:240px;
        height:100px;
        float:left;
        font-size: 34px;
        font-family: 'Noto sans KR', sans-serif;
        font-weight: 800;
        display: flex;
        justify-content: center;
        align-items: center;
        margin-top: 30px;
        padding-right: 170px;
    }

    div{
        font-family: 'Noto sans KR', sans-serif;
        font-weight: 400;
    }

    
    td{
        height: 70px;
        padding-left: 20px;
    }

    #tdtitle{
        width: 50px;

    }

    tr{
        border-bottom: 1px solid #DDDDDD;
    }

    .answer{
        display: none;
    }
    
    .question{
    	cursor: pointer;
    }
    
    

  </style>
  
</head>
<body>
    
    <div class="wrap">
	<!--헤더영역 블랙라인 + 로고 -->
       <%@ include file="/views/common/headerBar.jsp"%>
	<br>
      
      
      <!-- Q&A 로고 1 -->
      <div id="title1">서울 여행 정보 공유 사이트</div>

      <!-- Q&A 로고 2 -->
      <div id="title2">Q&A</div>

      <br>
      
      <!--Q&A 테이블-->

   	  <table class="list-area" align="center">
	      <tr class="question">
	           <td><img src="${contextPath}/resources/qna/Q_lcon.png" alt="질문">
	           NILILI 이용 방법에 대해 알고 싶어요.
	           <img src="${contextPath}/resources/qna/down_Icon.png" alt="방향아이콘">
	           </td>
	           
	      </tr>
	      <tr class="answer">
	           <td><img src="${contextPath}/resources/qna/A_icon.png" alt="질문">
	           NILILI는 여행을 사랑하는 당신의 취향을 파악하여 그에 맞는 여행 정보를 제공합니다.
	           </td>
	      </tr>
	
	      <tr class="question">
	           <td><img src="${contextPath}/resources/qna/Q_lcon.png" alt="질문">
	           여행 구독 서비스는 어떻게 이용하나요?
	           <img src="${contextPath}/resources/qna/down_Icon.png" alt="방향아이콘">
	           </td>
	           
	      </tr>
	      <tr class="answer">
	           <td><img src="${contextPath}/resources/qna/A_icon.png" alt="질문">
	           구독 서비스 > 구독하기 신청을 완료하면 구독자의 취향을 반영한 맞춤형 여행을 정기적으로 추천해드립니다.
	           </td>
	      </tr>
	
	      <tr class="question">
	           <td><img src="${contextPath}/resources/qna/Q_lcon.png" alt="질문">
	           여행 정보를 알고 싶을 땐? 
	           <img src="${contextPath}/resources/qna/down_Icon.png" alt="방향아이콘">
	           </td>
	           
	      </tr>
	      <tr class="answer">
	           <td><img src="${contextPath}/resources/qna/A_icon.png" alt="질문">
	           '커뮤니티'를 이용해보세요! 늴리리 사용자들의 여행 후기나 정보를 열람하실 수 있고,
	           나의 여행 정보도 공유할 수 있습니다. 
	           </td>
	      </tr>
	
	      <tr class="question">
	           <td><img src="${contextPath}/resources/qna/Q_lcon.png" alt="질문">
	               커뮤니티에서 글 작성이 안돼요.
	           <img src="${contextPath}/resources/qna/down_Icon.png" alt="방향아이콘">
	           </td>
	           
	      </tr>
	      <tr class="answer">
	           <td><img src="${contextPath}/resources/qna/A_icon.png" alt="질문">
	               로그인 시 이용 가능한 서비스입니다.
	           </td>
	      </tr>
	
	      <tr class="question">
	           <td><img src="${contextPath}/resources/qna/Q_lcon.png" alt="질문">
	               회원 정보를 수정하고 싶을 땐 어떻게 해야 하나요?
	           <img src="${contextPath}/resources/qna/down_Icon.png" alt="방향아이콘">
	           </td>
	           
	      </tr>
	      <tr class="answer">
	           <td><img src="${contextPath}/resources/qna/A_icon.png" alt="질문">
	               홈 > 마이페이지에서 수정 가능합니다.
	           </td>
	      </tr>

   	  </table>

      <!--슬라이드바 함수(question 클릭 시 answer가 display none일때 슬라이드 적용)-->
      <script>
          $(function () {
               $(".question").click(function () {
                    var $p = $(this).next();
                   console.log($(this).next());

                   if ($p.css("display") == "none") {
                   $(this).siblings(".answer").slideUp();
                   $p.slideDown(100);
                   } else {
                       $p.slideUp(100);
                   }
               });
           });
      </script>


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
</body>
</html>
