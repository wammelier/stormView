<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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

<script type="text/javascript">
	
	/* function fncGetUserList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "GET").attr("selected" , "/user/getFenceList").submit();
	};//end of getUserList(CurrentPage)

	$(function() {
		 $( ".form-control" ).change(function() {
		 	fncGetUserList(1);
		 }); 
	});//end of function */ 
	
	$(function() {
		$('.form-control').attr("option","selected").change(function() {
			
			/* 이렇게 static한 값을 설정하는 이유 :: 
				getUserList의 같은 쿼리를 사용하기위해 leader_name 콜룸을 검색할수 있는 condition값이 필요해서... */
			var searchCondition = '3';
			var searchKeyword = $('.form-control option:selected').val();
			
			//회원목록을 검색할 경우
			$.ajax({
				url: "/user/json/getFenceList",
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
						
						/* html을 새로 append하기 위해 기존 데이터를 ""으로 만듬 */
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
							
							/* null보단 널스트링을 디폴트로 넣는게 좋음.. */
							var appendGender = '';
							
							/* 성별이 남자인경우와 여자인경우를 디비에서 0,1 숫자 플래그로 표시하기 때문에 필요한 조건문.. */
							if( JSONData.list[i].gender == '0'){
								var appendGender = '자매';
							}else {
								var appendGender = '형제';
							}
							
							/* tag를 append하기 위한 필드생성 */
							var appendHtml = 	"<tr>"+
													"<td>"+JSONData.list[i].userName+"</td>"+
													"<td>"+JSONData.list[i].birth+"</td>"+
													"<td>"+appendGender+"</td>"+
													"<td>"+JSONData.list[i].leaderName+" 울타리</td>"+
													"<td>"+
													"<select class='form-control form-control-lg' style='width:140px; height:60px; font-size:27px;'>"+
										              "<c:forEach var='leader' items='${ leaderList }'>"+
									                  	"<option class='from-option' value='0' >${ leader.leaderName }</option>"+
														"</c:forEach>"+
														"</select>"+
										              "<button type='button' class='btn btn-success btn-lg'>편성</button></td>"+
												"</tr>";
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
    			<a class="nav-link active" href="/user/getFenceList" style="background: #F5A9BC;">울타리편성</a>
    		</li>
    		<li class="nav-item">
    			<a class="nav-link" href="/user/getAddUserAdminList" style="color:#F5A9BC;">가입시킬 청년목록</a>
    		</li>
		</ul>
        
        <form class="form-inline" name="detailForm">
           
            <div class="form-group" style="margin-bottom: 30px;">
                <select class="form-control form-control-lg" style="width:230px; height:60px; font-size:27px;">
	                <c:set var="i" value="0"/>
	                <option class="from-option" value="" selected="selected" >전체</option>
					<c:forEach var="leader" items="${ leaderList }">
	                    <c:if test="${empty search.searchCondition }">
		                    <option class="from-option" value="${ leader.leaderName }" >${ leader.leaderName } 울타리</option>
	                    </c:if>
	 
	                    <c:if test="${!empty search.searchCondition }">
		                    <option class="from-option" value=""  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>전체</option>
		                    <option class="from-option" value="${ leader.leaderName }"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>${ leader.leaderName }</option>
	                    </c:if>
                  	</c:forEach>

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
	            <c:set var="i" value="0"/>
				<c:forEach var="user" items="${ list }">
		            <tr>
		              <td>${ user.userName }</td>
		              <td>${ user.birth }</td>
		              <c:if test="${ user.gender == '0' }">
		              	<td>자매</td>
		              </c:if>
		              <c:if test="${ user.gender == '1' }">
		              	<td>형제</td>
		              </c:if>
		              <td>${ user.leaderName } 울타리</td>
		              <td>
		              <select class="form-control form-control-lg" style="width:140px; height:60px; font-size:27px;">
		              <c:forEach var="leader" items="${ leaderList }">
	                  	<option class="from-option" value="0" >${ leader.leaderName }</option>
						</c:forEach>
						</select>
		              <button type="button" class="btn btn-success btn-lg">편성</button></td>
		            </tr>
		             <!--  <td><button type="button" class="btn btn-warning btn-lg">취소</button></td> -->
	            </c:forEach>
	            
            </tbody>
        </table>
        </form>
        <jsp:include page="/common/pageNavigator_new.jsp"></jsp:include>
    </div>
    
</body>
</html>