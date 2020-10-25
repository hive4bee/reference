<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<head>
<title>Login</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="images/icons/favicon.ico" />
<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-form-title"
					style="background-image: url(images/bg-01.jpg);">
					<span class="login100-form-title-1">Log In</span>
				</div>

				<form class="login100-form validate-form" action="login.vw" method="post">
				
					<div class="wrap-input100 validate-input m-b-26" data-validate="Username is required">
						<span class="label-input100">ID</span>
						<input class="input100" type="text" name="mid" id="mid" placeholder="Enter userID">
					</div>

					<div class="wrap-input100 validate-input m-b-18"
						data-validate="Password is required">
						<span class="label-input100">Password</span>
						<input class="input100" type="password" name="mpw" id="mpw" placeholder="Enter password">
					</div>

					<div class="container-login100-form-btn">
						<input type="submit" class="login100-form-btn" value="로그인">&nbsp;&nbsp;&nbsp;
						<input type="button" class="login100-form-btn" value="Cancle" onclick="javascript:history.back()">
					</div>
					<br><br><br>
					
					<div class="container-login100-form-btn">
					<p><a href="index.vw" class="txt1"><font color="red">Go Home</font></a></p>	
				
					</div>
					<br><br>
					<div class="container-login100-form-btn">

					<p><a href="signup.vw"><font color="red">회원가입</font></a></p>
					</div>
					
				</form>
			</div>
		</div>
	</div>

	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="vendor/animsition/js/animsition.min.js"></script>
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="vendor/select2/select2.min.js"></script>
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
	<script src="vendor/countdowntime/countdowntime.js"></script>
	<script src="js/main.js"></script>

</body>