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
        <label><b>�̸�</b></label>
        <input type="text" value="�̽�ȯ" style="font-size: 30px;"readonly>
        <br/>
        <label><b>�޴�����ȣ</b></label>
        <input type="text" class="user_info" value="01043304417" style="font-size: 30px;" readonly>
        <br/>
        <label><b>���̵�</b></label>
        <input type="text" class="user_info" value="sw4417" style="font-size: 30px;" readonly>
        <br/>
        <label><b>�г���</b></label>
        <input type="text" class="user_info" value="wammelier" style="font-size: 30px;" readonly>
		<label><b>�̸���</b></label>
        <input type="text" class="user_info" value="sw4417@naver.com" style="font-size: 30px;" readonly>
        <br/>
        <label><b>����</b></label>
        <input type="text" class="user_info" value="����" style="font-size: 30px;" readonly> 
        <br/>
        <label><b>����(��������)</b></label>
        <input type="text" class="user_info" value="1993-01-24" style="font-size: 30px;">
        <br/>
        <label><b>���ʿ���</b></label>
        <br/>
        <div style="width:150px;">
	        <select name="baptism">
	        	<option value="" selected>����</option>
	        	<option value="">���Ƽ���</option>
	        	<option value="">����</option>
	        	<option value="">�Ա�</option>
	        </select>
        </div>
        <br/>
        <button class="ui-btn ui-corner-all" style="float: left; width: 30%; height: 70px; font-size: 25px; margin: 5% 5% 5%; background: linear-gradient( to top, #212121, #424242 ); color: #ffffff;">����</button>
        <button class="ui-btn ui-corner-all" style="float: left; width: 30%; height: 70px; font-size: 25px; margin: 5% 5% 5%; background: linear-gradient( to top, #212121, #424242 ); color: #ffffff;">���</button>
    </div>
</body>

</html>