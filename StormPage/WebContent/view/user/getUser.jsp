<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>getUser</title>
    
</head>
<style>
    .content {padding: 50px 50px 50px; margin-top: 220px;} 
    input {height: 80px;}
    b {font-size: 20px;}
</style>
<body>
 	<header style="z-index: 5;">
    	<jsp:include page="../toolbar/toolBar.jsp"/>
    </header>
    
    <div class="content">
        <label><b>�̸�</b></label>
        <div class="input-group input-group-lg">
		  	<input type="text" class="form-control" value="�̽�ȯ" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" readonly>
		</div>
        <br/>
        <label><b>�޴�����ȣ</b></label>
        <div class="input-group input-group-lg">
		  	<input type="text" class="form-control" value="010-4330-4417" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" readonly>
		</div>
		<br/>
        <div style=" overflow: visibility;">
        	<button class="ui-btn ui-corner-all" style="height: 50px; width: 300px; font-weight: bold; font-size: 15px; background:#F5A9BC; border: thin; border-radius: 6px;">�޴�����ȣ����</button>
        </div>
        <br/>
        <label><b>���̵�</b></label>
        <div class="input-group input-group-lg">
		  	<input type="text" class="form-control" value="sw4417" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" readonly>
		</div>
        <br/>
        <label><b>�г���(���氡��)</b></label>
        <div class="input-group input-group-lg">
		  	<input type="text" class="form-control" value="wammelier" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
		</div>
		<br/>
        <button class="ui-btn ui-corner-all" style="height: 50px; width: 300px; font-weight: bold; font-size: 15px; background:#F5A9BC; border: thin; border-radius: 6px;">��й�ȣ����</button>
        <br/><br/>
		<label><b>�̸���(���氡��)</b></label>
        <div class="input-group input-group-lg">
		  	<input type="text" class="form-control" value="sw4417@naver.com" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
		</div>
        <br/>
        <label><b>����</b></label>
        <div class="input-group input-group-lg">
		  	<input type="text" class="form-control" value="����" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" readonly>
		</div> 
        <br/>
        <label><b>����(���氡��)</b></label>
        <div class="input-group input-group-lg">
		  	<input type="text" class="form-control" value="1993-01-24" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" readonly>
		</div>
        <br/>
        <button class="" type="submit" style="float: left; width: 30%; height: 50px; font-size: 20px; margin: 5% 5% 5%;  background: linear-gradient( to top, #212121, #424242 ); color: #ffffff;">����</button>
        <button class="" style="float: left; width: 30%; height: 50px; font-size: 20px; margin: 5% 5% 5%; background: linear-gradient( to top, #212121, #424242 ); color: #ffffff;">���</button>
    </div>
</body>

</html>