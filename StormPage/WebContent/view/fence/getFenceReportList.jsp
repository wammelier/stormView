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
	
	<!-- 제이쿼리 js 이게 있어야 자바스크립트 $가 읽힘  -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	
</head>

<script type="text/javascript">
	$(function() {
		$('#fence_post').attr('src', '/resources/mainIconFencePink.png');
	});/* end of function() */
</script>

<style>
    /* 테이블 관련 CSS  */
    th {font-size: 40px;}
    td {font-size: 40px;}
    .form-control {font-size: 30px; height: 100%;}
    .select_room {margin: 20px; margin-top: 320px; width: 200px; height: 50px;}
    .select_room2 {margin: 20px; margin-top: 0px; width: 200px; height: 50px;}
    table {margin-top: 20px; margin-left: 15px;}
</style>

<script type="text/javascript">

	$(function(){
		$('a').on("click", function(){
			var a = $('input').val();
		})
	})
</script>

<body>

    <section data-role="page">
    
        <header class="header" data-role="header">
        	<jsp:include page="/view/toolbar/toolBar.jsp"/>
        </header> 
    	
        <div class="content" data-role="content">
        <div>
          <div class="select_room">
           <select class="form-control" name="searchCondition" style="height: 50px; font-size: 30px;">
              <option class="from-option" value="0" selected="selected" >2020년</option>
              <option class="from-option" value="1" >2021년</option>
              <option class="from-option" value="2" >2022년</option>
              <option class="from-option" value="3" >2023년</option>
           </select>
          </div>
          <div class="select_room2">
           <select class="form-control" name="searchCondition" style="height: 50px; font-size: 30px;">
              <option class="from-option" value="0" selected="selected" >1월</option>
              <option class="from-option" value="1" >2월</option>
              <option class="from-option" value="2" >3월</option>
              <option class="from-option" value="3" >4월</option>
              <option class="from-option" value="4" >5월</option>
              <option class="from-option" value="5" >6월</option>
              <option class="from-option" value="6" >7월</option>
              <option class="from-option" value="7" >8월</option>
              <option class="from-option" value="8" >9월</option>
              <option class="from-option" value="9" >10월</option>
              <option class="from-option" value="10" >11월</option>
              <option class="from-option" value="11" >12월</option>
           </select>
          </div>
          </div>
            <table class="table table-striped">
              <thead>
                <tr>
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
                  <td>이승환</td>
                  <td><input type="hidden" value="1"><a href="">보</a></td>
                  <td><input type="hidden" value="2"><a href="">보기</a></td>
                  <td><input type="hidden" value="3"><a href="">보기</a></td>
                  <td><input type="hidden" value="4"><a href="">보기</a></td>
                  <td><input type="hidden" value="5"><a href="">보기</a></td>
                </tr>
                <tr>
                  <td>양승미</td>
                  <td><a href="">보기</a></td>
                  <td><a href="">보기</a></td>
                  <td><a href="">보기</a></td>
                  <td><a href="">보기</a></td>
                  <td><a href="">보기</a></td>
                </tr>
                <tr>
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