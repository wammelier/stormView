<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>signUp</title>

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
	
</head>

<style>
    #wrap{background: url("/resources/signUpImg.jpeg");}
    
    /* 제일 상단에 로고 css */
    #wrap {padding-top: 20%; height:2200px;}
    .main_logo {margin-left: 10%; margin-top: 5%; width: 80%; height: 120px;}
    .logo_img {width: 100%; height: 100%;}
    
    .input-group-lg {width: 80%; margin-left:10%;}
    #input {height: 90px; font-size:34px; width: 50%;}
    b {font-size: 34px;}
    
    #in {margin-left: 10%; float:left; width: 240px; height: 80px; background: url(/resources/signUpIconIn.png); background-repeat: no-repeat;}
    #cancel {margin-left: 50px; float:left; width: 240px; height: 80px; background: url(/resources/signUpIconCancel.png); background-repeat: no-repeat;}
    
</style>

<body>

   <form action="signUp.jsp">
        <section id="wrap" data-role="page">
            <div class="contents" data-role="content">
                 <div class="main_logo">
                    <img class="logo_img" src="/resources/stormLogotext.png">
                </div>
                <br/><br/><br/>
                <div class="info" style='font-size:25px; margin-left: 10%; width:80%; color:#ffffff;"'>
                    	군포교회 청년부 Storm어플은 청년들의 개인정보를 유출하지 않습니다. 회원가입을 통해 기입하신 개인정보는 청년부내에서 행사를 진행할때 참고되며 그 외에 다른 상업적인 용도와 불법적인 사용을 하지않음을 약속드립니다.
                </div>
                <br/><br/>
                <div class="input-group input-group-lg">
				  	<input type="text" class="form-control" id="input" placeholder="이름" value="" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
				</div>
				<br/><br/>
                <div class="input-group input-group-lg">
				  	<input type="text" class="form-control" id="input" placeholder="휴대폰번호" value="" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
				</div>
				<br/><br/>
                <div class="submit_input">
                    <button id="confirm" style="margin-left:10%; width: 200px; height: 70px; font-size:24px;">인증하기</button>
                </div>
                <br/><br/>
                <div class="input-group input-group-lg">
				  	<input type="text" class="form-control" id="input" placeholder="아이디" value="" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
				</div>
				<br/><br/>
                <div class="input-group input-group-lg">
				  	<input type="text" class="form-control" id="input" placeholder="비밀번호" value="" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
				</div>
				<br/><br/>
                <div class="input-group input-group-lg">
				  	<input type="text" class="form-control" id="input" placeholder="비밀번호확인" value="" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
				</div>
				<br/><br/>
				<label style="margin-left:10%;"><b style="color:#ffffff;">성별</b></label>
                <div class="input-group mb-3" style="margin-left:10%; width: 80%;">
					<select class="custom-select" id="inputGroupSelect02" style="height: 80px; font-size:30px;">
					    <option value="0" selected>자매</option>
					    <option value="1">형제</option>
					</select>
				</div>
				<br/><br/>
                <div class="input-group input-group-lg">
				  	<input type="text" class="form-control" id="input" placeholder="닉네임" value="" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
				</div>
				<br/><br/>
                <div class="input-group input-group-lg">
				  	<input type="text" class="form-control" id="input" placeholder="이메일" value="" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
				</div>
				<br/><br/>
                <div class="input-group input-group-lg">
				  	<input type="text" class="form-control" id="input" placeholder="생년월일(예시 900101)" value="" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
				</div>
				<br/><br/>
                <div class="submit_input">
                    <button id="in"></button>
                </div>
                <div class="submit_input">
                    <button id="cancel"></button>
                </div>
            </div>
        </section>
    </form>
</body>
</html>