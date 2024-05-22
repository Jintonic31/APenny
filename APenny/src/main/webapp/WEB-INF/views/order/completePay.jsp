<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/script/jquery-3.7.1.js"></script>
<script type="text/javascript" src="/script/order.js"></script>


<form class="icContainer" name="completePay">
	
	<div class="cpImage" onclick="completeOrder()" >
		<img src="images/order/paydone.gif" />
	</div>
	
	<div class="cpMsg">
		<div>결제 완료!</div>
		<div>(Complete Payment!)</div>
	</div>
	
	
	
</form>