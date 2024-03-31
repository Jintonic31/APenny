<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Index.jsp</title>
<link rel="stylesheet" href="/css/index.css">
<link rel="stylesheet" type="text/css" href="/script/slick/slick.css">
<link rel="stylesheet" type="text/css" href="/script/slick/slick-theme.css">

<script src="/script/jquery-3.7.1.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="/script/slick/slick.min.js"></script>
<script src="/script/index.js"></script>

</head>
<body>
	<div class="container">
		<div class="indexLogo">
			<img src="images/index/mainImage.png">
			<img src="images/index/logo.png">
		</div>
	
		<div class="togoOrnot">
			<div class="indexTitle1">주문 방식을 선택하여 주세요.</div>
			<div class="indexTitle2">(Choose a "For here" or "To go" to place an order)</div>
			<div class="indexChoice">
				<a href="productList"><div class="eatnow">
					<img src="images/index/eatnow.png">
					<div class="btnSubs">매장<br>(For here)</div>
					<input type="hidden" value="매장">
				</div></a>
	
				<a href="productList"><div class="togo">
					<img src="images/index/togo.png">
					<div class="btnSubs">포장<br>(To go)</div>
					<input type="hidden" value="포장">
				</div></a>
			</div>
		</div>
 		<div class="Banner">
			<c:forEach items="${bannerList}" var="bannerVO">
				<div class="bannerImg"><img src="images/banner/${bannerVO.IMAGE}"></div>
			</c:forEach>
		</div>
	</div>	
	
</body>
</html>