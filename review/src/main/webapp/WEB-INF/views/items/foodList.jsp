<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="../header.jsp" />

<div class="hero-wrap js-fullheight" style="background-image: url('images/bg_4.jpg');">
	<div class="overlay"></div>
	<div class="container">
		<div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
			<div class="col-md-9 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
				<h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">FOOD</h1>
			</div>
		</div>
	</div>
</div>

<section class="ftco-section ftco-degree-bg">
	<div class="container">

		<form method="post" action="" name="tourListForm">
			<h4>FOOD & RESTAURANT</h4>
			<br>

			<div class="row">
			
			<!-- search -->
				<div class="col-lg-3 sidebar ftco-animate">
					<div class="sidebar-wrap bg-light ftco-animate">
						<h3 class="heading mb-4">Find RESTAURANT</h3>

						<div class="fields">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Destination, City">
							</div>
							<div class="form-group">
								<div class="select-wrap one-third">
									<div class="icon">
										<span class="ion-ios-arrow-down"></span>
									</div>
									<select name="" id="" class="form-control" placeholder="Keyword search">
										<option value="">Select Menu</option>
										<option value="">San Francisco USA</option>
										<option value="">Berlin Germany</option>
										<option value="">Lodon United Kingdom</option>
										<option value="">Paris Italy</option>
									</select>
								</div>
							</div>

							<div class="form-group">
								<input type="submit" value="Search" class="btn btn-primary py-3 px-5">
							</div>
						</div>

					</div>
				</div>

				<c:if test="${empty foodAll or foodAll.size()==0 }">
					<div class="col-lg-9" align="center">
						<h4>게시글이 없습니다</h4>
					</div>
				</c:if>

				<div class="col-lg-9">
					<div class="row">
					
						<c:forEach items="${foodAll}" var="foodDTO">
							<div class="col-md-4 ftco-animate">
								<div class="destination">
									<a href="foodDetail.vw?fno=${foodDTO.fno}" class="img img-2 d-flex justify-content-center align-items-center" style="background-image:url('img/food/${foodDTO.fimg}');">
										<div class="icon d-flex justify-content-center align-items-center">
											<span class="icon-search2"></span>
										</div>
									</a>
									
									<div class="text p-3">
										<div class="d-flex">
											<div class="one">
												<h3><a href="foodDetail.vw?fno=${foodDTO.fno}">${foodDTO.fname}</a></h3>
											</div>
										</div>
										<p class="rate">
											<c:if test="${foodDTO.fstar eq 0}">
												신규 등록된 글입니다.
											</c:if>
											<c:if test="${foodDTO.fstar> 0 && foodDTO.fstar<1 }">
												별점이 아깝네요
											</c:if>
											<c:if test="${foodDTO.fstar>= 1 && foodDTO.fstar<2}">
												<i class="icon-star"></i>
											</c:if>
											<c:if test="${foodDTO.fstar>= 2 &&  foodDTO.fstar<3}">
												<i class="icon-star"></i>
												<i class="icon-star"></i>
											</c:if>
											<c:if test="${foodDTO.fstar>= 3 &&  foodDTO.fstar<4}">
												<i class="icon-star"></i>
												<i class="icon-star"></i>
												<i class="icon-star"></i>
											</c:if>
											<c:if test="${foodDTO.fstar>= 4 &&  foodDTO.fstar<5}">
												<i class="icon-star"></i>
												<i class="icon-star"></i>
												<i class="icon-star"></i>
												<i class="icon-star"></i>
											</c:if>
											<c:if test="${ foodDTO.fstar eq 5}">
												<i class="icon-star"></i>
												<i class="icon-star"></i>
												<i class="icon-star"></i>
												<i class="icon-star"></i>
												<i class="icon-star"></i>
											</c:if>
											&nbsp;&nbsp;&nbsp;&nbsp; <font size="2em";style="float: right"> ${foodDTO.fstar} Rating</font>
										</p>

										<p>추천 음식 : ${foodDTO.fmenu}</p>
										<hr>
										<p class="bottom-area d-flex">
											<span><i class="icon-map-o"></i>&nbsp;&nbsp;&nbsp;작성자 : ${foodDTO.mid}</span>&nbsp;&nbsp;&nbsp;
											<span class="ml-auto"><a href="foodDetail.vw?fno=${foodDTO.fno}">둘러보기</a></span>
										</p>
									</div>
									
								</div>
							</div>
						</c:forEach>

					</div>

					<c:if test="${sessionScope.loginUser.mid != null}">
						<div style="float: right">
							<a href="foodInsert.vw"><input type="button" value="글 쓰기" class="btn btn-primary py-3 px-5"></a>
						</div>
					</c:if>

					<div class="row mt-5">
						<div class="col text-center">
							<div class="block-27">
								<div id="pagingDiv" class="pagingDiv">
									<ul>
										<c:if test="${paging.prev}">
											<li><a href="food.vw?pageNum=${paging.startPage-1}">&lt;</a></li>
										</c:if>
										<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
											<li><a href="food.vw?pageNum=${i}">${i}</a></li>
										</c:forEach>
										<c:if test="${paging.next}">
											<li><a href="food.vw?pageNum=${paging.endPage + 1 }">&gt;</a></li>
										</c:if>
									</ul>
								</div>
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</form>
	</div>
</section>

<input type="hidden" id="pageNum" name="pageNum" value="${paging.cri.pageNum }">
<input type="hidden" id="amount" name="amount" value="${paging.cri.amount }">

<jsp:include page="../footer.jsp" />
