<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Web.xml 별도 수정 -->
<%@ page import="java.util.*"%>
<%@ page import="org.springframework.validation.*" %>
<%@ page import="org.springframework.web.servlet.support.RequestContextUtils" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<%-- <%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %> --%>
<%-- <%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%> --%>
<%-- <%@ taglib prefix="ckeditor" uri="http://ckeditor.com" %> --%>
<%-- <%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%> --%>

<!DOCTYPE html>

<head>
<title>Sign Up</title>
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

<%-- <spring:message> : 다국어 처리용 --%>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-form-title" style="background-image: url(images/bg-01.jpg);">
					<span class="login100-form-title-1">회원가입	</span>
				</div>

				<form class="login100-form validate-form" method="post" name="updateMemberForm" id="updateMemberForm" onSubmit="return updateCheck()">
				
					<div class="wrap-input100 validate-input m-b-26" data-validate="Username is required">
					
						<span class="label-input100">UserID</span>
						<input class="input100" type="text" id="mid" value="${sessionScope.loginUser.mid}" >
						<div id="idSpan"></div>
					</div>
					<div class="createIdSpan" id="createIdSpan"></div>

					<div class="wrap-input100 validate-input m-b-18" data-validate = "Password is required">
				
							<span class="label-input100">Password</span>
						<input class="input100" type="password" id="mpw" name="mpw" placeholder="Enter password"
						onblur="onblur_event()">
					</div>
					<label class="idCheck" style="float: left;"></label>
					
					<div class="wrap-input100 validate-input m-b-26" data-validate = "Password is required">
						<span class="label-input100">*</span>
						<input class="input100" type="password" id="mpw2" name="mpw2" placeholder="Recheck Password"
						onblur="onblur_event()">
					</div>
					<label class="idCheck" style="float: left;"></label>
					
					<div class="wrap-input100 validate-input m-b-26" data-validate = "Password is required">
						<span class="label-input100">E-Mail</span>
						<input class="input100" type="mail" id="mmail" name="mmail" placeholder="Enter mail"
						onblur="onblur_event()">
					
					</div>
		
					<div class="container-login100-form-btn">
						<input type="submit" class="login100-form-btn" value="수정하기">&nbsp;&nbsp;
						<input type="reset" class="login100-form-btn" value="Cancle" onclick="javascript:history.back()">
					</div>
					
					<br><br><br>					
					<a href="/review" class="txt1"><font color="red">Go Home</font></a>
	
				</form>
				
			</div>
		</div>
	</div>
	
		<input type="hidden" id="mid" name="mid" value="${sessionScope.loginUser.mid}">
<%-- 		<input type="hidden" id="mpw" name="mpw" value="${sessionScope.loginUser.mpw}"> --%>
<%-- 		<input type="hidden" id="mmail" name="mmail" value="${sessionScope.loginUser.mmail}"> --%>
		
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="vendor/animsition/js/animsition.min.js"></script>
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="vendor/select2/select2.min.js"></script>
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
	<script src="vendor/countdowntime/countdowntime.js"></script>
	<script src="js/main.js"></script>
	
	
	<script>
	
			function updateCheck() {

			
			if ($('#mpw').val() == '') {
				alert("비밀번호를 입력해 주세요!");
				$('#mpw').focus();
				return false;
			}
			if ($('#mpw2').val() == '') {
				alert("비밀번호를 다시 입력해 주세요!");
				$('#mpw2').focus();
				return false;
			}

			if ($('#mpw').val() != $('#mpw2').val()) {
				alert("비밀번호가 일치하지 않습니다!");
				$('#mpw2').val('').focus();
				return false;
			}

			if ($('#mmail').val() == '') {
				alert("이메일을 입력해 주세요!");
				$('#mmail').focus();
				return false;
			}

			return true;
		}
			
		
		
		
		
	</script>
	
</body>


</body>