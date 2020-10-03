<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>getUserAdmin</title>
    
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

<script type="text/javascript">

	/* ������ư�� �������(submit�� ����) tag�� form�ȿ� name���� domain field�� ���Ӱ� ������ ���ε� ��Ŵ */
	$(function() {
		$('.submitButton').on('click', function() {
			
			$("form").attr("action", "/user/updateUserAdmin").attr("method" , "POST").submit();
		});/* end of event */
		
		/* ��ҹ�ư�� ������� �ڷΰ��� */
		$('.cancleButton').on('click', function(e) {
			history.back();
			/* ũ�ҿ��� �����۸�ũ�� ���� ������ �����ֱ� ������ �׷� �������� �⺻�ൿ�� �����ϴ� �����. */
			e.preventDefault();
		});
		
	});/* end of function */
	
	
</script>
<style>
    .content {padding: 50px 50px 50px; margin-top: 260px;} 
    #input {height: 80px; font-size:40px;}
    b {font-size: 34px;}
</style>
<body>
 	<header style="z-index: 5;">
    	<jsp:include page="../toolbar/toolBar.jsp"/>
    </header>
    <form>
	    <div class="content">
	        <label><b>�̸�</b></label>
	        <div class="input-group input-group-lg">
			  	<input type="text" name="userName" class="form-control" id="input" value="${ user.userName }" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" readonly>
			</div>
	        <br/>
	        <label><b>�޴�����ȣ</b></label>
	        <div class="input-group input-group-lg">
			  	<input type="text" name="phone" class="form-control" id="input" value="${ user.phone }" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" readonly>
			</div>
	        <br/>
	        <label><b>�ּ�</b></label>
	        <div class="input-group input-group-lg">
			  	<input type="text" name="address" class="form-control" id="input" value="${ user.address }" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
			</div>
	        <br/>
	        <label><b>����</b></label>
	        <div class="input-group mb-3">
				<select class="custom-select" name="gender" id="inputGroupSelect02" style="height: 80px; font-size:40px;">
					<c:if test="${ user.gender == '0' }">
				    	<option value="0" selected>�ڸ�</option>
					    <option value="1">����</option>
				    </c:if>
				    <c:if test="${ user.gender == '1' }">
				    	<option value="0">�ڸ�</option>
					    <option value="1" selected>����</option>
				    </c:if>
				    <c:if test="${ user.gender == null }">
				    	<option value="0" selected>�ڸ�</option>
					    <option value="1">����</option>
				    </c:if>
		   		</select>
		   	</div>
	        <br/>
	        <label><b>����</b></label>
	        <div class="input-group input-group-lg">
			  	<input type="text" name="birth" class="form-control" id="input" value="${ user.birth }" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
			</div>
	        <br/>
	        <label><b>��Ÿ��</b></label>
	        <div class="input-group input-group-lg">
			  	<input type="text" name="leaderName" class="form-control" id="input" value="${ user.leaderName }" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" readonly>
			</div>
	        <br/>
	        <label><b>���ʿ���</b></label>
	        <div class="input-group mb-3">
			<select class="custom-select" name="baptismName" id="inputGroupSelect02" style="height: 80px; font-size:40px;">
				<c:if test="${ user.baptismName == '0' }">
			    	<option value="0" selected>����</option>
				    <option value="1">����</option>
				    <option value="2">�Ա�</option>
				    <option value="3">���Ƽ���</option>
			    </c:if>
			    <c:if test="${ user.baptismName == '1' }">
			    	<option value="0">����</option>
				    <option value="1" selected>����</option>
				    <option value="2">�Ա�</option>
				    <option value="3">���Ƽ���</option>
			    </c:if>
			    <c:if test="${ user.baptismName == '2' }">
			    	<option value="0">����</option>
				    <option value="1">����</option>
				    <option value="2" selected>�Ա�</option>
				    <option value="3">���Ƽ���</option>
			    </c:if>
			    <c:if test="${ user.baptismName == '3' }">
			    	<option value="0">����</option>
				    <option value="1">����</option>
				    <option value="2">�Ա�</option>
				    <option value="3" selected>���Ƽ���</option>
			    </c:if>
			</select>
			</div>
			<br/>
	        <button class="submitButton" type="submit" style="float: left; width: 30%; height: 80px; font-size: 40px; margin: 5% 5% 5%;  background: linear-gradient( to top, #212121, #424242 ); color: #ffffff;">����</button>
	        <button class="cancleButton" style="float: left; width: 30%; height: 80px; 
	        font-size: 40px; margin: 5% 5% 5%; background: linear-gradient( to top, #212121, #424242 ); 
	        color: #ffffff;">���</button>
	    </div>
    </form>
</body>

</html>