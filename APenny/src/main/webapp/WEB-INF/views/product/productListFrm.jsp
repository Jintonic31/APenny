<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<div class="mainWrap">
	<form id="productFrm" method="get">
		<div id="ptabsWrap">
		    <c:forEach items="${pcategoryList}" var="pcategoryVO">
		    	<div class="ptab">${pcategoryVO.PCNAME}</div>
		    </c:forEach>
	    </div>
	    
	    <div id="plistsWrap">
	    	<c:forEach items="${productList}" var="productVO">
	    		<div class="productList">
	    			<div class="pimg">${productVO.IMAGE}</div>
	    			<div class="pname">${productVO.PNAME}</div>
	    			<!-- VIEW 에 temperature 테이블 추가 -->
	    		</div>
	    	</c:forEach>
	    
	    </div>
	    <%-- <div id="pcontents">
	    	<c:forEach items="${pcategoryList}" var="pcategoryVO">
	    		<c:forEach items="${productList}" var="productVO">
	    			<div class="pcontent">${productVO.pseq}</div>
	    		</c:forEach>
	        <div class="pcontent" id="content1">Content A</div>
	        <div class="pcontent" id="content2">Content B</div>
	        <div class="pcontent" id="content3">Content C</div>
	        <div class="pcontent" id="content4">Content D</div>
	        <div class="pcontent" id="content5">Content E</div>
	        <div class="pcontent" id="content6">Content F</div>
	        </c:forEach>
	    </div> --%>
	
	</form>
</div>

<%@ include file="../include/footer.jsp" %>