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
					data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">TOUR INSERT</h1>
			</div>
		</div>
	</div>
</div>

<section class="ftco-section bg-light">
	<div class="container">

		<form action="tourInsert.vw" method="post" enctype="multipart/form-data" name="tourInsertForm">
		
			<div class="table-responsive">
				<table class="table">
					<tr>
						<th>추천 장소</th>
						<td><input type="text" name="tname" id="tname"></td>
					</tr>
					<tr>
						<th>여행 지역</th>
						<td><input type="text" name="tlocation" id="tlocation"></td>
					</tr>
					<tr>
						<th>여행 기간</th>
						<td><input type="date" name="tstart" id="tstart" pattern="yyyy/MM/dd">&nbsp;&nbsp; ~ &nbsp;&nbsp;
						<input type="date" name="tend" id="tend" pattern="yyyy/MM/dd"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea id="tcontent" name="tcontent" rows="10" style="width: 98%;"></textarea></td>
					</tr>
					<tr>
						<th>이미지</th>
						<td><input type="file" name="tfile" id="tfile" multiple />
					</tr>
				</table>
			</div>
			
			<div class="text-center">
				<input type="button" class="btn btn-primary" value="글 올리기" onclick="tourInsertSubmit()">
				<input type="reset" class="btn btn-warning" value="다시 쓰기">
				<a href="tour.vw"><input type="button" class="btn btn-primary" value="목록으로"></a>
				<input type="hidden" name="mid" value="${sessionScope.loginUser.mid }">
			</div>
			
		</form>
	</div>
</section>

<input type="hidden" id="mid" name="mid" value="${sessionScope.loginUser.mid}">
<jsp:include page="../footer.jsp" />

<script>
	function tourInsertSubmit() {

		if ($("#tname").val() == "") {
			alert("추천 장소를 입력해 주세요");
			$("#tname").focus();
			return false;
		}
		if ($("#tlocation").val() == "") {
			alert("여행 지역을 입력해 주세요");
			$("#tlocation").focus();
			return false;
		}
		if ($("#tstart").val() == "") {
			alert("여행 시작일을 입력해 주세요");
			$("#tstart").focus();
			return false;
		}
		if ($("#tend").val() == "") {
			alert("여행 종료일을 입력해 주세요");
			$("#tend").focus();
			return false;
		}

		if ($("#tcontent").val() == "") {
			alert("내용을 입력해 주세요");
			$("#tcontent").focus();
			return false;
		}

		// 		if( $("#timg").val()!="" ){
		// 			var ext=$('#&nbsp;').val().split('.').pop().toLowerCase();
		// 			if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
		// 				alert('gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.');
		// 				return;
		// 			}
		// 		}
		document.tourInsertForm.submit();
	}
</script>
