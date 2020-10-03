<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html" charset="EUC-KR">
    <title>getFenceList</title>
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
    .content {margin: 10px 10px 20px; margin-top: 300px;}
    th {font-size: 40px;}
    td {font-size: 33px;}
    .form-group { width: 100%; height: 30px;}
    a{font-size:33px;}
    table {margin-left: 20px; margin-top: 30px;}
    
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
}
</style>

<script type="text/javascript">

/* 관리자가 작성한 회원의 상세정보를 수정하거나 열람하기를 원할 경우 */
$(function() {
	$(document).on('click', 'td:nth-child(1)', function() {
		var userName = $(this).find($('input[name="userName"]')).val();
		self.location = "/user/getUserAdmin?userName="+userName;
	});
});
	
	/* 관리자가 추가한 유저를 삭제하는 경우 */
	function deleteUserAdmin(userName) {
		swal({
			  title: "정말 삭제하시겠습니까?",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
		})/* end of swal */
		.then((willDelete) => {
		/* 스위트알럿 확인버튼을 누를경우 */
		  if (willDelete) {
				$.ajax ({
					url: "/user/json/deleteNamePhone/"+userName,
					method: "GET",
					dataType: "json",
					headers: { "Accept" : "application/json", "Content-Type" : "application/json; charset= UTF-8"},
					success: function(JSONData) {
						/* restController에서 delete되는 순간 map에 key= message value = deleteOk 를 담아서 view에 전달.. */
						if(JSONData.message == "deleteOk"){
							getUserAdminList();
						}else {
							console.log("값이 없습니다..")
						}/* end of else */
					},/* end of success */
					error: function(request, status, error) {
						console.log('code = ' +request.status + ' message =' + request.responseText + 'error =' +error);
					}/* end of error */
				});/* end of outterAjax */
				
			swal("삭제되었습니다!", {
		      icon: "success",
		    });/* end of swal */
		    
			/* 스위트알럿 취소버튼을 누를경우 */
		  } else {
		    swal("삭제가 취소되었습니다.!");
		  }/* end of else */
		});	/* end of then */
	/* ======================================== */ 
	/* ============ 스위트 알럿 끝!!============== */
	/* ======================================== */
	};/* end of deleteUserAdmin */



/* 리더를 임명할때.. */
function addLeader(userName) {
	$.ajax({
		url:"/user/json/updatePositionLeader/"+userName,
		method: "GET",
		dataType: "json",
		headers: { "Accept" : "application/json", "Content-Type" : "application/json; charset= UTF-8"},
		success: function(JSONData) {
			/* restController 로 부터 오는 data값.. */
			if(JSONData.message == "updateOk"){
				getUserAdminList()
			}/* end of if */
		},/* end of success */
		error: function(request, status, error) {
			console.log('code = '+request.status + 'message ='+ request.responseText + 'error =' + error);	
		},/* end of error */
	});/* end of ajax */
};/* end of function addLeader() */



/* 리더임명을 취소할때.. */
function deleteLeader(userName) {
	$.ajax({
		url:"/user/json/deleteLeaderPostion/"+userName,
		method: "GET",
		dataType: "json",
		headers: { "Accept" : "application/json", "Content-Type" : "application/json; charset= UTF-8"},
		success: function(JSONData) {
			/* restController 로 부터 오는 data값.. */
			if(JSONData.message == "deleteOk"){
				$('#'+userName+':nth').remove();
				$('#'+userName+':nth').html('<td><button type="button" id="'+userName+'" class="btn btn-warning btn-lg" style="font-size:30px;" onclick="deleteLeader(\''+userName+'\')">임명취소</button></td>')
				getUserAdminList();
			}/* end of if */
		},/* end of success */
		error: function(request, status, error) {
			console.log('code = '+request.status + 'message ='+ request.responseText + 'error =' + error);	
		},/* end of error */
	});/* end of ajax */
};/* end of function DeleteLeader() */



/* 각종 이벤트마다 테이블의 데이터를 리로드하기 위해 list Data 들을 ajax처리함. */
function getUserAdminList() {
	
	var searchKeyword = '';
	var searchCondition = '';
	
	$.ajax ({
		url: "/user/json/getAddUserAdminList",
		method: "POST",
		dataType: "json",
		headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
		data: JSON.stringify ({
			searchKeyword: searchKeyword,
			searchCondition : searchCondition
		}),
		success: function(JSONData, status) {
			if( JSONData == null || JSONData == "" ) {
				console.log("No Search ReturnData");
			}else{
				console.log("Yes Search ReturnData!! ==>"+JSONData);
				
				$('tbody').children().remove();
				
				for(var i = 0; i<JSONData.list.length; i++) {
					
					/* 삭제버튼 종류(0=삭제,1=삭제불가) */
					if( JSONData.list[i].signupFlag == 0 && JSONData.list[i].userPosition == 0) {
						var deleteButton = 
							'<button type="button" class="btn btn-danger btn-lg" style="font-size:30px;" onclick="deleteUserAdmin(\''+JSONData.list[i].userName+'\')">삭제</button>';
					}else if ( JSONData.list[i].signupFlag == 1 || JSONData.list[i].userPosition == 1) {
						var deleteButton = '삭제불가';
					}
					/* 유저의 가입여부에 따른 버튼종류(0=가입안됨, 1=가입됨) */
					if( JSONData.list[i].signupFlag == 0 ) {
						var signupFlag = '가입안됨';
					}else if ( JSONData.list[i].signupFlag == 1 ) {
						var signupFlag = '가입됨';
					}
					/* 리더를 임명하는 버튼 종류 (0=임명, 1=임명취소) */
					if( JSONData.list[i].userPosition == 0) {
						var leaderButton = '<button type="button" id="'+JSONData.list[i].userName+'" class="btn btn-success btn-lg" style="font-size:30px;" onclick="addLeader(\''+JSONData.list[i].userName+'\')">리더임명</button></td>';
					}else if( JSONData.list[i].userPosition == 1) {
						var leaderButton = '<button type="button" id="'+JSONData.list[i].userName+'" class="btn btn-warning btn-lg" style="font-size:30px;" onclick="deleteLeader(\''+JSONData.list[i].userName+'\')">임명취소</button></td>';
						
					}/* end of else if */
					/* 삭제후 테이블을 비동기방식으로 어펜드 하기위한 필드.. */
					var appendTag = '<tr>'+
										'<td>'+JSONData.list[i].userName+
										'<input type="hidden" name="userName" value=\"'+JSONData.list[i].userName+'\"/>'+
										'</td>'+
										'<td>'+JSONData.list[i].phone+'</td>'+
										'<td>'+signupFlag+'</td>'+
										'<td>'+leaderButton+'</td>'+
										'<td>'+deleteButton+'</td>';
					/* 태그 어펜드 .. */
					$('tbody').append(appendTag);
				}/* end of for */
			}/* end of else */
		},/* end fo success */
		error: function(request, status, error) {
			console.log('code = ' + request.status + 'message = ' + request.responseText + 'error = ' +error);
		}/* end of error */
	});/* end of Ajax */
};/* end of getUseAdminList */



/* 가입시킬 청년추가 버튼 누를때 보이고 숨기는 기능. */
function addUserButton() {
	if($('#addUserAdmin').css('display') == 'none') { 
		document.getElementById('addUserAdmin').style.display="block";
	}else {
		document.getElementById('addUserAdmin').style.display="none";
	}/* end of else */
};/* end of addUserButton() */



/* 가입시킬 유저 추가 버튼을 누르는 기능. */
function successButton() {
	var addName = $('#addName').val();
	var addPhone = $('#addPhone').val();
	 
	$.ajax ({
		url: "/user/json/addUserAdmin",
		method: "POST",
		dataType: "json",
		headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
		data: JSON.stringify ({
			userName : addName,
			phone : addPhone
		}),
		success: function(JSONData, status) {
			if(JSONData.message == 'addFailName'){
				swal("해당 이름이 이미 존재합니다.", "이미 추가하셨습니다.");	
			}else if(JSONData.message == 'addOk') {
				getUserAdminList();
				swal("", "등록되었습니다.", "success");
				$('#addName').val('');
				$('#addPhone').val('');
			}/* end of else if */
		}/* end of success */
	});/* end of ajax */
};/* end of function */


</script>
<body>
	
    <!-- toolbar include -->
    <header class="header">
   	    <jsp:include page="../toolbar/toolBar.jsp"/>
   	</header>
 
    <div class="content">
    
		<ul class="nav nav-pills nav-fill">
  			<li class="nav-item">
    			<a class="nav-link" href="/user/getUserList" style="color:#F5A9BC; font-size:40px;">가입자</a>
  			</li>
  			<li class="nav-item">
    			<a class="nav-link" href="/user/getFenceList" style="color:#F5A9BC; font-size:40px;">울타리편성</a>
    		</li>
    		<li class="nav-item">
    			<a class="nav-link active" href="/user/getAddUserAdminList" style="background: #F5A9BC; font-size:40px;">청년목록</a>
    		</li>
		</ul>
		<div>
       		<button type="button" id ="addButton" class="btn btn-primary btn-lg" style="margin-left:10px; margin-top: 50px; font-size: 40px; background: #F5A9BC;" onclick="addUserButton();">가입시킬 청년추가</button>
       	</div>
       <div id="addUserAdmin" style="margin: 20px 20px 20px; width: 900px; height: 80px; display: none;" >
       		<input id="addName" class="form-control" type="text" placeholder="이름" maxlength="4" style="float: left; font-size:40px; width:20%; height:100%;">
       		<input id="addPhone" class="form-control" type="text" placeholder="휴대폰번호" maxlength="12" style="float:left; margin-left: 30px; font-size:40px; width:35%; height:100%;">
       		<button type='button' id='successButton' class='btn btn-primary btn-lg' style="float:left; margin-left: 20px; margin-top: 5px; height:90%; width:15%; font-size:35px;" onclick="successButton()">등록</button>
       </div>
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
             	<c:set var="i" value="0"/>
				<c:forEach var="user" items="${ list }">
					<tr>		
		              <td>${ user.userName }
		              <input type="hidden" name="userName" value="${ user.userName }"/></td>
		              <td>${ user.phone }</td>
		              <c:if test="${ user.signupFlag == '0' }">
		              	<td>가입안됨</td>
		              </c:if>
		              <c:if test="${ user.signupFlag == '1' }">
		              	<td>가입됨</td>
		              </c:if>
		              <c:if test="${ user.userPosition == '0' }">
		              	<td><button type="button" id="${ user.userName }" class="btn btn-success btn-lg" style="font-size:30px;" onclick="addLeader('${ user.userName }')">리더임명</button></td>
		              </c:if>
		              <c:if test="${ user.userPosition == '1' }">
		              	<td><button type="button" id="${ user.userName }" class="btn btn-warning btn-lg" style="font-size:30px;" onclick="deleteLeader('${ user.userName }')">임명취소</button></td>
		              </c:if>
		              <c:if test="${ user.signupFlag == '0' && user.userPosition == '0' }">
		   				<td><button type="button" id="deleteButton" class="btn btn-danger btn-lg" style="font-size:30px;" onclick="deleteUserAdmin('${ user.userName }')">삭제</button></td>
		              </c:if>
		              <c:if test="${ user.signupFlag == '1' || user.userPosition == '1' }">
		              	<td>삭제불가</td>
		              </c:if>
		            </tr>
	            </c:forEach>
            </tbody>
        </table>
		<jsp:include page="/common/pageNavigator_new.jsp"></jsp:include>  
</body>
</html>