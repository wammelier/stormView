<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html" charset="EUC-KR">
    <title>getUserList</title>
</head>

<!-- bootStrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<!-- bootStrap js -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

<!-- sweetalert2 CDN -->
<!-- Include a required theme -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

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
    .userList_box {margin-left: 10px; padding-top:300px; width: 100%; height: 60px;}
    th {font-size: 40px;}
    td {font-size: 35px;}
    .nav-item {height:80px;}
    a {font-size: 33px;}
    
    /* 스위트알럿 css 변경방법... */
    .swal-modal{
    width: 900px;
    height: 350px;
    }
    .swal-title{
    font-size: 50px;
    }
    .swal-text {
    font-size:70px;
    }
    .swal-button--danger{
     width: 200px;
     font-size: 40px;
    }
    .swal-button--cancel{
    widht: 200px;
    font-size: 40px;
    }
    .swal-button--confirm{
    width: 200px;
    font-size: 40px;
    }
    
    /* toggle css */
    input[type="checkbox"] { display: none; } 
    .label__on-off { 
    	overflow: hidden; 
    	position: relative; 
    	display: inline-block; 
    	width: 130px; 
    	height: 50px; 
    	-webkit-border-radius: 13px; 
    	-moz-border-radius: 13px; 
    	border-radius: 20px; 
    	background-color: #ed4956; 
    	color: #fff; 
    	font-weight: bold; 
    	cursor: pointer; 
    	-webkit-transition: all .3s; 
    	-moz-transition: all .3s; 
    	-ms-transition: all .3s; 
    	-o-transition: all .3s; 
    	transition: all .3s; 
    } 
    .label__on-off > * { 
	    vertical-align: middle; 
	    -webkit-transition: all .3s;
	    -moz-transition: all .3s; 
	    -ms-transition: all .3s; 
	    -o-transition: all .3s; 
	    transition: all .3s; 
	    font-size: 30px; 
    } 
    .label__on-off .marble { 
	    position: absolute; 
	    top: 0px; 
	    left: 1px; 
	    display: block; 
	    width: 50px; 
	    height: 50px; 
	    background-color: #fff; 
	    -webkit-border-radius: 50%; 
	    -moz-border-radius: 50%; 
	    border-radius: 50%; 
	    -webkit-box-shadow: 0 0 10px rgba(0, 0, 0, .3); 
	    -moz-box-shadow: 0 0 10px rgba(0, 0, 0, .3); 
	    box-shadow: 0 0 10px rgba(0, 0, 0, .3); 
    } 
    .label__on-off .on { 
	    display: none; 
	    padding-right: 50px;
    } 
    .label__on-off .off { 
	    padding-left: 40px; 
	    line-height: 40px; 
    } 
    .input__on-off:checked + .label__on-off { 
    	background-color: #0bba82; 
    } 
    .input__on-off:checked + .label__on-off .on { 
    	display: inline-block; 
    } .input__on-off:checked + .label__on-off .off { 
    	display: none; 
    } 
    .input__on-off:checked + .label__on-off .marble { 
    	left: 78px; 
    }

}
</style>

<script type="text/javascript">

	$(function() {
		/* 검색창에 커서를 올릴경우 */
		$('.form-control').keyup(function() {
			/* backend단에 search도메인에 바인딩될 데이터값을 세팅함 */
			var searchCondition = $('.form-control option:selected').val();
			var searchKeyword = $('#searchKeyword').val();
			/* 회원목록을 조회하는 function */
			getUserList(searchCondition, searchKeyword)
		}); /* end of event */
	}); /* end of function */

	
	/* checkbox 클릭시 check가 되어있는지 안되어있는지를 판단하여 function실행.. */
	$(function() {
		$('input[type="checkbox"]').on('click', function() {
			if ( $('input[type="checkbox"]').is(':checked') == true ) {
				console.log('체크된 상태..');
				/* backend단에 search도메인에 바인딩될 데이터값을 세팅함 */
				var searchCondition = $('.form-control option:selected').val();
				var searchKeyword = $('#searchKeyword').val();
				/* 버튼활성화시 input box readonly처리 */
				$('#searchKeyword').attr("readonly",true); 
				/* 재명 회원목록을 조회하는 function */
				getDeletedUserList(searchCondition, searchKeyword);
			}else if ( $('input[type="checkbox"]').is(':checked') == false ) {
				console.log('체크안된 상태..');
				/* backend단에 search도메인에 바인딩될 데이터값을 세팅함 */
				var searchCondition = $('.form-control option:selected').val();
				var searchKeyword = $('#searchKeyword').val();
				/* 버튼활성화시 input box readonly 해제 */
				$('#searchKeyword').attr("readonly",false); 
				/* 회원목록을 조회하는 function */
				getUserList(searchCondition, searchKeyword)
			}/* end of else */
		});/* end of click event */
	});/* end of function */
	
	/* checkbox 클릭시 check가 되어있는지 안되어있는지를 판단하여 function실행.. */
	$(function() {
		$('input[type="checkbox"]').on('click', function() {
			if ( $('input[type="checkbox"]').is(':checked') == true ) {
				console.log('체크된 상태..');
				/* backend단에 search도메인에 바인딩될 데이터값을 세팅함 */
				var searchCondition = $('.form-control option:selected').val();
				var searchKeyword = $('#searchKeyword').val();
				/* 버튼활성화시 input box readonly처리 */
				$('#searchKeyword').attr("readonly",true); 
				/* 재명 회원목록을 조회하는 function */
				getDeletedUserList(searchCondition, searchKeyword);
			}else if ( $('input[type="checkbox"]').is(':checked') == false ) {
				console.log('체크안된 상태..');
				/* backend단에 search도메인에 바인딩될 데이터값을 세팅함 */
				var searchCondition = $('.form-control option:selected').val();
				var searchKeyword = $('#searchKeyword').val();
				/* 버튼활성화시 input box readonly 해제 */
				$('#searchKeyword').attr("readonly",false); 
				/* 회원목록을 조회하는 function */
				getUserList(searchCondition, searchKeyword)
			}/* end of else */
		});/* end of click event */
	});/* end of function */
	
	
	/* 재명버튼을 누를 경우. */
	$(function() {
		$(document).on('click', 'td:nth-child(5)', function() {
			var userId = $(this).find($('input[name="userId"]')).val();
			var comebackId = $(this).find($('input[name="comebackId"]')).val();
			/* debugging */
			console.log('userId == >' + userId);
			console.log('comebackId == >' + comebackId);
			if( userId != null ) {
			/* 유저의 deleted 칼럼을 1로 변경하는 기능 실행..*/
				deletedUser(userId)
			}else if( comebackId != null ) {
				comebackUser(comebackId)
			}
		});/* end of document */
	});/* end of function */
	
	
	/* 회원을 재명하는 기능.. */
	function deletedUser(userId) {
		/* getUserList ajax를 실행하기 위해 필드생성.. search도메인을 이용해서 데이터를 뽑아오기 때문에. */
		var searchCondition = $('.form-control option:selected').val();
		var searchKeyword = $('#searchKeyword').val();
		/* 재명버튼을 누를경우 해당하는 ajax 실행. */
		$.ajax({
			url: "/user/json/deletedUser/"+userId,
			method: "GET",
			dataType: "json",
			headers: { "Accpet" : "application/json", "Content-Type" : "application/json" },
			success: function(JSONData, status) {
				if( JSONData.message == "deleteFail" ) {
					console.log("No Search ReturnData");
				}else {
					console.log("Yes Search ReturnData ==>"+JSONData);
					getUserList(searchCondition, searchKeyword);
				}/* end of else */
			},/* end of success */
			/* 에러일시. */
			error: function(JSONData, status, error) {
				console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
			}/* end of error */
		});/* end of ajax */
	}/* end of deletedUser() */
	
	/* 회원의 재명을 취소하는 기능.. */
	function comebackUser(comebackId) {
		/* getUserList ajax를 실행하기 위해 필드생성.. search도메인을 이용해서 데이터를 뽑아오기 때문에. */
		var searchCondition = $('.form-control option:selected').val();
		var searchKeyword = $('#searchKeyword').val();
		/* 재명버튼을 누를경우 해당하는 ajax 실행. */
		$.ajax({
			url: "/user/json/comeBackUser/"+comebackId,
			method: "GET",
			dataType: "json",
			headers: { "Accpet" : "application/json", "Content-Type" : "application/json" },
			success: function(JSONData, status) {
				if( JSONData.message == "comeBackFail" ) {
					console.log("No Search ReturnData");
				}else {
					console.log("Yes Search ReturnData ==>"+JSONData);
					getDeletedUserList(searchCondition, searchKeyword);
				}/* end of else */
			},/* end of success */
			/* 에러일시. */
			error: function(JSONData, status, error) {
				console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
			}/* end of error */
		});/* end of ajax */
	}/* end of deletedUser() */
	
	
	/* 재명된 회원들의 목록을 확인하는 ajax */
	function getDeletedUserList(searchCondition, searchKeyword) {
		/* 재명된 회원목록을 검색할 경우.. */
		$.ajax({
			url: "/user/json/getDeletedUserList",
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
						/* tag를 append하기 위한 필드생성 */
						var appendHtml = 	"<tr>"+
												"<td>"+JSONData.list[i].userName+"</td>"+
												"<td>"+JSONData.list[i].userId+"</td>"+
												"<td></td>"+
												"<td></td>"+
												"<td><button type='button' class='btn btn-warning btn-lg' style='font-size: 35px;'>재명취소</button>"+
												"<input type='hidden' name='comebackId' value='"+JSONData.list[i].userId+"'/></td>"+
											"</tr>";
						/* tbody tag안에 어펜드 */
						$('tbody').append(appendHtml);
					}/* end of for  */
				}/* end of else */
			},/* end of seccess */
			error:function(request,status,error){
		        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
		    }/* end of error  */
		});/* end of ajax */
	};/* end of getDeletedUserList() */
	
	
	/* 회원목록을 조회하는 ajax */
	function getUserList(searchCondition, searchKeyword) {
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
						/* tag를 append하기 위한 필드생성 */
						var appendName = '';
						/* 리더와 일반청년을 append 하기위한 조건문..원래 html에서 c:if를 사용하기때문에 script에선 if문으로 구현 */
						/* 1=리더, 0=일반청년 */
						if( JSONData.list[i].userPosition == '0') {
							appendName = "일반청년";
						}else if ( JSONData.list[i].userPosition == '1'){
							appendName = "리더";
						} 	
						/* tag를 append하기 위한 필드 인스턴스 */
						var appendHtml = 	"<tr>"+
												"<td>"+JSONData.list[i].userName+"</td>"+
												"<td>"+JSONData.list[i].userId+"</td>"+
												"<td>"+JSONData.list[i].nickName+"</td>"+
												"<td>"+appendName+"</td>"+
												"<td><button type='button' class='btn btn-danger btn-lg' style='font-size: 35px;'>재명</button>"+
												"<input type='hidden' name='userId' value='"+JSONData.list[i].userId+"'/></td>"+
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
	}/* end of getUserList() */
	
	
	/* 관리자가 회원의 상세정보를 보기 원할 경우 */
	$(function() {
		$('td:nth-child(1)').on('click', function() {
			var userId = $(this).find($('input[name="userId"]')).val();
			self.location = "/user/getAdminUser?userId="+userId;
		});
	});/* end of function */
</script>


<body>
    <!-- toolbar include -->
    <header class="header" style="z-index: 2;">
    	<jsp:include page="../toolbar/toolBar.jsp"/>
    </header>
   	
    <div class="userList_box">
    
	    <ul class="nav nav-pills nav-fill" style="margin-bottom: 40px;">
		  	<li class="nav-item">
		    	<a class="nav-link active" href="/user/getUserList" style="background: #F5A9BC; font-size:40px;">가입자 (${resultPage.totalCount}명)</a>
		  	</li>
		  	<li class="nav-item">
		    	<a class="nav-link" href="/user/getFenceList" style="color:#F5A9BC; font-size:40px;">울타리편성</a>
		  	</li>
		  	<li class="nav-item">
    			<a class="nav-link" href="/user/getAddUserAdminList" style="color:#F5A9BC; font-size:40px;">청년목록</a>
    		</li>
		</ul>
	    
       <form class="form-inline" name="detailForm">
<!--            <input type="hidden" id="boardName" name="boardName" value="${param.boardName}"/>-->
            <div class="form-group">
                <select class="form-control" name="searchCondition" style="height:80px; width:170px; font-size:40px;">
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
                <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어" style="height:80px; width:300px; font-size:40px;"/>
            </div>
            <div style="margin-left:50px;">
	            <label style="font-size:25px; margin-left: 0px;">재명된 회원보기</label>
				<input type="checkbox" id="switch1" name="switch1" class="input__on-off" style=""> 
				<label for="switch1" class="label__on-off"> 
					<span class="marble"></span> 
					<span class="on">on</span> 
					<span class="off">off</span> 
				</label>
			</div>
			<div class="custom-control custom-switch" style="margin-left: 6%;">
			  <input type="checkbox" class="custom-control-input" id="customSwitch1" style="width: 60px; height: 50px;">
			  
			</div>
     	</form>
        <table class="table" style="margin-top: 40px;">
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
				<c:forEach var="user" items="${ list }" varStatus="status">
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
		              <td><button type="button" class="btn btn-danger btn-lg" style="font-size: 35px;">재명</button>
		              <input type="hidden" name="userId" value="${ user.userId }"/></td>
		            </tr>
	            </c:forEach>
         	</tbody>
        </table>
        <jsp:include page="/common/pageNavigator_new.jsp"></jsp:include>
    </div>
</body>
</html>