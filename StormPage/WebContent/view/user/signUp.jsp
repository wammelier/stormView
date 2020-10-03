<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html" charset="EUC-KR">
    <title>signUp</title>

	 <!-- bootStrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <!-- bootStrap js -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    
    <!-- sweetalert2 CDN -->	
	<!-- Include a required theme -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <!-- FontAwesome 아이콘-->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	
	<!-- 제이쿼리 js 이게 있어야 자바스크립트 $가 읽힘  -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	
</head>

<script type="text/javascript">
	
	/* 인증버튼을 누를경우. */
	$(document).on('click', '#confirm', function () {
		var userName = $('#userName').val();
		var phone = $('#phone').val();
		/* 인증의 완료를 알리는 key값. */
		var successKey = "successKey";
		console.log(userName + phone);
		
		$.ajax({
			url: "/user/json/authentic",
			method: "POST",
			dataType: "json",
			headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
			data: JSON.stringify ({
				userName : userName,
				phone : phone
			}),
			success: function(JSONData, status) {
				if( JSONData.message == 'confirmPhoneFail' ) {
					console.log("No Phone");
					/* 스위트알럿.. */
					swal("", "휴대폰번호가 맞지 않습니다.", "error");
				}else if( JSONData.message == 'confirmFail' ) {
					console.log("No Name");
					/* 스위트알럿.. */
					swal("", "등록되지 않은 이름입니다.", "error");
				}else if( JSONData.message == 'confirmOk' ) {
					console.log("Yes Search ReturnData!! ==>"+JSONData);
					/* 스위트알럿.. */
					swal(userName+"님 환영합니다!", "인증번호를 입력해주세요!");
					/* 인증하기 버튼을 확인버튼으로 바꾸기위해.. */
					var appendTag = '<input type="button" id="phoneCheckButton" value="확인" style="margin-left:10%; width: 200px; height: 70px; font-size:24px;"/>';
					/* 숨겨놨던 인증번호를 쓰는 input칸을 보이게하기. */
					$('#authentic').css('display', 'block');
					/* 인증하기 버튼을 확인버튼으로 바꾸기위해.. */
					$('.submit_input').html(appendTag);
					sendSms();
				} else if( JSONData.message == 'alreadysignUp' ) {
					console.log("already signUp");
					swal("", "이미 가입된 회원입니다.!", "error");
					
				}/* end of else if */
			},/* end of success */
			error: function(request, error, status) {
				console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
			}/* end of error */
		});/* end of ajax */
	});/* end of event */
	
	
	/* 인증번호를 발송할때 사용되는 ajax */
	function sendSms() { 
		/* 인증번호를 발송할때 사용할 핸드폰번호 필드화.. */
		var phone = $('#phone').val();
		/* 인증번호 발송 ajax */
		$.ajax ({ 
			url: "/user/json/sendSms", 
			method: "POST",
			dataType: "json",
			headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
			data: JSON.stringify ({ 
				phone : phone
			}), 
			success: function(JSONData, status) { 
				if ( JSONData.message == "done" ) { 
					swal("", "인증번호가 발송되었습니다!", "success");
					phoneCheck(JSONData.checkNo);
				}else {
					swal("", "인증번호 발송실패!", "error");
				};/* end of else */
			},
			error: function(request, status, error) {
				console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
			}/* end of error */
		});/* end of ajax */
	}/* end of function */
	
	
	/* 회원이적은 인증번호와 서버에서 발송된 인증번호가 같은지 확인하는 기능. */
	/* rand == 인증번호..  */
	function phoneCheck(rand) {
		/* 확인버튼을 클릭할경우.. */
		$('#phoneCheckButton').on('click', function() {
			/* 가입자가 기입한 인증번호.. */
			var authenticNo = $('#authentic').val();
			/* 유저가 작성한 번호와 핸드폰으로 전송된 인증번호를 비교함. */
			if ( rand == authenticNo ) {
				swal("", "인증에 성공하였습니다.", "success");
				document.getElementById('userName').readOnly = true;
				document.getElementById('phone').readOnly = true;
				$('#authentic').css('display', 'none');
				$('.succes_button').css('display', 'none');
				$('#successSignUpAfter').css('display', 'block');
			}else {
				swal("실패!", "다시 확인해주세요!");
			}/* end of else */
		})/* end of click event */
	};/* end of phoneCheck() */
	
	/* 회원인증을 하지 않고 가입하기 버튼을 누를경우 인증하라는 메세지를 띄움.. */
	$(function() {
		$('#successSignUp').on('click', function() {
			swal("", "본인인증을 먼저 진행해 주세요.", "error");
		});/* end of onclick */
	});/* end of function() */
	
	
	/* 본인인증을하면 버튼이 바뀜 필수입력사항을 입력하면 가입처리함.  */
	$(function() {
		/* 해당하는 필드의 값이 0일시 가입승인, 1일시 error처리 */
		var signFlagId = '';
		var signFlagPwd = '';
		var signFlagNickName = '';
		/* 아이디중복체크 하는 ajax */
		$(document).on('keyup', '#userId', function() {
			/* 회원이 작성한 id */
			var userId = $('#userId').val();
			$.ajax ({
				url: "/user/json/idCehck", 
				method: "POST",
				dataType: "json",
				headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
				data: JSON.stringify ({ 
					userId : userId
				}), 
				success: function(JSONData, status) { 
					/* 아이디가 4자리 이상인지 구별하기 위해.. */
					if( userId.length > 4 ) {
						/* 아이디가 사용중이지 않을때.. */
						if( JSONData.message == "checkOk") {
							$('#idCheckMessage').css('display', 'block');
							$('#idCheckMessage').css('color', 'blue');
							$('#idCheckMessage').text('사용가능한 아이디 입니다.');
							signFlagId = '0';
						/* 아이디가 사용중일때.. */
						}else {
							$('#idCheckMessage').css('display', 'block');
							$('#idCheckMessage').css('color', 'red');
							$('#idCheckMessage').text('이미 사용중인 아이디 입니다.');
							signFlagId = '1';
						}/* end of else */
					/* 아이디가 4자리이상이 아닐경우.. */
					}else {
						$('#idCheckMessage').css('display', 'block');
						$('#idCheckMessage').css('color', 'red');
						$('#idCheckMessage').text('아이디는 4자리 이상으로 해주세요!');
						signFlagId = '1';
					}/* end of else */
				},/* end of success */
				error: function(request, error, status) {
					console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
				}/* end of error */
			});/* end of ajax */
		});/* end of keyUp */
		/*===================== 아이디 확인 완료.. ======================*/
		
		/* 비밀번호를 확인하는 keyup function */
		$(document).on('keyup', '#userPwdConfirm', function() {
			var userPwd = $('#userPwd').val();
			var userPwdConfirm = $('#userPwdConfirm').val();
			if( userPwd.length > 6) {
				/* 비밀번호가 서로 일치하지 않을 경우.. */
				if( userPwd != userPwdConfirm) {
					$('#pwdCheckMessage').css('display', 'block');
					$('#pwdCheckMessage').css('color', 'red');
					$('#pwdCheckMessage').text('비밀번호가 서로 다릅니다!');
					signFlagPwd = '1';
				/* 비밀번호가 서로 일치할 경우.. */
				}else {
					$('#pwdCheckMessage').css('display', 'block');
					$('#pwdCheckMessage').css('color', 'blue');
					$('#pwdCheckMessage').text('비밀번호가 일치합니다!');
					signFlagPwd = '0';
				}/* end of else */
			}else {
				$('#pwdCheckMessage').css('display', 'block');
				$('#pwdCheckMessage').css('color', 'blue');
				$('#pwdCheckMessage').text('비밀번호는 6자리 이상입니다!');
				signFlagPwd = '1';
			}/* end of else */
		});/* end of keyUp event */
		/*===================== 비밀번호 확인 완료.. =======================*/
		
		/* 닉네임을 중복체크하는 쿼리.. */
		$(document).on('keyup', '#nickName', function() {
			/* 회원이 작성한 닉네임 필드화.. */
			var nickName = $('#nickName').val();
			$.ajax({
				url: "/user/json/nickNameCheck", 
				method: "POST",
				dataType: "json",
				headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
				data: JSON.stringify ({ 
					nickName : nickName
				}), 
				success: function(JSONData, status) { 
					/* 닉네임이 3자리 이상일때.. */
					if ( nickName.length > 2 ) {
						/* 닉네임이 사용중이지 않을때 중복체크완료! */
						if( JSONData.message == "checkOk") {
							$('#nickNameCheckMessage').css('display', 'block');
							$('#nickNameCheckMessage').css('color', 'blue');
							$('#nickNameCheckMessage').text('사용가능한 닉네임 입니다.');
							signFlagNickName = '0';
						/* 닉네임이 사용중일때... */
						}else {
							$('#nickNameCheckMessage').css('display', 'block');
							$('#nickNameCheckMessage').css('color', 'red');
							$('#nickNameCheckMessage').text('이미 사용중인 닉네임 입니다.');
							signFlagNickName = '1';
						}/* end of else */
					}else {
						$('#nickNameCheckMessage').css('display', 'block');
						$('#nickNameCheckMessage').css('color', 'red');
						$('#nickNameCheckMessage').text('닉네임은 3자리 이상입니다.');
						signFlagNickName = '1';
					}/* end of else */
				},/* end of success */
				error: function(request, error, status) {
					console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
				}/* end of error */
			});/* end of ajax */
		});/* end of keyUp event */
		/*================== 닉네임 중복체크 완료.. ====================*/
		
		/* 가입하기 버튼을 누를 경우.. */
		$('#successSignUpAfter').on('click', function() {
			/* 아이디 중복체크 실패시.. */
			if( signFlagId == '1' ) {
				swal("", "아이디를 확인해 주세요!", "error");
			/* 비밀번호가 서로 다를시.. */
			}else if( signFlagPwd == '1' ) {
				swal("", "비밀번호를 확인해 주세요!", "error");
			/* 닉네임 중복체크 실패시.. */
			}else if( signFlagNickName == '1' ) {
				swal("", "닉네임을 확인해 주세요!", "error");
			/* 아이디, 비밀번호, 닉네임중 하나라도 정상적으로 입력이 되지 않은경우.. */
			}else if(  signFlagId == '' || signFlagPwd == '' || signFlagNickName == '') {
				swal("", "필수사항을 모두 입력해 주세요!", "error");
			/* 아이디, 비밀번호, 닉네임 모두 정상적으로 입력이 완료된 경우. */
			}else if( signFlagId == '0' && signFlagPwd == '0' && signFlagNickName == '0' ) {
				signUp();
			}/* end of else if */
		});/* end of onclick */
	});/* end of function() */
	
	/* 회원가입시 회원이 입력한정보를 서버로 보내는 ajax */
	function signUp() {
		/* 회원이 입력한 정보를 필드화.. */
		var userId = $('#userId').val();
		var userName = $('#userName').val();
		var userPwd = $('#userPwd').val();
		var gender = $('#gender').val();
		var address = $('#address').val();
		var nickName = $('#nickName').val();
		var email = $('#email').val();
		var birth = $('#birth').val();
		/* signUp ajax 실행.. */
		$.ajax ({
			url: "/user/json/signUp", 
			method: "POST",
			dataType: "json",
			headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
			data: JSON.stringify ({ 
				userId : userId,
				userName : userName,
				userPwd : userPwd,
				gender : gender,
				address : address,
				nickName : nickName,
				email : email,
				birth : birth
			}), 
			success: function(JSONData, status) { 
				if(JSONData.message == "insertOk") {
					swal("", "가입완료!", "success");
					self.location = "/user/login";
				}else {
					swal("", "error!", "error");
				}/* end of else */
			},/* end of success */
			error: function(request, error, status) {
				console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
			}/* end of error */
		});/* end of ajax */
	}/* end of function() */

</script>

<style>
    #wrap{background: url("/resources/signUpImg.jpeg");}
    
    /* 제일 상단에 로고 css */
    #wrap {padding-top: 20%; height:2400px;}
    .main_logo {margin-left: 10%; margin-top: 5%; width: 80%; height: 120px;}
    .logo_img {width: 100%; height: 100%;}
    
    .input-group-lg {width: 80%; margin-left:10%;}
    b {font-size: 34px;}
    
    #successSignUp {
	    margin-left: 10%; 
	    float:left; 
	    width: 240px; 
	    height: 80px; 
	    background: url(/resources/signUpIconIn.png); 
	    background-repeat: no-repeat;
	}
	   
	#successSignUpAfter {
	    margin-left: 10%; 
	    float:left; 
	    width: 240px; 
	    height: 80px; 
	    background: url(/resources/signUpIconIn.png); 
	    background-repeat: no-repeat;
	}
	
    #cancel {
	    margin-left: 50px; 
	    float:left; 
	    width: 240px; 
	    height: 80px; 
	    background: url(/resources/signUpIconCancel.png); 
	    background-repeat: no-repeat;
    }
    .cancle_button{
    	margin-left:50px;
    }
    
     /* 스위트알럿 css 변경방법... */
    .swal-modal{
    width: 900px;
    height: 350px;
    }
    .swal-title{
    font-size: 50px;
    }
    .swal-text {
    font-size:70px;
    }
    .swal-button--danger{
     width: 200px;
     font-size: 40px;
    }
    .swal-button--cancel{
    widht: 200px;
    font-size: 40px;
    }
    .swal-button--confirm{
    width: 200px;
    font-size: 40px;
    }
    
</style>

<body>

   <form action="signUp.jsp">
        <section id="wrap" data-role="page">
            <div class="contents" data-role="content">
                 <div class="main_logo">
                    <img class="logo_img" src="/resources/stormLogotext.png">
                </div>
                <br/><br/><br/>
                <div class="info" style='font-size:25px; margin-left: 10%; width:80%; color:#ffffff;"'>
                    	군포교회 청년부 Storm어플은 청년들의 개인정보를 유출하지 않습니다. 회원가입을 통해 기입하신 개인정보는 청년부내에서 행사를 진행할때 참고되며 그 외에 다른 상업적인 용도와 불법적인 사용을 하지않음을 약속드립니다.
                </div>
                <br/><br/>
                <div class="input-group input-group-lg">
				  	<input type="text" name="userName" class="form-control" id="userName" placeholder="이름" 
				  	value="" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg"
				  	onkeyup="this.value=this.value.replace(/[a-z0-9]|[ \[\]{}()''<>?|`~!@#$%^&*-_+=,.;:]/g, '');"
				  	style="height: 80px; font-size:34px; width: 50%;" maxlength="5">
				</div>
				<br/><br/>
                <div class="input-group input-group-lg">
				  	<input type="text" name="phone" class="form-control" id="phone" placeholder="휴대폰번호" 
				  	value="" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" 
				  	onkeyup="this.value=this.value.replace(/[^0-9]/g, '');" maxlength="11"
				  	style="height: 80px; font-size:34px; width: 50%;">
				</div>
				<br/><br/>
                <div class="input-group input-group-lg" style="">
				  	<input type="text" class="form-control" id="authentic" placeholder="인증번호" value="" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg"
				  	style= "display: none; height: 80px; font-size:34px; width: 50%;">
				</div>
				<br/><br/>
                <div class="submit_input">
                    <input type="button" id="confirm" value="인증하기" style="background: linear-gradient( to top, #263238, #212121 ); color:#ffffff; margin-left:10%; width: 200px; height: 70px; font-size:24px;"/>
                </div>
                <br/><br/>
                <div class="input-group input-group-lg">
				  	<input type="text" name="userId" class="form-control" id="userId" placeholder="*아이디(영문,숫자만 가능) 필수" value="" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg"
				  	onkeyup="this.value=this.value.replace(/[^a-z0-9]/g, '');"
				  	style="height: 80px; font-size:34px; width: 50%;">
				</div>
				<div id="idCheckMessage" style="margin-left: 130px; margin-top: 20px; width: 400px; height: 20px; font-size: 25px; color:red; display: none;"></div>
				<br/><br/>
                <div class="input-group input-group-lg">
				  	<input type="password" name="userPwd" class="form-control" id="userPwd" placeholder="*비밀번호(6자리이상) 필수" value="" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg"
				  	onkeyup="this.value=this.value.replace(/ /gi, '');"
				  	style="height: 80px; font-size:34px; width: 50%;">
				</div>
				<br/><br/>
                <div class="input-group input-group-lg">
				  	<input type="password" class="form-control" id="userPwdConfirm" placeholder="*비밀번호확인(필수)" value="" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg"
				  	onkeyup="this.value=this.value.replace(/ /gi, '');"
				  	style="height: 80px; font-size:34px; width: 50%;">
				</div>
				<div id="pwdCheckMessage" style="margin-left: 130px; margin-top: 20px; width: 400px; height: 20px; font-size: 25px; color:red; display: none;"></div>
				<br/><br/>
				<label style="margin-left:10%;"><b style="color:#ffffff;">성별(필수)</b></label>
                <div class="input-group mb-3" style="margin-left:10%; width: 80%;">
					<select class="custom-select" name="gender" id="gender" style="height: 80px; font-size:30px;">
					    <option value="0" selected>자매</option>
					    <option value="1">형제</option>
					</select>
				</div>
				<br/><br/>
				<div class="input-group input-group-lg">
				  	<input type="text" name="address" class="form-control" id="address" placeholder="주소(선택사항)" 
				  	value="" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" onkeyup="this.value=this.value.replace(/^[a-zA-Z]+$/, '');"
				  	style="height: 80px; font-size:34px; width: 50%;">
				</div>
				<br/><br/>
                <div class="input-group input-group-lg">
				  	<input type="text" name="nickName" class="form-control" id="nickName" placeholder="*닉네임(최소3자 부터 최11자 까지) 필수" value="" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" maxlength="11"
				  	onkeyup="this.value=this.value.replace(/ /gi, '');" style="height: 80px; font-size:34px; width: 50%;">
				</div>
				<div id="nickNameCheckMessage" style="margin-left: 130px; margin-top: 20px; width: 400px; height: 20px; font-size: 25px; color:red; display: none;"></div>
				<br/><br/>
                <div class="input-group input-group-lg">
				  	<input type="text" name="email" class="form-control" id="email" placeholder="이메일(선택사항)" 
				  	value="" aria-label="Sizing example input" 
				  	aria-describedby="inputGroup-sizing-lg" onkeyup="this.value=this.value.replace(/ /gi, '');"
				  	style="height: 80px; font-size:34px; width: 50%;">
				</div>
				<br/><br/>
                <div class="input-group input-group-lg">
				  	<input type="text" name="birth" class="form-control" id="birth" placeholder="생년월일(예시 900101 선택사항)" value="" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" maxlength="6"
				  	onkeyup="this.value=this.value.replace(/[^0-9]/g, '');"
				  	style="height: 80px; font-size:34px; width: 50%;">
				</div>
				<br/><br/>
                <div class="succes_button">
                    <input type="button" id="successSignUp"  style="display: block;"/>
                </div>
                <div class="succes_button_after">
                    <input type="button" id="successSignUpAfter"  style="display: none;"/>
                </div>
                <div class="cancle_button">
                    <input type="button" id="cancel"/>
                </div>
            </div>
        </section>
    </form>
</body>
</html>