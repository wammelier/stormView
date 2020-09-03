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

<style>

/*���� ��� �޴���*/
    header {height: 260px; box-shadow: 0px 2px 0px 0px #bdbdbd; position: absolute;}
    .header_top {top:0px; left: 0px; right: 0px; position: fixed; display: flex; justify-content: space-between; width: 100%; height: 130px; background: #ffffff;}
    header .main_logo {margin-left: 10px; margin-top: 10px; float: left; width: 30%; height: 75%;}
    header .logo_img {width: 100%; height: 100%;}
    header .fa-search {float: ; margin-top: 20px; margin-right: 10px; border-radius: 180px; width: 80px; height: 60%; background: #9c27b0; font-size: 40px; background: #f5f5f5; color: #616161; text-align: center; line-height: 75px;}
    header .fa-cog{float: ; margin-top: 20px; margin-right: 0px; border-radius: 180px; width: 80px; height: 60%; font-size: 40px; color: #616161; text-align: center; line-height: 75px;}
    header .admin_menu {padding-top: 5%; font-size: 30px; font-weight: bold;}
    
    /*�ι�° ��� �޴���*/
    .header_under {top: 130px; left: 0px; position: fixed; display: flex; height: 130px; width: 100%; z-index: auto; background: #ffffff;}
    .headersub_icon {float: left; margin: 0% 0% 0% 0%; width: 30%; height: 100%;}
    .pic {width: 100%; height: 100%;}
    
    /* ���̺� ���� CSS  */
    th {font-size: 25px;}
    td {font-size: 25px;}
    .form-control {font-size: 30px; height: 100%;}
    .select_room {margin: 20px; margin-top: 300px; width: 200px; height: 50px;}
    table {margin-top: 20px;}
    
    
</style>

<script type="text/javascript">

	$(function(){
		$('a').on("click", function(){
			var a = $('input').val();
			alert(a);
			
		})
		
	})
</script>

<body>

    <section data-role="page">
    
        <header class="header" data-role="header">
           <div class="header_top">
                <div id="main_log" class="main_logo">
	                <a href="/main.jsp">
	                	<img class="logo_img" src="/resources/stormLogo.png">
	                </a>
                </div>
                <div>
	                <i class="fas fa-search"></i>
	                <a href="/view/admin/getUserList.jsp"><i class="fas fa-cog"></i></a>
                </div>
            </div>

            <div class="header_under">
                <div class="headersub_icon">
                	<a href="/view/user/getUser.jsp">
                    	<img id="main_logo_img" src="/resources/strompic2.jpeg" style="margin-top: 10%; margin-left: 30%; border-radius: 50%; width: 40%; height: 70%;">
                    </a>
                </div>
                <div class="headersub_icon">
                    <img id="notice_post" class="pic" src="/resources/mainIconNotifyBlack.png">
                </div>
                <div class="headersub_icon">
                	<a href="/view/post/addPost.jsp">
                    	<img id="share_post" class="pic" src="/resources/mainIconShareBlack.png">
                    </a>
                </div>
                <div class="headersub_icon">
                	<a href="/view/post/addPost.jsp">
                    	<img id="imgage_post" class="pic" src="/resources/mainIconImgBlack.png">
                    </a>
                </div>
                <div class="headersub_icon">
                	<a href="/view/fence/getFenceReportList.jsp">
                    	<img id="fence_post" class="pic" src="/resources/mainIconFencePink.png">
                    </a>
                </div>
            </div>
        </header> 
    	
        <div class="content" data-role="content">
          <div class="select_room">
           <select class="form-control" name="searchCondition">
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
                  <td><input type="hidden" value="1"><a href="">��</a></td>
                  <td><input type="hidden" value="2"><a href="">����</a></td>
                  <td><input type="hidden" value="3"><a href="">����</a></td>
                  <td><input type="hidden" value="4"><a href="">����</a></td>
                  <td><input type="hidden" value="5"><a href="">����</a></td>
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