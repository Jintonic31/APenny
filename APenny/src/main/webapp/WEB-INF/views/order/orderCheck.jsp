<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/header.jsp" %>


<form id="orderCheckFrm" method="post">

	<div class="olistWrap">
		<div class="oneolistTitle">
			<div>&nbsp;</div>
			<div>상품명</div>
			<div>수량</div>
			<div>가격</div>
		</div>
		
		<div class="oneolistWrap">
			<c:forEach items="${cartList}" var="cartVO">
				<div class="oneolist">
					<div class="orderImg"><img src="images/product/${cartVO.IMAGE}" /></div>
					<div class="orderPname">(${cartVO.TNAME})&nbsp;${cartVO.PNAME}</div>
					<div class="orderQty">${cartVO.QTY}</div>
					<div class="orderPrice"><fmt:formatNumber value="${cartVO.PRICE2 * cartVO.QTY}" type="currency" /></div>
				</div>
			</c:forEach>
		</div>
	</div>
	
	
	<!-- Modal Start -->
	
    <div id="rewardModal" class="modal2">
		<div class="modal-content2" id="modalContent2">
		
			<!-- 외부 jsp 출력 -->
			
		</div>
	</div>
	
	
	<!-- Modal End -->
	
	
	<div class="olistBottom">
		<div>TOTAL</div>
		<div>${totalQty}</div>
		<div>
			<fmt:formatNumber value="${totalPrice}" type="currency" currencySymbol="" />
		</div>
	</div>
	
	<div class="payment">
		<div class="payTitle">결제 수단</div>
		<div class="payOption">
			<c:forEach items="${payOption}" var="payVO">
				<div class="onepayment" onclick="rewardYN(${payVO.PMSEQ})">
					<div class="payImg"><img src="images/payment/${payVO.PMIMAGE}" /></div>
					<div class="payName">${payVO.PMNAME}</div>
				</div>
			</c:forEach>				
		</div>
	</div>

</form>

<script>
	function rewardYN(pmseq){
		$('.modal-content2').load("/selectReward?pmseq=" + pmseq);
		$('#rewardModal').css('display', 'flex');
	}
</script>

<style>
	#rewardModal{
		position:absolute;
		left:50%;
		top:50%;
		transform:translate(-50%, -40%);
		display:none;
		width:800px;
		height:1000px;
	}
</style>




</div><!-- end bodyWrap -->

</div><!-- end wrap -->
</body>
</html>