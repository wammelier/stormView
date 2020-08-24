<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>getFenceReportList</title>

    <!--JqueryMobile CDN-->
    <link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>

    <!-- bootStrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <!-- bootStrap js -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</head>

<style>
    th {font-size: 15px;}
    td {font-size: 15px;}
    /* .form-control {font-size: 13px; height: 25px;}
    .select_room {margin: 20px; width: 200px; height: 40px;} */
</style>

<body>

    <section data-role="page">
    
        <div data-role="header" style="z-index: 1;">
    		<jsp:include page="../toolbar/toolBar.jsp"/>
    	</div>
    	
        <div class="content" data-role="content">
          <div class="select_room">
           <select class="form-control" name="searchCondition">
                    <c:if test="${empty search.searchCondition }">
                    <option class="from-option" value="0" selected="selected" >1��</option>
                    <option class="from-option" value="1" >2��</option>
                    <option class="from-option" value="2" >3��</option>
                    <option class="from-option" value="3" >4��</option>
                    </c:if>
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
                  <th scope="col">��ȣ</th>
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
                  <th scope="row">1</th>
                  <td>�̽�ȯ</td>
                  <td><a href="">����</a></td>
                  <td><a href="">����</a></td>
                  <td><a href="">����</a></td>
                  <td><a href="">����</a></td>
                  <td><a href="">����</a></td>
                </tr>
                <tr>
                  <th scope="row">2</th>
                  <td>��¹�</td>
                  <td><a href="">����</a></td>
                  <td><a href="">����</a></td>
                  <td><a href="">����</a></td>
                  <td><a href="">����</a></td>
                  <td><a href="">����</a></td>
                </tr>
                <tr>
                  <th scope="row">3</th>
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