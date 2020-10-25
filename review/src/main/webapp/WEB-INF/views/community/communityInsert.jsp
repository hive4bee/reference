<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../header.jsp" />
<%-- <%@include file="header.jsp" %> --%>

<div class="hero-wrap js-fullheight" style="background-image: url('images/bg_4.jpg');">
	<div class="overlay"></div>
	<div class="container">
		<div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
			<div class="col-md-9 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
				<h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">글 쓰기</h1>
			</div>
		</div>
	</div>
</div>

<section class="ftco-section bg-light">
	<div class="container">
		<form role="freeboardInsertForm" method="post">
			<h4>글 쓰기</h4>
			<br><br>
			
			<!-- Insert Contents -->
			<div class="box-body">
				<div class="form-group">
					<label for="">글 제목</label>
					<input type="text" id="subject" name="subject" class="form-control" placeholder="Write Subject">
				</div>
				<br>
				<div class="form-group">
					<label for="">내용</label>
					<textarea class="form-control" rows="10" id="content" name="content" placeholder="Write..."></textarea>
				</div>
			</div>
			
			<!-- Button -->

			<div class="box-footer">
				<button type="submit" class="btn btn-primary">글쓰기</button>
			</div>
			
			<input type="hidden" name="mid" value="${sessionScope.loginUser.mid }">
		</form>
		
	</div>
</section>

<jsp:include page="../footer.jsp" />
