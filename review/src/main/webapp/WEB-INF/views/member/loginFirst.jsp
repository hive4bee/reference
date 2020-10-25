<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
			
				<!-- image -->
				<div class="login100-form-title" style="background-image: url(images/bg-01.jpg);">
					<span class="login100-form-title-1">회원가입 먼저! </span>
				</div>
				
				<!-- comment -->
				<form class="login100-form validate-form">
					<span class="txt1"><h2>회원가입이<br> <br> 완료되었습니다!</h2></span>
				</form>
				
			</div>
		</div>
	</div>

<script>
	setTimeout(function() {
		location.href = "../member/login.jsp"
	}, 1000);
	//setTimeout(function(){location.href="login.jsp"},3000);
</script>