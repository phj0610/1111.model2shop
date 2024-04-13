<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	
         body {
            padding-top : 50px;
        }
        
        .btn{
        	color:black;
        }
        
  
    
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	    $(document).ready(function() {
	        // "Ȯ��" ��ũ�� ���� Ŭ�� �̺�Ʈ �ڵ鷯
	        $("button.btn").on("click", function() {
	            window.location.href = "/product/listProduct?menu=manage";
	        });
	        
	        // "�߰����" ��ũ�� ���� Ŭ�� �̺�Ʈ �ڵ鷯
	        $("a.btn").on("click", function() {
	            window.location.href = "/product/addProduct";
	        });
	    });
	</script>

	

</head>

<body>

<jsp:include page="/layout/toolbar.jsp" />

   	<div class="container">
   	
   				<div class="page-header">
	       <h3 class=" text-info">��ǰ��ϿϷ�</h3>
	       <h5 class="text-muted">��ǰ ������ <strong class="text-danger">Ȯ��</strong>�� �ּ���.</h5>
	    </div>
	    
	    
	    <div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ��</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodName }</div>
		</div>
			<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ������</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodDetail}</div>
		</div>
		
			<hr/>
			<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��������</strong></div>
			<div class="col-xs-8 col-md-4">${product.manuDate}</div>
		</div>
			<hr/>
		
			<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>����</strong></div>
			<div class="col-xs-8 col-md-4">${product.price}</div>
		</div>
			<hr/>
			
			<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ�̹���</strong></div>
			<div class="col-xs-8 col-md-4">${product.fileName}</div>
		</div>
			<hr/>
   	
		<div class="row">
	  		<div class="col-md-12 text-center ">
		      <button type="button" style="background-color: pink; "class="btn"  >Ȯ&nbsp;��</button>
			  <a class="btn" style="background-color: pink;" role="button">�� �� �� ��</a>
		    </div>
		  </div>
		<br/>
</div>

</body>
</html>


