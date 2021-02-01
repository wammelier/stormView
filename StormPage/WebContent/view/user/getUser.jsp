
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>getUser</title>
    
     <!-- bootStrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" .="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <!-- bootStrap js -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    
    <!-- sweetalert2 CDN -->	
	<!-- Include a required theme -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
    <!-- FontAwesome ??????-->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	
	<!-- 제이쿼리 js 이게 있어야 자바스크립트 $가 읽힘  -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    
</head>

<script type="text/javascript">


	$(function() {
		$('.logout_button').on('click', function(e) {
			/* 크롬에서는 이전에 있던 하이퍼링크를 가지고 있는 성질이 있기때문에 설정이 필요함.. */
			e.preventDefault();
			logout();
		});/* end of click */
	});/* end of click */
	
	/* 로그아웃 버튼  */
	function logout() {
		swal({
		  title: "로그아웃 하시겠습니까?",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})/* end of swal */
		.then((willDelete) => {
			if (willDelete) {
				$(self.location).attr('href','/user/logout');
			}else {
			    swal("", "취소되었습니다!", "error");
			}/* end of else */
		});/* end of then */
	};/* end of logout */
	
	/* 닉네임을 체크하는 ajax */
	$(function() {
		/* 닉네임 중복체크 문구가 똫같은 형태로 계속뜨면 혼동이 올수 있기때문에 누를때마다 카운트를 올리기 위한 필드생성 */
		var count = 0;
		/* 닉네임변경 버튼 클릭 */
		$('#nickNameChange').on('click', function() {
			/* 닉네임중복 확인과 변경에 필요한 데이터 필드화.. */
			var nickName = $('#nickName').val();
			var userId = $('#userId').val();
			$.ajax ({ 
				url: "/user/json/nickNameCheck", 
				method: "POST",
				dataType: "json",
				headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
				data: JSON.stringify ({ 
					nickName : nickName
				}), 
				success: function(JSONData, status) { 
					if ( JSONData.message == "checkOk" ) {
						/* nickname을 update하기위한 ajax실행 */
						updateNickName(userId, nickName);
					}else {
						count += 1;
						/* 닉네임 중복체크 문구 띄우기 */
						$('.nickNameAlert').css('display', 'block');
						$('.nickNameAlert').text('이미 사용중인 닉네임 입니다...('+count+')');
					};/* end of else */
				},
				error: function(request, status, error) {
					swal("", "에러! 관리자에게 문의하세요.", "error");
					console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
				}/* end of error */
			});/* end of ajax */
		});/* end of click */
	});/* end of function */
	
	/* nickName?? update??? function */
	function updateNickName(userId, nickName) {
		$.ajax ({ 
			url: "/user/json/updateNickName", 
			method: "POST",
			dataType: "json",
			headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
			data: JSON.stringify ({ 
				nickName : nickName,
				userId : userId
			}), 
			success: function(JSONData, status) { 
				if ( JSONData.message == "updateOk" ) { 
					swal("", "닉네임을 수정했습니다!", "success");
					/* 중복체크 문구를 계속 띄우면 사용자가 성공인지 실패인지 혼란스러울수 있기 때문에 가리기 */
					$('.nickNameAlert').css('display', 'none');
					/* 바뀐 닉네임을 사용자에게 보여주기 위해 비동기방식으로 바뀐닉네임을 띄운다. */
					$('#nickName').val(nickName);
				}else {
					swal("", "닉네임이 바뀌지 않았습니다..", "error");
				};/* end of else */
			},
			error: function(request, status, error) {
				swal("", "에러! 관리자에게 문의하세요.", "error");
				console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
			}/* end of error */
		});/* end of ajax */
	}
	
	
	/* 수정버튼과 취소버튼을 실행시키기 위한 돔 실행*/
	$(function() {
		/* 수정버튼 클릭시 해당태그의 name태그로 도메인에 바인딩함.. */
		$('.submitButton').on('click', function() {
			$("form").attr("action", "/user/updateUser").attr("method" , "POST").submit();
		});/* end of event */
		
		/* 취소버튼을 클릭릭시 이전으로 돌아감.. */
		$('.cancleButton').on('click', function(e) {
			history.back();
			/* 크롬에서 하이퍼링크에 대한 동작이 남아있기 때문에 그런 브라우저의 기본행동을 저지하는 방법임. */
			e.preventDefault();
		});/* end of click */
	});/* end of function */
	
	/****************************** 휴대폰번호 변경 Start..  *******************************/
	
	$(function() {
		/* 원래의 폰번호를 저장하는 필드 */
		var originalPhone = $('#phone').val();
		/* 휴대폰번호 변경 버튼을 클릭. */
		$('#phoneChange').on('click', function() {
			/* 휴대폰번호 입력란에 readonly를 해제 */
			document.getElementById('phone').readOnly = false;
			/* 핸드폰 입력란의 입력되어있는 번호를 지운다. */
			$('#phone').val('');
			/* 인증번호 전송버튼을 화면에 보이게 한다. */
			$('#requestPhone').css('display', 'block');
			/* 취소버튼 활성화.. */
			$('#cancelPhone').css('display', 'block');
			/* 휴대폰번호 변경 버튼 비활성화 */
			$('#phoneChange').css('display', 'none');
		});/* end of click */
			
		/* 인증번호전송 버튼 클릭시 .. */
		$('#requestPhone').on('click', function() {
			/* 인증번호를 보낼 핸드폰번호 필드화.. */
			var phone = $('#phone').val();
			/* 휴대폰번호가 10자리 미만일경우. */
			if( phone.length > 9 ) {
				/* 인정번호 입력란 활성화.. */
				$('#authenticNo').css('display', 'block');
				/* 인증번호 받기 버튼 비활성화 */
				$('#requestPhone').css('display', 'none');
				/* 확인버튼 활성화 */
				$('#successPhone').css('display', 'block');
				/* 취소버튼 활성화 */
				$('#cancelPhone').css('display', 'block');
				/* 인증번호 발송 */
				sendSms(phone);
			}else {
				swal('', '인증번호 발송 실패.', 'error')
			}/* end of else */
		});/* end of click */
	
	
		/* 취소버튼을 클릭하는 경우.. */
		$('#cancelPhone').on('click', function() {
			/* 휴대폰번호 입력란 비활성화 */
			document.getElementById('phone').readOnly = true;
			/* 원래적혀있던 핸드폰번호 다시입력.. */
			$('#phone').val(originalPhone);
			/* 인증번호받기 버튼 비활성화 */
			$('#requestPhone').css('display', 'none');
			/* 인증번호입력란 비활성화 */
			$('#authenticNo').css('display', 'none');
			/* 확인버튼 비활성화 */
			$('#successPhone').css('display', 'none');
			/* 취소버튼 비활성화 */
			$('#cancelPhone').css('display', 'none');
			/* 휴대폰번호 변경버튼 활성화 */
			$('#phoneChange').css('display', 'block');
		});/* end of click */
	});/* end of function() */
		
	/* 인증번호를 보내는 ajax */
	function sendSms(phone) { 
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
					swal("", "인증번호를 보냈습니다!", "success");
					phoneCheck(JSONData.checkNo, phone);
				}else {
					swal("", "인증번호 발송에 실패하였습니다.", "error");
				};/* end of else */
			},
			error: function(request, status, error) {
				console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
			}/* end of error */
		});/* end of ajax */
	}/* end of function */
	
	/* 사용자가 적은 인증번호가 맞는지 체크하는 기능.. */
	/* rand == 인증번호  */
	function phoneCheck(rand, phone) {
		/* 확인버튼 클릭시 ??? */
		$('#successPhone').on('click', function() {
			/* 사용자가 적은 인증번호를 필드화... */
			var authenticNo = $('#authenticNo').val();
			/* 서버로부터 보낸 인증번호와 사용자가 적은 인증번호가 일치할 경우 . */
			if ( rand == authenticNo ) {
				swal("", "인증번호가 일치합니다.", "success");
				/* 휴대폰번호 입력란을 비활성화 */
				document.getElementById('phone').readOnly = true;
				/* 휴대폰번호 변경 버튼 활성화 */
				$('#phoneChange').css('display', 'block');
				/* 인증번호 입력란 비활성화 */
				$('#authenticNo').css('display', 'none');
				/* 확인버튼 비활성화 */
				$('#successPhone').css('display', 'none');
				/* 바뀐 핸드폰번호를 화면에 띄우기 위해 사용.. */
				$('#phone').val(phone);
				/* 휴대폰번호를 db에 업데이트하기 위해 실행.. */
				updatePhone(phone)
			}else {
				swal("", "????????? ??????.", "error");
				/* $('#phone').val(originalPhone); */
			}/* end of else */
		});/* end of click event */
	};/* end of phoneCheck() */
	
	/* 휴대폰번호를 update하는 ajax */
	function updatePhone(phone) {
		/* 업데이트 하기위해 유저의 이름이 필요함 */
		var userName = $('#userName').val();
		/* updatePhone ajax 실행  */
		$.ajax ({ 
			url: "/user/json/updatePhone", 
			method: "POST",
			dataType: "json",
			headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
			data: JSON.stringify ({
				phone : phone,
				userName : userName
			}), 
			success: function(JSONData, status) { 
				if ( JSONData.message == "updateOk" ) { 
					swal("", "번호를 수정했습니다!", "success");
				}else {
					swal("", "번호를 수정하지 못했습니다.", "error");
				};/* end of else */
			},
			error: function(request, status, error) {
				swal("", "에러! 관리자에게 문의하세요!", "error");
				/* console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); */
			}/* end of error */
		});/* end of ajax */
	}/* end of updatePhone */
	
	/****************************** 휴대폰번호 변경 End..  *******************************/
	
	
	/****************************** 비밀번호 변경 Start..  *******************************/
	/* 비밀번호 변경기능. */
	$(function() {
		/* 비밀번호 변경 버튼 클릭.. */
		$('#pwdChange').on('click', function() {
			/* 비밀번호 입력창 활성화.. */
			$('#pwd').css('display', 'block');
			$('#pwdConfirm').css('display', 'block');
			/* 비밀번호 변경버튼 비활성화 */
			$('#pwdChange').css('display', 'none');
			/* 확인버튼 활성화 */
			$('#successPwd').css('display', 'block');
			/* 취소버튼 활성화 */
			$('#cancelPwd').css('display', 'block');
		});/* end of click */
		
		/* 확인버튼 클릭.. */
		$('#successPwd').on('click', function() {
			/* 회원이 작성한 비밀번호를 필드화 */
			var userPwd = $('#pwd').val();
			var pwdConfirm = $('#pwdConfirm').val();
			/* 비밀번호가 5자리 이상일경우만 ajax실행.. */
			if( userPwd.length > 5) {
				if( userPwd == pwdConfirm) {
					/* 비밀번호 변경 실행 */
					updatePwd();
					/* 각종버튼 활성화 비활성화 */
					$('#pwd').css('display', 'none');
					$('#pwdConfirm').css('display', 'none');
					$('#pwdChange').css('display', 'block');
					$('#successPwd').css('display', 'none');
				}else {
					swal('', '비밀번호가 변경되지 않습니다.', 'error');
				}/* end fo else */
			}else {
				swal('', '비밀번호는 5자리 입니다.', 'error');
			}/* end of else */
		});/* end of click */
		
		/* 취소버튼 클릭 */
		$('#cancelPwd').on('click', function() {
			$('#pwd').css('display', 'none');
			$('#pwdConfirm').css('display', 'none');
			$('#pwdChange').css('display', 'block');
			$('#successPwd').css('display', 'none');
			$('#cancelPwd').css('display', 'none');
		})
	});/* end of function() */
	
	/* 비밀번호 수정 실행 . */
	function updatePwd() {
		/* 회원아이디 비밀번호 필드화 .. */
		var userId = $('#userId').val();
		var userPwd = $('#pwd').val();
		/* 비밀번호 ajax실행.. */
		$.ajax ({
			url: "/user/json/updatePwd", 
			method: "POST",
			dataType: "json",
			headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
			data: JSON.stringify ({ 
				userId : userId,
				userPwd : userPwd
			}), 
			success: function(JSONData, status) { 
				if(JSONData.message == "updateOk") {
					swal("", "변경되었습니다!", "success");
				}else {
					swal("", "error!", "error");
				}/* end of else */
			},/* end of success */
			error: function(request, error, status) {
				swal("", "에러! 관리자에게 문의하세요.", "error");
				console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
			}/* end of error */
		});/* end of ajax */
	}/* end of updatePwd */
	
	/****************************** ??占쏙옙?? ???? ?占쏙옙? End..  *******************************/
	
	/****************************** FileUpload Start...  *******************************/
	$(function() {
		if( ${ ! empty result } ) {
			console.log('업로드 완료');
		}else {
			console.log('업로드가 안되었습니다.');
		}/* end of else */
	});/* end of function() */
	
</script>
<style>
    .content {padding: 50px 50px 50px; height:1700px; margin-top: 290px;} 
    #input {height: 80px; font-size:40px;}
    b {font-size: 40px;}
    .imgMenu {padding: 50px 50px 50px; height:100px; margin-top: 290px;}
    
     /* ???????? css ??????... */
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
 	<header style="z-index: 5;">
    	<jsp:include page="../toolbar/toolBar.jsp"/>
    </header>
	    	<form class="imgMenu" action="fileUpLoad" method="POST" enctype="multipart/form-data">
		    	<label><b>프로필이미지</b></label>
		        <div class="input-group input-group-lg">
		        	<input type="file" name="upLoadFile" placeholder="파일선택" /><br/>
   					<input type="submit" value="업로드">
				  	<!-- <img style="width: 200px; height: 200px; border-radius: 80%;" src="/resources/stormLogo.png"> -->
				</div>
				<input type="button" class="ui-btn ui-corner-all" id="imgChange" value="이미지변경" style="height: 80px; width: 300px; font-weight: bold; font-size: 40px; background:#F5A9BC; border: thin; border-radius: 6px;"/>
		        <br/><br/>
	        </form>
	        <form class="content">
	        <label><b>회원이름</b></label>
	        <div class="input-group input-group-lg">
			  	<input type="text" name="userName" class="form-control" id="userName" value="${ user.userName }" aria-label="Sizing example input" style="height: 80px; font-size:40px;" aria-describedby="inputGroup-sizing-lg" readonly>
			</div>
	        <br/>
	        <label><b>핸드폰번호</b></label>
	        <div class="input-group input-group-lg">
			  	<input type="text" name="phone" class="form-control" id="phone" value="${ user.phone }" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" style="height: 80px; font-size:40px;" onkeyup="this.value=this.value.replace(/[^0-9]/g, '');" maxlength="11" readonly>
			</div>
			<br/>
			<div>
				<input type="text" id="authenticNo" class="form-control" maxlength="6" placeholder="인증번호(6자리)" onkeyup="this.value=this.value.replace(/[^0-9]/g, '');" style="display: none; height: 80px; font-size:40px;"/>
			</div>
	        <br/>
	        <input type="button" class="ui-btn ui-corner-all" id="phoneChange" value="휴대폰번호 변경" style="float:left; height: 80px; width: 300px; font-weight: bold; font-size: 40px; background:#F5A9BC; border: thin; border-radius: 6px; display: block;"/>
	        <input type="button" class="ui-btn ui-corner-all" id="requestPhone" value="인증번호받기" style="float:left; height: 80px; width: 300px; font-weight: bold; font-size: 40px; background:#F5A9BC; border: thin; border-radius: 6px; display: none;"/>
	        <input type="button" class="ui-btn ui-corner-all" id="successPhone" value="확인" style="float:left; height: 80px; width: 300px; font-weight: bold; font-size: 40px; background:#F5A9BC; border: thin; border-radius: 6px; display: none;"/>
	        <input type="button" class="ui-btn ui-corner-all" id="cancelPhone" value="취소" style="float:left; margin-left: 20px; height: 80px; width: 300px; font-weight: bold; font-size: 40px; background:#F5A9BC; border: thin; border-radius: 6px; display: none;"/>
	        <br/><br/><br/><br/><br/><br/><br/><br/>
	        <label><b>회원아이디</b></label>
	        <div class="input-group input-group-lg">
			  	<input type="text" name="userId" class="form-control" id="userId" value="${ user.userId }" style="height: 80px; font-size:40px;" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" readonly>
			</div>
	        <br/>
	        <label><b>닉네임(변경가능)</b></label>
	        <div class="input-group input-group-lg">
			  	<input type="text" name="nickName" class="form-control" id="nickName" value="${ user.nickName }" style="height: 80px; width:50%; font-size:40px;" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
			</div>
			<div class="nickNameAlert" style="font-size:25px; color: red; width: 350px; height: 30px; display: none;"></div>
			<br/>
			<input type="button" class="ui-btn ui-corner-all" id="nickNameChange" value="닉네임변경"style="float:left; height: 80px; margin-bottom:10px; width: 300px; font-weight: bold; font-size: 40px; background:#F5A9BC; border: thin; border-radius: 6px; display: block;">
			<br/>
			<div class="input-group input-group-lg">
			  	<input type="text" id="pwd" class="form-control" value="" placeholder="비밀번호" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" style="display: none; height: 80px; font-size:40px;">
			</div>
			<br/>
			<div class="input-group input-group-lg">
			  	<input type="text" id="pwdConfirm" class="form-control" value="" placeholder="비밀번호 확인" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" style="display: none; height: 80px; font-size:40px;">
			</div>
			<br/>
	        <input type="button" class="ui-btn ui-corner-all" id="pwdChange" value="비밀번호 변경"style="float:left; height: 80px; width: 300px; font-weight: bold; font-size: 40px; background:#F5A9BC; border: thin; border-radius: 6px; display: block;">
	        <input type="button" class="ui-btn ui-corner-all" id="successPwd" value="확인" style="float:left; height: 80px; width: 300px; font-weight: bold; font-size: 40px; background:#F5A9BC; border: thin; border-radius: 6px; display: none;">
	        <input type="button" class="ui-btn ui-corner-all" id="cancelPwd" value="취소" style="float:left; margin-left:20px; height: 80px; width: 300px; font-weight: bold; font-size: 40px; background:#F5A9BC; border: thin; border-radius: 6px; display: none;">
	        <br/><br/><br/><br/><br/><br/><br/><br/>
			<label><b>이메일(변경가능)</b></label>
	        <div class="input-group input-group-lg">
			  	<input type="text" name="email" class="form-control" id="input" value="${ user.email }" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
			</div>
	        <br/>
	        <label><b>주소(변경가능)</b></label>
	        <div class="input-grou占쏙옙占쏙옙占쏙옙p input-group-lg">
			  	<input type="text" name="address" class="form-control" id="input" value="${ user.address }" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
			</div>
	        <br/>
	        <label><b>성별</b></label>
	        <div class="input-group input-group-lg">
	        	<c:if test="${ user.gender == '0' }">
			  		<input type="text" name="gender" class="form-control" id="input" value="자매" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" readonly>
				</c:if>
				<c:if test="${ user.gender == '1' }">
			  		<input type="text" name="gender" class="form-control" id="input" value="형제" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" readonly>
				</c:if>
			</div> 
	        <br/>
	        <label><b>생일(형식: 990223)</b></label>
	        <div class="input-group input-group-lg">
			  	<input type="text" name="birth" class="form-control" id="input" value="${ user.birth }" 
			  	aria-label="Sizing example input" maxlength="6" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
			  	aria-describedby="inputGroup-sizing-lg">
			</div>
			<br/>
			<button class="logout_button" style="float: left; width: 100%; height: 80px; font-size: 40px; margin: 5% 0% 0%; border: thin; background: linear-gradient( to top, #d50000, #e53935 ); color: #ffffff;">로그아웃</button>
			<br/>
	        <button class="submitButton" style="float: left; width: 30%; height: 90px; font-size: 40px; margin: 5% 0% 0%; border: thin; background: linear-gradient( to top, #212121, #424242 ); color: #ffffff;">수정</button>
	        <button class="cancleButton" style="float: left; width: 30%; height: 90px; font-size: 40px; margin: 5% 5% 5%; border: thin; background: linear-gradient( to top, #212121, #424242 ); color: #ffffff;">취소</button>
	    </form>
</body>

</html>