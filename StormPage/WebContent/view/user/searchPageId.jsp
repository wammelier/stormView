<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

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

<!-- FontAwesome ������-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
 <!-- googlefont -->
 
 <script type="text/javascript">
	/* 조회하기 버튼 클릭.. */
	$(function() {
		$('#confirm_button').on('click', function() {
			confirmUser();
		});/* end of click */
	});/* end of function */
	
	/* 취소버튼 클릭.. */
	$(function() {
		$('#cancel_button').on('click', function() {
			self.location = "/user/mainPage";
		});/* end of click */
	});/* end of function */
 	
 	/* 조회하기 기능 실행.. */
 	function confirmUser() {
 		/* 조회시 필요한 회원의 이름 핸드폰을 필드화.. */
 		var userName = $('#userName').val();
 		var phone = $('#phone').val();
 		/* 아이디조회 ajax 실행 */
 		$.ajax ({ 
			url: "/user/json/userConfirm", 
			method: "POST",
			dataType: "json",
			headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
			data: JSON.stringify ({ 
				userName : userName,
				phone : phone
			}), 
			success: function(JSONData, status) { 
				if ( JSONData.message == "confirmOk" ) { 
					swal("", "인증번호를 발송했습니다!", "success");
					$('#authenticNo').css('display', 'block');
					$('#confirm_button').css('display', 'none');
					$('#confirm_button_after').css('display','block')
					sendSms(JSONData.user.userId);
				}else if ( JSONData.message == "phoneConfirmfail" ){
					swal("", "핸드폰번호가 맞지 않습니다.", "error");
				}else {
					swal("", "인증번호 발송 에러", "error");
				}/* end of else */
			},
			error: function(request, status, error) {
				console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
			}/* end of error */
		});/* end of ajax */
 	}/* end of confirmUser() */
 	
 	/* 인증번호 발송 ajax */
	function sendSms(userId) { 
		/* 핸드폰번호 필드화.. */
		var phone = $('#phone').val();
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
					phoneCheck(JSONData.checkNo, userId);
				}else {
					console.log('������ȣ �߼� ����!');
				};/* end of else */
			},
			error: function(request, status, error) {
				console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
			}/* end of error */
		});/* end of ajax */
	}/* end of function */
 	
 	/* 인정번호를 확인하는 기능 실행. */
	/* rand == 인증번호..  */
	function phoneCheck(rand, userId) {
		/* 조회하기 버튼 클릭 .. */
		$('#confirm_button_after').on('click', function() {
			/* 인증번호 필드화.. */
			var authenticNo = $('#authenticNo').val();
			/* 서버에서 발송한 인증번호와 회원이 작성한 인증번호를 비교하여 같으면 조회가능 */
			if ( rand == authenticNo ) {
				swal("", "회원의 아이디 : "+userId, "success")
				.then((willDelete) => {
					if (willDelete) {
						self.location = "/user/mainPage";
					}/* end of if */
				});/* end of then */
			}else {
				swal("", "조회불가!", "error");
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
    
    /* ����Ʈ�˷� css ������... */
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
            <div class="title_name">아이디 조회</div>
            <input class="form-control" id="userName" type="text" placeholder="회원이름"/>
            <input class="form-control" id="phone" type="text" placeholder="핸드폰번호"/>
            <input class="form-control" id="authenticNo" type="text" style="display: none;" placeholder="인증번호(6자리)"/>
            <input class="find_button" id="confirm_button" type="button" style="display: block;" value="확인"/>
            <input class="find_button" id="confirm_button_after" type="button" style="display: none;" value="확인"/>
            <input class="find_button" id="cancel_button" type="button" value="취소"/>
       </div>

   </section>
    
</body>
</html>