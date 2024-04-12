<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
        .form-control:focus{
        	border-color:#943576
        }
    </style>
   <script type="text/javascript">
   

   function fncGetList(currentPage) {
	      $("#currentPage").val(currentPage)
	      $("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=${param.menu}").submit();
	   }  
   
   
   $(function() {
	      // alert(1);
	       $( "button" ).on("click" , function() {
	         alert(1);
	         fncGetList(1);   
	      });
	    });
 
//�̷��� �ϸ� �˻� �� ���� Ű ����
 $( "input[name='searchKeyword']" ).keypress(function(event) {
       // ���� Ű �ڵ�� 13�Դϴ�.
       if (event.which === 13) {
           // ���� Ű�� ������ �� �˻� �̺�Ʈ ����
          fncGetProductList(1);
       }
   });

 $(document).ready(function() {
	    $( "td:nth-child(2)").on("click", function() {
	        var prodNo = $(this).find('input[type="hidden"]').val();
	        if (prodNo) {
	            window.location.href = "/product/getProduct?menu=${param.menu}&prodNo=" + prodNo;
	        }
	    });
	});

 
           $(function() {
        	    $("td:nth-child(5) > i").on("click", function() {
        	        var prodNo = $(this).siblings('input[type="hidden"]').val();
        	        // hidden input�� �߰��Ͽ� form�� 'prodNo' ���� �Բ� �����մϴ�.
        	        $(this).closest("form").append('<input type="hidden" name="prodNo" value="' + prodNo + '">');
        	        // form�� �����մϴ�.
        	       // alert(prodNo);
        	        $(this).closest("form").submit();
        	        
        	        $.ajax({
        	            url: "/product/json/getProduct/" + prodNo + "/${menu}",
        	            method: "GET",
        	            dataType: "json",
        	            success: function(JSONData, status) {
        	               // alert(status);
        	                
        	                var displayValue = "<h5>" +
        	                    "��ǰ�� : " + JSONData.prodName + "<br>" +
        	                    "��ǰ������ : " + JSONData.prodDetail + "<br>" +
        	                    "�������� : " + JSONData.manuDate + "<br>" +
        	                    "���� : " + JSONData.price + "<br>" +
        	        
        	                    "</h5>";
        	                
        	                $("h5").remove();
        	                $("#" + prodNo + "").html(displayValue);
        	            }
        	        });
        	    });
        	

      

    //==> userId LINK Event End User ���� ���ϼ� �ֵ��� 

  	$( "td:nth-child(2)" ).css("color" , "#943576");
   
   //==> �Ʒ��� ���� ������ ������ ??
   $(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
});   
 
</script>

</head>

<body >



	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>��ǰ�����ȸ</h3>
	    </div>
	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
						<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ����</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">�˻�</button>
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table ���� �˻� Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >��ǰ��</th>
            <th align="left">����</th>
            <th align="left">�����</th>
            <th align="left">��������</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="product" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center">${ i }</td>
			  <td align="left"   title="Click : ��ǰ���� Ȯ��"  >${product.prodName}	  	
			  <input type="hidden" value="${product.prodNo}">
			  </td>
			  <td align="left">${product.price }</td>
			  <td align="left">${product.regDate}</td>
			  <td align="left">
			  	<i class="glyphicon glyphicon-ok" id= "${product.prodNo}"></i>
			  	<input type="hidden" value="${product.prodNo}">
			  </td>
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	 <jsp:include page="../common/pageNavigator_new.jsp"/>   
	<!-- PageNavigation End... -->
	
</body>

</html>

