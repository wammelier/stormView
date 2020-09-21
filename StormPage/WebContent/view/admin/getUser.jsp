<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
    
    <!-- FontAwesome 아이콘-->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	
	<!-- 제이쿼리 js 이게 있어야 자바스크립트 $가 읽힘  -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	
	<!-- 제이쿼리 js 이게 있어야 자바스크립트 $가 읽힘  -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    
</head>

<script type="text/javascript">
	$(function(){
		/* 로그아웃 버튼 클릭할시.. */
		$('.logout_button').on("click",function(){
			$(self.location).attr('href','/user/logout');
		});
		
		/* 확인버튼 클릭시 뒤로가기 */
		$('.okButton').on('click', function(e) {
			history.back();
			/* 크롬에서 하이퍼링크에 대한 동작이 남아있기 때문에 그런 브라우저의 기본행동을 저지하는 방법임. */
			e.preventDefault();
		});
	});
	
</script>
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
        <label><b>이름</b></label>
        <div class="input-group input-group-lg">
		  	<input type="text" class="form-control" id="input" value="${ user.userName }" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" readonly>
		</div>
        <br/>
        <label><b>휴대폰번호</b></label>
        <div class="input-group input-group-lg">
		  	<input type="text" class="form-control" id="input" value="${ user.phone }" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" readonly>
		</div>
        <br/>
        <label><b>아이디</b></label>
        <div class="input-group input-group-lg">
		  	<input type="text" class="form-control" id="input" value="${ user.userId }" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" readonly>
		</div>
        <br/>
        <label><b>닉네임</b></label>
        <div class="input-group input-group-lg">
		  	<input type="text" class="form-control" id="input" value="${ user.nickName }" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" readonly>
		</div>
		<br/>
		<label><b>이메일(변경가능)</b></label>
        <div class="input-group input-group-lg">
		  	<input type="text" class="form-control" id="input" value="${ user.email }" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" readonly>
		</div>
        <br/>
        <label><b>주소(변경가능)</b></label>
        <div class="input-group input-group-lg">
		  	<input type="text" class="form-control" id="input" value="${ user.address }" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" readonly>
		</div>
        <br/>
        <label><b>성별</b></label>
        <div class="input-group input-group-lg">
        	<c:if test="${ user.gender == '0' }">
		  		<input type="text" class="form-control" id="input" value="자매" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" readonly>
			</c:if>
			<c:if test="${ user.gender == '1' }">
		  		<input type="text" class="form-control" id="input" value="형제" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" readonly>
			</c:if>
		</div> 
        <br/>
        <label><b>생일</b></label>
        <div class="input-group input-group-lg">
		  	<input type="text" class="form-control" id="input" value="${ user.birth }" 
		  	aria-label="Sizing example input"
		  	aria-describedby="inputGroup-sizing-lg" readonly>
		</div>
		<br/>
        <button class="okButton" type="submit" style="float: left; width: 30%; height: 80px; font-size: 30px; margin: 5% 0% 0%; border: thin; background: linear-gradient( to top, #212121, #424242 ); color: #ffffff;">확인</button>
    </div>
</body>

</html>