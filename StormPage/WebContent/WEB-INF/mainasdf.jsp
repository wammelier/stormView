<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>main</title>
    <link rel="stylesheet" href="./jqueryMobile/jquery.mobile-1.4.5/jquery.mobile-1.4.5.css">
	<script src="./jquery/jquery-1.11.0.js"></script>
	<script src="./jqueryMobile/jquery.mobile-1.4.5/jquery.mobile-1.4.5.js"></script>

</head>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<style>
    * {margin 0; padding 0;}
    body {border-color: #e3f2fd;}
    #wrap {width: 1200px; margin:0 auto; background: #eeeeee;}
    
    
    /*제일 상단바*/
    #header {margin-bottom: 3px; width: 100%; height: 60px; box-shadow: 0px 2px 6px #bdbdbd;  background: #ffffff;}
    #header .logo {float: left; margin-left: 20px; width: 100px; height: 60px;}
    #header .logo .logo_img {float: left; width: 100%; height: 90%;}
    #header .search_icon {float: left; text-align: center; border-radius: 180px; margin-top: 10px; margin-left: 20px; width: 40px; height: 40px; font-size: 20px; background: #f5f5f5; color: #616161;}
    #header .fa-search {line-height: 40px;}
    
    /*두번째 상단바 (모바일에서만 보이기 때문에 큰 화면에선 하이드시킴*/
    #header_sub {padding-top: 10px; width: 100%; height: 50px; background: #ffffff; display: none;}
    #header_sub .headersub_icon_pic {float: left; width: 60px; height: 50px;}
    #header_sub .headersub_icon {float: left; margin-left: 10%; margin-right: 4%; font-size: 30px;}

    
    /*왼쪽 메뉴바*/
    #div_left {float: left; width: 25%; height: 730px; background: #f5f5f5;}
    #div_left .menu {width: 100%; height: 70px; border-radius: 10px;}
    .menu:hover{background: #e0e0e0;}
    #div_left .menu .menu_pic {margin-top: 16px; margin-left: 27px; float: left; width: 40px; height: 40px;}
    #div_left .menu .picture {border-radius: 180px; width: 100%; height: 100%;}
    #div_left .menu .user_name{margin-left: 30px; line-height: 70px; float: left; font-size: 20px;}
    #div_left .menu .menu_icon{margin-left: 30px; line-height: 70px; float: left; font-size: 30px;}
    #div_left .menu .menu_content{margin-left: 30px; line-height: 70px; float: left; font-size: 20px;}
    #div_left .blank {width: 100%; height: 250px; border-radius: 10px;}
    #div_left .footer {width: 100%; height: 100px; padding-top: 28px; padding-left: 10px; text-align: left; font-size: 14px; color: grey;}
  
    /*게시글 목록들*/
    #div_middle {float: left;overflow: scroll; width: 50%; height: 730px; background: #f5f5f5;}
    #post_body {overflow: hidden; box-shadow: 1px 1px #bdbdbd; padding: 10px; margin: 10px; border-radius: 10px; width: 93%; height: auto; background: #ffffff;}
    #post_body .image {float: left; width: 10%; height: 60px;}
    #post_body .image_pic {border-radius: 180px; width:100%; height:100%;}
    #post_body .title_group {float: left; width: 80%; height: 60px;}
    #post_body .post_user {width: 100%; height: 40px;}
    #post_body .user_name {position: relative; font-size: 17px; top: 10px; left: 5px;}
    #post_body .time {position: relative; font-size: 12px; font-weight: bold;  left:5px;}
    #post_body .post_time {width: 100%; height: 20px;}
    #post_body .post_menu {float: left; width: 10%; height: 60px; color: gray;}
    #post_body .post_menu .fa-caret-down {margin:15px; font-size: 30px; color: }
    #post_body .post_content {float: left; width: 100%; height: auto;}
    #post_body .post_content .content {margin: 10px; height : 100%;}
    #post_body .poto {float: left; width: 100%; height: auto;}
    #post_body .poto .post_img {width: 100%; height: 360px;}
    #post_body .sub_menu .sub_icon {margin-left: 10px; margin-right: 10px; margin-top: 10px; float: left; font-size: 30px; color: #bdbdbd;}
    .sub_icon:hover{background: #e0e0e0;}
    
    /*오른쪽 메뉴바*/
    #div_right {float: left; width: 25%; height: 730px; background: #f5f5f5;}
    #div_right .menu_text {margin: 15px; float: left; width: 100px; height: 20px; font-weight: bold; font-size: 20px; color: #616161;}
    #div_right .friend_bar {float: left; padding-top: 10px; margin: 10px; width: 90%; height: 50px; border-radius: 10px;}
    .friend_bar:hover{background: #e0e0e0; border-radius: 10px;}
    #div_right .friend_bar .friend_div {float: left; width: 40px; height: 40px;}
    #div_right .friend_bar .friend_img {border-radius: 180px; width: 100%; height: 100%;}
    #div_right .friend_bar .friend_name {float: left; margin-top: 13px; margin-left: 10px; width: 60px;}
    
    
    /*미디어쿼리*/
     /* 화면 너비 0 ~ 1200px */
    @media (max-width: 1240px){
        #wrap {width: 100%;}
        #div_left {display: none;}
        #div_middle {width: 100%; height: 730px;}
        #div_right {display: none;}
        #header {margin-bottom: 0px; width: 100%; box-shadow: 0px 0px 0px; background: #ffff;}
        #header .search_icon {line-height: 40px; margin-left: 60%; }
        #header .fa-church {float: left; margin-left: %; line-height: 55px; font-size: 25px; display: block;}
        #header_sub {margin-bottom: 1px; padding-top: 10px; width: 100%; height: 50px; box-shadow: 0px 3px 0px #bdbdbd; background: #ffffff; display: block;}
        #header_sub .headersub_icon {float: left; margin-left: 10%; margin-right: 2%; width: 35px; height: 35px; font-size: 30px;}
        #header_sub .pic {border-radius: 180px; width: 100%; height: 100%;}
    }    
    
    /* 화면 너비 0 ~ 768px */
    @media (max-width: 768px){
        #wrap {width: 100%;}
        #div_left {display: none;}
        #div_middle {width: 100%; height: 730px;}
        #div_right {display: none;}
        #header {margin-bottom: 0px; width: 100%; box-shadow: 0px 0px 0px; background: #ffff;}
        #header .search_icon {line-height: 40px; margin-left: 60%; }
        #header .fa-church {float: left; margin-left: %; line-height: 55px; font-size: 25px; display: block;}
        #header_sub {margin-bottom: 1px; padding-top: 10px; width: 100%; height: 50px; box-shadow: 0px 3px 0px #bdbdbd; background: #ffffff; display: block;}
        #header_sub .headersub_icon {float: left; margin-left: 10%; margin-right: 2%; width: 35px; height: 35px; font-size: 30px;}
        #header_sub .pic {border-radius: 180px; width: 100%; height: 100%;}
    }
    
    /* 화면 너비 0 ~ 480px */
    @media (max-width: 480px){
        #wrap {width: 100%;}
        #div_left {display: none;}
        #div_middle {width: 100%; height: 730px;}
        #div_right {display: none;}
    }
    
</style>
<body>
	<section id="page1" data-role="page">
        <header data-role="header"><h1>jQuery Mobile</h1></header>                   
        <div class="content" data-role="content">
            <p>1 page</p>
            <p><a href="#page2">go page2</a></p> 
            <p><a href="externalPage.html" data-ajax="false">go external page</a></p> 
        </div>
        <footer data-role="footer"><h1>footer</h1></footer>
    </section>
    
    
   <div id="wrap">
        <header id="header">
            <div class="logo">
                <img class="logo_img" src="/resources/stormLogo.jpeg">
            </div>
            <div class="search_icon">
                <i class="fas fa-search"></i>
            </div>
        </header>
        
        <header id="header_sub">
            <div class="headersub_icon">
                <img class="pic" src="/resources/strompic2.jpeg">
            </div>
            <div class="headersub_icon">
                <i class="fas fa-church"></i>
            </div>
            <div class="headersub_icon">
                <i class="far fa-paper-plane"></i>
            </div>
            <div class="headersub_icon">
                <i class="far fa-image"></i>
            </div>
            <div class="headersub_icon">
                <i class="far fa-clipboard"></i>
            </div>
        </header>
        
        <section id="div_left">
            <div class="menu">
                <div class="menu_pic">
                    <img class="picture" src="/resources/strompic2.jpeg">
                </div>
                <div class="user_name">이승환</div>
            </div>
            <div class="menu">
                <div class="menu_icon" style="color: #2e7d32;">
                    <i class="fas fa-church"></i>
                </div>
                <div class="menu_content">광고</div>
            </div>
            <div class="menu">
                <div class="menu_icon" style= "color: #ffc400;">
                    <i class="far fa-paper-plane"></i>
                </div>
                <div class="menu_content">&nbsp;&nbsp;나눔</div>
            </div>
            <div class="menu">
                <div class="menu_icon" style="color: #F5A9BC">
                    <i class="far fa-image"></i>
                </div>
                <div class="menu_content">&nbsp;&nbsp;사진</div>
            </div>
            <div class="menu">
                <div class="menu_icon" style="color: #bdbdbd;">
                    <i class="far fa-clipboard"></i>
                </div>
                <div class="menu_content">&nbsp;&nbsp;&nbsp;울타리보고서</div>
            </div>
            <div class="blank"></div>
            <footer class="footer">15859 경기도 군포시 당산로 13 (당동 774-8) TEL : (031)452-1044, 457-6421, 455-0144(야간) FAX : (031)455-1051
Copyright ⓒ 2020 www.stormch.org all right reserved. Designed by Storm청년부.</footer>
        </section>
        
        <section id="div_middle">
           <div id="post_body">
                <div class="image">
                    <img class="image_pic" width="50px" src="/resources/stormLogo.jpeg">
                </div>
                <div class="title_group">
                    <div class="post_user">
                        <span class="user_name">이승환</span>
                    </div>
                    <div class="post_time">
                        <span class="time">어제 오전 9:00</span>
                    </div>
                </div>
                <div class="post_menu">
                    <i class="fas fa-caret-down"></i>
                </div>
                <div class="post_content">
                    <div class="content">
                        군포교회 모두가 한마음으로 로마서 8장 31-39절을 암송했습니다. 매일의 묵상을 통해 말씀을 누리는 모두가 되기를 원합니다. 군포교회 모두가 한마음으로 로마서 8장 31-39절을 암송했습니다. 매일의 묵상을 통해 말씀을 누리는 모두가 되기를 원합니다.군포교회 모두가 한마음으로 로마서 8장 31-39절을 암송했습니다. 매일의 묵상을 통해 말씀을 누리는 모두가 되기를 원합니다.군포교회 모두가 한마음으로 로마서 8장 31-39절을 암송했습니다. 매일의 묵상을 통해 말씀을 누리는 모두가 되기를 원합니다.군포교회 모두가 한마음으로 로마서 8장 31-39절을 암송했습니다. 매일의 묵상을 통해 말씀을 누리는 모두가 되기를 원합니다.군포교회 모두가 한마음으로 로마서 8장 31-39절을 암송했습니다. 매일의 묵상을 통해 말씀을 누리는 모두가 되기를 원합니다.군포교회 모두가 한마음으로 로마서 8장 31-39절을 암송했습니다. 매일의 묵상을 통해 말씀을 누리는 모두가 되기를 원합니다.군포교회 모두가 한마음으로 로마서 8장 31-39절을 암송했습니다. 매일의 묵상을 통해 말씀을 누리는 모두가 되기를 원합니다.
                    </div>
                </div>
                <div class="poto">
                    <img class="post_img" src="/resources/stormLogo.jpeg">
                </div>
                <div class="sub_menu">
                    <div class="sub_icon">
                        <i class="far fa-heart"></i>
                    </div>
                    <div class="sub_icon">
                        <i class="fas fa-praying-hands"></i>
                    </div>
                    <div class="sub_icon">
                        <i class="far fa-comment-alt"></i>
                    </div>
                </div>
            </div>
        </section>
        
        <section id="div_right">
            <div class="menu_text">친구목록</div>
            <div class="friend_bar">
               <div class="friend_div">
                    <img class="friend_img" src="/resources/stormLogo.jpeg">
                </div>
                <div class="friend_name">이승환</div>
            </div>
        </section>
    </div>
</body>
</html>
