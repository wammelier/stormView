<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="en">
<head>
   
    <meta charset="UTF-8">
    <title>getFenceReport</title>
    
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
    .content {margin-top: 290px; height: auto;}
    .top_header{overflow: hidden; height: 80px; box-shadow: 0px 7px 0px #f5f5f5;}
    .button_group {float: left; width: 40%; height: 100%;}
    .fence_name {float: left; font-size: 40px;}
    
    /* �޴� css  */
    .menu_name{overflow: hidden; padding-top: 10px; height: 70px; background: #F5A9BC;}
    .name {float: left; width: 15%; padding-left: 2%; height: 60px; font-size: 35px;}
    .praise {float: left; width: 85%; height: 60px; font-size: 35px;}
    
    /* ���� css */
    .report_content {width: 100%; padding-top: 5px; height: auto; text-shadow: 0px 0px 0px black;}
    .reader_name {float: left;  padding-left: 2%; padding-top: 10px; width: 15%; height: 100%; font-size: 30px;}
    .praise_content {padding: 3px; float: left; padding-top: 10px; width: 80%; font-size: 30px;}
    .button_div {float: left; width: 5%; padding-left: 1%; padding-top: 3%;}
    
    /* The Modal (background) */
    .modal {
        display: none; /* Hidden by default */
        position: fixed; /* Stay in place */
        z-index: 1; /* Sit on top */
        left: 0;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        overflow: auto; /* Enable scroll if needed */
        background-color: rgb(0,0,0); /* Fallback color */
        background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    }

    /* Modal Content/Box */
    .modal-content {
        background-color: #fefefe;
        margin: 30% 15% 15% auto; /* 15% from the top and centered */
        padding: 20px;
        border: 1px solid #888;
        border-radius: 30%;
        /* width: 100px; */ /* Could be more or less, depending on screen size */                          
    }
    /* The Close Button */
    .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }
    
   	p:hover,
   	p:focus {
   		color: black;
   		cursor: pointer;
   	}
    
</style>

<script type="text/javascript">

$(function(){
	

	//Get the modal
	var modal = document.getElementById('myModal');
	
	// Get the button that opens the modal
	var btn = document.getElementById("myBtn");
	
	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];                                          
	
	// When the user clicks on the button, open the modal 
	btn.onclick = function() {
	    modal.style.display = "block";
	}
	window.onclick = function(event) {
	    if (event.target == modal) {
	        modal.style.display = "none";
	    }
	}
});
</script>
<body>
    
    <div data-role="page">
       
	    <div data-role="header" style="z-index: 1;">
	    		<jsp:include page="../toolbar/toolBar.jsp"/>
	    </div>
        
        <div class="content" data-role="content">
          
            <div class="top_header">
                <div class="button_group">
                   <i class="fas fa-plus-circle" style=" color: #536dfe; margin-left: 20px; font-size: 60px;"></i>
                </div>
                <div class="fence_name">�̽�ȯ��Ÿ��</div>
            </div>
            
            <div class="menu_name">
                <div class="name">�̸�</div>
                <div class="praise">�⵵����</div>
            </div>
            
            <div class="report_content" style="display: ">
                <div class="reader_name">�̽�ȯ</div>
                <div class="praise_content">�⵵���� �׽�Ʈ ���Դϴ�.�⵵���� �׽�Ʈ ���Դϴ�.�⵵���� �׽�Ʈ ���Դϴ�.�⵵���� �׽�Ʈ ���Դϴ�.�⵵���� �׽�Ʈ ���Դϴ�.�⵵���� �׽�Ʈ ���Դϴ�.�⵵���� �׽�Ʈ ���Դϴ�.</div>
                <div class="button_div">
                     <i id="myBtn" class="fas fa-ellipsis-v" style="margin-top:30px; font-size:45px;"></i>
		
		                <!-- The Modal -->
		                <div id="myModal" class="modal">
		
		                  <!-- Modal content -->
		                  <div class="modal-content" style="width:70%;">
		                    <!-- <span class="close">&times;</span>  -->                                                              
		                    <p style="font-size: 40px; text-align: center;">�Խñۼ���</p>
		                    <p style="font-size: 40px; text-align: center;">�Խñۻ���</p>
		                  </div>

                		</div>
                </div>
            </div>
            
            
            <!-- ������ư�� ������� �� �������� ���� display block  -->
            <div class="report_content" style="display: block;">
                
                <div class="reader_name">
                   	 <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" style="width: 100px; height: 80px; font-size:30px;">
                </div>
                <div class="praise_content">
	                <div class="form-group">
					    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
			 	 	</div>
			 	 </div>
			 	 <div class="button_div">
                	<i class="fas fa-check" style="font-size: 40px; color: #43a047;"></i>
                </div>
            </div>

        </div>
    </div>
    
</body>
</html>