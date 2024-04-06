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
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
   
    function fncGetProductList(currentPage) {
        $("#currentPage").val(page);
        $("form").attr("method", "POST").attr("action", "/product/listProduct?menu=${param.menu}").submit();
    }
    

      $(function(){
      
       $( "td.ct_btn01:contains('�˻�')" ).on("click" , function() {
      //Debug..
      alert(  $( "td.ct_btn01:contains('�˻�')" ).html() );
      fncGetProductList(1);
   });
   
   //�̷��� �ϸ� �˻� �� ���� Ű ����
    $( "input[name='searchKeyword']" ).keypress(function(event) {
          // ���� Ű �ڵ�� 13�Դϴ�.
          if (event.which === 13) {
              // ���� Ű�� ������ �� �˻� �̺�Ʈ ����
             fncGetProductList(1);
          }
      });
   });
   
    $(function() {
          $("td:nth-child(5) > i").on("click", function() {

              var prodNo = $(this).find('input[name^="prodNo"]').val();
   
              $(this).append('<input type="hidden" name^="prodNo" value="' + prodNo + '">');

              
              $.ajax(
                    {
                       url : "/product/json/getProduct/"+prodNo+"/${menu}" ,
                     method : "GET" ,
                     dataType : "json" ,
                     headers : {
                        "Accept" : "application/json",
                        "Content-Type" : "application/json"
                     },
                     success : function(JSONData , status) {
                        alert(status);
                        
                        var displayValue = "<h8>"
                                                +"��ǰ�� : "+JSONData.prodName+ "<br/>"
                                                +"������ : "+JSONData.prodDetail+ "<br/>"
                                                +"���� : "+JSONData.price+ "<br/>"
                                                +"����� : "+JSONData.manuDate+ "<br/>"
                                                +"��ǰ��ȣ : "+JSONData.prodNo+ "<br/>"
                                                +"</h8>";
                                                
                        $("h8").remove();
                        $( "#"+prodNo+"" ).html(displayValue);   
                     }
                    });
             /*  self.location="/product/getProduct?menu=${param.menu}&prodNo="+prodNo;
          */

          }); 
          

       //==> userId LINK Event End User ���� ���ϼ� �ֵ��� 

      $( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
      $("h7").css("color" , "red");
      
      //==> �Ʒ��� ���� ������ ������ ??
      $(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
   });   
<!--  <a href="/product/${ menuType eq 'manage' ? 'updateProduct' : 'getProduct'}?prodNo=${ product.prodNo }&menu=${param.menu}"  -->
   
</script>

</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>��ǰ�����ȸ</h3>
	    </div>
	    

    <div class="row">
    
        <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">

				          <c:choose>
          <c:when test="${param.menu != null && param.menu == 'manage'}">
              ��ǰ ����
          </c:when>
          <c:when test="${param.menu == null || param.menu == 'null' || param.menu == 'search'}">
              ��ǰ �����ȸ
          </c:when>
      </c:choose>

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
           
           <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >��ǰ��</th>
            <th align="left">����</th>
            <th align="left">�����</th>
            <th align="left">�������</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="product" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center">${ i }</td>
			   <td align="left">
               
                  <input type="hidden" name="prodNo" value="${product.prodNo}">
                      ${product.prodName} </td>   
                      
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
	<jsp:include page="../common/listpageNavigator.jsp"/>
	<!-- PageNavigation End... -->
	
</body>

</html>
       
