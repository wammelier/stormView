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
		$('.logout_button').on("click",function(){
			$(self.location).attr('href','/user/logout');
		});
	});
	
	/* 수정버튼을 누를경우(submit에 의해) tag의 form안에 name들을 domain field의 네임과 같으면 바인딩 시킴 */
	$(function() {
		$('.submitButton').on('click', function() {
			$("form").attr("action", "/user/updateUser").attr("method" , "POST").submit();
		});/* end of event */
		
		/* 취소버튼을 누를경우 뒤로가기 */
		$('.cancleButton').on('click', function(e) {
			history.back();
			/* 크롬에서 하이퍼링크에 대한 동작이 남아있기 때문에 그런 브라우저의 기본행동을 저지하는 방법임. */
			e.preventDefault();
		});
		
	});/* end of function */
	
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
    <form>
	    <div class="content">
	    	<label><b>프로필이미지</b></label>
	        <div class="input-group input-group-lg">
			  	<img style="width: 200px; height: 200px; border-radius: 80%;" src="/resources/stormLogo.png">
			</div>
			<button class="ui-btn ui-corner-all" style="height: 80px; width: 300px; font-weight: bold; font-size: 30px; background:#F5A9BC; border: thin; border-radius: 6px;">이미지변경</button>
	        <br/><br/>
	        <label><b>이름</b></label>
	        <div class="input-group input-group-lg">
			  	<input type="text" name="userName" class="form-control" id="input" value="${ user.userName }" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" readonly>
			</div>
	        <br/>
	        <label><b>휴대폰번호</b></label>
	        <div class="input-group input-group-lg">
			  	<input type="text" name="phone" class="form-control" id="input" value="${ user.phone }" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" readonly>
			</div>
	        <br/>
	        <button class="ui-btn ui-corner-all" style="height: 80px; width: 300px; font-weight: bold; font-size: 30px; background:#F5A9BC; border: thin; border-radius: 6px;">휴대폰번호변경</button>
	        <br/><br/>
	        <label><b>아이디</b></label>
	        <div class="input-group input-group-lg">
			  	<input type="text" name="userId" class="form-control" id="input" value="${ user.userId }" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" readonly>
			</div>
	        <br/>
	        <label><b>닉네임(변경가능)</b></label>
	        <div class="input-group input-group-lg">
			  	<input type="text" name="nickName" class="form-control" id="input" value="${ user.nickName }" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
			</div>
			<br/>
	        <button class="ui-btn ui-corner-all" style="height: 80px; width: 300px; font-weight: bold; font-size: 30px; background:#F5A9BC; border: thin; border-radius: 6px;">비밀번호변경</button>
	        <br/><br/>
			<label><b>이메일(변경가능)</b></label>
	        <div class="input-group input-group-lg">
			  	<input type="text" name="email" class="form-control" id="input" value="${ user.email }" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
			</div>
	        <br/>
	        <label><b>주소(변경가능)</b></label>
	        <div class="input-group input-group-lg">
			  	<input type="text" name="address" class="form-control" id="input" value="${ user.address }" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
			</div>
	        <br/>
	        <label><b>성별</b></label>
	        <div class="input-group input-group-lg">
	        	<c:if test="${ user.gender == '0' }">
			  		<input type="text" name="gender" class="form-control" id="input" value="자매" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" readonly>
				</c:if>
				<c:if test="${ user.gender == '1' }">
			  		<input type="text" name="gender" class="form-control" id="input" value="형제" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" readonly>
				</c:if>
			</div> 
	        <br/>
	        <label><b>생일(예시: 990223)</b></label>
	        <div class="input-group input-group-lg">
			  	<input type="text" name="birth" class="form-control" id="input" value="${ user.birth }" 
			  	aria-label="Sizing example input" maxlength="6" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
			  	aria-describedby="inputGroup-sizing-lg">
			</div>
			<br/>
			<button class="logout_button" style="float: left; width: 100%; height: 60px; font-size: 30px; margin: 5% 0% 0%; border: thin; background: linear-gradient( to top, #d50000, #e53935 ); color: #ffffff;">로그아웃</button>
			<br/>
	        <button class="submitButton" type="submit" style="float: left; width: 30%; height: 80px; font-size: 30px; margin: 5% 0% 0%; border: thin; background: linear-gradient( to top, #212121, #424242 ); color: #ffffff;">수정</button>
	        <button class="cancleButton" style="float: left; width: 30%; height: 80px; font-size: 30px; margin: 5% 5% 5%; border: thin; background: linear-gradient( to top, #212121, #424242 ); color: #ffffff;">취소</button>
	    </div>
    </form>
</body>

</html>