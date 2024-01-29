<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous0">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>늴리리</title>
<style>

* {
	font-family: 'Noto Sans KR', sans-serif;
}

 /*콘텐츠 타이틀 영역 설정*/
        #title{
            position: relative;
            /* border: 1px solid black; */
            height: 168px;
            text-align: center;
        }
        /*콘텐츠 타이틀 스타일, 영역(중앙정렬) 설정*/
        #contitle{

            font-size: 30px;
            font-weight:300;
            margin: 0 30 auto;
         }
         
         *{font-family: 'Noto sans KR', sans-serif;}
         /*콘텐츠 텍스트 1 영역 설정*/
/*-------------------콘텐츠 위치값 설정(가운데 정렬 기준잡아두기)-----------------------------------*/
         #contents,#content_img,#susbtn{
            position: relative;
            text-align: center;
            /* border: 1px solid black; */
         }
         /*--------------------------상단텍스트------------------------------------------*/
         #conText01{
			font-family: 'Noto sans KR', sans-serif;
            letter-spacing: -2.5px;
            line-height: 40px;
            color: #595959;
            font-weight: 500; 
            font-size: 28px;
            margin: 0 auto;
         }
/*--------------------------------하단텍스트---------------------------------------------*/
         #conText02 table{
            margin: 0 auto;
         }
         #conText02 th{
            font-size: 26px;
            font-weight: 800;
            letter-spacing: -2px;
            text-align: left;
            margin-left: 30px;
            color: #333333;
         }
         #conText02 td{
            font-size: 17px;
            color: #4d4d4d;
            letter-spacing: -1.3px;
            padding-top: 100px;
            padding-left: 80px;
            line-height: 30px;
         }
         /*--------------------------------하단텍스트---------------------------------------------*/
         #conText03{
            letter-spacing: -3.5px;
            line-height: 50px;
            color: #333333;
            /* font-weight: 600; */
            font-size: 16px;
            margin: 55px  auto;
            border: 2px solid #cdcdcd ;
            border-radius: 10px;
            width: 1100px;
            height: 204px;
                    /* border: 1px solid #cdcdcd; */
             }
             #conText03 th{
                font-size: 18px;
                font-weight: bolder;
                letter-spacing: -1px;
                position: absolute;
                padding-top: 30px;
                color: #a90000;
             }
             #conText03 td{
             	font-family: 'Noto sans KR', sans-serif;
                font-size: 17px;
                font-weight: 400;
                color: #4d4d4d;
                letter-spacing: -1.2px;
                padding-top: 10px;
                padding-left: 50px;
                line-height: 28px;
                text-align: left;
             }
         
            /*---------------------------콘텐츠 두번째 테이블 위치, 스타일설정---------------------*/
             #conText04 table{
                border: 2px solid black;
                border-left: none;
                border-right: none;
                height: 80px;
                width: 1100px;
                margin: 0 auto;
                margin-top: 40px;
                background-color: #f5f5f5;
                font-size: 18px;
                font-weight: 400;
                color: #333333;
                padding-right: 20px;
             }
             #conText04 span{
                padding-right: 10px;
                padding-left: 10px;
             }
             .red{
                color: #a90000;
                padding-left: 20px;
             }
             #conText04 tbody{
                border-bottom: 2px solid black;
                text-align:center;
             }
                     /*--------------구독버튼-----------------------------*/
         #susbtn button{
      
            font-size: 16px;
            font-weight: 400;
            width: 300px;
            height: 67px;
            margin: 70px auto;
            background-color: #cdcdcd;  
            border: none;
         }
/*--------------------------------버튼호버--------------------------------*/
         #susbtn button:hover{
            background-color: #a90000;
            color: #f9dede;
         }
/*-------------------------------------------푸터영역--------------------------------------*/
         #footer{
        margin-top: 60px;
        color: gray;
      }
      #f_text{
        padding-top: 40px;
      }
   </style>
</head>
<body>

	<div class="wrap">
<%@ include file="../common/headerBar.jsp"%> 


        <!--서브페이지 타이틀 -->
         <div id="title">
            <br>
            <hr>
            <p id="contitle" >구독지 서비스</p>

         </div>
         <!--*******************************콘텐츠 영역********************************* -->
         <div id="contents">
            <pre id="conText01" >
               대한민국 서울 우리가 몰랐던  방방곡곡 아름다운 서울에서 당신에게 추억을 선물합니다.
               닐리리에서 제공하는 최고의 서비스, 서울을 즐길 수 있는 최고의 선택 
            </pre>
         </div>
<!--*******************************가운데 이미지입니다 **********************-->
         <div id="content_img">
            <img src="${contextPath }/resources/01_service/img.png" alt="서비스소개이미지" id="image">
         </div>
<!--*******************************하단텍스트!!!!!!!!!***********************************-->
         <div id="conText02">

           <table id="sTable">
            <colgroup>
              <col style="width: 288px;">
            </colgroup>
            <tbody>
                <tr>
                    <th>여행도 이제 구독하세요</th>
                    <td >여행구독 서비스란? <br>
                        일정 금액을 지불하면 정기적으로 소비자의 취향을 반영한 맞춤형 여행상품 또는 <br>
                        체험상품을 제공하는 서비스입니다. 구독자를 모집하여 <br>
                        여행구독자에게 보석같은 여행지부터 , 관광 기업의 신상 여행 정보까지 <br>
                        월별 떠나기 좋은 여행을  경험하게 합니다
                    </td>
                </tr>
            </tbody>
           </table>

           <div id="conText03">
               
               <table id="sTable">
                   <colgroup>
                    <col style="width: 288px;">
                </colgroup>
                <tbody>
                    <tr>
                        <th>구독 회원 여행 정보 제공 서비스</th>
                        <td >
                            <pre>
                            나만의 맞춤 여행지 - 나의 성향에 따른 맞춤형 여행지를 추천 해 드립니다.
                            <small>(※로그인 후 대한민국 구석구석을 이용하면 더 풍성한 여행지를 추천받을 수 있습니다.)</small>
                            우연한 발견 추천 여행지 - 서울 구석구석 운영자가 추천하는 여행지입니다.
                            나의 관심 지역 추천 여행지 - 나와 같은 지역 성향의 사용자들이 관심을 갖는 여행지추천입니다. 
                            서울 구석구석 인기 맛집 - 서울 구석구석 사용자들에게 인기있는 음식점 추천입니다. 
                            
                            </pre>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!--*******************************하단텍스트!!!!!!!!!***********************************-->
            <div id="conText04">
                <table>
                    <tbody>
                        <tr>
                            <td align="center">
                                <img src="${contextPath }/resources/01_service/1_ui.png" alt="1번_아이콘">
                                <span>구독 서비스</span>
                                <img src="${contextPath }/resources/01_service/arrow.png" alt="화살표">
                                <span class="red">3,900원</span>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div id="susbtn">
               <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
				  구독하기
				</button>
                </div>
         </div>
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">구독 결제하기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
       <c:choose>
  <c:when test="${not empty loginMember }">
         <div class="modal-body">
    "${loginMember.memberName }" 님 구독을 하시겠습니까?
     <br><br>
     (확인을 누르시면 자동으로 구독이 되십니다)
      </div>
      <div class="modal-footer">
        <button type="button" id="closeBtn"class="btn btn-secondary" data-bs-dismiss="modal">구독 취소</button>
        <button type="button" id="submitBtn" class="btn btn-primary">구독 하기</button>
        </c:when>
        <c:otherwise>
     <div class="modal-body">
    <mark>로그인을 먼저 진행해주세요</mark>
      </div>
      <div class="modal-footer">
        <button type="button" id="closeBtn"class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" id="submitBtn2" class="btn btn-primary">로그인</button>
        </c:otherwise>
 </c:choose>
      </div>
    </div>
  </div>
</div>
         	<%@ include file="../common/footerBar.jsp"%>
         	<script>
         	$("#submitBtn2").click(function(){
         		window.location.href = "../../index.jsp";
         	});
         	
         	
         	$("#submitBtn").click(function(){
         		$.ajax({
         			url : "${contextPath}/subscribe.mb",
         			data :{
         				memberName :"${loginMember.memberName}",
         				memberNo : "${loginMember.memberNO}",
         			},
         			success: function(result){
         				if(result>0){
         					$("#closeBtn").click();
         				}else{
         					alert("비정상적인 이유로 구독에 실패하였습니다");
         				}
         			},
         			error: function(){
         				alert("서버와의 통신중 비정상적인 이유로 실패");
         			},
         			type:"post"
         		});
         	});
         	
         	$("#submitBtn").click(function(){
         		$.ajax({
         			url : "${contextPath}/insert.sb",
         			data :{
         				memberNo : "${loginMember.memberNO}",
         			},
         			success: function(result){
         				if(result>0){
         					window.location.href = "serviceFinal.jsp";
         				}else{
         					alert("비정상적인 이유로 구독에 실패하였습니다");
         				}
         			},
         			error: function(){
         				alert("서버와의 통신중 비정상적인 이유로 실패");
         			},
         			type:"post"
         		});
         	});
         	</script>
</body>
</html>