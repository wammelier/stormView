<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>signUp</title>

    <!--JqueryMobile CDN-->
    <link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
</head>

<style>
    #wrap{background: url("/resources/signUpImg.jpeg");}
    
    /* 제일 상단에 로고 css */
    #wrap {padding-top: 20%;}
    .main_logo {margin-left: 10%; margin-top: 5%; width: 80%; height: 120px;}
    .logo_img {width: 100%; height: 100%;}
    
    /* 아이디, 비번 입력란 */
    #id_block {margin: 10% 0% 0%; width: 96%; height: 85px;}
    .input_tap {margin: 0% 10% 6%; width: 80%;}
    
    .menu_name {margin: 0% 10% 0%; width: 70px; height: 80px; font-size: 40px;}
    input {padding-left: 30px; margin-left: 10px; font-size: 40px;}
    input::placeholder {font-size: 35px;}
    .gender_input {float: left; margin-left: 10%; width: 70px; height: 70px;}
    .submit_input {float: left; margin-left: 10%; margin-right: 0%; width: 20%; height: 100px; }
    #in {width: 240px; height: 80px; background: url(/resources/signUpIconIn.png); background-repeat: no-repeat;}
    #cancel {width: 240px; height: 80px; background: url(/resources/signUpIconCancel.png); background-repeat: no-repeat;}
    
</style>

<body>

   <form action="signUp.jsp">
        <section id="wrap" data-role="page">
            <div class="contents" data-role="content">
                 <div class="main_logo">
                    <img class="logo_img" src="/resources/stormLogotext.png">
                </div>
                <div class="input_tap">
                    <input type="id" id="id_block" placeholder="아이디"/>
                </div>
                <div class="input_tap">
                    <input type="password" id="pw_block" placeholder="비밀번호"/>
                </div>
                <div class="input_tap">
                    <input type="password" id="pw_confirm_block" placeholder="비밀번호 확인"/>
                </div>
                <div class="input_tap">
                    <input type="text" id="nickname_block" placeholder="닉네임"/>
                </div>
                <div class="input_tap">
                    <input type="text" id="email_block" placeholder="이메일"/>
                </div>
                <div class="submit_input">
                    <button id="in"></button>
                </div>
                <div class="submit_input">
                    <button id="cancel"></button>
                </div>
            </div>
        </section>
    </form>
</body>
</html>