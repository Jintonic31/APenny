<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    
    
</div><!-- end bodyWrap -->



	<footer>
		<div class="container">
			<div class="cartList">
				<c:forEach items="${cartList}" var="cartVO">
					<div class="oneclist">
						<div>${cartVO.PNAME}</div>
						<div>${cartVO.QTY}</div>
						<div>${cartVO.PRICE2}</div>
					</div>
				</c:forEach>
				<div class="ctotalPrice">
					<div class=ctotalQty>
						<div>수량 : ${totalQty}</div>
						<div>
							<fmt:formatNumber value="${totalPrice}" type="currency" />
						</div>
					</div>
				</div>
				
			</div>
			<div class="orderBtns">
			
			</div>
		</div>
	</footer>
	
	
	
</div><!-- end wrap -->
</body>
</html>