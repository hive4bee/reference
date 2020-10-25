<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="../header.jsp" />

<div class="hero-wrap js-fullheight" style="background-image: url('images/bg_5.jpg');">
	<div class="overlay"></div>
	<div class="container">
		<div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
			<div class="col-md-9 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
				<h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">TOUR DETAIL</h1>
			</div>
		</div>
	</div>
</div>

<section class="ftco-section ftco-degree-bg">
	<div class="container">
		<div class="row">

			<!-- 검색 -->
			<div class="col-lg-3 sidebar">
				<div class="sidebar-wrap bg-light ftco-animate">
					<h3 class="heading mb-4">Find City</h3>
					<form action="#">
						<div class="fields">
							<div class="form-group">
								<input type="text" class="form-control"	placeholder="Destination, City">
							</div>
							<div class="form-group">
								<div class="select-wrap one-third">
									<div class="icon">
										<span class="ion-ios-arrow-down"></span>
									</div>
									<select name="" id="" class="form-control" placeholder="Keyword search">
										<option value="">Select Location</option>
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
					</form>
				</div>
			</div>

			<!-- main -->
			<div class="col-lg-9">
				<div class="row">

					<div class="col-md-12 ftco-animate">
						<div class="single-slider owl-carousel">
							<div class="item">
								<div class="hotel-img" style="background-image: url(img/tour/${detailTour.timg});"></div>
							</div>
							<div class="item">
								<div class="hotel-img" style="background-image: url(images/hotel-3.jpg);"></div>
							</div>
						</div>
					</div>

					<div class="col-md-12 hotel-single mt-4 mb-5 ftco-animate">
						<h6>여행자 : ${detailTour.mid}</h6>
						<h6>여행 지역 : ${detailTour.tlocation}</h6>
						<h6>여행 기간 : ${detailTour.tstart} ~ ${detailTour.tend}
						<br>
						<h2>${detailTour.tname}</h2>
						<p>${detailTour.tcontent}</p>
						<p>Odit voluptatibus, eveniet vel nihil cum ullam dolores
							laborum, quo velit commodi rerum eum quidem pariatur! Quia fuga
							iste tenetur, ipsa vel nisi in dolorum consequatur, veritatis
							porro explicabo soluta commodi libero voluptatem similique id
							quidem? Blanditiis voluptates aperiam non magni. Reprehenderit
							nobis odit inventore, quia laboriosam harum excepturi ea.
							Adipisci vero culpa, eius nobis soluta. Dolore, maxime ullam
							ipsam quidem, dolor distinctio similique asperiores voluptas
							culpa, tenetur recusandae!</p>
					</div>

					<div class="col-md-12 hotel-single mt-4 mb-5 ftco-animate">
						<h5>
							<span class="star"> <i class="icon-heart"></i>&nbsp;&nbsp;${detailTour.tlike}명이 	좋아하는 글입니다.</span>
						</h5>
					</div>



					<div align="center">

						<c:if test="${sessionScope.loginUser.mid  != null and sessionScope.loginUser.mid  != detailTour.mid}">
							<div><a class="btn btn-outline-dark heart "> <img id="heart" src=""></a></div>
						</c:if>

						<c:if test="${sessionScope.loginUser.mid != null and sessionScope.loginUser.mid == detailTour.mid}">
							<a href="tour.vw"><input type="button" class="btn btn-primary" value="목록으로"></a>
							<a href="tourDelete.vw?tno=${detailTour.tno}"><button type="submit" class="btn btn-primary">삭제</button></a>
						</c:if>

						<c:if test="${sessionScope.loginUser.mid == null}">
							<a href="tour.vw"><input type="button" class="btn btn-primary" value="목록으로"></a>
						</c:if>

					</div>
				</div>
			</div>

		</div>
	</div>
</section>
<!-- .section -->

<jsp:include page="../footer.jsp" />
<script>
$(document).ready(function () {
	var tno = '<c:out value="${detailTour.tno}"/>';
	console.log("tno : " + tno);
    var heartval = ${heart};
    console.log("heartval : " + heartval);
    var tlike='<c:out value="${detailTour.tlike}"/>';
    tlike = parseInt(tlike);
    console.log("tlike : " + tlike);
    if(heartval>0) {
        console.log(heartval);
        $("#heart").prop("src", "img/main/like.png");
        $(".heart").prop('name',heartval)
    }
    else {
        console.log(heartval);
        $("#heart").prop("src", "img/main/likecancle.png");
        $(".heart").prop('name',heartval)
    }
	//<span class="star"> <i class="icon-heart"></i>&nbsp;&nbsp;${detailTour.tlike}명이 	좋아하는 글입니다.</span>
    $(".heart").on("click", function () {
    	console.log("heart button clicked....");
        var that = $(".heart");
        var sendData = {'tno' : '${detailTour.tno}','heart' : that.prop('name')};
        $.ajax({
            url :'/review/tour/heart',
            type :'POST',
            data : sendData,
            success : function(data){
                that.prop('name',data);
                if(data==1) {
                    $('#heart').prop("src","img/main/like.png");
                    $(".star").html("<i class='icon-heart'></i>&nbsp;&nbsp;"+(tlike+1)+"명이 좋아하는 글입니다.");
                    tlike=tlike+1;
                }
                else{
                    $('#heart').prop("src","img/main/likecancle.png");
                    $(".star").html("<i class='icon-heart'></i>&nbsp;&nbsp;"+(tlike-1)+"명이 좋아하는 글입니다.");
                    tlike=tlike-1;
                }
            }
        });
    });
});

</script>
<style>
.heart {width: 80%}
#heart {width: 80%}
</style>