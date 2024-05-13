<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    
</div><!-- end bodyWrap -->



	<footer>
		<form class="fcontainer" name="footcart">
			<div class="cartList">
				<div class="oneclistTitle">
					<div>상품명</div>
					<div>수량</div>
					<div>가격</div>
				</div>
				<div class="oneclistWrap">
					<c:forEach items="${cartList}" var="cartVO">
						<div class="oneclist" id="oneclist">
							<div class="cartPname">(${cartVO.TNAME})&nbsp;${cartVO.PNAME}</div>
							<div class="cartQty">
								<div class="changeQty" onclick="subQty(${cartVO.CSEQ}, ${cartVO.QTY})">
									<img src="images/include/sub.png" />
								</div>
								<div>${cartVO.QTY}</div>
								<div class="changeQty" onclick="addQty(${cartVO.CSEQ}, ${cartVO.QTY})">
									<img src="images/include/add.png" />
								</div>
							</div>
							<div class="cartPrice"><fmt:formatNumber value="${cartVO.PRICE2 * cartVO.QTY}" type="currency" /></div>
						</div>
					</c:forEach>
				</div>				
				
			</div>
			
			<div class="footerBottom" >
			
				<div class="ctotal">
					<div class="ctotalQty">
						<div>수량</div>
						<div> : ${totalQty}</div>
					</div>
					<div class="ctotalPrice">
						<div>합계</div>	
						<div>
							: <fmt:formatNumber value="${totalPrice}" type="currency" currencySymbol="" />
						</div>
					</div>
						
				</div>
			
				<div class="orderyn">
					<button onclick="deleteAllCart()">주문 취소</button>
					<button onclick="goOrderCheck()" >다음</button>
				</div>
			</div>
		</form>
	</footer>
	
	
	
</div><!-- end wrap -->
</body>
</html>