<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>login</title>
</head>
	
	<!-- 제이쿼리 js 이게 있어야 자바스크립트 $가 읽힘  -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

    <!--JqueryMobile CDN-->
    <link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
    <!-- <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script> -->
    <script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
	
	<!-- bootStrap CDN -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
	
<script type="text/javascript">
	$(function(){
		var userId = $('#user_id');
		var pwd = $('#user_pwd');
		$(".login_button").on("click", function() {
            loginAjax(userId, pwd);
        });
	});
	function loginAjax(userId, userPwd) {
		console.log('loginAjax??');
		$.ajax({
			url: "/user/json/login",
			method: "post",
			dataType: "json",
			headers: {
				"Accept": "application/json",
				"Content-Type": "application/json"
			},
			data: JSON.stringify({
				userId: userId.val(),
				userPwd: userPwd.val()
			}),
			success : function(JSONData){
				console.log(JSONData);
				if(JSONData.result == 'ok') {
					setTimeout(function(){
						$(self.location).attr("href","/user/mainPage");
					}, 700);
					
				}else if (JSONData.result == 'NoSearchId'){
					$('.errorTextBox').text("해당하는 아이디가 존재하지 않습니다.").css('color','red').css('font-size', '30px')
					
				}else if (JSONData.result == 'NoSearchPwd'){
					$('.errorTextBox').text("잘못된 비밀번호 입니다.").css('color','red').css('font-size', '30px')
				}//end of else
					
			}// end of seccess
		});//end of ajax
			
	}// end of function()
</script>

<style>
    #wrap {background: url("/resources/loginimg.png"); overflow: none;}
    .login_div {width: 100%; height: 1500px; padding:0px 0px 0px 10%;}
    .img_background {width: 100%; padding-top: 700px; background-size: 900px; }
    #logo {margin-bottom: 30px; width: 90%;}
    #logo .logo_img {width: 100%;}
    .login_box {margin: 0px 0px 0px 0px;  width: 90%;}
    
    input {width: 100%; height: 100px; padding: 30px; font-size: 40px;}
    input::placeholder {font-size: 30px;}
    .login_button_div {margin: 10% 10% 0px; width: 80%;}
    .login_button { height: 100px; background: url("/resources/loginicon.png"); background-size: 100% 100%; background-repeat: no-repeat;}
    .user_info {margin: 10% 0px 0px 15%; float: left; width: 90%; height: 100px; font-size: 25px; color: #ffffff}
    .user_info .signup_text {float: left; margin-left: 10%; width: 30%;}
    .user_info .search_text {float: left;}
    
    
</style>
<body>
    <div id="wrap" data-role= "page">
        <div class="login_div" data-role="content">
           <form class="img_background">
                <div id="logo">
                    <img class="logo_img" src="/resources/stormLogotext.png">
                </div>
                <div class="login_box">
                    <div class="login_input">
                        <input type="text" id="user_id" name="id" placeholder="아이디(이메일형식)"/>
                    </div>
                    <div class="login_input">
                        <input type="password" id="user_pwd" name="password" placeholder="비밀번호(6~12자리)"/>
                    </div>
                    <div class="errorTextBox" style="width:100%; height:60px;"></div>
                    <div class="login_button_div">
                        <button class="login_button" type="button"></button>
                    </div>
                    <div class="user_info">
                        <div class="signup_text">회원가입</div>
                        <div class="search_text">아이디/비밀번호 찾기</div>
                    </div>
              </div>
            </form>
        </div>
    </div>
</body>
</html>