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
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
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
 
//이렇게 하면 검색 시 엔터 키 먹음
 $( "input[name='searchKeyword']" ).keypress(function(event) {
       // 엔터 키 코드는 13입니다.
       if (event.which === 13) {
           // 엔터 키가 눌렸을 때 검색 이벤트 실행
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
        	        // hidden input을 추가하여 form에 'prodNo' 값을 함께 전송합니다.
        	        $(this).closest("form").append('<input type="hidden" name="prodNo" value="' + prodNo + '">');
        	        // form을 제출합니다.
        	       // alert(prodNo);
        	        $(this).closest("form").submit();
        	        
        	        $.ajax({
        	            url: "/product/json/getProduct/" + prodNo + "/${menu}",
        	            method: "GET",
        	            dataType: "json",
        	            success: function(JSONData, status) {
        	               // alert(status);
        	                
        	                var displayValue = "<h5>" +
        	                    "상품명 : " + JSONData.prodName + "<br>" +
        	                    "상품상세정보 : " + JSONData.prodDetail + "<br>" +
        	                    "제조일자 : " + JSONData.manuDate + "<br>" +
        	                    "가격 : " + JSONData.price + "<br>" +
        	        
        	                    "</h5>";
        	                
        	                $("h5").remove();
        	                $("#" + prodNo + "").html(displayValue);
        	            }
        	        });
        	    });
        	

      

    //==> userId LINK Event End User 에게 보일수 있도록 

  	$( "td:nth-child(2)" ).css("color" , "#943576");
   
   //==> 아래와 같이 정의한 이유는 ??
   $(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
});   
 
</script>

</head>

<body >



	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>상품목록조회</h3>
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품번호</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품명</option>
						<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품가격</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">검색</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >상품명</th>
            <th align="left">가격</th>
            <th align="left">등록일</th>
            <th align="left">간략정보</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="product" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center">${ i }</td>
			  <td align="left"   title="Click : 상품정보 확인"  >${product.prodName}	  	
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
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	 <jsp:include page="../common/pageNavigator_new.jsp"/>   
	<!-- PageNavigation End... -->
	
</body>

</html>

