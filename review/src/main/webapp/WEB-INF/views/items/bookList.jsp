<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="../header.jsp" />
<%-- <%@include file="header.jsp" %> --%>

<div class="hero-wrap js-fullheight" style="background-image: url('images/bg_4.jpg');">
	<div class="overlay"></div>
	<div class="container">
		<div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
			<div class="col-md-9 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
				<h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">BOOK</h1>
			</div>
		</div>
	</div>
</div>

<section class="ftco-section bg-light">
	<div class="container">
		<form method="post" action="" name="bookList">
			<h4>BOOK & REVIEW</h4>
			<div class="row d-flex">

				<c:if test="${empty bookAll or bookAll.size()==0 }">
					<div align="center">
						<h3>게시글이 없습니다</h3>
					</div>
				</c:if>

				<c:forEach items="${bookAll}" var="bookDTO">
					<div class="col-md-3 d-flex ftco-animate">
						<div class="blog-entry align-self-stretch">
							<a href="bookDetail.vw?bno=${bookDTO.bno}" class="block-20"><img class="bi" src="img/book/${bookDTO.bimg}" /></a>
							<div class="text p-4 d-block">
								<h3 class="heading mt-3">
									<a href="bookDetail.vw?bno=${bookDTO.bno}">${bookDTO.bname}</a>
								</h3>
								<p>Author : ${bookDTO.bauthor}</p>
								<span class="tag">${bookDTO.mid}</span>
								<div class="meta mb-3">
									<div>
										<fmt:formatDate type="date" value="${bookDTO.indate}" />
									</div>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<div>
										<span class="icon-chat"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${bookDTO.bcnt}
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

			<c:if test="${sessionScope.loginUser.mid != null}">
				<div style="float: right">
					<a href="bookInsert.vw"><input type="button" value="글 쓰기"		class="btn btn-primary py-3 px-5"></a>
				</div>
			</c:if>

			<!-- paging -->

			<div class="row mt-5">
				<div class="col text-center">
					<div class="block-27">
						<div id="pagingDiv" class="pagingDiv">
							<ul>
								<c:if test="${paging.prev}">
									<li><a href="book.vw?pageNum=${paging.startPage-1}">&lt;</a></li>
								</c:if>
								<c:forEach var="i" begin="${paging.startPage}"
									end="${paging.endPage }">
									<li><a href="book.vw?pageNum=${i}">${i}</a></li>
								</c:forEach>
								<c:if test="${paging.next}">
									<li><a href="book.vw?pageNum=${paging.endPage + 1 }">&gt;</a></li>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
			</div>
			
	</div>
	</form>
	</div>

</section>
<style>
.bi {width:100%;height:100%}
</style>

<jsp:include page="../footer.jsp" />
