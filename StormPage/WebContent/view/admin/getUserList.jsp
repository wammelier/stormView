<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>UserList</title>
</head>

<!-- bootStrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<!-- bootStrap js -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

<!--JqueryMobile CDN-->
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>

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
    .header{background: #f44336; height: 240px;}
    .form-group {margin: 10px 20px 30px;}
    .checkbox_div {margin-left: 10px; padding-top:20px; width: 50px; height: 60px;}
</style>

<body>
    <!-- toolbar include -->
    <div data-role="header" style="z-index: 1;">
    	<jsp:include page="../toolbar/toolBar.jsp"/>
    </div>
   	
    <div class="userList_box" data-role="content">
       <form class="form-inline" name="detailForm">
<!--            <input type="hidden" id="boardName" name="boardName" value="${param.boardName}"/>-->
            <div class="form-group">
                <select class="form-control" name="searchCondition">
                    <c:if test="${empty search.searchCondition }">
                    <option class="from-option" value="0" selected="selected" >아이디</option>
                    <option class="from-option" value="1" >닉네임</option>
                    <option class="from-option" value="2" >이름</option>
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
            <div class="form-group ">
                <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"/>
            </div>
                <label style="padding-top: 30px; float: left; margin-left:10px; font-size: 25px;"><b>재명된 회원보기</b></label>
                <div class="toggle_switch" style="margin-top: 15px;">
    				<input type="checkbox" data-role="flipswitch" name="flip-checkbox-4" id="flip-checkbox-4" checked="checked"/>
				</div>
                
        <table class="table">
            <thead>
            <tr>
                <th scope="col">번호</th>
                <th scope="col">이름</th>
                <th scope="col">닉네임</th>
                <th scope="col">생년월일</th>
                <th scope="col">휴대폰번호</th>
                <th scope="col">성별</th>
                <th scope="col">세례여부</th>
                <th scope="col">어플가입</th>
               	<c:if set="asdf">
                <th scope="col">리더임명</th>
                </c:if>
                <th scope="col">재명여부</th>
            </tr>
            </thead>
            <tbody>
            <tr>
              <th scope="row">1</th>
              <td>이승환</td>
              <td>wammelier</td>
              <td>930124</td>
              <td>01043304417</td>
              <td>형제</td>
              <td>입교</td>
              <td>가입됨</td>
              <td><button class="ui-btn ui-corner-all">임명</button></td>
              <td><button class="ui-btn ui-corner-all">재명</button></td>
            </tr>
            <tr>
              <th scope="row">2</th>
              <td>정창성</td>
              <td>소문난깝돌이</td>
              <td>950327</td>
              <td>01020409835</td>
              <td>형제</td>
              <td>유아세례</td>
              <td>가입됨</td>
              <td><button class="ui-btn ui-corner-all">임명취소</button></td>
              <td><button class="ui-btn ui-corner-all">재명</button></td>
            </tr>
            <tr>
              <th scope="row">3</th>
              <td>양승미</td>
              <td>야생마</td>
              <td>000000</td>
              <td>01012345678</td>
              <td>자매</td>
              <td>세례</td>
              <td>가입됨</td>
              <td><button class="ui-btn ui-corner-all">임명취소</button></td>
              <td><button class="ui-btn ui-corner-all">재명</button></td>
            </tr>
            </tbody>
        </table>
        </form>
    </div>
    
</body>
</html>