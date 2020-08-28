<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>getFenceReportList</title>

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
    
    /* 테이블 관련 CSS  */
    th {font-size: 25px;}
    td {font-size: 25px;}
    /* .form-control {font-size: 13px; height: 25px;}
    .select_room {margin: 20px; width: 200px; height: 40px;} */
    table {margin-top: 260px;}
    
    
</style>

<body>

    <section data-role="page">
    
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
                    	<img id="fence_post" class="pic" src="/resources/mainIconFencePink.png">
                    </a>
                </div>
            </div>
        </header> 
    	
        <div class="content" data-role="content">
          <div class="select_room">
           <select class="form-control" name="searchCondition">
                    <c:if test="${empty search.searchCondition }">
                    <option class="from-option" value="0" selected="selected" >1월</option>
                    <option class="from-option" value="1" >2월</option>
                    <option class="from-option" value="2" >3월</option>
                    <option class="from-option" value="3" >4월</option>
                    </c:if>
<!--
                    <c:if test="${!empty search.searchCondition }">
                    <option class="from-option" value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>아이디</option>
                    <option class="from-option" value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>닉네임</option>
                    <option class="from-option" value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>이름</option>
                    </c:if>
-->
                </select>
            </div>
            <table class="table table-striped">
              <thead>
                <tr>
                  <th scope="col">번호</th>
                  <th scope="col">이름</th>
                  <th scope="col">1주차</th>
                  <th scope="col">2주차</th>
                  <th scope="col">3주차</th>
                  <th scope="col">4주차</th>
                  <th scope="col">5주차</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <th scope="row">1</th>
                  <td>이승환</td>
                  <td><a href="">보기</a></td>
                  <td><a href="">보기</a></td>
                  <td><a href="">보기</a></td>
                  <td><a href="">보기</a></td>
                  <td><a href="">보기</a></td>
                </tr>
                <tr>
                  <th scope="row">2</th>
                  <td>양승미</td>
                  <td><a href="">보기</a></td>
                  <td><a href="">보기</a></td>
                  <td><a href="">보기</a></td>
                  <td><a href="">보기</a></td>
                  <td><a href="">보기</a></td>
                </tr>
                <tr>
                  <th scope="row">3</th>
                  <td>백예진</td>
                  <td><a href="">보기</a></td>
                  <td><a href="">보기</a></td>
                  <td><a href="">보기</a></td>
                  <td><a href="">보기</a></td>
                  <td><a href="">X</a></td>
                </tr>
              </tbody>
            </table>
        </div>
    </section>
</body></html>