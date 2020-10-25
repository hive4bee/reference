<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../header.jsp" />
<%-- <%@include file="header.jsp" %> --%>

<div class="hero-wrap js-fullheight" style="background-image: url('images/bg_4.jpg');">
	<div class="overlay"></div>
	<div class="container">
		<div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
			<div class="col-md-9 ftco-animate text-center"
				data-scrollax=" properties: { translateY: '70%' }">
				<h1 class="mb-3 bread"
					data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">FREE BOARD</h1>
			</div>
		</div>
	</div>
</div>

<section class="ftco-section bg-light">
	<div class="container">
		<form role="form" method="post">
			<input type="hidden" name="boardno" value="${detailBoard.boardno}">
		</form>
			<h4>글 상세보기</h4>
			<br><br>
			<div class="table-responsive">
				<table class="table">
					<tr>
						<th>작성자</th>
						<td>${detailBoard.mid}</td>
						<th>등록일</th>
						<td><fmt:formatDate value="${detailBoard.indate}" type="date" /></td>
					</tr>

					<tr>
						<th>제목</th>
						<td colspan="3">${detailBoard.subject}</td>
					</tr>

					<tr>
						<th>내용</th>
						<td colspan="3">${detailBoard.content}</td>
					</tr>

				</table>
			</div>
			<br><br><br><br>

			<div class="box-footer">
			
						
				<button type="submit" class="btn btn-warning">수정</button>	&nbsp;&nbsp;&nbsp;
				<button type="submit" class="btn btn-warning">댓글</button>	&nbsp;&nbsp;&nbsp;
				<button type="submit" class="btn btn-danger">삭제</button>&nbsp;&nbsp;&nbsp;
				<button type="submit" class="btn btn-primary">목록으로</button>
			</div>


	</div>
</section>
<script>
	$(document).ready(function() {

		var formObj = $("freeboardDetailForm[role='form']");
		console.log(formObj);

		$(".btn-warning").on("click", function() {
			formObj.attr("action","/board/modify");
			formObj.attr("method","get");
			formObj.submit();
		});

		$(".btn-danger").on("click", function() {
			formObj.attr("action","freeboardDelete.vw");
		});

		$(".btn-primary").on("click", function() {
			self.location="freeboard.vw";
		});

	});
</script>


<jsp:include page="../footer.jsp" />
