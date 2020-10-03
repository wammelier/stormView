<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>searchPage</title>
       
	 <!-- bootStrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <!-- bootStrap js -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    
	<!--Jquery CDN-->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	
	<!-- sweetalert2 CDN -->	
	<!-- Include a required theme -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>

<!-- FontAwesome 아이콘-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
 <!-- googlefont -->
 
 <script type="text/javascript">
 	/* 확인버튼을 누를경우.. */
 	$(function() {
 		$('#confirm_button').on('click', function() {
 			confirmUser();
 		});/* end of click */
 	});/* end of function */
 	
 	/* 취소버튼을 누를경우.. */
 	$(function() {
 		$('#cancel_button').on('click', function() {
 			self.location = "/user/mainPage";
 		});/* end of click */
 	});/* end of function */
 	
 	/* 유저의 정보를 확인하는 기능.. */
 	function confirmUser() {
 		/* 유저가 작성한 아이디 휴대폰 필드화.. */
 		var userName = $('#userName').val();
 		var userId = $('#useId').val();
 		var phone = $('#phone').val();
 		
 		$.ajax ({ 
			url: "/user/json/userConfirmPwd", 
			method: "POST",
			dataType: "json",
			headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
			data: JSON.stringify ({ 
				userName : userName,
				userId : userId,
				phone : phone
			}), 
			success: function(JSONData, status) { 
				if ( JSONData.message == "confirmOk" ) { 
					swal("", "인증번호가 발송 되었습니다.", "success");
					$('#authenticNo').css('display', 'block');
					$('#confirm_button').css('display', 'none');
					$('#confirm_button_after').css('display','block')
					sendSms(JSONData.user.userPwd);
				}else if ( JSONData.message == "idConfirmfail" ){
					swal("", "회원의 아이디가 없습니다.", "error");
				}else if ( JSONData.message == "confirmFail" ){
					swal("", "회원의 정보가 없습니다.", "error");
				}else if ( JSONData.message == "phoneConfirmfail" ){
					swal("", "번호가 일치하지 않습니다.", "error");
				}/* end of else */
			},
			error: function(request, status, error) {
				console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
			}/* end of error */
		});/* end of ajax */
 	}/* end of confirmUser() */
 	
 	/* 인증번호를 발송할때 사용되는 ajax */
	function sendSms(userPwd) { 
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
					phoneCheck(JSONData.checkNo, userPwd);
				}else {
					console.log('인증번호 발송 실패!');
				};/* end of else */
			},
			error: function(request, status, error) {
				console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
			}/* end of error */
		});/* end of ajax */
	}/* end of function */
 	
 	/* 회원이적은 인증번호와 서버에서 발송된 인증번호가 같은지 확인하는 기능. */
	/* rand == 인증번호..  */
	function phoneCheck(rand, userPwd) {
		/* 확인버튼을 클릭할경우.. */
		$('#confirm_button_after').on('click', function() {
			/* 가입자가 기입한 인증번호.. */
			var authenticNo = $('#authenticNo').val();
			/* 유저가 작성한 번호와 핸드폰으로 전송된 인증번호를 비교함. */
			if ( rand == authenticNo ) {
				swal("", "회원의 패스워드 : "+userPwd, "success")
				.then((willDelete) => {
					if (willDelete) {
						self.location = "/user/mainPage";
					}/* end of if */
				});/* end of then */
			}else {
				swal("", "다시 확인해주세요!", "error");
			}/* end of else */
		})/* end of click event */
	};/* end of phoneCheck() */
	
 </script>
<style>
    @font-face {
    font-family: 'NIXGONB-Vb';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/NIXGONB-Vb.woff') format('woff');
    font-weight: normal;
    font-style: normal;
    }    
</style>

<style>
    #wrap { height: 1100px;}
    .header {height: 200px;}
    .search_box {height: 800px;}
    .title_name {border-bottom: 1px solid; margin-left: 10%; padding: 0% 0px 0px; width: 80%; height: 100px; font-size: 60px; text-align: center;}
    .form-control {padding-left: 30px; margin: 10% 0% 0% 10%; width: 77%; font-size: 50px;}
    .find_button {float:left; margin: 10% 0px 0% 10%; width: 30%; height: 90px; font-size: 40px;}
    
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
   
   <section id="wrap" data-role="page">
       <header class= "header" data-role= "header"></header>
       <div class= "search_box" data-role= "page">
            <div class="title_name">비밀번호 찾기</div>
            <input class="form-control" id="userName" type="text" placeholder="이름"/>
            <input class="form-control" id="useId" type="text" placeholder="아이디"/>
            <input class="form-control" id="phone" type="text" placeholder="휴대폰번호"/>
            <input class="form-control" id="authenticNo" type="text" style="display: none;" placeholder="인증번호"/>
            <input class="find_button" id="confirm_button" type="button" style="display: block;" value="확인"/>
            <input class="find_button" id="confirm_button_after" type="button" style="display: none;" value="확인"/>
            <input class="find_button" id="cancel_button" type="button" value="취소"/>
       </div>

   </section>
    
</body>
</html>