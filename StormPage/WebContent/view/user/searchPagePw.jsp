<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>searchPagePw</title>

    <!--JqueryMobile CDN-->
    <link rel="stylesheet" href="./jqueryMobile/jquery.mobile-1.4.5/jquery.mobile-1.4.5.css">
	<script src="./jqueryMobile/jquery.mobile-1.4.5/jquery.mobile-1.4.5.js"></script>
	
	<!--Jquery CDN-->
	<script src="./jquery/jquery-1.11.0.js"></script>
</head>

<!-- FontAwesome 아이콘-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
 <!-- googlefont -->
<style>
    @font-face {
    font-family: 'NIXGONB-Vb';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/NIXGONB-Vb.woff') format('woff');
    font-weight: normal;
    font-style: normal;
    }   
</style>

<style>
    #wrap {background:; height: 1600px;}
    .header {height: 300px;}
    .search_box {height: 800px; background: #ffffff;}
    .title_name {border-bottom: 1px solid; margin-left: 10%; padding: 5% 0px 0px; width: 80%; height: 100px; font-size: 50px; text-align: center;}
    .name_phone {padding-left: 30px; margin: 5% 0% 0% 10%; width: 77%; height: 90px; font-size: 30px;}
    .find_button {margin: 10% 0px 0% 10%; width: 30%; height: 90px; font-size: 40px;}
</style>

<body>
   
    <section id="wrap" data-role="page">
        <header class= "header" data-role= "header"></header>
            <div class= "search_box" data-role= "page">
                <div class="title_name">비밀번호 찾기</div>
                <input class="name_phone" type="text" placeholder="이름"/>
                <input class="name_phone" type="text" placeholder="아이디"/>
                <input class="name_phone" type="text" placeholder="휴대폰번호"/>
                <input class="name_phone" type="text" placeholder="인증번호"/>
                <input class="find_button" type="button" value="확인"/>
                <input class="find_button" type="button" value="취소"/>
            </div>
    </section>
    
</body>
</html>