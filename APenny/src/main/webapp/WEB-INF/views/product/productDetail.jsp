<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="/script/product.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/script/jquery-3.7.1.js"></script>
<link rel="stylesheet" href="../css/product.css">

	
<div class="pdContainer">
	
	<div class="pdTop">
		<div class="closeBtn" onclick="closeModal()">
			<img src="images/product/x.png">
		</div>
	</div>
	
	<div class="pdinfo">
		<div class="pdimg"><img src="images/product/${productVO.IMAGE}.jpg"></div>
		<div class="pdtext">
			<input type="hidden" value="${productVO.PSEQ}">
			<div class="pdname">${productVO.PNAME}</div>
			<div class="pdprice">
				<div>💰</div>
				<div>
					<fmt:formatNumber value='${productVO.PRICE2}' pattern="#,###" />원
				</div>
			</div>
			<div class="pddescript">${productVO.DESCRIPT}</div>
		</div>				
	</div>
			
	<div class="pdBtn">
		<button onclick="goCart(${productVO.PSEQ})">담기</button>
	</div>
</div>	



<script>
	function closeModal(){
		$('#pdModal').css('display', 'none');
	}
</script>


