<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>getUser</title>
    
     <!-- bootStrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <!-- bootStrap js -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    
    <!-- FontAwesome ������-->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	
	<!-- �������� js �̰� �־�� �ڹٽ�ũ��Ʈ $�� ����  -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    
</head>
<style>
    .content {padding: 50px 50px 50px; margin-top: 290px;} 
    #input {height: 80px; font-size:30px;}
    b {font-size: 34px;}
</style>
<body>
 	<header style="z-index: 5;">
    	<jsp:include page="../toolbar/toolBar.jsp"/>
    </header>
    
    <div class="content">
        <label><b>�̸�</b></label>
        <div class="input-group input-group-lg">
		  	<input type="text" class="form-control" id="input" value="�̽�ȯ" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" readonly>
		</div>
        <br/>
        <label><b>�޴�����ȣ</b></label>
        <div class="input-group input-group-lg">
		  	<input type="text" class="form-control" id="input" value="010-4330-4417" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" readonly>
		</div>
        <br/>
        <button class="ui-btn ui-corner-all" style="height: 80px; width: 300px; font-weight: bold; font-size: 30px; background:#F5A9BC; border: thin; border-radius: 6px;">�޴�����ȣ����</button>
        <br/><br/>
        <label><b>���̵�</b></label>
        <div class="input-group input-group-lg">
		  	<input type="text" class="form-control" id="input" value="sw4417" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" readonly>
		</div>
        <br/>
        <label><b>�г���(���氡��)</b></label>
        <div class="input-group input-group-lg">
		  	<input type="text" class="form-control" id="input" value="wammelier" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
		</div>
		<br/>
        <button class="ui-btn ui-corner-all" style="height: 80px; width: 300px; font-weight: bold; font-size: 30px; background:#F5A9BC; border: thin; border-radius: 6px;">��й�ȣ����</button>
        <br/><br/>
		<label><b>�̸���(���氡��)</b></label>
        <div class="input-group input-group-lg">
		  	<input type="text" class="form-control" id="input" value="sw4417@naver.com" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
		</div>
        <br/>
        <label><b>����</b></label>
        <div class="input-group input-group-lg">
		  	<input type="text" class="form-control" id="input" value="����" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" readonly>
		</div> 
        <br/>
        <label><b>����(���氡�� ' - ' �� �����ϰ� �Է����ּ���.)</b></label>
        <div class="input-group input-group-lg">
		  	<input type="text" class="form-control" id="input" value="1993-01-24" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
		</div>
        <br/>
        <label><b>���ʿ���</b></label>
        <div class="input-group input-group-lg">
		  	<input type="text" class="form-control" id="input" value="�Ա�" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" readonly>
		</div>
		<br/>
        <button class="" type="submit" style="float: left; width: 30%; height: 80px; font-size: 30px; margin: 5% 5% 5%;  background: linear-gradient( to top, #212121, #424242 ); color: #ffffff;">����</button>
        <button class="" style="float: left; width: 30%; height: 80px; font-size: 30px; margin: 5% 5% 5%; background: linear-gradient( to top, #212121, #424242 ); color: #ffffff;">���</button>
    </div>
</body>

</html>