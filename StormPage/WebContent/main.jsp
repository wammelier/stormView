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
    
    /* The Modal (background) */
    .modal {
        display: none; /* Hidden by default */
        position: fixed; /* Stay in place */
        z-index: 1; /* Sit on top */
        left: 0;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        overflow: auto; /* Enable scroll if needed */
        background-color: rgb(0,0,0); /* Fallback color */
        background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    }

    /* Modal Content/Box */
    .modal-content {
        background-color: #fefefe;
        margin: 15% auto; /* 15% from the top and centered */
        padding: 20px;
        border: 1px solid #888;
        width: 50%; /* Could be more or less, depending on screen size */                          
    }
    /* The Close Button */
    .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }
    .close:hover,
    .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }    

    
</style>

<script type="text/javascript">
	
$(function(){
    $('#wrap').bind('click', function(){
        alert('body??');
    });
});

</script>

    <body>
    
    
      <div id="wrap" data-role="page">
      
      <!-- toolbar include -->
		<header style="z-index: 1;">
    		<jsp:include page="./view/toolbar/toolBar.jsp"/>
    	</header>
    	
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
                    	<!-- Trigger/Open The Modal -->
		                <button id="myBtn">Open Modal</button>
		
		                <!-- The Modal -->
		                <div id="myModal" class="modal">
		
		                  <!-- Modal content -->
		                  <div class="modal-content">
		                    <span class="close">&times;</span>                                                               
		                    <p>Some text in the Modal..</p>
		                  </div>

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