<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


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
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
         	 body >  div.container{ 
        	border: 4px solid #943576;
            margin-top: 10px;
        }
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

//	document.detailForm.action='/product/addProduct';
//	document.detailForm.submit();
//}

$("form").attr("method" , "POST").attr("action" , "/product/addProduct").submit();
}

$(function() {
    // "등록" 버튼 클릭 이벤트
    $("button").on("click", function() {
        fncAddProduct();
    });
});
    $(function() {
    // "취소" 버튼 클릭 이벤트
    $("a").on("click", function() {
        $("form")[0].reset(); // 폼 리셋
    });
});
	
 

</script>
</head>

<body>

<jsp:include page="/layout/toolbar.jsp" />
   	

	
	<br/>
		<h2 class="bg text-center" >상품등록하기~~</h2><br/>
	
	<form class="form-horizontal">
		   		<div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName" placeholder="상품명">
		    </div>
		  </div>

 		<div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodDetail" name="prodDetail" placeholder="상품상세정보">
		    </div>
		  </div>

		 <div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
		    <div class="col-sm-4">
		      <input type="date" class="form-control" id="manuDate" name="manuDate" placeholder="제조일자" >
		    </div>
		  </div>
		  
		  

		<div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="price" name="price" placeholder="가격">
		    </div>
		  </div>
		  
		  	<div class="form-group">
		    <label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="fileName" name="fileName" placeholder="상품이미지">
		    </div>
		  </div>
			
	 <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" style="background-color: pink; "class="btn"  >등&nbsp;록</button>
			  <a class="btn" style="background-color: pink;" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>

</html>
		
	
	