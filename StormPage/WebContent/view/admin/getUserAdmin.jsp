<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

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
    
    <!-- FontAwesome 아이콘-->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	
	<!-- 제이쿼리 js 이게 있어야 자바스크립트 $가 읽힘  -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    
</head>
<style>
    .content {padding: 50px 50px 50px; margin-top: 220px;} 
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
		  	<input type="text" class="form-control" id="input" value="이승환" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" readonly>
		</div>
        <br/>
        <label><b>휴대폰번호</b></label>
        <div class="input-group input-group-lg">
		  	<input type="text" class="form-control" id="input" value="010-4330-4417" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" readonly>
		</div>
        <br/>
        <label><b>아이디</b></label>
        <div class="input-group input-group-lg">
		  	<input type="text" class="form-control" id="input" value="sw4417" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" readonly>
		</div>
        <br/>
        <label><b>주소</b></label>
        <div class="input-group input-group-lg">
		  	<input type="text" class="form-control" id="input" value="경기도 군포시 당동" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" readonly>
		</div>
        <br/><br/>
		<label><b>이메일</b></label>
        <div class="input-group input-group-lg">
		  	<input type="text" class="form-control" id="input" value="sw4417@naver.com" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" readonly>
		</div>
        <br/>
        <label><b>성별</b></label>
        <div class="input-group input-group-lg">
		  	<input type="text" class="form-control" id="input" value="형제" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" readonly>
		</div> 
        <br/>
        <label><b>생일</b></label>
        <div class="input-group input-group-lg">
		  	<input type="text" class="form-control" id="input" value="1993-01-24" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" readonly>
		</div>
        <br/>
        <label><b>세례여부</b></label>
        <div class="input-group mb-3">
		<select class="custom-select" id="inputGroupSelect02" style="height: 80px; font-size:30px;">
		    <option selected>없음</option>
		    <option value="1">세례</option>
		    <option value="2">입교</option>
		    <option value="3">유아세례</option>
		</select>
		</div>
		<br/>
        <button class="" type="submit" style="float: left; width: 30%; height: 80px; font-size: 30px; margin: 5% 5% 5%;  background: linear-gradient( to top, #212121, #424242 ); color: #ffffff;">수정</button>
        <button class="" style="float: left; width: 30%; height: 80px; font-size: 30px; margin: 5% 5% 5%; background: linear-gradient( to top, #212121, #424242 ); color: #ffffff;">취소</button>
    </div>
</body>

</html>