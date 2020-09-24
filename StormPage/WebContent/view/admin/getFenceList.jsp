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
	
	$(function() {
		/* option 태그가 바뀔때 selected되는 값을 가져오기 위해.. */
		$('#mainSelect').attr("option","selected").change(function() {
			
			/* 이렇게 static한 값을 설정하는 이유 :: 
				option태그에서 selected 된 값을 통해 바로 디비 검색을 하기위해 사용.. */
			/* 토탈카운트 디비 때문에 숫자를 계속 이어가야함.. 이전에 getUserList 에서 1,2를 사용하고 있기때문.
			option에서 울타리이름을 클릭했을 경우 컨디션을 3으로. */
			var searchCondition = $('#mainSelect option:selected').val();
			if(searchCondition != '0') {
				searchCondition = '3';
			}
			/* option에서 울타리 전체를 클릭했을 경우 키워드를 널스티링. */
			var searchKeyword = $(this).find($('#mainSelect option:selected')).val();
			if( searchKeyword == '0' ) {
				searchKeyword = '';
			}else if (searchKeyword == 'none' ) {
				searchKeyword = null;
			}
			console.log(searchKeyword);
			console.log(searchCondition);
			
			/* 회원목록을 조회하기위한 데이터를 로드.. */
			getFenceList(searchKeyword, searchCondition);
		}); /* end of event */
		
		
	}); /* end of function */
	
	/* 편성버튼을 누를경우 해당하는 청년의 리더네임이 변경된다. */
	function updateLeaderName(indexNo) {
		/* 편성후 table list를 계속 유지시키기위해 검색조건 static field생성. 3인 이유는 위에 적혀있음. */
		var searchCondition = '3';
		var searchKeyword = '';
		/* indexNo를 가져오는 이유는 해당하는 table row 만을 선택하고 싶은데 그럴수가 없어서 html쪽에 
		varstatus 속성을 추가하여 각 select태그 마다 인덱스 번호가 부여되게 만듬. */
		if(  $('#leaderNameSelect'+indexNo).attr('option','selected').val() != 'none' ) {
			var leaderName = $('#leaderNameSelect'+indexNo).attr('option','selected').val();
		}else {
			var leaderName = null;
		}
		console.log(leaderName);
		var userName = $('#'+indexNo).val();
		$.ajax({
			url: "/user/json/updateLeaderName",
			method: "POST",
			dataType: "json",
			headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
			data: JSON.stringify({
				userName: userName,
				leaderName: leaderName
			}),
			success: function(JSONData, status){
				if( JSONData.message == "updateFail") {
					console.log("No Search ReturnData");
				}else{
					console.log("Yes Search ReturnData!! ==>"+JSONData);
					getFenceList(searchKeyword, searchCondition);
				}/* end of else */
			},/* end of success */
			error:function(request,status,error) {
				console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			}/* end of error */
		});
	};
	
	
	
	/* 울타리 편성현황을 조회하기위한 기능. */
	function getFenceList(searchKeyword, searchCondition) {
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
						
						/* 성별이 남자인경우와 여자인경우를 디비에서 0,1 숫자 플래그로 표시하기 때문에 필요한 조건문.. */
						if( JSONData.list[i].gender == '0'){
							var appendGender = '자매';
						}else if(JSONData.list[i].gender == '1') {
							var appendGender = '형제';
						/* 성별이 아무것도 기입되어있지 않은경우. */	
						}else if(JSONData.list[i].gender == null) {
							var appendGender = '없음.';
						}
						/* 생일이 아무것도 기입되어있지 않은경우. */
						if( JSONData.list[i].birth == null) {
							var apendBirth = '정보없음.'; 
						}
						/* 회원이름과 리더이름이 같으면 그사람은 리더이기 때문에 다른 울타리에 편성이 안되어야한다. */
						/* 리더가 아닌경우.. */
						if( JSONData.list[i].userName != JSONData.list[i].leaderName ) {
							var appendSelectTag = 
							"<option class='from-option' value='none'>편성안됨</option>"+
							"<c:forEach var='leader' items='${ leaderList }' varStatus='subStatus'>"+
                  			"<option class='from-option' value='${ leader.leaderName }' ${ subStatus.index == 0 && subStatus.index != null ? 'selected' : '' }>${ leader.leaderName }</option>"+
							"</c:forEach>";
							var appendButtonTag = "<button type='button' class='btn btn-success btn-lg' onclick='updateLeaderName(\""+i+"\")'>편성</button>";
						/* 리더인 경우.. 편성울타리랑 버튼까지 널스트링*/
						}else if ( JSONData.list[i].userName == JSONData.list[i].leaderName ) {
							var appendSelectTag = "";
							var appendButtonTag = "";
						}
						
						if ( JSONData.list[i].leaderName == null ) {
							var appendLeaderName = '편성안됨';
						}else {
							var appendLeaderName = JSONData.list[i].leaderName+"울타리";
						}
						
						/* tag를 append하기 위한 필드생성 */
						var appendHtml = "<tr>"+
											"<td>"+JSONData.list[i].userName+
												"<input id='"+i+"' type='hidden' value='"+JSONData.list[i].userName+"'/>"+
											"</td>"+ 
											"<td>"+apendBirth+"</td>"+
											"<td>"+appendGender+"</td>"+
											"<td>"+appendLeaderName+"</td>"+
											"<td>"+
												"<select id='leaderNameSelect"+i+"' class='form-control form-control-lg' style='width:160px; height:60px; font-size:27px;'>"+
												appendSelectTag+
												"</select>"+
												appendButtonTag+"</td>"+
											"</tr>";
											
						/* tag append */
						$('tbody').append(appendHtml);
					}/* end of for  */
				}/* end of else  */
			}, /* end of success */
			
			/* 에러일 경우!! */
			error:function(request,status,error){
		        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
		    }/* end of error  */
		}); /* end of ajax */
	}/* end of getFenceList() */
	
	
		
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
                <select id="mainSelect" class="form-control form-control-lg" style="width:230px; height:60px; font-size:27px;">
	                <c:set var="i" value="0"/>
	                <option class="from-option" value="0" selected="selected" >전체</option>
	                <option class="from-option" value="none" >편성안됨</option>
					<c:forEach var="leader" items="${ leaderList }">
	                    <c:if test="${empty search.searchCondition }">
		                    <option class="from-option" value="${ leader.leaderName }" >${ leader.leaderName } 울타리</option>
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
				<c:forEach var="user" items="${ list }" varStatus="status">
		            <tr>
		              <td>${ user.userName }
		              <input id="${ status.index }" type="hidden" value="${ user.userName }"/></td>
		              <c:if test="${ user.birth == null }">
		              	<td>정보없음.</td>
		              </c:if>
		              <c:if test="${ user.birth != null }">
		              	<td>${ user.birth }</td>
		              </c:if>
		              <c:if test="${ user.gender == null }">
		              	<td>없음.</td>
		              </c:if>
		              <c:if test="${ user.gender == '0' }">
		              	<td>자매</td>
		              </c:if>
		              <c:if test="${ user.gender == '1' }">
		              	<td>형제</td>
		              </c:if>
		              <c:if test="${ user.leaderName != null }">
		              	<td>${ user.leaderName } 울타리</td>
		              </c:if>
		              <c:if test="${ user.leaderName == null }">
		              	<td>편성안됨</td>
		              </c:if>
		              <td>
		              <select id="leaderNameSelect${ status.index }" class="form-control form-control-lg" style="width:160px; height:60px; font-size:27px;">
		              		<c:if test="${ user.userName != user.leaderName }">
		              			<option class="from-option" value="none">편성안됨</option>
				                <c:forEach var="leader" items="${ leaderList }" varStatus="subStatus">
			                  		<option class="from-option" value="${ leader.leaderName }" ${ subStatus.index == 0 && subStatus.index != null ? "selected" : "" } >${ leader.leaderName }</option>
								</c:forEach>
							</c:if>
							<c:if test="${ user.userName == user.leaderName }">
							</c:if>
						</select>
						<c:if test="${ user.userName != user.leaderName }">
							<button type="button" class="btn btn-success btn-lg" onclick="updateLeaderName('${ status.index }')">편성</button>
						</c:if>
						<c:if test="${ user.userName == user.leaderName }">
						</c:if>
						</td>
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