<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MainPage</title>
    
   
    
</head>

<!-- bootStrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<!-- bootStrap js -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

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
		
		});
		
		$('#main_logo_img').bind("click", function(){
		});
		
	});
	
</script>
 
<style>
    /* 구글 웹폰트 사용 CDN*/
    @import url('https://fonts.googleapis.com/css?family=Nanum+Gothic|Nanum+Myeongjo&display=swap&subset=korean');
    
    /*제일 상단 메뉴바*/
    header {height: 260px; box-shadow: 0px 2px 0px 0px #bdbdbd; position: absolute;}
    .header_top {top:0px; left: 0px; right: 0px; position: fixed; display: flex; justify-content: space-between; width: 100%; height: 130px; background: #ffffff;}
    header .main_logo {margin-left: 10px; margin-top: 10px; float: left; width: 30%; height: 75%;}
    header .logo_img {width: 100%; height: 100%;}
    header .fa-search {float: ; margin-top: 20px; margin-right: 10px; border-radius: 180px; width: 80px; height: 60%; background: #9c27b0; font-size: 40px; background: #f5f5f5; color: #616161; text-align: center; line-height: 75px;}
    header .fa-cog{float: ; margin-top: 20px; margin-right: 0px; border-radius: 180px; width: 80px; height: 60%; font-size: 40px; color: #616161; text-align: center; line-height: 75px;}
    header .admin_menu {padding-top: 5%; font-size: 30px; font-weight: bold;}
    
    /*두번째 상단 메뉴바*/
    .header_under {top: 130px; left: 0px; position: fixed; display: flex; height: 130px; width: 100%; z-index: auto; background: #ffffff;}
    .headersub_icon {float: left; margin: 0% 0% 0% 0%; width: 30%; height: 100%;}
    .pic {width: 100%; height: 100%;}
    
</style>
    <body>
        <header class="header" data-role="header">
           <div class="header_top">
                <div id="main_log" class="main_logo">
	                <a href="/main.jsp">
	                	<img class="logo_img" src="/resources/stormLogo.png">
	                </a>
                </div>
                <div>
	                <i class="fas fa-search"></i>
	                <a href="/view/admin/getUserList.jsp"><i class="fas fa-cog"></i></a>
                </div>
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