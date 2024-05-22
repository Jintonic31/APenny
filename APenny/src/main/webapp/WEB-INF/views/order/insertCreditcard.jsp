<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/script/jquery-3.7.1.js"></script>
<script type="text/javascript" src="/script/order.js"></script>


<form class="icContainer" name="insertCard">
	
	<div class="icImage" onclick="completePay()" >
		<img src="images/order/insertcard.gif" />
	</div>
	
	<div class="icMsg">
		<div>카드 리더기에 카드를 삽입하여 주세요.</div>
		<div>(Please insert the card into the card reader.)</div>
	</div>
	
	
	
</form>