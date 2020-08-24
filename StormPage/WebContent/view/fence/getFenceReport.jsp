<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="en">
<head>
   
    <meta charset="UTF-8">
    <title>getFenceReport</title>
    
    <!--JqueryMobile CDN-->
    <link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    
    <!-- bootStrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <!-- bootStrap js -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    
    <!-- FontAwesome 아이콘-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    
</head>
<style>
    .content {margin-top: 20px; height: auto;}
    .top_header{overflow: hidden; height: 80px; box-shadow: 0px 7px 0px #f5f5f5;}
    .button_group {float: left; width: 40%; height: 100%;}
    .fence_name {float: left; font-size: 40px;}
    
    /* 메뉴 css  */
    .menu_name{overflow: hidden; padding-top: 10px; height: 70px;}
    .name {float: left; width: 15%; padding-left: 2%; height: 60px; font-size: 35px;}
    .praise {float: left; width: 85%; height: 60px; font-size: 35px;}
    
    /* 내용 css */
    .report_content {width: 100%; padding-top: 5px; height: auto; text-shadow: 0px 0px 0px black;}
    .reader_name {float: left;  padding-left: 2%; padding-top: 10px; width: 15%; height: 100%; font-size: 30px;}
    .praise_content {padding: 3px; float: left; padding-top: 10px; width: 80%; font-size: 30px;}
    .button_div {float: left; width: 5%; padding-left: 1%; padding-top: 5%;}
    
</style>
<body>
    
    <div data-role="page">
       
	    <div data-role="header" style="z-index: 1;">
	    		<jsp:include page="../toolbar/toolBar.jsp"/>
	    </div>
        
        <div class="content" data-role="content">
          
            <div class="top_header">
                <div class="button_group">
                   <i class="fas fa-plus-circle" style=" color: #536dfe; margin-left: 20px; font-size: 60px;"></i>
                </div>
                <div class="fence_name">이승환울타리</div>
            </div>
            
            <div class="menu_name">
                <div class="name">이름</div>
                <div class="praise">기도제목</div>
            </div>
            
            <div class="report_content" style="display: ">
                <div class="reader_name">이승환</div>
                <div class="praise_content">기도제목 테스트 중입니다.기도제목 테스트 중입니다.기도제목 테스트 중입니다.기도제목 테스트 중입니다.기도제목 테스트 중입니다.기도제목 테스트 중입니다.기도제목 테스트 중입니다.</div>
                <div class="button_div">
                    <a href="#popupBasic" data-rel="popup" class="ui-btn ui-corner-all ui-shadow ui-btn-inline" data-transition="pop">
                        <i class="fas fa-ellipsis-v"></i>
                    </a>
                    <div data-role="popup" id="popupBasic">
                        <p style="font-size: 50px;"><i class="fas fa-times" style="font-size: 70px; color: red;"></i> 삭제하기</p>
                        <p style="font-size: 50px;"><i class="fas fa-check" style="font-size: 50px; color: #43a047;"></i> 수정하기</p>
                    </div>
                </div>
            </div>
            
            
            <!-- 수정버튼을 누를경우 이 페이지를 띄우기 display block  -->
            <div class="report_content" style="display: block;">
                
                <div class="reader_name">
                    <input type="text" value="">
                </div>
                <div class="praise_content">
                    <form>
                        <textarea name="textarea-1" id="textarea-1" style="width: 100%;"></textarea>
                    </form>
                </div>
                <div class="button_div">
                	<i class="fas fa-check" style="font-size: 50px; color: #43a047;"></i>
                </div>
            </div>

        </div>
    </div>
    
</body>
</html>