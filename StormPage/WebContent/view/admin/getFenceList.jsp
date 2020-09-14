<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>getFenceList</title>
</head>

<!-- bootStrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<!-- bootStrap js -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

<!-- FontAwesome 아이콘-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

 <!-- googlefont -->
<style>
    @font-face {
    font-family: 'NIXGONB-Vb';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/NIXGONB-Vb.woff') format('woff');
    font-weight: normal;
    font-style: normal;
    }    
</style>

<style>
    .content {margin: 10px 10px 30px; margin-top: 300px;}
    th {font-size: 30px;}
    td {font-size: 28px;}
    .form-group { width: 100%; height: 30px; margin-top: 30px;}
    a{font-size:33px;}
</style>

<body>
    <!-- toolbar include -->
    <header class="header">
   	    <jsp:include page="../toolbar/toolBar.jsp"/>
   	</header>
 
    <div class="content">
    
		<ul class="nav nav-pills nav-fill">
  			<li class="nav-item">
    			<a class="nav-link" href="/view/admin/getUserList.jsp" style="color:#F5A9BC;">청년목록</a>
  			</li>
  			<li class="nav-item">
    			<a class="nav-link active" href="/view/admin/getFenceList.jsp" style="background: #F5A9BC;">울타리편성</a>
    		</li>
    		<li class="nav-item">
    			<a class="nav-link" href="/view/admin/getAdminAddUser.jsp" style="color:#F5A9BC;">가입시킬 청년목록</a>
    		</li>
		</ul>
        
        <form class="form-inline" name="detailForm">
           
            <div class="form-group" style="margin-bottom: 30px;">
                <select class="form-control form-control-lg" style="width:140px; height:60px; font-size:27px;">
                    <c:if test="${empty search.searchCondition }">
                    <option class="from-option" value="0" selected="selected" >전체</option>
                    <option class="from-option" value="1" >백예진울타리</option>
                    <option class="from-option" value="2" >이승환울타리</option>
                    <option class="from-option" value="3" >이승환울타리</option>
                    </c:if>
    <!--
                    <c:if test="${!empty search.searchCondition }">
                    <option class="from-option" value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>아이디</option>
                    <option class="from-option" value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>닉네임</option>
                    <option class="from-option" value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>이름</option>
                    </c:if>
    -->
                </select>
            </div>
            
            <table class="table" style="margin-top: 20px;">
            <thead>
            <tr>
                <th scope="col">이름</th>
                <th scope="col">생년월일</th>
                <th scope="col">성별</th>
                <th scope="col">소속</th>
                <th scope="col">편성</th>
            </tr>
            </thead>
            <tbody>
            <tr>
              <td>이승환</td>
              <td>930124</td>
              <td>형제</td>
              <td>이승환울타리</td>
              <td><button type="button" class="btn btn-success btn-lg">편성</button></td>
            </tr>
             
             <tr>
              <td>백예진</td>
              <td>890000</td>
              <td>자매</td>
              <td>백예진울타리</td>
              <td><button type="button" class="btn btn-success btn-lg">편성</button></td>
            </tr>
             
             <tr>
              <td>양승미</td>
              <td>333333</td>
              <td>자매</td>
              <td>양승미울타리</td>
              <td><button type="button" class="btn btn-warning btn-lg">취소</button></td>
            </tr>
            
            </tbody>
        </table>
        </form>
    </div>
    
</body>
</html>