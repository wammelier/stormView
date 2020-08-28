<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="UTF-8"%>

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

<script type="text/javascript">
	
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
    
    /* 게시글 관련 css */
    .contents {padding-top: 280px; height: inherit; background: #f5f5f5;}
    
    .addpost_header {float: left; width: 99%; height: 50px; color: #ffffff; padding-top:20px; font-size:30px; background: #F5A9BC;}
    .post_content {float: left; width: 99%; height: auto; background: #ffffff;}
    .img_content {float: left; height: 700px; width: 100%; background: #ffffff;}
    .img_list_div {float: left; height: 400px; width: 100%; overflow-x: scroll;}
    .upload_button {float: left; margin-left: 20%; width: 80%; font-size: 50px; height: auto;}
    .ui-icon-action {box-shadow: 0px;}

    
</style>

    <body>
    

      <div id="wrap" data-role="page">
        
        <!-- toolbar include -->
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
       
          <form>
            <div class="addpost_header">
                <div class="header_menu_name" style="float: left; margin-left: 20px;">새 게시물</div>
            </div>
                   

            <div class="post_content">
                <textarea name="textarea-1" id="textarea-1" style="width: 99%; font-size: 30px; border: 2px solid #F5A9BC;"></textarea>
            </div>
            
            <div class="addpost_header" style="margin-top: 40px; float: left;">
                <div class="header_menu_name" style="float: left; margin-left:20px;">라이브러리</div>
            </div>
            <div class="img_content">
               <div class="img_list_div">
                    <div class="img_list" style="float: left; margin: 40px; width: 300px; height: 300px; border: 3px solid #F5A9BC;">
                    	<img alt="" src="/resources/loginimg2.jpeg" style="width: 100%; height: 100%;">
                    </div>
               	</div>    
                <br/>
                <div class="upload_button">
                    <button class="upload_img" type="button" style="color: #ffffff; width: 80%; font-size: 25px; height: 60px; background: linear-gradient( to top, #f48fb1, #F5A9BC);">사진올리기</button>
                </div>
                	<button type="submit" style="border-radius: 45px; float: left; width: 120px; height: 70px; margin-top: 30px; margin-left: 30%; background: url(/resources/add_post_icon_ok.png); background-repeat: no-repeat; background-size: contain; 0px;"></button>
                	<button type="submit" style="border-radius: 45px; float: left; width: 120px; height: 70px; margin-top: 30px; margin-left: 35px; background: url(/resources/add_post_icon_cancle.png); background-repeat: no-repeat; background-size: contain; 0px;"></button>
                
              </div>

            </form>
        </div>
        
        </div>
    </body>
</html>