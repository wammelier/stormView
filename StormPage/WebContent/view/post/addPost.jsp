<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MainPage</title>
    
    <!--JqueryMobile CDN-->
    <link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <!-- <script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script> -->
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
    
    /* 게시글 관련 css */
    
    .contents {padding-top: 260px; height: inherit; background: #f5f5f5;}
    
    .addpost_header {float: left; width: 100%; height: 50px; color: #ffffff; padding-top:20px; font-size:30px; background: #F5A9BC;}
    .post_content {float: left; width: 100%; height: auto; background: #ffffff;}
    .img_content {float: left; height: 700px; width: 100%; background: #ffffff;}
    .img_list_div {float: left; height: 400px; width: 100%; overflow-x: scroll;}
    .upload_button {float: left; margin-left: 20%; width: 80%; font-size: 50px; height: auto;}
    .ui-icon-action {box-shadow: 0px;}

    
</style>
    <body>
    

      <div id="wrap" data-role="page">
        
        <!-- toolbar include -->
        <div data-role="header" style="z-index: 1;">
            <jsp:include page="../toolbar/toolBar.jsp"/>
        </div>

        <div class="contents" data-role="content">
       
          <form>
            <div class="addpost_header">
                <div class="header_menu_name" style="float: left; margin-left: 20px;">새 게시물</div>
            </div>
                   

            <div class="post_content">
                <textarea name="textarea-1" id="textarea-1" style="width: 100%; font-size: 30px; border: 2px solid #F5A9BC;"></textarea>
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
                	<button type="submit" style="border-radius: 45px; float: left; width: 120px; height: 70px; margin-top: 30px; margin-left: 40%; background: url(/resources/add_post_icon_ok.png); background-repeat: no-repeat; background-size: contain; 0px;"></button>
                	<button type="submit" style="border-radius: 45px; float: left; width: 120px; height: 70px; margin-top: 30px; margin-left: 35px; background: url(/resources/add_post_icon_cancle.png); background-repeat: no-repeat; background-size: contain; 0px;"></button>
                
              </div>

            </form>
        </div>
        
        </div>
    </body>
</html>