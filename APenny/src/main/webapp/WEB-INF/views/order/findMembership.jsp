<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/script/jquery-3.7.1.js"></script>
<script type="text/javascript" src="/script/order.js"></script>


<form class="msContainer" name="membership">
	
	<div class="msTop">
		멤버십 조회/적립
	</div>
	
	<div class="msMid">
		<div>
			<input type="text" value="010" readonly />
			<span>-</span>
			<input type="password" name="tel2" value="${tel2Value}"/>
		</div>
	</div>
	
	<div class="msKeypad">
		<div class="keypadWrap">
			<c:forEach begin="1" end="9" var="num">
				<input type="button" class="onenumber" value="${num}" readonly />
			</c:forEach>
			<input type="button" class="etcnumber" value="" readonly />
			<input type="button" class="onenumber" value="0" readonly />
			<div class="etcnumber" id="deleteNum">
				<img src="images/order/backspace.png" />
			</div>
		</div>
	</div>
	
	<!-- Mini Modal Start -->
	
    <div id="mshipMsg" class="modal3">
    	<c:forEach items="${membership}" var="memberVO">
    		<span id="msNick">
				${memberVO.NICK}
			</span><br>
			<span id="msPoint">
				${memberVO.POINT}
			</span>
			
			
    	</c:forEach>
    	<div class="msgWrap">
 			<span id="msMsg">${message}</span>
 		</div>	
		
		<div class="msgBtnsWrap">
			<input type="button" value="적립안함"  />
			<input type="button" value="재입력" />
		</div>
	</div>
	
	
	<!-- Mini Modal End -->
	
	<div class="msBtns">
		<div class="msBtnsWrap">
			<input type="button" id="noMember" value="적립안함" onclick="noReward()" />
		</div>
		<div class="msBtnsWrap">
			<input type="button" id="yesMember" value="조회" onclick="gofindMember()" />
		</div>
	</div>
	
</form>

<style>
	#mshipMsg{
		position:absolute;
		left:50%;
		top:50%;
		transform:translate(-50%, -40%);
		display:none;
		width:600px;
		height:400px;
		z-index:999;
	}
</style>