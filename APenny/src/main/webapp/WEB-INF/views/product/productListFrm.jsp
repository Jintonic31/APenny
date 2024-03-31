<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>



<div class="mainWrap">
	<form id="productFrm" method="post">
	
		<div id="ptabsWrap">
			<c:forEach items="${pcategoryList}" var="pcategoryVO">
				<div class="ptab" id="tabPcseq${pcategoryVO.PCSEQ}" onClick='goCategory(${pcategoryVO.PCSEQ})'>${pcategoryVO.PCNAME}</div>
			</c:forEach>
		</div>
		
		
		<!-- Modal Start -->
		
	    <div id="pdModal" class="modal">
			<div class="modal-content" id="modalContent">
			
				<!-- 외부 jsp 출력 -->
				
			</div>
		</div>
		
		<!-- Modal End -->
		
		
			    
	    <div id="plistsWrap">
	    	<c:forEach items="${productList}" var="productVO">
	    	
	    		<a href="#" onclick="openModal(${productVO.PSEQ})">
	    			<div class="productList" id="listPcseq${productVO.PCSEQ}">
		    			<div class="pimg">
		    				<img src="images/product/${productVO.IMAGE}">
		    			</div>
		    			<div class="ptempt">${productVO.TNAME}</div>
		    			<div class="pname">${productVO.PNAME}</div>
		    			<div class="pprice">
		    				💰<fmt:formatNumber value='${productVO.PRICE2}' pattern="#,###" />
		    			</div>
	    			</div>
	    		</a>
	    	</c:forEach>
	    </div>
	    
	
	</form>
</div>

<script>
	function openModal(pseq){
		$('.modal-content').load("/productDetail?pseq=" + pseq);
		$('#pdModal').css('display', 'flex');
	}
</script>



<style>
	#pdModal{
		position:absolute;
		left:50%;
		top:40%;
		transform:translate(-50%, -40%);
		display:none;
		width:600px;
		height:700px;
	}
</style>

<%@ include file="../include/footer.jsp" %>