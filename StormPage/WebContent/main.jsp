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

<!-- 제이쿼리 js 이게 있어야 자바스크립트 $가 읽힘  -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 
<style>
    /* 구글 웹폰트 사용 CDN*/
    @import url('https://fonts.googleapis.com/css?family=Nanum+Gothic|Nanum+Myeongjo&display=swap&subset=korean');
    
    /*제일 상단 메뉴바*/
    header {height: 320px; box-shadow: 0px 2px 0px 0px #bdbdbd; position: absolute;}
    .header_top {top:0px; left: 0px; right: 0px; position: fixed; display: flex; justify-content: space-between; width: 100%; height: 160px; background: #ffffff;}
    header .main_logo {margin-left: 10px; margin-top: 10px; float: left; width: 30%; height: 75%;}
    header .logo_img {width: 100%; height: 100%;}
    header .fa-search {float: ; margin-top: 20px; margin-right: 10px; border-radius: 180px; width: 100px; height: 60%; background: #9c27b0; font-size: 60px; background: #f5f5f5; color: #616161; text-align: center; line-height: 90px;}
    header .fa-cog{float: ; margin-top: 20px; margin-right: 0px; border-radius: 180px; width: 80px; height: 60%; font-size: 40px; color: #616161; text-align: center; line-height: 75px;}
    header .admin_menu {padding-top: 5%; font-size: 30px; font-weight: bold;}
    
    /*두번째 상단 메뉴바*/
    .header_under {top: 160px; left: 0px; position: fixed; display: flex; height: 140px; width: 100%; z-index: auto; background: #ffffff;}
    .headersub_icon {float: left; margin: 0% 0% 0% 0%; width: 500px; height: 100%;}
    .pic {width: 100%; height: 100%;}
    
    /* 게시글 관련 css */
    .contents {padding-top: 290px; background: #f5f5f5;}
    
    /* 게시글 추가 탭 CSS  */
    .add_post_body {overflow: hidden; padding : 10px 0px 0px 20px; width: 100%; height: 120px;  background: #ffffff;}
    .add_post_img {float: left; padding-top: 10px;}
    .add_post_button {float: left; margin-left: 20px; padding-left: 20px; margin-top: 2px; border-radius: 60px; border: none; width: 80%; height: 90px; font-size: 30px; margin-top: 10px; background: #f5f5f5; color: #757575;}
    
    /* 게시글 CSS */
    .post_body { overflow: hidden; margin-top: 40px; padding:20px; width: 100%; height: auto; background: #ffffff;}
    .post_body .image {margin: 10px; float: left; width: 10%; height: 100px;}
    .post_body .image_pic {border-radius: 180px; width:100%; height:100%;}
    .post_body .title_group {float: left; width: 80%; height: 60px;}
    .post_body .post_user {width: 100%; height: 40px;}
    .post_body .user_name {font-size: 60px; padding: 10px 10px 10px 10px; font-family: 'Roboto', sans-serif;}
    .post_body .time {font-size: 17px; font-weight: bold; top:45px; left:5px; color: #424242;}
    .post_body .post_time {width: 100%; height: 20px; padding: 30px 10px 10px 10px; font-family: 'Nanum Gothic', sans-serif;}
    .post_body .post_menu {float: left; width: 7%; height: 60px; color: gray;}
    .post_body .post_menu .fa-caret-down {margin:15px; font-size: 70px;}
    .post_body .post_content {float: left; width: 97%; height: auto; font-size: 40px;}
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
        margin: 50% 15% 15% auto; /* 15% from the top and centered */
        padding: 20px;
        border: 1px solid #888;
        /* width: 100px; */ /* Could be more or less, depending on screen size */                          
    }
    /* The Close Button */
    .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }
   p:hover,
   p:focus {
   	color: black;
   	cursor: pointer;
   }
    /* .close:hover,
    .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }     */

    
</style>

<script type="text/javascript">

$(function(){
	
	//Get the modal
	var modal = document.getElementById('myModal');
	
	// Get the button that opens the modal
	var btn = document.getElementById("myBtn");
	
	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];                                          
	
	// When the user clicks on the button, open the modal 
	btn.onclick = function() {
	    modal.style.display = "block";
	}
	
	$('.add_post_button').bind('click', function(){
		location.href= '/view/post/addPost.jsp';
	})
	
	$('#notice_post').bind('click', function(){
		location.href= '/main.jsp';
	})
	
/* 	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
	    modal.style.display = "none";
	} */
	
	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	    if (event.target == modal) {
	        modal.style.display = "none";
	    }
	}
	
});

</script>

    <body>
    
      <div id="wrap">
      
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
                    <img id="notice_post" class="pic" src="/resources/mainIconNotifyPink.png">
                </div>
                
                <div class="headersub_icon">
                	<a href="/view/post/addPost.jsp">
                    	<img id="share_post" class="pic" src="/resources/mainIconShareBlack.png">
                    </a>
                </div>
                <div class="headersub_icon">
                	<a href="/view/post/addPost.jsp">
                    	<img id="imgage_post" class="pic" src="/resources/mainIconImgBlack.png">
                    </a>
                </div>
                <div class="headersub_icon">
                	<a href="/view/fence/getFenceReportList.jsp">
                    	<img id="fence_post" class="pic" src="/resources/mainIconFenceBlack.png">
                    </a>
                </div>
            </div>
        </header>
    	
            <div class="contents" data-role="content">
	            <div class="add_post_body">
	           		<div class="add_post_img">
	           			<img class="" style="width:90px; height:90px; border-radius: 100%;"  src="./resources/stormLogo.png">
	           		</div>
	           		<div class="add_post_button">
	           			<p>이승환님, 공동체에 나누고 싶은말이 있으신가요?</p>
	           		</div>
	            </div>
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
		                <!-- <button id="myBtn">Open Modal</button> -->
		                <i id="myBtn" class="fas fa-ellipsis-v" style="margin-top:30px; font-size:45px;"></i>
		
		                <!-- The Modal -->
		                <div id="myModal" class="modal">
		
		                  <!-- Modal content -->
		                  <div class="modal-content" style="width:70%;">
		                    <!-- <span class="close">&times;</span>  -->                                                              
		                    <p style="font-size: 40px; text-align: center;">게시글수정</p>
		                    <p style="font-size: 40px; text-align: center;">게시글삭제</p>
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
            <a style="display:scroll;position:fixed;bottom:10px;right:10px;" href="#" title=”맨 위로">
				<i class="fas fa-angle-double-up" style="font-size: 50px;"></i>
			</a> 

        </div>
    </body>
</html>