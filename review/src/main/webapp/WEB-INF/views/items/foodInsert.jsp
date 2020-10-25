<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="../header.jsp" />
<%-- <%@include file="header.jsp" %> --%>

<div class="hero-wrap js-fullheight"
	style="background-image: url('images/bg_4.jpg');">
	<div class="overlay"></div>
	<div class="container">
		<div
			class="row no-gutters slider-text js-fullheight align-items-center justify-content-center"
			data-scrollax-parent="true">
			<div class="col-md-9 ftco-animate text-center"
				data-scrollax=" properties: { translateY: '70%' }">
				<h1 class="mb-3 bread"
					data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">FOOD INSERT</h1>
			</div>
		</div>
	</div>
</div>

<section class="ftco-section bg-light">
	<div class="container">

		<form action="foodInsert.vw" method="post" enctype="multipart/form-data" name="foodInsertForm">
			<div class="table-responsive">
				<table class="table">
					<tr>
						<th>매장 이름</th>
						<td><input type="text" name="fname" id="fname"></td>
					</tr>
					<tr>
						<th>매장 주소</th>
						<td><input type="text" name="faddr" id="faddr"></td>
					</tr>
					<tr>
						<th>추천음식</th>
						<td><input type="text" name="fmenu" id="fmenu"></td>
					</tr>
					<th>글 쓰기</th>
					<td><textarea id="fcontent" name="fcontent" rows="10" style="width: 98%;"></textarea></td>
					<tr>
						<th>이미지</th>
						<td><input type="file" name="ffile" id="ffile" multiple />
					</tr>
				</table>
			</div>

			<div class="text-center">
				<input type="button" class="btn btn-primary" value="글 올리기" onClick="foodInsertSubmit()">
				<input type="reset" class="btn btn-warning" value="다시 쓰기">
				<a href="food.vw"><input type="button" class="btn btn-primary" value="목록으로"></a>
			</div>

			<input type="hidden" name="mid"	value="${sessionScope.loginUser.mid }">

		</form>

	</div>
</section>

<jsp:include page="../footer.jsp" />
<script>
	function foodInsertSubmit() {

		if ($("#fname").val() == "") {
			alert("매장 이름을 입력해 주세요");
			$("#fname").focus();
			return false;
		}
		if ($("#faddr").val() == "") {
			alert("매장 주소를 입력해 주세요");
			$("#faddr").focus();
			return false;
		}
		if ($("#fmenu").val() == "") {
			alert("추천 음식을 입력해 주세요");
			$("#fmenu").focus();
			return false;
		}
		if ($("#fcontent").val() == "") {
			alert("내용을 입력해 주세요");
			$("#fcontent").focus();
			return false;
		}

		// 		if( $("#timg").val()!="" ){
		// 			var ext=$('#&nbsp;').val().split('.').pop().toLowerCase();
		// 			if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
		// 				alert('gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.');
		// 				return;
		// 			}
		// 		}
		document.foodInsertForm.submit();
	}
</script>
