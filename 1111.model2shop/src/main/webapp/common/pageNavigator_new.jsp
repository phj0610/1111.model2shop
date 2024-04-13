<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="container text-center">
<style>
.pagination > li > a
{
    background-color: white;
    color: #943576;
}

.pagination > li > a:focus,
.pagination > li > a:hover,
.pagination > li > span:focus,
.pagination > li > span:hover
{
    color: #943576;
    background-color: #eee;
    border-color: #ddd;
}

.pagination > .active > a
{
    color: white;
    background-color:#943576;
    border: solid 1px #943576;
}

.pagination > .active > a:hover
{
    background-color: #943576;
    border: solid 1px #943576;
}
</style>
		 
		 <nav>
		  <!-- 크기조절 :  pagination-lg pagination-sm-->
		
		    <ul class="pagination" >
		    
		    <!--  <<== 좌측 nav -->
		  	<c:if test="${ resultPage.currentPage <= resultPage.pageUnit }">
		 		<li class="disabled">
			</c:if>
			<c:if test="${ resultPage.currentPage > resultPage.pageUnit }">
				<li>
			</c:if>
		      <a href="javascript:fncGetList('${ resultPage.currentPage-1}')" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		    
		    <!--  중앙  -->
			<c:forEach var="i"  begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" step="1">
				
				<c:if test="${ resultPage.currentPage == i }">
					<!--  현재 page 가르킬경우 : active -->
				    <li class="active">
				    	<a href="javascript:fncGetList('${ i }');">${ i }<span class="sr-only" >(current)</span></a>
				    </li>
				</c:if>	
				
				<c:if test="${ resultPage.currentPage != i}">	
					<li>
						<a href="javascript:fncGetList('${ i }');">${ i }</a>
					</li>
				</c:if>
			</c:forEach>
		    
		     <!--  우측 nav==>> -->
		     <c:if test="${ resultPage.endUnitPage >= resultPage.maxPage }">
		  		<li class="disabled">
			</c:if>
			<c:if test="${ resultPage.endUnitPage < resultPage.maxPage }">
				<li>
			</c:if>
		      <a href="javascript:fncGetList('${resultPage.endUnitPage+1}')" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </ul>
		</nav>
		
</div>
 


<!-- <div class="container"> -->
<!-- 		<nav> -->
<!-- 		  <ul class="pager"> -->
<!-- 		    <li><a href="#">Previous</a></li> -->
<!-- 		    <li><a href="#">Next</a></li> -->
<!-- 		  </ul> -->
<!-- 		</nav> -->
<!-- </div> -->


<!-- <div class="container"> -->
<!-- 		<nav> -->
<!-- 		  <ul class="pager"> -->
<!-- 		    <li class="previous disabled"><a href="#"><span aria-hidden="true">&larr;</span> Older</a></li> -->
<!-- 		    <li class="previous"><a href="#"><span aria-hidden="true">&larr;</span> Older</a></li>  -->
<!-- 		    <li class="next"><a href="#">Newer <span aria-hidden="true">&rarr;</span></a></li> -->
<!-- 		  </ul> -->
<!-- 		</nav> -->
<!-- </div> -->