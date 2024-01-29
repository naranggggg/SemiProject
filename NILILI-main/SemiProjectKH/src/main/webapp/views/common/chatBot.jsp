<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>늴리리</title>
  <style>
     
     /*버튼 css입니다*/   
.chat-toggle-button {
    position: fixed;
    bottom: -25px;
    right: -15px;
    width: 80px;
    height: 80px;

    color: #ffffff;
    border-radius: 50%;
    text-align: center;
    line-height: 50px;
    font-size: 24px;
    cursor: pointer;
    transition: all 0.3s ease;
    margin-right: 40px;
    margin-bottom: 40px;
    float: right;
    z-index: 2000;
	 box-shadow: 
        0px 0px 40px rgba(50, 50, 93, 0.25),
        0px 30px 60px rgba(0, 0, 0, 0.3),
        0px -2px 10px rgba(10, 37, 64, 0.35) inset;
        }
      
/*버튼 호버시 변하는 css입니다*/

        .chat-toggle-button:hover {
            background-color: #D83B44;
        }

        /* 챗봇몸체 */
        .chat-body {
          
         
            max-height: 400px;
            overflow-y: auto;
        }

        /* 버튼 박스(챗봇이 열리면 버튼들의 css입니다) */
        .button-container {
            font-size: 24px;
            margin: 20px;
            padding: 20px;
            box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;
            border-radius: 20px;
            background-color: #f9f9f9;
            font-weight: bolder;
        }

        /* 버튼 CSS */
        .button-container button {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: none;
            border-radius: 10px;
            background-color: #9A0A0A;
            color: white;
            cursor: pointer;
            font-size: 15px;
        }

        .chat-container {
            display: none;
            position: fixed;
            bottom: 100px;
            width: 500px;
            right: 0;
            float: right;
            
            z-index: 1500;
            margin-right: 20px;
        }

        .chat-container.visible {
            display: block;
        }
        
          *{font-family: 'Noto sans KR', sans-serif;}
          
        

</style>
   
</head>
<body>
    <div class="chat-toggle-button" onclick="toggleChat()"><img src="resources/mainIndex/AiBot.png" alt="메인이미지"></div>
<!--@@@@@@@@@@@@@@@@@@@@@메인 인덱스@@@@@@@@@@@@@@@@@@@@@@@@@-->
    <div class="chat-body">
        <!-- 챗봇 대화창 컨테이너 -->
        <div class="chat-container" id="chat-container">
            <!-- 챗봇 헤더 -->
            <!-- 버튼 컨테이너 -->
            <div class="button-container" id="button-container">
              <h6><pre id="textToReveal" style="font-family: 'Noto sans KR', sans-serif;">

안녕하세요 

AI가 되고싶은 챗봇

NILILI 입니다


무엇을 도와드릴까요?
                </pre></h6>
                <button onclick="introduceArea()">홈페이지소개 시켜줘</button>
                <button onclick="whatSubscribeArea()">구독을 시작하면?</button>
                <button onclick="goEnrollArea()">회원가입 하고 싶어</button>
                <button onclick="goFindIDPwdArea()">아이디를 잃어버렸어 </button>
                <button onclick="goSubscribeArea()">구독하고 싶어</button>
                <button onclick="goHotBoardArea()">닐리리의 핫한 게시물</button>
            </div>
        </div>
        <div class="chat-container" id="introduce" style="display: none;">
<!--@@@@@@@@@@@@@@@@@@@@@홈페이지 소개@@@@@@@@@@@@@@@@@@@@@@@@@-->
            <div class="button-container" id="button-container-introduce">
               <h6> <pre id="text2" style="font-family: 'Noto sans KR', sans-serif;">

저희 홈페이지는 여행가고 싶은 분들을 위한 

기본적인 서울 소개 홈페이지 입니다

주말에 간단하게 나들이 가고싶은데

어딜 갈지 모르는 당신에게 

서울의 방방곳곳 숨어있는 명소를 

간단하게 소개시켜드리거나 

간단한 게임을 통해 여행지를 추천해드리는

사이트입니다.
 
                                </pre></h6>
             
                <button onclick="toggleChat()" id="backsite">이전 목록으로</button>
            </div>
        </div>
<!--@@@@@@@@@@@@@@@@@@@@@구독소개@@@@@@@@@@@@@@@@@@@@@@@@-->

        <div class="chat-container" id="whatSubscribe" style="display: none;">

            <div class="button-container" id="button-container-introduce">
<h6> <pre id="text4" style="font-family: 'Noto sans KR', sans-serif;">

닐리리는 구독을 신청하시면

보다 재밌게 여행지를 고를수있게

간단한 게임을 구현해놨습니다

더구나 한달에 한번씩 레터를 보내

닐리리가 추천한 여행지를 소개해드립니다

</pre></h6>
               
                <button onclick="toggleChat()" id="backsite3">이전 목록으로</button>
            </div>
        </div>
<!--@@@@@@@@@@@@@@@@@@@@@회원가입@@@@@@@@@@@@@@@@@@@@@@@@@-->
<c:if test="${not empty loginMember}">
        <div class="chat-container" id="goEnrollForm" style="display: none;">

            <div class="button-container" id="button-container-introduce">
<h6> <pre id="text3" style="font-family: 'Noto sans KR', sans-serif;">

NILILI의 멤버가 되고싶으시다구요?

제가 바로 회원가입 버튼을 만들어 오겠습니다

.....

.............

...zzzzZZzzzZZ

오잉? 이미 로그인이 되어있으십니다.

해당 서비스는 로그아웃 후 이용가능 하니 

참고해주세용

</pre></h6>
              
                <button onclick="toggleChat()" id="backsite2">이전 목록으로</button>
            </div>
        </div>

</c:if>
        <div class="chat-container" id="goEnrollForm" style="display: none;">

            <div class="button-container" id="button-container-introduce">
<h6> <pre id="text3" style="font-family: 'Noto sans KR', sans-serif;">

NILILI의 멤버가 되고싶으시다구요?

요청을 듣고 제가 밑에 회원가입 버튼을 만들어왔습니다 

어서 닐리리의 든든한 친구가 되어주세요!

</pre></h6>
           <a href="http://localhost:8888/semi/enrollForm.mb"><button>회원가입</button></a>     
                <button onclick="toggleChat()" id="backsite2">이전 목록으로</button>
            </div>
        </div>

<!--@@@@@@@@@@@@@@@@@@@@@아디비번찾기@@@@@@@@@@@@@@@@@@@@@@@@@-->
<c:if test="${not empty loginMember}">
<div class="chat-container" id="goFindPwdForm" style="display: none;">

            <div class="button-container" id="button-container-introduce">
<h6> <pre id="text5" style="font-family: 'Noto sans KR', sans-serif;">

아이디 비밀번호를 까먹으셨다구요?

잠시만 기다려주세요 버튼을 만들어 오겠습니다

...zzzzZZzzzZZ

...zzzzZZzzzZZ

오잉? 이미 로그인 되어 있으신데요?

해당 서비스는 로그아웃 후 이용해주세요
</pre></h6>
                <button onclick="toggleChat()" id="backsite4">이전 목록으로</button>
            </div>
        </div>

</c:if>
        <div class="chat-container" id="goFindPwdForm" style="display: none;">

            <div class="button-container" id="button-container-introduce">
<h6> <pre id="text5" style="font-family: 'Noto sans KR', sans-serif;">

아이디 비밀번호를 까먹으셨다구요?

제가 바로 버튼을 만들어왔습니다

어서 찾으시고 로그인 하신다음에

NILILI를 즐겨주세요!

</pre></h6>
               <a href="http://localhost:8888/semi/views/member/find_Id_Pwd.jsp"><button id="">ID PW 찾기</button></a> 
                <button onclick="toggleChat()" id="backsite4">이전 목록으로</button>
            </div>
        </div>

<!--@@@@@@@@@@@@@@@@@@@@@구독강요@@@@@@@@@@@@@@@@@@@@@@@@@-->

        <div class="chat-container" id="goSubscribeForm" style="display: none;">

            <div class="button-container" id="button-container-introduce">
            <c:choose>
            <c:when test="${empty loginMember}">
<h6> <pre id="text6" style="font-family: 'Noto sans KR', sans-serif;">

닐리리의 매력에 더욱더 빠지고 싶으신가요?

제가 바로 구독버튼을 만들어오겠습니다

...zzzzZZzzzZZ

...zzzzZZzzzZZ

아직 로그인을 안하셨네요! 

로그인을 하셔야지만 구독을 하실수 있으세요! 

로그인 먼저 진행 하시고 다시 저를 찾아와주세요!

</pre></h6>
	
               
</c:when>
<c:when test="${loginMember.memberSubscribe eq 'N'}">
<h6> <pre id="text6" style="font-family: 'Noto sans KR', sans-serif;">

닐리리의 매력에 더욱더 빠지고 싶으신가요?

제가 바로 구독버튼을 만들어오겠습니다

밑에 생긴 구독버튼을 클릭 하셔서 닐리리의

프리미엄 서비스를 즐겨 주세요!

</pre></h6>


 			<button id="">구독하기</button>


</c:when>
<c:otherwise>

<h6> <pre id="text6" style="font-family: 'Noto sans KR', sans-serif;">

닐리리의 매력에 더욱더 빠지고 싶으신가요?

제가 바로 구독버튼을 만들어오겠습니다

.........
...zzzzZZzzzZZzzzzZZZZ
.........

이미 구독을 하신 상태이십니다!!

마음껏 닐리리를 즐겨주세요!

</pre></h6>





</c:otherwise>




                </c:choose>
                <button onclick="toggleChat()" id="backsite5">이전 목록으로</button>
            </div>
        </div>       


        <div class="chat-container" id="goHotBoardForm" style="display: none;">

            <div class="button-container" id="button-container-introduce">
<h6> <pre id="text7" style="font-family: 'Noto sans KR', sans-serif;">

닐리리의 핫한 게시물이 궁금하시다구요?

밑에 버튼을 만들어 놨으니 한번 보러가실까요?

오늘의 핫한 게시물 TOP10을 소개합니다!! 

</pre></h6>
               <a href="${contextPath}/hot.bo?currentPage=1"><button>오늘의 핫한 게시물은?</button></a> 
                <button onclick="toggleChat()" id="backsite6">이전 목록으로</button>
            </div>
        </div>




    </div>

<!-- 새롭게 창이 열리게 해놓아 경우마다 div를 주었습니다 -->
    <script>
    //this가 안먹혀 일일히 아이디값 주고 이전으로 설정해놨습니다
        $("#backsite").click(function(){

            $("#introduce").css("display", "none");
            $("#chatContainer").css("display", "block");
        });
 
        $("#backsite2").click(function(){

        $("#goEnrollForm").css("display", "none");
        $("#chatContainer").css("display", "block");
        });


        $("#backsite3").click(function(){

        $("#whatSubscribe").css("display", "none");
        $("#chatContainer").css("display", "block");
        });

        $("#backsite4").click(function(){

        $("#goFindPwdForm").css("display", "none");
        $("#chatContainer").css("display", "block");
        });

        
        $("#backsite5").click(function(){

        $("#goSubscribeForm").css("display", "none");
        $("#chatContainer").css("display", "block");
        });
        
        $("#backsite6").click(function(){

           $("#goHotBoardForm").css("display", "none");
           $("#chatContainer").css("display", "block");
            });


        // 토글하는 함수(버튼 클릭시 챗봇 영역이 나오게)
        function toggleChat() {
            var chatContainer = $("#chat-container");
            var openChat = $("#openChat");
            var textToReveal = $("#textToReveal, #textToReveal-open");
            var chatBody = $(".chat-body");

            var introduce = $("#introduce");
            var whatSubscribe = $("#whatSubscribe");
            var goEnrollForm = $("#goEnrollForm");
            var goFindPwdForm = $("#goFindPwdForm");
            var goSubscribeForm = $("#goSubscribeForm");
            var goHotBoardForm = $("#goHotBoardForm");
            
            if (chatContainer.css("display") === "none") {
                // 채팅창 열기
                chatContainer.css("display", "block");
                textToReveal.each(function () {
                    revealText($(this));
                });
            } else {//열려있을때는 한번더 클릭하여 없에기 
            	  $(".chat-container").css("display", "none");
            	
           
            	  
            }
            	  
            }
            
        
		//첫번째 옵션인 홈페이지 소개 함수입니다
        function introduceArea() {
            var chatContainer = $("#chat-container");
            var introduce = $("#introduce");
            var text2 = $("#text2");

            chatContainer.css("display", "none");
            introduce.css("display", "block");
            text2.each(function () {
                revealText($(this));
            });
           
        }
 	//두번째 옵션인 구독소개 함수입니다
        function whatSubscribeArea() {
            var chatContainer = $("#chat-container");
            var whatSubscribe = $("#whatSubscribe");
            var text4 = $("#text4");

            chatContainer.css("display", "none");
            whatSubscribe.css("display", "block");
            text4.each(function () {
                revealText($(this));
            });
        }

	//세번째 옵션인 회원가입 함수입니다
        function goEnrollArea() {
            var chatContainer = $("#chat-container");
            var goEnrollForm = $("#goEnrollForm");
            var text3 = $("#text3");

            chatContainer.css("display", "none");
            goEnrollForm.css("display", "block");
            text3.each(function () {
                revealText($(this));
            });
        }
	//네번째 옵션인 아디 찾기 옵션입니다
        function goFindIDPwdArea() {
            var chatContainer = $("#chat-container");
            var goFindPwdForm = $("#goFindPwdForm");
            var text5 = $("#text5");

            chatContainer.css("display", "none");
            goFindPwdForm.css("display", "block");
            text5.each(function () {
                revealText($(this));
            });
        }
	//다섯번째 옵션인 구독하기 옵션입니다
        function goSubscribeArea() {
            var chatContainer = $("#chat-container");
            var goSubscribeForm = $("#goSubscribeForm");
            var text6 = $("#text6");

            chatContainer.css("display", "none");
            goSubscribeForm.css("display", "block");
            text6.each(function () {
                revealText($(this));
            });
        }  
        //여섯번째 옵션인 핫게시물 옵션입니다
        function goHotBoardArea() {
            var chatContainer = $("#chat-container");
            var goHotBoardForm = $("#goHotBoardForm");
            var text7 = $("#text7");

            chatContainer.css("display", "none");
            goHotBoardForm.css("display", "block");
            text7.each(function () {
                revealText($(this));
            });
        } 
		//일일히 문자를 타이핑 하듯이 나열해주는 함수입니다.
        function revealText(element) {
            var text = element.html();
            element.html("");//처음에는 빈문자열로 시작합니다
            var index = 0;//시작할 인덱스입니다
            var timer = setInterval(function () {
                element.html(element.html() + text.charAt(index));//빈문자열부터 시작해서 인덱스를 하나하나씩 올려주며 작성한 글들을 뽑습니다
                index++;
                if (index === text.length) {
                    clearInterval(timer);//시간(ms)을 간격으로 콜백함수를 반복 호출 하는 함수이다.
                   //
                }
            }, 30);//30ms로 설정 아마 0.03초
        }
        //현재 챗봇 이외의 영역을 클릭할시 다 사리지게 하는 옵션입니다
        $(document).on('click', function(e) {
            // 클릭된 요소가 채팅 창 또는 관련된 영역인지 확인
            if (!$(e.target).closest('.chat-container, .chat-toggle-button').length) {
                // 클릭된 영역이 채팅 창 또는 관련된 영역이 아니면 채팅 창을 숨김
                $(".chat-container").css("display", "none");
            }
        });
        
      // 위 함수에 대한 gpt 설명 
        /*  !$(e.target).closest('.chat-container, .chat-toggle-button').length는 
        jQuery를 사용하여 클릭된 요소의 부모 중에서 .chat-container 또는 .chat-toggle-button 클래스를 가진 요소를 찾는 것입니다.

        e.target은 클릭된 요소를 나타냅니다.
        .closest('.chat-container, .chat-toggle-button')은 클릭된 요소부터 시작해서 상위로 올라가며 주어진 선택자들 중에서 가장 가까운 부모를 찾습니다.
        !는 논리 NOT 연산자로, 결과를 부정합니다.
        .length는 선택된 요소의 개수를 나타냅니다.
        따라서 !$(e.target).closest('.chat-container, .chat-toggle-button').length는
		클릭된 요소의 부모 중에서 .chat-container 또는 .chat-toggle-button 클래스를 가진 요소가 없을 경우를 나타냅니다. 
		이 경우, 클릭된 요소가 채팅 창 또는 토글 버튼 영역 외부에 있다는 의미이며, 이때 채팅 창을 숨기는 동작을 수행합니다.
		 */
    </script>
        
</body>
</html>
