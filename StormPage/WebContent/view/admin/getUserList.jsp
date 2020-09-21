<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>UserList</title>
</head>

<!-- 제이쿼리 js 이게 있어야 자바스크립트 $가 읽힘  -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	
<!-- bootStrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<!-- bootStrap js -->
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

<script type="text/javascript">

	$(function() {
		/* 검색창에 커서를 올릴경우 */
		$('.form-control').keyup(function() {
			/* backend단에 search도메인에 바인딩될 데이터값을 세팅함 */
			var searchCondition = $('.form-control option:selected').val();
			var searchKeyword = $('#searchKeyword').val();
			
			//회원목록을 검색할 경우
			$.ajax({
				url: "/user/json/getUserList",
				method: "POST",
				dataType: "json",
				headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
				data: JSON.stringify({
					searchKeyword: searchKeyword,
					searchCondition : searchCondition
				}),
				success: function(JSONData, status){
					if( JSONData == null || JSONData == "" ) {
						console.log("No Search ReturnData");
					}else{
						console.log("Yes Search ReturnData!! ==>"+JSONData);
						
						/* thml을 새로 append하기 위해 기존 데이터를 ""으로 만듬 */
						$('tbody').children().remove();
						
						for(var i = 0; i < JSONData.list.length; i++) {
							
							/* ##############################시간을 표시해야할때 사용할것!!########################  */
							/* ##############################시간을 표시해야할때 사용할것!!########################  */
							/* ##############################시간을 표시해야할때 사용할것!!########################  */
							
							/* milliSeconds 시간을 date에 담아서 재대로된 시간으로 표현하기 위한 방법 */
							/* var regdate = new Date(JSONData.list[i].regDate);
							var splitDate = regdate.getFullYear()+"-";
							if(parseInt(regdate.getMonth())<9){
								splitDate += "0"+parseInt(regdate.getMonth()+1)+"-";
							}else{
							splitDate += regdate.getMonth()+1+"-";
							}
							if(parseInt(regdate.getDate())<9){
								splitDate += "0"+parseInt(regdate.getDate());
							}else{
								splitDate += regdate.getDate();
							} */
							
							/* tag를 append하기 위한 필드생성 */
							var appendName = '';
							/* 리더와 일반청년을 append 하기위한 조건문..원래 html에서 c:if를 사용하기때문에 script에선 if문으로 구현 */
							/* 1=리더, 0=일반청년 */
							if( JSONData.list[i].userPosition == '1') {
								appendName = "일반청년";
							}else{
								appendName = "리더";
							} 	
							/* tag를 append하기 위한 필드 인스턴스 */
							var appendHtml = 	"<tr>"+
													"<td>"+JSONData.list[i].userName+"</td>"+
													"<td>"+JSONData.list[i].userId+"</td>"+
													"<td>"+JSONData.list[i].nickName+"</td>"+
													"<td>"+appendName+"</td>"+
													"<td><button type='button' class='btn btn-danger btn-lg'>재명</button></td>"+
												"</tr>";
							/* tbody tag안에 어펜드 */
							$('tbody').append(appendHtml);
			              						
						}/* end of for  */
					}/* end of else  */
				}, /* end of success */
				
				/* 에러일 경우!!  */
				error:function(request,status,error){
			        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			        
			    }/* end of error  */
			}); /* end of ajax */
		}); /* end of event */
	}); /* end of function */
	
	/* 관리자가 회원의 상세정보를 보기 원할 경우 */
	$(function() {
		$('td:nth-child(1)').on('click', function() {
			var userId = $(this).find($('input[name="userId"]')).val();
			self.location = "/user/getAdminUser?userId="+userId;
		});
	});/* end of function */
</script>

<style>
    .header{background: #f44336; height: 240px;}
    .form-group {margin: 10px 20px 30px;}
    .userList_box {margin-left: 10px; padding-top:300px; width: 100%; height: 60px;}
    th {font-size: 30px;}
    td {font-size: 27px;}
    .nav-item {height:80px;}
    a {font-size: 33px;}
    
</style>

<body>
    <!-- toolbar include -->
    <header style="z-index: 2;">
    	<jsp:include page="../toolbar/toolBar.jsp"/>
    </header>
   	
    <div class="userList_box">
    
	    <ul class="nav nav-pills nav-fill">
		  	<li class="nav-item">
		    	<a class="nav-link active" href="/user/getUserList" style="background: #F5A9BC;">청년목록 (${resultPage.totalCount}명)</a>
		  	</li>
		  	<li class="nav-item">
		    	<a class="nav-link" href="/user/getFenceList" style="color:#F5A9BC;">울타리편성</a>
		  	</li>
		  	<li class="nav-item">
    			<a class="nav-link" href="/user/getAddUserAdminList" style="color:#F5A9BC;">가입시킬 청년목록</a>
    		</li>
		</ul>
	    
       <form class="form-inline" name="detailForm">
<!--            <input type="hidden" id="boardName" name="boardName" value="${param.boardName}"/>-->
            <div class="form-group">
                <select class="form-control" name="searchCondition" style="height:60px; width:130px; font-size:26px;">
                
                    <c:if test="${empty search.searchCondition }">
	                    <option class="from-option" value="0" selected="selected" >아이디</option>
	                    <option class="from-option" value="1" >닉네임</option>
	                    <option class="from-option" value="2" >이름</option>
                    </c:if>

                    <c:if test="${!empty search.searchCondition }">
	                    <option class="from-option" value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>아이디</option>
	                    <option class="from-option" value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>닉네임</option>
	                    <option class="from-option" value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>이름</option>
                    </c:if>

                </select>
            </div>
            
            <div class="form-group ">
                <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어" style="height:60px; width:300px; font-size:26px;"/>
            </div>
			
			<div class="custom-control custom-switch" style="margin-left: 6%;">
			  <input type="checkbox" class="custom-control-input" id="customSwitch1">
			  <label class="custom-control-label" for="customSwitch1">재명된 회원보기</label>
			</div>
     	</form>
                
        <table class="table" style="margin-top: 20px;">
            <thead>
            <tr>
                <th scope="col">이름</th>
                <th scope="col">아이디</th>
                <th scope="col">닉네임</th>
                <th scope="col">직책</th>
                <th scope="col">재명여부</th>
            </tr>
            </thead>
            <tbody>
	            <c:set var="i" value="0"/>
				<c:forEach var="user" items="${ list }">
		            <tr>
		              <td>${ user.userName }
		              <input type="hidden" name="userId" value="${ user.userId }"/></td>
		              <td>${ user.userId }</td>
		              <td>${ user.nickName }</td>
		              <c:if test="${ user.userPosition == '0' }">
		              	<td>일반청년</td>
		              </c:if>
		              <c:if test="${ user.userPosition == '1' }">
		              	<td>리더</td>
		              </c:if>
		              <td><button type="button" class="btn btn-danger btn-lg">재명</button></td>
		            </tr>
	            </c:forEach>
         	</tbody>
        </table>
        <jsp:include page="/common/pageNavigator_new.jsp"></jsp:include>
    </div>
</body>
</html>