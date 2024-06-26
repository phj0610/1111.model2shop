<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		body {
            padding-top : 50px;
            
            .btn{
        	color:black;
        }
        
        .btn:hover{
        color:#943576
        
        }
        
        .form-control:focus{
        	border-color:#943576
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

function fncAddProduct(){
   
	var name=$("input[name='prodName']").val();
	var detail=$("input[name='prodDetail']").val();
	var manuDate=$("input[name='manuDate']").val();
	var price=$("input[name='price']").val();
   
   if(name == null || name.length<1){
      alert("상품명은 반드시 입력하여야 합니다.");
      return;
   }
   if(detail == null || detail.length<1){
      alert("상품상세정보는 반드시 입력하여야 합니다.");
      return;
   }
   if(manuDate == null || manuDate.length<1){
      alert("제조일자는 반드시 입력하셔야 합니다.");
      return;
   }
   if(price == null || price.length<1){
      alert("가격은 반드시 입력하셔야 합니다.");
      return;
   }

   $("form").attr("method" , "POST").attr("action" , "/product/updateProduct").submit();
}

$(function() {
    // "등록" 버튼 클릭 이벤트
    $("button.btn").on("click", function() {
        fncAddProduct();
    });
});

$(function() {
    // "등록" 버튼 클릭 이벤트
    $("a.btn").on("click", function() {
    	history.go(-1);
    });
});


</script>
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
   	
   		<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">상품수정</h3>
	       <h5 class="text-muted">상품 정보를 <strong class="text-danger">최신정보로 관리</strong>해 주세요.</h5>
	    </div>

	<form class="form-horizontal">

   		<div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName"  value="${product.prodName}" >
		    </div>
		  </div>
		  
		  	<div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodDetail" name="prodDetail"  value="${product.prodDetail }" >
		    </div>
		  </div>
		  
		   	<div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
		    <div class="col-sm-4">
		      <input type="date" class="form-control" id="manuDate" name="manuDate"  value="${product.manuDate} " >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="price" name="price"  value="${product.price}" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="fileName" name="fileName"  value="${product.fileName }" >
		    </div>
		  </div>

		<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn" style="background-color: pink;"  >수 &nbsp;정</button>
			  <a class="btn" style="background-color: pink;"href="#" role="button">취 &nbsp;소</a>
		    </div>
		  </div>
		  
		</form>

</div>

</body>
</html>