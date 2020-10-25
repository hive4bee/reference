<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="header.jsp" />
<%-- <%@include file="header.jsp" %> --%>

<div class="hero-wrap js-fullheight" style="background-image: url('images/bg_1.jpg');">
	<div class="overlay"></div>
	<div class="container">
		<div class="row no-gutters slider-text js-fullheight align-items-center justify-content-start"
			data-scrollax-parent="true">
			<div class="col-md-9 ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
				
				<!-- center comment -->
				
				<h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">
				<strong>내 취향대로! <br></strong>Pick!!</h1>
				<p data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">
				Find great places to travle, eat, book, or visit from local experts</p>
				<div class="block-17 my-4"></div>
				
				<!-- icon -->
				<p class="browse d-md-flex">
					
					<span class="d-flex justify-content-md-center align-items-md-	center">
					<a href="tour.vw"><i class="flaticon-shopping-bag"></i>여행</a></span>
					
					<span class="d-flex justify-content-md-center align-items-md-center">
					<a href="food.vw"><i class="flaticon-fork"></i>맛집</a></span>
					
					<span class="d-flex justify-content-md-center align-items-md-	center">
					<a href="book.vw"><i class="flaticon-hotel"></i>도서</a></span>
					
					<span class="d-flex justify-content-md-center align-items-md-	center">
					<a href="lotto.vw"><i class="flaticon-place"></i>LOTTO</a></span>
				</p>
				
			</div>
		</div>
	</div>
</div>

<!-- loader -->
<div id="ftco-loader" class="show fullscreen">
	<svg class="circular" width="48px" height="48px">
		<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
		<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
</div>

<script src="js/jquery.min.js"></script>
<script src="js/jquery-migrate-3.0.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.waypoints.min.js"></script>
<script src="js/jquery.stellar.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/aos.js"></script>
<script src="js/jquery.animateNumber.min.js"></script>
<script src="js/bootstrap-datepicker.js"></script>
<script src="js/jquery.timepicker.min.js"></script>
<script src="js/scrollax.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="js/google-map.js"></script>
<script src="js/main.js"></script>

</body>
