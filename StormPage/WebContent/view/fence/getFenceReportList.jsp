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
    
    <!-- FontAwesome ������-->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	
	<!-- �������� js �̰� �־�� �ڹٽ�ũ��Ʈ $�� ����  -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	
</head>

<script type="text/javascript">
	$(function() {
		$('#fence_post').attr('src', '/resources/mainIconFencePink.png');
	});/* end of function() */
</script>

<style>
    /* ���̺� ���� CSS  */
    th {font-size: 40px;}
    td {font-size: 40px;}
    .form-control {font-size: 30px; height: 100%;}
    .select_room {margin: 20px; margin-top: 320px; width: 200px; height: 50px;}
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
          <div class="select_room">
           <select class="form-control" name="searchCondition" style="height: 50px; font-size: 30px;">
              <option class="from-option" value="0" selected="selected" >1��</option>
              <option class="from-option" value="1" >2��</option>
              <option class="from-option" value="2" >3��</option>
              <option class="from-option" value="3" >4��</option>
<!--
              <c:if test="${!empty search.searchCondition }">
              <option class="from-option" value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>���̵�</option>
              <option class="from-option" value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>�г���</option>
              <option class="from-option" value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>�̸�</option>
              </c:if>
-->
           </select>
          </div>
            <table class="table table-striped">
              <thead>
                <tr>
                  <th scope="col">�̸�</th>
                  <th scope="col">1����</th>
                  <th scope="col">2����</th>
                  <th scope="col">3����</th>
                  <th scope="col">4����</th>
                  <th scope="col">5����</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>�̽�ȯ</td>
                  <td><input type="hidden" value="1"><a href="">��</a></td>
                  <td><input type="hidden" value="2"><a href="">����</a></td>
                  <td><input type="hidden" value="3"><a href="">����</a></td>
                  <td><input type="hidden" value="4"><a href="">����</a></td>
                  <td><input type="hidden" value="5"><a href="">����</a></td>
                </tr>
                <tr>
                  <td>��¹�</td>
                  <td><a href="">����</a></td>
                  <td><a href="">����</a></td>
                  <td><a href="">����</a></td>
                  <td><a href="">����</a></td>
                  <td><a href="">����</a></td>
                </tr>
                <tr>
                  <td>�鿹��</td>
                  <td><a href="">����</a></td>
                  <td><a href="">����</a></td>
                  <td><a href="">����</a></td>
                  <td><a href="">����</a></td>
                  <td><a href="">X</a></td>
                </tr>
              </tbody>
            </table>
        </div>
    </section>
</body></html>