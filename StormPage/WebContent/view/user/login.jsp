<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>login</title>
</head>

    <!--JqueryMobile CDN-->
    <link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
	
	<!-- bootStrap CDN -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
	
	
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
                        <input type="id" name="id" placeholder="아이디(이메일형식)"/>
                    </div>
                    <div class="login_input">
                        <input type="password" name="password" placeholder="비밀번호(6~12자리)"/>
                    </div>
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