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
<link rel="stylesheet" type="text/css" href="font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="Linearicons-Free-v1.0.0/icon-font.min.css">
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
				<div class="login100-form-title" style="background-image: url(images/bg-01.jpg);">
					<span class="login100-form-title-1">회원가입 </span>
				</div>

				<form class="login100-form validate-form" method="post" name="signupForm" id="signupForm" onSubmit="return joinCheck()">

					<div class="wrap-input100 validate-input m-b-26" data-validate="Username is required">
						<span class="label-input100">UserID</span>
						<input class="input100" type="text" id="mid" name="mid" placeholder="Enter userID" onkeyup="idcheck()" onblur="onblur_event()">
						<div id="idSpan"></div>
					</div>

					<div class="wrap-input100 validate-input m-b-18" data-validate="Password is required">
						<span class="label-input100">Password</span>
						<input class="input100" type="password" id="mpw" name="mpw" placeholder="Enter password">
					</div>

					<div class="wrap-input100 validate-input m-b-26" data-validate="Password is required">
						<span class="label-input100">*</span>
						<input class="input100" type="password" id="mpw2" name="mpw2" placeholder="Recheck Password">
					</div>

					<div class="wrap-input100 validate-input m-b-26" data-validate="Mail is required">
						<span class="label-input100">E-Mail</span>
						<input class="input100" type="mail" id="mmail" name="mmail" placeholder="Enter mail" onkeyup="mailcheck()" onblur="onblur_event()">
						<div id="mailSpan"></div>
					</div>

					<div class="container-login100-form-btn">
						<input type="submit" class="login100-form-btn" value="가입하기">&nbsp;&nbsp;
						<input type="reset" class="login100-form-btn" value="Cancle" onclick="javascript:history.back()">
					</div>

					<br><br><br>
					<a href="/review" class="txt1"><font color="red">Go Home</font></a>

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


	<script>
		function joinCheck() {

			if ($('#mid').val() == '') {
				alert("ID를 입력해 주세요!");
				$('#mid').focus();
				return false;
			}

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

		function onblur_event() {
			
			if ($("#mid").val() != "") {
				var idChecked = /^[0-9a-zA-Z]{3,15}$/; // 아이디 유효성검사(3자리 이상 15자리 이하)
				if (!idChecked.test($("#mid").val())) {
					$("#idSpan").css("color", "red").css("font-size", "13px").css("margin-top","5px").css("margin-left", "5px").css("width", "350px").css("float", "left");
					document.getElementById("idSpan").innerHTML = "아이디는 3~15자리, 공백없이 영문으로 만들어주세요.";
					return false;
				}
			}

			if ($("#mmail").val() != "") {
				var mailChecked = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;// 이메일이 적합한지 검사할 정규식
				if (!mailChecked.test($("#mmail").val())) {
					$("#mailSpan").css("color", "red").css("font-size", "13px").css("margin-top", "5px").css("margin-left", "5px").css("width", "350px").css("float", "left");
					document.getElementById("mailSpan").innerHTML = "적합하지 않은 이메일 형식입니다.";
					return false;
				}
			}

		}//onblur_event end

		function idcheck() {
			$.ajax({
						url : "/review/idChk.vw",
						type : "post",
						dataType : "json",
						data : {
							"mid" : $("#mid").val()
						},
						success : function(idresult) {
							if (idresult == 1) {
								$("#idSpan").css("color", "red").css("font-size", "13px").css("margin-top","5px").css("margin-left", "5px").css("width", "350px").css("float", "left");
								document.getElementById("idSpan").innerHTML = "이미 사용중인 아이디 입니다.";
							} else if (idresult == 0) {
								$("#idSpan").css("color", "red").css("font-size", "13px").css("margin-top","5px").css("margin-left", "5px").css("width", "350px").css("float", "left");
								document.getElementById("idSpan").innerHTML = "사용가능한 아이디입니다.";
							}
						}
					});
		}//idcheck end

		function mailcheck() {
			$.ajax({
						url : "/review/mailChk.vw",
						type : "post",
						dataType : "json",
						data : {
							"mmail" : $("#mmail").val()
						},
						success : function(mailresult) {
							if (mailresult == 1) {
								$("#mailSpan").css("color", "red").css("font-size", "13px").css("margin-top", "5px").css("margin-left", "5px").css("width", "350px").css("float", "left");
								document.getElementById("mailSpan").innerHTML = "이미 사용중인 메일 입니다.";
							} else if (mailresult == 0) {
								$("#mailSpan").css("color", "red").css("font-size", "13px").css("margin-top", "5px").css("margin-left", "5px").css("width", "350px").css("float", "left");
								document.getElementById("mailSpan").innerHTML = "사용가능한 메일주소 입니다.";
							}
						}
					});
		}//mailcheck end
		
	</script>

</body>

<!--
	<script>
	
		function ValidationCheck() {
			var validate=true;
			var regExp=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/; // email 유효성검사
			var hanChecked=/^[가-힝a-zA-Z]{2,15}$/; // 한글 유효성검사(2자리 이상 15자리 이하)
			var idChecked=/^[0-9a-zA-Z]{3,15}$/; // 아이디 유효성검사(3자리 이상 15자리 이하)
			// var phoneChecked = /^[0-9-]{1,16}$/;
			// var phoneChecked = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-([0-9]{3,4})-([0-9]{4})$/;

			// if ($("#${commandName} #userPhone").val()) {
			// if (!phoneChecked.test($("#${commandName} #userPhone").val())) {
			// alert("전화번호가 잘못 되었습니다.");
			// ("#${commandName} #userPhone").focus();
			// return false;
			// }
			// }

			if (!$("#mid").val()) {
				alert("아이디를 입력 하세요.");
				$("#mid").focus();
				validate=false;
				return false;
			} else if (!idChecked.test($("#mid").val())) {
				alert("아이디는 3자 ~ 15자리 사이로 만들어주세요(VC함수)");
				return false;
			} else if (!$("#mpw").val()) {
				alert("비밀번호를 입력하세요.");
				$("#mpw").focus();
				return false;
			} else if ($("#mpw").val().length > 16 || $("#mpw").val().length < 8) {
				alert("비밀번호는 8 ~ 16 자리로 입력해주세요(VC함수)");
				return false;
			} else if (!$("#mpw2").val()) {
				alert("비밀번호 확인을 입력하세요.");
				$("#mpw2").focus();
				return false;
			} else if ($("#mpw").val() != $("#mpw2").val()) {
				alert("비밀번호가 일치 하지 않습니다.");
				$("#mpw2").focus();
				return false;
			} else if (!$("#mmail").val()) {
				alert("이메일을 입력하세요.");
				$("#mmail").focus();
				return false;
			} else if ($("#mmail").val()) {
				if (!regExp.test($("#mmail").val())) {
					alert("이메일 주소가 유효하지 않습니다");
					$("#mmail").focus();
					return false;
				}
			} else if (!$("#emailAuth").val()) {
				alert("이메일 인증을 완료해주세요.");
				$("#emailAuth").focus();
				return false;
			} else if ($("#emailAuthBtn")[0].disabled == false) {
				console.log($("#emailAuthBtn")[0].disabled);
				alert("이메일 인증을 완료해주세요.");
				$("#emailAuth").focus();
				return false;
			} else {
				return true;
			}
		}//ValidationCheck end
-->
