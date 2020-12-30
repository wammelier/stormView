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

<!-- 제이쿼리 js 이게 있어야 자바스크립트 $읽힘  -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

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
	
	//로딩화면을 출력하는 기능..
	function loading() {
		//화면의 높이와 너비를 구합니다.
	    var maskHeight = $(document).height();
	    var maskWidth  = window.document.body.clientWidth;
	     
	    //화면에 출력할 마스크를 설정해줍니다.
	    var mask       = "<div id='mask' style='position:absolute; z-index:9000; background-color:#000000; display:none; left:0; top:0;'></div>";
	    var loadingImg = '';
	      
	    loadingImg += "<div id='loadingImg'>";
	    loadingImg += "<img src='/resources/heartImgPink.gif' style='position:relative; display: block; margin: -2100px auto;'/>";
	    loadingImg += "</div>"; 
	  
	    //화면에 레이어 추가
	    $('body')
	        .append(mask)
	        .append(loadingImg)
	        
	    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채웁니다.
	    $('#mask').css({
	            'width' : maskWidth
	            , 'height': maskHeight
	            , 'opacity' : '0.3'
	    });
	  
	    //마스크 표시
	    $('#mask').fadeOut();  
	  
	    //로딩중 이미지 표시
	    $('#loadingImg').fadeOut();
	};// end of loding()
	
	/* qr코드 생성 */
	$(function() {
		
		var userId = $(".userId").val();
		var userName = $(".userName").val();
		var googleqr = "http://chart.apis.google.com/chart?cht=qr&chs=400&choe=UTF-8&chld=H30";
		
		var qrchl = googleqr+"&chl="+encodeURIComponent("회원의 아이디 : "+userId)+encodeURIComponent("회원의 이름 : "+userName);
		var imgtag = document.getElementById("qrImg");
		
		imgtag.setAttribute("src", qrchl);
		
		/* imgtag.setAttribute("id", "qrcodeimg");
		imgtag.setAttribute("src", qrchl);
		imgtag.setAttribute("style", "display:none;");
		document.getElementById("qr_result").removeChild(document.getElementById("qrcodeimg"));
		document.getElementById("qr_result").appendChild(imgtag); */
		
	});
	
	/* qr코드 모달띠우기 */
	$(function() {
		//Get the modal
		var modal = document.getElementById('myModal');
		
		// Get the button that opens the modal
		var btn = document.getElementById("qr");
		
		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];     
		
		// When the user clicks on the button, open the modal 
		btn.onclick = function() {
		    modal.style.display = "block";
		}
		
		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
		    if (event.target == modal) {
		        modal.style.display = "none";
		    }
		}
	})

	$(function() {
		//관리자 톱니바퀴 아이콘 클릭시..
		$('.fa-cog').on('click', function() {
			loading();
			self.location = "/user/getUserList";
		});//end of click
	});//end of function
</script>
 
<style>
    /* 구글 웹폰트 사용 CDN*/
    @import url('https://fonts.googleapis.com/css?family=Nanum+Gothic|Nanum+Myeongjo&display=swap&subset=korean');
    
/*제일 상단 메뉴바*/
    header {height: 320px; box-shadow: 0px 2px 0px 0px #bdbdbd; position: absolute;}
    .header_top {top:0px; left: 0px; right: 0px; position: fixed; display: flex; justify-content: space-between; width: 100%; height: 160px; background: #ffffff;}
    header .main_logo {margin-left: 10px; margin-top: 10px; float: left; width: 30%; height: 75%;}
    header .logo_img {width: 100%; height: 100%;}
    .qrcodeImg {float:left; margin-right: 30px; margin-top: 57px; width: 60px; height: 60px;}
    .searchIcon {float:left; margin-top: 20px;}
    .cogIcon {float:left; margin-top:30px; margin-right:30px;}
    header .fa-search {float: ; margin-top: 20px; margin-right: 10px; border-radius: 180px; width: 100px; height: 60%; background: #9c27b0; font-size: 60px; background: #f5f5f5; color: #616161; text-align: center; line-height: 90px;}
    header .fa-cog{float: ; margin-top: 20px; margin-right: 0px; border-radius: 180px; width: 80px; height: 60%; font-size: 40px; color: #616161; text-align: center; line-height: 75px;}
    header .admin_menu {padding-top: 5%; font-size: 30px; font-weight: bold;}
    
    /*두번째 상단 메뉴바*/
    .header_under {top: 160px; left: 0px; position: fixed; display: flex; height: 140px; width: 100%; z-index: auto; background: #ffffff;}
    .headersub_icon {float: left; margin: 0% 0% 0% 0%; width: 500px; height: 100%;}
    .pic {width: 100%; height: 100%;}
    
    .headersub_icon:hover{background: #e0e0e0;}
    
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
        /* background-color: rgb(0,0,0); /* Fallback color */ 
        /* background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    }

    /* Modal Content/Box */
    .modal-content {
        background-color: #fefefe;
        margin: 30% 30% 15% auto; /* 15% from the top and centered */
        padding: 0px;
        border: 1px solid #888;
        /* width: 100px; */ /* Could be more or less, depending on screen size */                          
    }
</style>
    <body>
        <header class="header" data-role="header">
           <div class="header_top">
                <div id="main_log" class="main_logo">
	                <a href="/user/mainPage">
	                	<img class="logo_img" src="/resources/stormLogo.png">
	                </a>
                </div>
                <div>
	                <div class="qrcodeImg" id="qr">
	                	<img src="/resources/qrcodeImg.png" style="width: 100%; height: 100%;'">
	                </div>
	                <div class="searchIcon">
		                <i class="fas fa-search"></i>
		            </div>
		            <div class="cogIcon">
		                <c:if test="${user.userRole == '1' }">
		                	<i class="fas fa-cog"></i>
		                </c:if>
		            </div>
                </div>
            </div>
            <div class="header_under">
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
                <c:if test="${user.userPosition == '1' }">
	                <div class="headersub_icon">
	                	<a href="/view/fence/getFenceReportList.jsp">
	                    	<img id="fence_post" class="pic" src="/resources/mainIconFenceBlack.png">
	                    </a>
	                </div>
                </c:if>
                <div class="headersub_icon">
                	<a href="/user/getUser">
                    	<img id="main_logo_img" src="/resources/strompic2.jpeg" style="margin-top: 10%; margin-left: 30%; border-radius: 50%; width: 40%; height: 70%;">
                    </a>
                </div>
                <!-- The Modal -->
	              <div id="myModal" class="modal">
		              <!-- Modal content -->
		              <div class="modal-content" style="width:40%;">
		                  <!-- <span class="close">&times;</span>  -->                                                              
		                 <img id="qrImg" style="margin-left:3%;" src="">
		                 <input class="userId" type="hidden" value="${ user.userId }"/>
		                 <input class="userName" type="hidden" value="${ user.userName }"/>
	                	</div>
            		</div>
            </div>
        </header> 
    </body>
</html>