<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MainPage</title>
    
    <!--JqueryMobile CDN-->
    <link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
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

<script type="text/javascript">

$(function(){
	$('#main_log').bind("click", function(){
		alert("mainPage로 이동합니다..");
		$.mobile.changePage("/main.jsp", {transition: "flip", changeHash: false });

	});
});
</script>
 
<style>
    /* 구글 웹폰트 사용 CDN*/
    @import url('https://fonts.googleapis.com/css?family=Nanum+Gothic|Nanum+Myeongjo&display=swap&subset=korean');
    
    /*제일 상단 메뉴바*/
    header {height: 260px; box-shadow: 0px 1px 0px 0px #bdbdbd; position: absolute;}
    .header_top {top:0px; left: 0px; right: 0px; position: fixed; display: flex; justify-content: space-between; width: 100%; height: 130px; background: #ffffff;}
    header .main_logo {margin-left: 10px; margin-top: 20px; float: left; width: 20%; height: 70%;}
    header .logo_img {width: 100%; height: 100%;}
    header .fa-search {float: right; margin-top: 20px; margin-right: 10px; border-radius: 180px; width: 80px; height: 60%; background: #9c27b0; font-size: 40px; background: #f5f5f5; color: #616161; text-align: center; line-height: 75px;}
    header .admin_menu {padding-top: 5%; font-size: 30px; font-weight: bold;}
    
    /*두번째 상단 메뉴바*/
    .header_under {top: 130px; left: 0px; position: fixed; display: flex; height: 130px; width: 100%; background: #ffffff;}
    .headersub_icon {float: left; margin: 0% 0% 0% 0%; width: 30%; height: 100%;}
    .pic {width: 100%; height: 100%;}
    
</style>
    <body>
        <header class="header" data-role="header">
           <div class="header_top">
                <div id="main_log" class="main_logo">
                	<img class="logo_img" src="/resources/stormLogo.png">
                </div>
                <div class="admin_menu">청년리스트 조회</div>
                <i class="fas fa-search"></i>
            </div>

            <div class="header_under">
                <div class="headersub_icon">
                	<a href="/view/user/getUser.jsp">
                    <img id="main_logo_img" src="/resources/strompic2.jpeg" style="margin-top: 10%; margin-left: 30%; border-radius: 50%; width: 40%; height: 70%;">
                    </a>
                </div>
                <div class="headersub_icon">
                    <img id="notice_post" class="pic" src="/resources/mainIconNotifyBlack.png">
                </div>
                <div class="headersub_icon">
                    <img id="share_post" class="pic" src="/resources/mainIconShareBlack.png">
                </div>
                <div class="headersub_icon">
                    <img id="imgage_post" class="pic" src="/resources/mainIconImgBlack.png">
                </div>
                <div class="headersub_icon">
                    <img id="fence_post" class="pic" src="/resources/mainIconFenceBlack.png">
                </div>
            </div>
        </header> 
    </body>
</html>