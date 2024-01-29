<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap">
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
<meta name="viewport" content="width=
    , initial-scale=1.0">
<title>늴리리</title>

<style>

#area1 {
	height: 1000px;
	display: flex;
	justify-content: center; /* 중앙 정렬로 설정 */
	align-items: center; /* 수직 정렬로 설정 */
}

.find {
	padding: auto;
	margin: auto;
	text-align: left;
	margin-right: 150px; /* 오른쪽 간격 조정 */
	margin-left: 150px; /* 왼쪽 간격 조정 */
	margin-top: 100px; /*위로 얼만큼 떨어지는지 조정*/
}

#findId>thead>tr>th, #findPwd>thead>tr>th {
	border-bottom: 3px solid black;
	font-size: x-large;
	font-weight: bolder;
	font-family: 'Nanum Gothic', sans-serif;
}

#findId>tbody>tr>td, #findPwd>tbody>tr>td {
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 20px;
	font-weight: bold;
}

#up {
	font-family: 'Nanum Gothic', sans-serif;
	font-weight: bolder;
	font-size: xx-large;
}

        @keyframes shake {
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

	<div class="wrap">
<%@ include file="../common/headerBar.jsp"%> 


<h1 id="up" align="center">FIND YOUR
	ID&nbsp;&nbsp;/&nbsp;&nbsp;PASSWORD</h1>

<div id="area1">

	<table class="find" align="left" id="findId" height="600px">
		<thead>
			<tr>
				<th>FIND YOUR ID</th>
			</tr>
		</thead>
		<tbody>


			<tr height="100px">
				<td>회원가입 시 등록하신 정보로 아이디를 확인하실 수 있습니다<br> 회원님의 이름과 가입시 작성하신
					이메일 주소를 입력해 주세요
				</td>
			</tr>

			<tr height="50px">
				<td>이름</td>
			</tr>
			<tr height="100px">
				<td>
					<div class="input-group mb-3">
						<span class="input-group-text" id="basic-addon1">이름</span> <input
							type="text" required id="userName1" name="userName"
							class="form-control" placeholder="Username" aria-label="Username"
							aria-describedby="basic-addon1">
					</div>
					</div>
				</td>
			</tr>
			<tr height="50px">
				<td>이메일</td>
			</tr>
			<tr height="100px">
				<td><div class="input-group mb-3">
						<input type="text" id="userEmailId1" name="userEmailId"
							class="form-control" placeholder="UserEmail"
							aria-label="Username" required> <span
							class="input-group-text">@</span> <span class="input-group-text"
							id="basic-addon2"> <select name="userDomain"
							id="userDomain1" required class="form-select form-select-sm"
							aria-label="Small select example">
								<option selected>이메일을 선택해주세요</option>
								<option value="@naver.com">naver.com</option>
								<option value="@gmail.com">gmail.com</option>
								<option value="@daum.net">daum.net</option>
								<option value="@nate.com">nate.com</option>
								<option value="@khacademy.com">kh.com</option>
						</select>
					</div>
					<p id="alert-message" style="font-size: small;">"@"이전까지만 입력해주세요</p>
				</td>
			</tr>
			</span>
			</div>


			<tr align="center">
				<td><button class="btn btn-outline-secondary"
						data-bs-toggle="modal" data-bs-target="#staticBackdrop"
						onclick="findId();">아이디찾기</button></td>
			</tr>

			</tr>

			<!-- Button trigger modal -->


			<!-- Modal -->
			<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
				data-bs-keyboard="false" tabindex="-1"
				aria-labelledby="staticBackdropLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="staticBackdropLabel">아이디 찾기</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">

							<span id="findIdModal"></span>


						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>



		</tbody>
	</table>


	<table align="right" class="find" id="findPwd" height="600px">
		<thead>
			<tr>
				<th>FIND YOUR PASSWORD</th>
			</tr>
		</thead>


		<tbody>
			<tr height="100px">
				<td>회원님의 가입시 작성하신 아이디와 이름 이메일 주소를 입력해주세요</td>
			</tr>

			<tr>
				<td>아이디</td>
			</tr>
			<tr>
				<td><div class="input-group mb-3">
						<span class="input-group-text" id="basic-addon1">ID</span> <input
							type="text" required id="userId" class="form-control"
							placeholder="Username" aria-label="Username"
							aria-describedby="basic-addon1">
					</div></td>
			</tr>
			<tr>
				<td>이름</td>
			</tr>
			<tr>
				<td><div class="input-group mb-3">
						<span class="input-group-text" id="basic-addon1">NAME</span> <input
							type="text" required id="userName" class="form-control"
							placeholder="Username" aria-label="Username"
							aria-describedby="basic-addon1">
					</div>
			</tr>
			<tr>
				<td>이메일</td>
			</tr>
			<tr height="100px">
				<td><div class="input-group mb-3">
						<input type="text" required id="userEmailId" name="userEmailId"
							class="form-control" placeholder="Username" aria-label="Username">
						<span class="input-group-text">@</span> <span
							class="input-group-text" id="basic-addon2"> <select
							id="userDomain" class="form-select form-select-sm"
							aria-label="Small select example">
								<option selected>이메일을 입력해주세요</option>
								<option value="@naver.com">naver.com</option>
								<option value="@google.com">gmail.com</option>
								<option value="@daum.net">daum.net</option>
								<option value="@nate.com">nate.com</option>
								<option value="@khacademy.com">kh.com</option>
						</select>
					</div>
					<p id="alert-message" style="font-size: small;">"@"이전까지만 입력해주세요</p>
				</td>
			</tr>
			</span>
			</div>
			<tr align="center">
				<td>
					<button type="button" onclick="findPwd();"
						class="btn btn-outline-secondary" data-bs-toggle="modal"
						data-bs-target="#exampleModal">비밀번호찾기</button>
				</td>
			</tr>

		</tbody>




		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">비밀번호 수정</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<!-- 해당 사용자가 있을경우 비밀번호를 수정하는 span 태그입니다 -->
						<span id="updatePwdModal" style="display: none;"> * 새로운
							비밀번호 <input type="password" required id="updatePwd"
							class="form-control" placeholder="영문+숫자+특수문자 조합 8~16자리"
							aria-label="Username" aria-describedby="basic-addon1"> <span
							id="updatePwdContent"></span> <br>
						<br> * 비밀번호 확인 <input type="password" required id="updatePwdCk"
							class="form-control" placeholder="비밀번호확인" aria-label="Username"
							aria-describedby="basic-addon1"> <span
							id="updatePwdCkContent"></span> <br>
						<br>
						<br>

						</span>

						<!-- 해당 사용자 정보가 없을경우 정보가 없다고 표시되는곳입니다 -->
						<span id="emptyPwdModal" style="display: none;"> </span>

					</div>
					<div class="modal-footer">
						<button type="button" id="close" class="btn btn-secondary"
							data-bs-dismiss="modal">닫기</button>
						<button type="button" id="updatePwdbtn"
							class="btn btn-primary">비밀번호 수정</button>
					</div>
				</div>
			</div>
		</div>


	</table>




</div>
</div>

<%@ include file="../common/footerBar.jsp"%>


<script>
$("#updatePwdbtn").click(function() {//비밀번호 수정버튼 함수 
	
	
    let updatePwd = $("#updatePwd").val();//새롭게 입력할 비밀번호
    let regExp2 = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[\W_]).{8,16}$/;// 비밀번호 정규식
    let updatePwdCk = $("#updatePwdCk").val();//확인비밀번호

    if (regExp2.test(updatePwd) && updatePwd == updatePwdCk) {// 이상없을때 서버로 제출
        $.ajax({
        	url: "${contextPath}/updatePwd.mb",
        	data : {
        		updatePwd : $("#updatePwd").val(),
        		userId : $("#userId").val(),
				userName : $("#userName").val(),
				userEmailId : $("#userEmailId").val(),
				userDomain : $("#userDomain").val()
        	},
        	success :function(result){
        		if(result>0){
        			alert("비밀번호가 변경되었습니다");
        			$("#close").click();//클릭을  사용자 대신 한다
        		}else{
        			alert("비정상적인이유로 비밀번호가 변경되지 못하였습니다")
        			$("#close").click();
        		}
        	},
        	error : function(){
        		alert("서버와의 통신 실패")
        	},
        	type : "POST"
        });
        
    } else if (!(regExp2.test(updatePwd))) {//정규식 틀릴떄
        $("#updatePwd").focus();
        $("#updatePwd").addClass("shake-input");//애니메이션효과
        $("#updatePwdContent").html("옳바르게 비밀번호를 입력해주세요");
        $("#updatePwdContent").css("color", "red");
        $("#updatePwd").on("input", function() {//on 함수는 input태그 안에서 수정작업이 있을경우 발생한다
            $("#updatePwdContent").html("");
        });
    } else {//비밀번호 확인 틀릴때
        $("#updatePwdCk").focus();
        $("#updatePwdCk").addClass("shake-input");//애니메이션효과
        $("#updatePwdCkContent").html("옳바르게 비밀번호를 입력해주세요");
        $("#updatePwdCkContent").css("color", "red");
        $("#updatePwdCk").on("input", function() {//on 함수는 input태그 안에서 수정작업이 있을경우 발생한다
            $("#updatePwdCkContent").html("");
        });
    }
});


	$(function() {//이메일창에 @를 클릭할시 막아주는 기능입니다
		$("input[name='userEmailId']").on("input", function() {
			let value = $(this).val();
			if (value.includes("@")) {
				$(this).val(value.replace("@", ""));
				$(this).addClass("shake-input");

			} else {
				$(this).removeClass("shake-input");
			}
		});
	});

	function findPwd() {//비밀번호 찾기에서 ajax를 활용하여 사용자가 있을경우 비밀번호 수정으로 들어가고
		//없으면 없다고 표시해주는 기능입니다

		$.ajax({
			url : "${contextPath}/findPwd.mb",
			data : {
				userId : $("#userId").val(),
				userName : $("#userName").val(),
				userEmailId : $("#userEmailId").val(),
				userDomain : $("#userDomain").val()
			},
			success : function(result) {

				if (result == 0) {
					$("#emptyPwdModal").css("display", "block")
					$("#emptyPwdModal").css("font-weight", "bolder");
					$("#emptyPwdModal").html(
							"찾으시는 사용자가 존재하지 않습니다.<br> 다시 확인 하여 입력해주세요");

				} else {
					$("#updatePwdModal").css("display", "block");

				}

				$('#exampleModal').on('hidden.bs.modal', function(e) {//다시 가려준다. (또 다시실행을 했을경우 이전의 내용이 나오기때문)
					$("#updatePwdModal").css("display", "none");
					$("#emptyPwdModal").css("display", "none");
				});

			},

			error : function() {

			},

			type : "POST"

		});

	};

	function findId() {//아이디 찾는 비동기식 활용
		$.ajax({
			url : "${contextPath}/findId.mb",
			data : {
				userName : $("#userName1").val(),
				userEmailId : $("#userEmailId1").val(),
				userDomain : $("#userDomain1").val()
			},
			success : function(result) {
				if (result == 'null') {
					$("#findIdModal").css("font-weight", "bolder");
					$("#findIdModal").html("찾으시는 아이디가 존재하지 않습니다");
				} else {
					$("#findIdModal").css("font-weight", "bolder");
					$("#findIdModal")
							.html("FIND YOUR ID <br><br><br>" + result);
				}
			},
			error : function() {
			},
			type : "POST"
		});
	};
</script>
</body>
</html>