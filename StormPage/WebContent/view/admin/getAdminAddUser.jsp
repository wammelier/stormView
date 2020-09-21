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
    th {font-size: 30px;}
    td {font-size: 28px;}
    .form-group { width: 100%; height: 30px;}
    a{font-size:33px;}
    
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
	$('td:nth-child(1)').on('click', function() {
		var userName = $('input[name="userName"]').val();
		alert(userName);
		self.location = "/user/getUserAdmin?userName="+userName;
		
	});
	
	$('#addButton').on('click', function() {
		swal({
			  title: "정말 삭제하시겠습니까?",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
			    swal("삭제되었습니다!", {
			      icon: "success",
			    });
			  } else {
			    swal("삭제가 취소되었습니다.!");
			  }
			});
	})
	
	$('#deleteButton').click(function() { 
		
		/* 회원의 이름을(이름이 pk입니다.) 통해 해당하는 테이블 목록을 삭제하기위해 */
		var userName = $('input[name="userName"]').val();
				  
		/* sql에서 해당하는 keyword와 condition값을 설정해야 list가 불러와지게 설계.. */
		/* 현재 사용중인 jsp에선 keyword와 condition값을 필요로하지 않기 때문에 널스트링을 설정 */
		var searchKeyword = "";
		var searchCondition = "";
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
										
										/* 유저의 가입여부에 따른 버튼종류(0=가입안됨, 1=가입됨), 삭제버튼 종류(0=삭제,1=삭제불가) */
										if( JSONData.list[i].signupFlag == 0) {
											var signupFlag = '가입안됨';
											var deleteButton = 
												'<button type="button" class="btn btn-danger btn-lg" onclick="deleteUserAdmin()">삭제</button>';
										}else if ( JSONData.list[i].signupFlag == 1 ) {
											var signupFlag = '가입됨';
											var deleteButton = '삭제불가';
										}/* end of else if */
										
										/* 리더를 임명하는 버튼 종류 (0=임명, 1=임명취소) */
										if( JSONData.list[i].userPosition == 0) {
											var leaderButton = '<button type="button" class="btn btn-success btn-lg">리더임명</button>';
										}else if( JSONData.list[i].userPosition == 1) {
											var leaderButton = '<button type="button" class="btn btn-warning btn-lg">임명취소</button>';
										}/* end of else if */
										/* 삭제후 테이블을 비동기방식으로 어펜드 하기위한 필드.. */
										var appendTag = '<tr>'+
															'<td>'+JSONData.list[i].userName+'</td>'+
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
						});/* end of innerAjax */
					}else {
						console.log("값이 없습니다..")
					}
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
	});/* end of deleteUserAdmin() */
});/* end of function */


</script>
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
    			<a class="nav-link active" href="/user/getAddUserAdminList" style="background: #F5A9BC;">가입시킬 청년목록</a>
    		</li>
		</ul>
       	<button type="button" id ="addButton" class="btn btn-primary btn-lg" style="margin-left:10px; margin-top: 10px; font-size: 35px; background: #F5A9BC;">가입시킬 청년추가</button>
     </div>
        <form method="get">    
         <table class="table">
            <thead>
	            <tr>
	                <th scope="col">이름</th>
	                <th scope="col">휴대폰번호</th>
	                <th scope="col">가입여부</th>
	                <th scope="col">리더임명</th>
	                <th scope="col">삭제여부
	                
	                </th>
	            </tr>
            </thead>
            <tbody>
             <c:set var="i" value="0"/>
				<c:forEach var="user" items="${ list }">
		            <tr>
		              <td>${ user.userName }
		              <input type="hidden" id="userName" name="userName" value="${ user.userName }"/></td>
		              <td>${ user.phone }</td>
		              <c:if test="${ user.signupFlag == '0' }">
		              	<td>가입안됨</td>
		              </c:if>
		              <c:if test="${ user.signupFlag == '1' }">
		              	<td>가입됨</td>
		              </c:if>
		              <c:if test="${ user.userPosition == '0' }">
		              	<td><button type="button" class="btn btn-success btn-lg">리더임명</button></td>
		              </c:if>
		              <c:if test="${ user.userPosition == '1' }">
		              	<td><button type="button" class="btn btn-warning btn-lg">임명취소</button></td>
		              </c:if>
		              <c:if test="${ user.signupFlag == '0' }">
		   				<td><button type="button" id="deleteButton" class="btn btn-danger btn-lg">삭제</button></td>
		              </c:if>
		              <c:if test="${ user.signupFlag == '1' }">
		              	<td>삭제불가</td>
		              </c:if>
		            </tr>
	            </c:forEach>
            </tbody>
        </table>
        </form>
		<jsp:include page="/common/pageNavigator_new.jsp"></jsp:include>    
</body>
</html>