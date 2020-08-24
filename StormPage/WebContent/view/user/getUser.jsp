<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>getUser</title>


    <!--JqueryMobile CDN-->
   	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
	<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
	<!-- <script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script> -->
    
</head>
<style>
    .content {padding: 50px 50px 50px; margin-top: 10px;} 
    input {height: 80px;}
    b {font-size: 30px;}
</style>
<body>
 	<div data-role="header" style="z-index: 1;">
    	<jsp:include page="../toolbar/toolBar.jsp"/>
    </div>
    
    <div class="content" data-role="content">
        <label><b>이름</b></label>
        <input type="text" value="이승환" style="font-size: 30px;"readonly>
        <br/>
        <label><b>휴대폰번호</b></label>
        <input type="text" class="user_info" value="01043304417" style="font-size: 30px;" readonly>
        <div style=" overflow: visibility;">
        <button class="ui-btn ui-corner-all" style="height: 70px; font-size: 25px; background:#F5A9BC;">휴대폰번호변경</button>
        </div>
        <br/>
        <label><b>아이디</b></label>
        <input type="text" class="user_info" value="sw4417" style="font-size: 30px;" readonly>
        <br/>
        <label><b>닉네임(변경가능)</b></label>
        <input type="text" class="user_info" value="wammelier" style="font-size: 30px;">
        <button class="ui-btn ui-corner-all" style="height: 70px; font-size: 25px; background:#F5A9BC; ">비밀번호변경</button>
        <br/>
		<label><b>이메일(변경가능)</b></label>
        <input type="text" class="user_info" value="sw4417@naver.com" style="font-size: 30px;">
        <br/>
        <label><b>성별</b></label>
        <input type="text" class="user_info" value="형제" style="font-size: 30px;" readonly> 
        <br/>
        <label><b>생일(변경가능)</b></label>
        <input type="text" class="user_info" value="1993-01-24" style="font-size: 30px;">
        <br/>
        <button class="ui-btn ui-corner-all" style="float: left; width: 30%; height: 70px; font-size: 25px; margin: 5% 5% 5%;  background: linear-gradient( to top, #212121, #424242 ); color: #ffffff;">수정</button>
        <button class="ui-btn ui-corner-all" style="float: left; width: 30%; height: 70px; font-size: 25px; margin: 5% 5% 5%; background: linear-gradient( to top, #212121, #424242 ); color: #ffffff;">취소</button>
    </div>
</body>

</html>