<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript" src="/script/product.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/script/jquery-3.7.1.js"></script>
<link rel="stylesheet" href="../css/product.css">

	
<form class="pdContainer" name="pdetail" action="get">
	
	<div class="pdTop">
		<div class="closeBtn" onclick="closeModal()">
			<img src="images/product/x.png">
		</div>
	</div>
	
	<div class="pdinfo">
		<div class="pdimg"><img src="images/product/${productVO.IMAGE}"></div>
		<div class="pdtext">
			<input type="hidden" name="pseq" value="${productVO.PSEQ}">
			<input type="hidden" name="qty" value="1" />
			<div class="pdprice">
				💰&nbsp;&nbsp;<fmt:formatNumber value='${productVO.PRICE2}' pattern="#,###" />
			</div>
			<input type="hidden" name="tseq" value="${productVO.TSEQ}" />
			<div class="pdtemt">${productVO.TNAME}</div>
			<div class="pdname">${productVO.PNAME}</div>
			<div class="pddescript">${productVO.DESCRIPT}</div>
		</div>				
	</div>
			
	<div class="pdBtn">
		<button onclick="goCart()">
			<img src="images/product/gocart.png" />담기
		</button>
	</div>
</form>	



<script>
	function closeModal(){
		$('#pdModal').css('display', 'none');
	}
</script>


