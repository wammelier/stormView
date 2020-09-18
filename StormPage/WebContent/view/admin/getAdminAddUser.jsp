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
    .content {margin: 10px 10px 20px; margin-top: 300px;}
    th {font-size: 30px;}
    td {font-size: 28px;}
    .form-group { width: 100%; height: 30px;}
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
    			<a class="nav-link" href="/user/getUserList" style="color:#F5A9BC;">청년목록</a>
  			</li>
  			<li class="nav-item">
    			<a class="nav-link" href="/user/getFenceList" style="color:#F5A9BC;">울타리편성</a>
    		</li>
    		<li class="nav-item">
    			<a class="nav-link active" href="/view/admin/getAdminAddUser.jsp" style="background: #F5A9BC;">가입시킬 청년목록</a>
    		</li>
		</ul>
        
        <button type="button" class="btn btn-primary btn-lg" style="margin-left:10px; margin-top: 10px; background: #F5A9BC;">가입시킬 청년추가</button>
     </div>
            
            <table class="table">
            <thead>
            <tr>
                <th scope="col">이름</th>
                <th scope="col">휴대폰번호</th>
                <th scope="col">가입여부</th>
                <th scope="col">리더임명</th>
                <th scope="col">삭제여부</th>
            </tr>
            </thead>
            <tbody>
            <tr>
              <td>이승환</td>
              <td>01043304417</td>
              <td>가입안됨</td>
              <td><button type="button" class="btn btn-primary btn-lg">임명</button></td>
              <td><button type="button" class="btn btn-danger btn-lg">삭제</button></td>
            </tr>
             
             <tr>
              <td>백예진</td>
              <td>1234567</td>
              <td>가입안됨</td>
              <td><button type="button" class="btn btn-primary btn-lg">임명</button></td>
              <td><button type="button" class="btn btn-danger btn-lg">삭제</button></td>
            </tr>
             
             <tr>
              <td>양승미</td>
              <td>56789076</td>
              <td>가입안됨</td>
              <td><button type="button" class="btn btn-warning btn-lg">임명취소</button></td>
              <td><button type="button" class="btn btn-danger btn-lg">삭제</button></td>
            </tr>
            
            </tbody>
        </table>
        </form>
    </div>
    
</body>
</html>