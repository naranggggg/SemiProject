<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<title>늴리리</title>
<style>

* {
	font-family: 'Noto Sans KR', sans-serif;
}

/*---------------------content 스타일 영역------------------------------*/
#title {
	/* border: 1px solid black; */
	height: 168px;
}

#title>p {
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 40px;
	font-weight: bolder;
	padding-left: 892px;
}

#contents {
	/* border: 1px solid black; */
	align-items: center;
	width: 1035px;
	margin:0 auto;
}

#subtitle {
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 20px;
	font-weight: 600;
	height: 30px;
	border-bottom: 3px solid black;
}

#id, #pwd, #chkpwd, #name, #birth, #gender, #phone, #email {
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 16px;
	height: 70px;
	padding-top: 15px;
	border-bottom: 1px solid #dcdcdc;
}

#custAddress {
	margin-top: 15px;
	height: 137px;
}

#address {
	border-bottom: 3px solid black;
}

/*-------------------------------아이디 입력------------------*/
#id>span {
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 16px;
}

#id>input {
	width: 400px;
	height: 42px;
	margin-left: 222px;
	border: 1px solid #dcdcdc;
}

.chkId {
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 14px;
	color: aliceblue;
	width: 140px;
	height: 45px;
	background-color: #7d7d7d;
	border: none;
}

/*------------------------비밀번호, 비밀번호 확인-----------------*/
#pwd>span {
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 16px;
}

#pwd>input {
	width: 400px;
	height: 42px;
	margin-left: 205px;
	border: 1px solid #dcdcdc;
}

#chkpwd>span {
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 16px;
}

#chkpwd>input {
	width: 400px;
	height: 42px;
	margin-left: 173px;
	border: 1px solid #dcdcdc;
}

/*--------------------이름 입력 스타일---------------------*/
#name>span {
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 16px;
}

#name>input {
	width: 400px;
	height: 42px;
	margin-left: 236px;
	border: 1px solid #dcdcdc;
}

/*---------------------생일,번호 select,option스타일-----------------*/
#birth>span {
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 16px;
}

.binfo, .phonInfo {
	width: 100%;
	height: 42px;
	margin-top: 10px;
}

.bBox, .pbox {
	height: 42px;
	border: 1px solid #dcdcdc;
}

.pmiddle, .plast {
	height: 40px;
	border: 1px solid #dcdcdc;
}

/*-------------------생일-------------------------*/
#birth_year, #front {
	width: 125px;
	height: 42px;
	margin-left: 206px;
}

#birth_month, #birth_day, #middle, #last {
	width: 125px;
}
/*-------------양력,음력-----------------------------*/
#yang {
	margin-left: 43px;
}

#eum, #m {
	margin-left: 20px;
}
/*--------------성별 radio_input----------------*/
#f {
	margin-left: 223px;
	margin-top: 20px;
}

#selectEmail {
	width: 100px;
	height: 45px;
	border: 1px solid #dcdcdc;
}

#custEmailId {
	margin-left: 210px;
	border: 1px solid #dcdcdc;
}

#custEmailDomein {
	border: 1px solid #dcdcdc;
}

/*---------------------------------주소--------------------*/
.custAddress {
	width: 400px;
	height: 42px;
	border: 1px solid #dcdcdc;
	margin-left: 226px;
}

#btnPostCode {
	margin-left: 10px;
	font-family: 'Nanum Gothic', sans-serif;
	font-weight: 500;
	font-size: 14px;
}

.custInputAddress {
	width: 400px;
	height: 42px;
	margin-left: 269px;
	margin-top: 24px;
	margin-bottom: 15px;
}
/*--------------------------------------동의영역------------------------------*/

.allChk {
	padding-left: 30px;
}

#txt_all {
	margin-left: 30px;
}

.microBtnOpenLayer {
	border:none;
	float:right;
	margin-right: 20px;
}

#chkAgree1, #chkAgree2, #chkAgree3, #chkAgree4 {
	margin-bottom: 20px;
	margin-top: 20px;
	/* border-bottom:1px solid white; */
}

.inputBtnchk {
	border-bottom: 1px solid white;
}

.joinAgreement>ul {
	background-color: #f5f5f5;
}

.material-symbols-outlined {
	font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24
}

/*-------------동의 모달영역-----------------------*/
.mWrp{
	position: fixed;
	z-index: 200;
	padding-top: 100px;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0,0,0,0.3);
	display: none;
}
.mBody{
 	width: 700px;
 	height: 600px;
 	padding: 40px 40px;
 	margin: 0 auto;
 	border: 1px solid #777;
 	background-color: #fff;
 	overflow : auto;
}

.cBtn{
	float: right;
	font-weight: bold;
	color : #777;
	font-size: 25px;
	cursor: pointer;
}
#c2modalBody table{
	
	width: 600px;
	height: 56px;
	border-bottom: 1px solid #343434;
	border-top: 1px solid #343434;
	text-align: center;
}
#c2modalBody th{
	border-bottom: 1px solid #dfdfe4;
}
	
/*--------------푸터----------------------*/
.foot{
border:1px solid black;
width: 1920px;
right: 10px;
margin-left:0;
text-align: center;
}

 @keyframes shake {/*애니메이션 효과 css*/
  0% { transform: translateX(0); }
  20% { transform: translateX(-5px); }
  40% { transform: translateX(5px); }
  60% { transform: translateX(-5px); }
  80% { transform: translateX(5px); }
  100% { transform: translateX(0); }
}

.shake-input {
  animation: shake 0.5s;
  animation-iteration-count: 3;
}


</style>
</head>


<body>



<%@ include file="../common/headerBar.jsp"%> 


	<!--****************************콘텐츠 영역******************************-->
	<div id="title">
		<br> <hr>
		<p id="title">회원가입</p>
	</div>
	<div id="contents">
		<div id="subtitle">기본정보 입력</div>
		<form action="${contextPath }/enrollForm.mb" method="post">
			<div id="content1">
			
				<!--**********************************************아이디*************************************************-->
				<div id="id">
					 <label for="idInput">* 아이디</label>
					<input type="text" id="idInput" name="userId" required placeholder="영문/숫자/'_' 만 입력가능 4~16자리">
					<span id="overLapId">영문/숫자/'_' 만 입력가능 4~16자리</span><!-- 중복확인 버튼 대신 오류문 발생 -->
				
				</div>

				<!--************************************************비밀번호 , 이름*******************************************************-->
				
				<div id="pwd">
					<label for="pwdInput">* 비밀번호</label>
					<input type="password" id="pwdInput" name="userPwd" required placeholder="영문+숫자+특수문자 조합 8~16자리" maxlength="16">
					<span id="pwdCk1"></span><!-- 오류문 발생 span태그 -->
				</div>
				
				<div id="chkpwd">
					 <label for="pwdInputCk">* 비밀번호 확인</label>
					<input type="password" required placeholder="영문+숫자+특수문자 조합 8~16자리" maxlength="16" id="pwdInputCk">
					<span id="pwdCk2"></span><!-- 오류문 발생 span태그 -->
				</div>
				<div id="name">
					<label for="nameInput">* 이름</label>
					<input type="text" id="nameInput" name="userName" required placeholder="두글자 이상(한글 이외의 글자 입력불가)">
					<span id="nameCk"></span><!-- 오류문 발생 span태그 -->
				</div>



				<!--*****************************************************생년월일***************************************************-->
				<div id="birth">

					<div class="binfo" id="info_birth">
						<span>*생년월일</span> 
						<select class="bBox" id="birth_year" onchange="javascript:lastday();" name="userYear">
							<option disabled selected>출생년도</option>
						</select>
						 <select class="bBox" id="birth_month" name="userMonth" onchange="javascript:lastday();">
							<option disabled selected>월</option>
						</select>
						 <select class="bBox" id="birth_day" name="userDay">
						</select>

					</div>



					<!--******************************************************************성별************************************************************-->
				</div>
				<div id="gender">
					<span>* 성별</span> 
					<input type="radio" class="radioBoxCh" name="userGender" value="F" id="f"><label for="f">여자</label>
					<input type="radio" class="radioBoxCh" name="userGender" value="M" id="m"><label for="m">남자</label>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="radibBoxChspan"></span><!-- 오류문 발생 span태그 -->
				</div>


				<!--******************************************************전화번호*************************************************************************-->
				<div id="phone">
					<div class="phonInfo">
						<span>전화번호</span>
						 <select class="pbox" id="front" name="firstPNum">
							<option selected>010</option>
						</select> 
						<input type="text" class="pmiddle" maxlength="4"  minlength="4" id="midPNum" name="midPNum"> 
						<input type="text" class="plast" maxlength="4"  minlength="4" id="lastPNum" name="lastPNum">
					</div>
				</div>


				<!--******************************************이메일*************************************************************************************-->
			    <div id="email">
        <label for="custEmailId">*이메일</label>
        <input type="text" id="custEmailId" name="custId" placeholder="이메일아이디" style="height: 42px;" required>
        <span class="txt_emil">@</span>
        <input type="text" class="duplicate_email" id="custEmailDomain" name="domain" style="width: 125px; height: 42px;" readonly>
        <select class="normal" name="domain" id="selectEmail">
            <option disabled selected>선택</option>
            <option value="naver.com">naver</option>
            <option value="gmail.com">gmail</option>
            <option value="daum.net">daum</option>
            <option value="nate.com">nate</option>
            <option value="khacademy.com">KH</option>
            <option value="직접입력">직접입력</option>
        </select>
        <span id="emailOverLap"></span><!-- 오류문 발생 span태그 -->
        <div style="width: 114px; height: 42px; outline-style: none;" class="select-list-box" wck="selectEmail" tabindex="0"></div>
        <div tabindex="0" title="" class="selected-headline" nstyle="width: 114px;"></div>
    </div>
				<!--**********************************************************주소****************************************************************************************-->

<div id="address">
    <div class="custAddress_postCode" >
<span style="padding-bottom: 100px; position: relative; top: 80px;">*&nbsp;&nbsp; 주소</span>
        <div class="address-inputs">
            <input type="text" class="custAddress" id="sample6_postcode" placeholder="우편번호" readonly="readonly" name="memberPostCode">0
            <input type="text" class="custAddress" id="sample6_address" placeholder="주소" readonly="readonly" name="memberAddress">
            <button type="button" id="btnPostCode" onclick="sample6_execDaumPostcode()"  class="btn_post_search" 
						style="width: 140px; height: 45px; background-color: #7d7d7d; border: none; color: aliceblue;">우편번호 찾기</button>
        </div>
        <div class="address-details">
            <input type="text" id="sample6_detailAddress" placeholder="상세주소" name="memberDetailAddress" class="custInputAddress" style="margin-left: 225px;">
<input type="text" id="sample6_extraAddress" name="memberExtraAddress" placeholder="참고항목" style="margin-left: 10px;">
        </div>
    </div>
</div>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>




			<!--**************************************************동의영역***************************************************************-->
			<div id="content2">
				<div class="joinAgreement">
					<!--****************************모두동의 ******************-->
					<p class="allChk">
						<span class="inputBtnChk"> <input type="checkbox"
							id="chkAll" onclick="selectAll();"> <label for="chkAll"> <span
								id="allTxt1"
								style="font-size: 20px; font-weight: 500; font-family: 'Nanum Gothic', sans-serif;">
									전체 동의합니다.</span> <br> <br> <span id="txt_all">"전체동의는
									필수 및 선택정보에 대한 동의도 포함되어 있으며, 개별적으로 동의를 선택할 수 있습니다."</span> <br> <span
								id="txt_all"> "선택항목에 대한 동의를 거부하는 경우에도 회원가입 서비스는 이용
									가능합니다." </span>
						</label>
						</span>
					</p>

					<!-- ****************************동의 목록******************************* -->
					<ul id="agreePart" style="list-style-type: none;">
						<li>
						   <span class="inpuBtnchk"> 
						   <input type="checkbox" id="chkAgree4" name="chkAgree04"> <label for="chkAgree4"
								style="font-size: 16px; font-weight: 500; font-family: 'Nanum Gothic', sans-serif;">
									만 14세 이상입니다. (필수) </label>
						   </span>
						</li>
						<li>
						    <span class="inpuBtnchk"> <input type="checkbox" id="chkAgree1" name="chkAgree01"> <label for="chkAgree1"
								style="font-size: 16px; font-weight: 500; font-family: 'Nanum Gothic', sans-serif;">
									"이용약관 동의 (필수)" </label>
						    </span>
						    <button type="button" class="microBtnOpenLayer" id="openuseInfo" >내용보기</button>
						</li>
						<li>
						     <span class="inpuBtnchk"> <input type="checkbox" class="material-symbols-outlined" id="cumtom-check-1"
								name="chkAgree02"> <label for="chkAgree2"
								style="font-size: 16px; font-weight: 500; font-family: 'Nanum Gothic', sans-serif;">
									"개인정보 수집 및 이용에 대한 동의 (필수)" </label>
						     </span>
							<button type="button" class="microBtnOpenLayer" id="openCollect">내용보기</button>
						</li>
						<li>
						     <span class="inpuBtnchk"> <input type="checkbox" id="chkAgree3" name="chkAgree03"> <label for="chkAgree3"
								style="font-size: 16px; font-weight: 500; font-family: 'Nanum Gothic', sans-serif;">
									"개인정보 수집 및 이용안내(선택)" </label>
						    </span>
							<button type="button" class="microBtnOpenLayer" id="openCollect2">내용보기</button>
						</li>
					</ul>


				</div>
				<!--********************************취소,저장 btn*******************************************-->
				<div class="joinBtnWrap" align="center" style="margin-top: 30px;">
					
					<button type="button" id="btnCancel" name="button" class="btn" onclick="" 
					style="width: 108px; height: 35px;">취소</button>
					
					
					<button type="button" id="btnConfirm"class="btn" onclick=" return enroll();"
					style="width: 108px; height: 35px; background-color: black; color: aliceblue; border: none;">확인</button>


				</div>

			</div>
			
			
			<!-- *******************************모달팝업(이용약관)*************************************** -->
			<div id="modalWrap" class="mWrp">
			  <div id="modalBody" class="mBody">
			    <span id="closeBtn" class="cBtn"> &times;</span>
			    <p> <h3>이용약관</h3> </p>
			    <p><b>제 1장 총칙</b></p>
			    <p><b>제 1조(목적)</b></p>
			    <p>본 약관은 ㈜닐리리(이하 "회사"라 합니다.)가 제공하는 인터넷 서비스(이하 "서비스"라 합니다.)의 이용과 관련하여 회사와 회원의 권리, 의무 및 기타 필요한 사항을 규정함을 목적으로 합니다.</p>
			    <br>
			    <p><b>제 2조 (용어의 정의)</b></p>
			    <p>본 약관에서 사용하는 주요한 용어의 정의는 다음과 같습니다.</p>
			    <p>1. 회원: 회사와 서비스 이용 계약을 체결하고 회원 아이디(ID)를 부여 받은 자를 말합니다.</p>
			    <p>2. 아이디: 회원의 식별과 회원의 서비스 이용을 위하여 회원이 선정하고 회사가 승인하는 문자나 숫자 혹은 그 조합을 말합니다.(이하 "ID"라 합니다.)</p>
			    <p>3. 비밀번호 : 회원이 부여 받은 ID와 일치 된 회원임을 확인하고, 회원 자신의 비밀을 보호하기 위하여 회원이 정한 문자와 숫자의 조합을 말합니다.</p>
			    <p>4. 닉네임: 서비스 이용을 위하여 회원이 선정하고 회사가 승인한 문자나 숫자 혹은 그 조합으로 서비스 이용 시 회원을 구분하고 지칭하고 나타내는 명칭을 말합니다.</p>
			    <p>5. 이용제한: 회사가 약과넹 의거하여 회원의 서비스 이용을 제한하는 것을 말하며,일정 기간 서비스 이용중지, 영구적인 서비스 이용 중지,서비스 중 일부에 대한 이용 중지를 포함합니다.</p>
			    <p>6. 포인트: 각 회원에게 부여되는 점수로 서비스 내에서의 활동 정도 및 서비스의 이용 에 따라 증감되는 수치를 말합니다. </p>
			  </div>  
			
			</div>
<!-- 			<!-- *******************************모달팝업(개인정보 수집 및 이용)*************************************** -->
			<div id="cmodalWrap" class="mWrp">
			  <div id="cmodalBody" class="mBody">
			    <span id="closeBtn1" class="cBtn"> &times;</span>
			    <p> <h3>개인정보 수집 및 이용에 대한 동의 (필수)</h3> </p>
			    <hr>
			    <br>
			    <p>이용목적</p>
			    <br><p>가상자산 거래 서비스 제공 및 고객 불만 등 민원처리</p>
			   <br>	 <p>수집항목</p>
			    <p> <ul>
			    <li>필수 항목 : 이메일 주소(ID),비밀번호</li>
			    <li>선택항목: 추천인 코드(UID)</li>
			    <li>자동 수집 항목: 서비스 이용기록,접속로그,방문일시,기기정보 ,접속IP,쿠키</li>
			    </ul> </p>
			    <p>보유 및 이용기간</p>
			    <br><p>회원탈퇴 시까지</p>
			    <br>
			    <p>※회원님은 동의를 거부할 권리는 있으나, 동의를 거부할 경우 회원가입에 제한 될 수 있습니다.</p>
			   
		
			    
			  </div>  
			
			</div>
			
			<!-- *******************************모달팝업(개인정보 수집 및 이용)*************************************** --> 
			<div id="c2modalWrap" class="mWrp">
			  <div id="c2modalBody" class="mBody">
			    <span id="closeBtn2" class="cBtn"> &times;</span>
			    <p> <h3>개인정보 수집 및 이용안내 (선택)</h3> </p>
			    <hr>
			    <br>
			   <p> <table>
			   <thead>
			   <tr>
			   <th>구분</th>
			   <th>수집항목</th>
			   <th>이용목적</th>
			   </tr>
			   </thead>
			   
			   <tbody>
			   	<tr>
			   	<td>기타서비스</td>
			   	<td>휴대폰번호</td>
			   	<td>앱 설치URL전송</td>
			   	</tr>
			   </tbody>
			   
			   </table>  </p>
			    <p>개인정보의 보유 및 이용 기간: 회원 탈퇴 시 30일 뒤 또는 법정 의무 보유기간</p>
			    <br><p>선택사항의 동의를 거부하시는 경우에도 회원가입 및 구매결정 등 필수 서비스는 이용할 수 있습니다. 단, 일부 부가서비스는 제한될 수 있습니다.</p>
		
			    
			  </div>  
			
			</div>
			
			
	</form>
	</div>
	
	<%@ include file="../common/footerBar.jsp"%>

<style>

      #footer{
        margin-top: 60px;
        margin-left:-500px;
        width: 1920px;
        color: gray;
        text-align: center;
      }
      #f_text{
        padding-top: 40px;
      }

</style>




	<script>
   //이용약관 모달창 열기 	
	const btn = document.getElementById('openuseInfo');
	const modal = document.getElementById('modalWrap');
	const closeBtn = document.getElementById('closeBtn');
	
	btn.onclick = function(){
		modal.style.display = 'block';
	}
	
	closeBtn.onclick = function(){
		modal.style.display = 'none';
	}
	window.onclick = function(event){
		if(event.target == modal){
			modal.style.display = "none";
		}
	}
	
	
	//개인정보 수집 및 이용에 대한 동의 약관 보기 
	const btn1 = document.getElementById('openCollect');
	const cmodal = document.getElementById('cmodalWrap');
	const closeBtn1 = document.getElementById('closeBtn1');
	
	btn1.onclick = function(){
		cmodal.style.display = 'block';
		
	}
	
	closeBtn1.onclick = function(){
		cmodal.style.display = 'none';
		
	}
	window.onclick = function(event){
		if(event.target == modal){
			cmodal.style.display = "none";
		}
	}
	
	
	//개인정보 수집 및 이용 동의
	const btn2 = document.getElementById('openCollect2');
	const c2modal = document.getElementById('c2modalWrap');
	const closeBtn2 = document.getElementById('closeBtn2');
	
	btn2.onclick = function(){
		c2modal.style.display = 'block';
		
	}
	
	closeBtn2.onclick = function(){
		c2modal.style.display = 'none';
		
	}
	window.onclick = function(event){
		if(event.target == modal){
			c2modal.style.display = "none";
		}
	}
	
	
	
	
	
	
	
	//아이디 중복검사 기능 ajax
	 $(function(){
	
		 $("#idInput").on("input",function(){
			
			
			 $.ajax({
				url :"${contextPath}/overLapEnroll.mb",
				data : {
			
					overLapId : $(this).val()
					
				},
				
				success : function(result){
				
					if(result=="NNNNN"){//중복된거있을때
						$("#overLapId").text("* 사용중인 아이디입니다.");
						$("#overLapId").css("color","red");
					
							
					}else{
						$("#overLapId").text("* 사용 가능한 아이디입니다");
						$("#overLapId").css("color","green");
					
					}
					
					
				},
				error : function(xhr,status,error){
					console.log("에러입니다" + error);
				},
				
				type :"post"
					 
			 });
			 });
		 //이메일 중복검사 ajax
		 $("#custEmailId,#custEmailDomain,#selectEmail").on("input change",function(){
		 $.ajax({
			url : "${contextPath}/overLapEmail.mb",
			data : {
				emailId : $("#custEmailId").val(),
				custEmailDomain : $("#custEmailDomain").val(),
			},
			success : function(count){
				if(count=="NNNNN"){//중복된거있을때
					$("#emailOverLap").text("* 사용중인 이메일입니다.");
					$("#emailOverLap").css("color","red");
				}else{
				}
			},
			error : function(){
				console.log("서버오류구리");
			},
			type : "post"//url노출방지
		 });
		 });
	 });
		//회원가입 제출 스크립트 
		//밑에 함수에서 회원가입 버튼을누르면 오류를 판별해주고 어디가 이상이있는지 확인해준다  오류가 없으면 서버로 전송
		function enroll() {
			var idInput = $("#idInput").val();
			let regExp1 = /^[a-zA-Z0-9_]{4,16}$/;//아이디

			let pwdInput = $("#pwdInput").val();
			let regExp2 = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[\W_]).{8,16}$/;//비번

			let nameInput = $("#nameInput").val();
			let regExp3 = /^[가-힣]{2,}$/;//이름

			let custEmailId = $("#custEmailId").val();
			let regExp4 = /^[a-z0-9]+$/;//이메일

			let custEmailDomein = $("#custEmailDomein").val();
			
			if(regExp1.test(idInput) && regExp2.test(pwdInput) 
				&& regExp3.test(nameInput) && regExp4.test(custEmailId)
				&& $("#overLapId").text()=="* 사용 가능한 아이디입니다"
				&& $("#pwdCk2").text()== "* 비밀번호가 일치합니다"
				&& $(".radioBoxCh").is(":checked")
				&& $("#emailOverLap").html()== ""){//조건이 다 맞을때 버튼을 submit로 바꿔서 서버로 전송	
				 $('#btnConfirm').prop('type', 'submit');
				//아이디 비밀번호 성별 체크 이메일 중복검사가 무사히 통과되면 회원 가입 버튼이 submit으로 바뀜
			}
			else if (!regExp1.test(idInput) || $("#overLapId").text()=="* 사용중인 아이디입니다."){//아이디 틀렸을때 
				$("#idInput").focus();
				if(!regExp1.test(idInput)){
					$("#overLapId").text("* 영문/숫자/'_'만입력가능 4~16자리만 입력가능");
					$("#overLapId").css("color","red");
				}
				$("#idInput").css("border", "1px solid #FF0000");
				$("#idInput").addClass("shake-input");
				$("#idInput").on("input", function() {
				$("#idInput").css("border", "1px solid #dcdcdc");
				});
			}
			if (!regExp2.test(pwdInput) || $("#pwdCk2").text()=="* 비밀번호가 일치하지않습니다" ) {//비번틀렸을때 비번확인 틀렸을때
				$("#pwdInput").focus();
				$("#pwdCk1").text("* 영문+숫자+특수문자 조합 8~16자리만 입력가능")	
				
				if($("#pwdCk2").text()=="* 비밀번호가 일치하지않습니다"){
					$("#pwdInputCk").focus();
					$("#pwdInputCk").css("border", "2px solid #FF0000");
					$("#pwdInputCk").addClass("shake-input");
					
					$("#pwdInputCk,#pwdInput").on("input", function() {
						$("#pwdCk2").text("");
						$("#pwdInputCk").css("border", "1px solid #dcdcdc");
				});
				}
				
				$("#pwdInput").css("border", "2px solid #FF0000");
				$("#pwdInput").addClass("shake-input");

				$("#pwdInput").on("input", function() {
					$("#pwdCk1").text("");
					$("#pwdInput").css("border", "1px solid #dcdcdc");
				});
			}
			if (!regExp3.test(nameInput)) {//이름틀렸을떄
				$("#nameInput").focus();
				$("#nameCk").text("* 입력양식에 맞게 입력해주세요");
				$("#nameCk").css("color","red");
	
				$("#nameInput").css("border", "2px solid #FF0000");
				$("#nameInput").addClass("shake-input");
				$("#nameInput").on("input", function() {
					$("#nameInput").css("border", "1px solid #dcdcdc");
					$("#nameCk").text("");
				});
			}
			if (!regExp4.test(custEmailId)) {//이메일 틀렸을때

				$("#custEmailId").css("border", "2px solid #FF0000");
				$("#custEmailId").addClass("shake-input");
					$("#custEmailId").on("input", function() {
							$("#custEmailId").css("border", "1px solid #dcdcdc");
				});
			}
			if(!$(".radioBoxCh").is(":checked")){//성별체크안했을때
				$("#radibBoxChspan").html("성별입력란을 체크해주세요");
				$("#radibBoxChspan").css("color","red");
				$("#radibBoxChspan").focus();
				$(".radioBoxCh").on("change", function() {
				    if ($(this).is(":checked")) {
				        $("#radibBoxChspan").html("");
				    } 
				});
			}			
		   if($("#chkAgree4").prop("checked") && $("#chkAgree1").prop("checked") && $("#cumtom-check-1").prop("checked") ){
				$("#btnConfirm").prop("disabled",false);//필수이용약관동의 안했을때
		     }else{
				alert("필수항목에대한 동의를 해주세요")
				return false;
				}
		};
	</script>
	
	<script>
	//이메일 직접입력 했을때 뜨는 경고문 하고 셀렉박스의 option값이 바로여ㅠ input태그의 value값으로 들어가게 설정
	$(document).ready(function () {
	    $("#selectEmail").change(function () {
	        let selectedValue = $(this).val();
	        $("#custEmailDomain").val(selectedValue);
	        $("#emailOverLap").html("");
	        
	        if (selectedValue === '직접입력') {
	            $("#custEmailDomain").prop("readonly", false);
	            $("#custEmailDomain").val("");
	            
	            $("#custEmailDomain").on("input", function () {
	                if (!$("#custEmailDomain").val().includes('@')) {
	                    $("#selectEmail option[value=custom]").val($("#custEmailDomain").val());
	                }

	                if ($("#custEmailDomain").val().includes('@')) {
	                    $("#emailOverLap").html("이메일 형식으로 입력해주세요");
	                    $("#emailOverLap").css("color", "red");
	                } else {
	                    $("#emailOverLap").html("");
	                }
	            });
	        } else {
	            $("#custEmailDomain").prop("readonly", true);
	        }
	    });
		//emailId 적는 칸에 @나 . 적을시 오류문 발생 함수
	    $("#custEmailId").on("input", function () {
	        if ($("#custEmailId").val().includes('@') || $("#custEmailId").val().includes('.')) {
	            $("#emailOverLap").html("이메일의 아이디만 입력해주세요");
	            $("#emailOverLap").css("color", "red");
	        } else {
	            $("#emailOverLap").html("");
	        }
	    });
	});
		
	</script>
		<script>
		
		$(function(){
			//중간번호 입력시 자동으로 끝번호입력하게 만듬 핸드폰번호관련 함수
			$("#midPNum").on("input",function(){	
				if(this.value.length == this.maxLength){
					$("#lastPNum").focus();
				}
			})		
		});
	</script>
		<script>
		//폰번호 숫자 외 이상한 문자 들어갈시에 막는 함수		
		$("#midPNum,#lastPNum").on("input", function() {
	        // 숫자 이외의 문자 제거
	        this.value = this.value.replace(/[^0-9]/g, '');
	    });
		</script>
	<script>//생년월일 셀렉트태그 함수 월에 맞게 맞는 일수 선택
		var start_year = "1960";// 시작할 년도
		var today = new Date();//date 객체 생성
		var today_year = today.getFullYear(); // getFullyear 을쓰자
											//getyear은 앞자리가 2000년 대면 짤려서 나오는데 (ex 2019년은 119년이라 나옴)
											//getFullYear은 1000년도부터 9999년까지 적용가능
		var index = 0;
		for (var y = start_year; y <= today_year; y++) { //start_year ~ 현재 년도
			document.getElementById('birth_year').options[index] = new Option(
					y, y);//옵션값을 정해주는 구문
			index++;
		}
		index = 0;
		for (var m = 1; m <= 12; m++) {
			document.getElementById('birth_month').options[index] = new Option(
					m, m);
			index++;
		}
		lastday();
		function lastday() { //년과 월에 따라 마지막 일 구하기 
			var Year = document.getElementById('birth_year').value;
			var Month = document.getElementById('birth_month').value;
			var day = new Date(new Date(Year, Month, 1) - 86400000).getDate();
			var dayindex_len = document.getElementById('birth_day').length;
			if (day > dayindex_len) {
				for (var i = (dayindex_len + 1); i <= day; i++) {
					document.getElementById('birth_day').options[i - 1] = new Option(
							i, i);
				}
			} else if (day < dayindex_len) {
				for (var i = dayindex_len; i >= day; i--) {
					document.getElementById('birth_day').options[i] = null;
				}
			}
		}
	</script>

	<script>
	function selectAll(){//체크박스 전체선택
	if($("#chkAll").prop("checked")){
		$("#chkAgree4,#chkAgree1,#cumtom-check-1,#chkAgree3").prop("checked",true);
	}else{
		$("#chkAgree4,#chkAgree1,#cumtom-check-1,#chkAgree3").prop("checked",false);
	}
	}
	</script>
	<script>
	$(function(){//비밀번호랑 비밀번호 확인이랑 다를때 발생하는 함수
		  $("#pwdInput, #pwdInputCk").on("input", function() {
			    if ($("#pwdInput").val() === $("#pwdInputCk").val()) {
			      $("#pwdCk2").text("* 비밀번호가 일치합니다");
			      $("#pwdCk2").css("color", "green");
			    } else {
			      $("#pwdCk2").text("* 비밀번호가 일치하지 않습니다");
			      $("#pwdCk2").css("color", "red");
			    }
			  });	
	});
	</script>
</body>
	
</html>