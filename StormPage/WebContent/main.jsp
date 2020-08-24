<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MainPage</title>
    
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
    /* 구글 웹폰트 사용 CDN*/
    @import url('https://fonts.googleapis.com/css?family=Nanum+Gothic|Nanum+Myeongjo&display=swap&subset=korean');
    
    /* 게시글 관련 css */
    
    .contents {padding-top: 260px; background: #f5f5f5;}
    .post_body { overflow: hidden; margin-top: 40px; width: 100%; height: auto; background: #ffffff;}
    .post_body .image {margin: 10px; float: left; width: 10%; height: 100px;}
    .post_body .image_pic {border-radius: 180px; width:100%; height:100%;}
    .post_body .title_group {float: left; width: 80%; height: 60px;}
    .post_body .post_user {width: 100%; height: 40px;}
    .post_body .user_name {font-size: 60px; padding: 10px 10px 10px 10px; font-family: 'Roboto', sans-serif;}
    .post_body .time {font-size: 17px; font-weight: bold; top:45px; left:5px; color: #424242;}
    .post_body .post_time {width: 100%; height: 20px; padding: 30px 10px 10px 10px; font-family: 'Nanum Gothic', sans-serif;}
    .post_body .post_menu {float: left; width: 7%; height: 60px; color: gray;}
    .post_body .post_menu .fa-caret-down {margin:15px; font-size: 70px;}
    .post_body .post_content {float: left; width: 100%; height: auto; font-size: 40px;}
    .post_body .post_content .content {margin: 10px; height : 100%; font-family: 'Noto Serif KR', serif;}
    .post_body .poto {float: left; width: 100%; height: auto;}
    .post_body .poto .post_img {width: 100%; height: 800px;}
    .post_body .sub_menu .sub_icon {margin: 10px 30px 10px 10px; float: left; width: 80px; height: 80px; color: #bdbdbd;}
    .sub_icon:hover{background: #e0e0e0;}

    
</style>
    <body>
    
    
      <div id="wrap" data-role="page">
      
      <!-- toolbar include -->
		<div data-role="header" style="z-index: 1;">
    		<jsp:include page="./view/toolbar/toolBar.jsp"/>
    	</div>
    	
            <div class="contents" data-role="content">
               <div class="post_body">
                    <div class="image">
                        <img class="image_pic" width="50px" src="./resources/stormLogo.png">
                    </div>
                    <div class="title_group">
                        <div class="post_user">
                            <span class="user_name">Storm</span>
                        </div>
                        <div class="post_time">
                            <span class="time">어제 오전 9:00</span>
                        </div>
                    </div>
                    <div class="post_menu">
                        <a href="#popupBasic" data-rel="popup" class="ui-btn ui-corner-all ui-shadow ui-btn-inline" data-transition="pop">
                            <i class="fas fa-ellipsis-v" style="margin: 10px; font-size: 40px;"></i>
                        </a>
                        <div data-role="popup" id="popupBasic">
                            <p style="font-size: 50px;"><i class="fas fa-times" style="font-size: 70px; color: red;"></i> 삭제하기</p>
                            <p style="font-size: 50px;"><i class="fas fa-check" style="font-size: 50px; color: #43a047;"></i> 수정하기</p>
                        </div>
                    </div>
                    <div class="post_content">
                        <div class="content">
                            군포교회 모두가 한마음으로 로마서 8장 31-39절을 암송했습니다. 매일의 묵상을 통해 말씀을 누리는 모두가 되기를 원합니다. 군포교회 모두가 한마음으로 로마서 8장 31-39절을 암송했습니다. 매일의 묵상을 통해 말씀을 누리는 모두가 되기를 원합니다.군포교회 모두가 한마음으로 로마서 8장 31-39절을 암송했습니다. 매일의 묵상을 통해 말씀을 누리는 모두가 되기를 원합니다.군포교회 모두가 한마음으로 로마서 8장 31-39절을 암송했습니다. 매일의 묵상을 통해 말씀을 누리는 모두가 되기를 원합니다.군포교회 모두가 한마음으로 로마서 8장 31-39절을 암송했습니다. 매일의 묵상을 통해 말씀을 누리는 모두가 되기를 원합니다.군포교회 모두가 한마음으로 로마서 8장 31-39절을 암송했습니다. 매일의 묵상을 통해 말씀을 누리는 모두가 되기를 원합니다.군포교회 모두가 한마음으로 로마서 8장 31-39절을 암송했습니다. 매일의 묵상을 통해 말씀을 누리는 모두가 되기를 원합니다.군포교회 모두가 한마음으로 로마서 8장 31-39절을 암송했습니다. 매일의 묵상을 통해 말씀을 누리는 모두가 되기를 원합니다.
                        </div>
                    </div>
                    <div class="poto">
                        <img class="post_img" src="./resources/stormLogo.png">
                    </div>
                    <div class="sub_menu">
                        <div class="sub_icon">
                           <img src="./resources/mainIconHeartBlack.png" style="width:100%; height: 100%;">
                        </div>
                        <div class="sub_icon">
                            <img src="./resources/mainIconPraiseBlack.png" style="width: 100%; height: 100%;">
                        </div>
                        <div class="sub_icon">
                           <img src="./resources/mainIconcomunityBlack.png" style="width: 100%; height: 100%;">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>