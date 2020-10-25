<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<head>
<title>How Dare</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Alex+Brush" rel="stylesheet">
<link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/aos.css">
<link rel="stylesheet" href="css/ionicons.min.css">
<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<link rel="stylesheet" href="css/jquery.timepicker.css">
<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/style.css">
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="index.vw">거기 어때?</a>
			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
				
					<li class="nav-item active"><a href="index.vw" class="nav-link">Home</a></li>
					<li class="nav-item"><a href="tour.vw" class="nav-link">여행</a></li>
					<li class="nav-item"><a href="food.vw" class="nav-link">맛집</a></li>
					<li class="nav-item"><a href="book.vw" class="nav-link">도서</a></li>
					<li class="nav-item"><a href="community.vw" class="nav-link">COMMUNITY</a></li>
					<li class="nav-item"><a href="freeboard.vw" class="nav-link">자유게시판</a></li>
					<li class="nav-item">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>

					<c:choose>
						<c:when test="${empty loginUser}">
							<li class="nav-item"><span class="nav-link" float="middle"><strong>VISITOR:&nbsp;</strong>비회원</span></li>
							<li class="nav-item cta"><a href="login.vw" class="nav-link"><span>Log In</span></a></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item cta"><a href="myPage.vw?mid=${sessionScope.loginUser.mid}" class="nav-link"><span>VISITOR:
							<font style="text-decoration: underline">${sessionScope.loginUser.mid}</font></span></a></li>
							
														
							<li class="nav-item cta"><a href="logout.vw" class="nav-link"><span>Log Out</span></a></li>
						</c:otherwise>
					</c:choose>
					
				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->
	
	<input type="hidden" id="mid" name="mid" value="${sessionScope.loginUser.mid}">