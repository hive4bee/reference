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
				<h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">FOOD DETAIL</h1>
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
					<h3 class="heading mb-4">Find Restaurant</h3>
					<form action="#">
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
										<option value="">별점</option>
										<option value="">지역</option>
										<option value="">메뉴</option>
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
			
			<!-- Main -->
			<div class="col-lg-9">
				<div class="row">
					<div class="col-md-12 ftco-animate">
						<div class="single-slider owl-carousel">
							<div class="item">
								<div class="hotel-img" style="background-image: url(img/food/${detailFood.fimg} );"></div>
							</div>
							<div class="item">
								<div class="hotel-img" style="background-image: url(images/hotel-3.jpg);"></div>
							</div>
						</div>
					</div>
					<div class="col-md-12 hotel-single mt-4 mb-5 ftco-animate">
						<h6>작성자 : ${detailFood.mid}</h6>
						<br>

						<h2>${detailFood.fname}</h2>
						<p class="rate mb-5">
							<span class="loc"><i class="icon-map"></i>${detailFood.faddr}</span>
							<br><br>
							<span class="star">
								<c:if test="${detailFood.fstar eq 0}">
												신규 등록된 글입니다.
											</c:if> <c:if
									test="${detailFood.fstar> 0 && detailFood.fstar<1 }">
												별점이 아깝네요
											</c:if> <c:if
									test="${detailFood.fstar>= 1 && detailFood.fstar<2}">
									<i class="icon-star"></i>
								</c:if> <c:if
									test="${detailFood.fstar>= 2 &&  detailFood.fstar<3}">
									<i class="icon-star"></i>
									<i class="icon-star"></i>
								</c:if> <c:if
									test="${detailFood.fstar>= 3 &&  detailFood.fstar<4}">
									<i class="icon-star"></i>
									<i class="icon-star"></i>
									<i class="icon-star"></i>
								</c:if> <c:if
									test="${detailFood.fstar>= 4 &&  detailFood.fstar<5}">
									<i class="icon-star"></i>
									<i class="icon-star"></i>
									<i class="icon-star"></i>
									<i class="icon-star"></i>
								</c:if> <c:if test="${detailFood.fstar eq 5}">
									<i class="icon-star"></i>
									<i class="icon-star"></i>
									<i class="icon-star"></i>
									<i class="icon-star"></i>
									<i class="icon-star"></i>
								</c:if> &nbsp;&nbsp;&nbsp;&nbsp; <font size="2em";style="float: right"> ${detailFood.fstar} Rating</font>
							</span>
						<p>${detailFood.fcontent}</p>
						<p>Odit voluptatibus, eveniet vel nihil cum ullam dolores
							laborum, quo velit commodi rerum eum quidem pariatur! Quia fuga</p>
						<p>Adipisci vero culpa, eius nobis soluta. Dolore, maxime
							ullam ipsam quidem, dolor distinctio similique asperiores
							voluptas enim, exercitationem ratione aut adipisci modi quod
							quibusdam iusto, voluptates beatae iure nemo itaque laborum.
							provident. Voluptatibus, veritatis. Beatae numquam nam ab
							voluptatibus culpa, tenetur recusandae!</p>
					</div>

					<div align="center">
						<c:if test = "${sessionScope.loginUser.mid != null and sessionScope.loginUser.mid == detailFood.mid}">
							<a href="food.vw"><input type="button" class="btn btn-primary" value="목록으로"></a>&nbsp;&nbsp;&nbsp;
							<a href="foodDelete.vw?fno=${detailFood.fno}"><button type="submit" class="btn btn-primary">삭제</button>	</a>
						</c:if>
						
						<c:if test = "${sessionScope.loginUser.mid != null and sessionScope.loginUser.mid != detailFood.mid}">
							<a href="food.vw"><input type="button" class="btn btn-primary" value="목록으로"></a>
						</c:if>
						
						<c:if test="${sessionScope.loginUser.mid == null}">
							<a href="food.vw"><input type="button" class="btn btn-primary" value="목록으로"></a>
						</c:if>
				</div>
					
				<div class="pt-5 mt-5">

						<!-- 댓글라인 -->
						<div id="foodReviewList">
							등록된 댓글이 없습니다.
							<div class='text-center'>
								<ul id="pagination" class="pagination pagination-sm no-margin ">
								</ul>
							</div>
						</div>

						<!-- 칸 조절용 -->
						<ul class="comment-list">
							<li class="comment">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
						</ul>

					<!-- 리뷰쓰기 -->
					<c:if test="${sessionScope.loginUser.mid != null}">
						<div class="comment-form-wrap pt-5">
							<h3 class="mb-5">리뷰 쓰기</h3>
							<div class="p-5 bg-light" width="10%">
								<div class="form-group">
									<label for="frstar">별점 주기</label>&nbsp;&nbsp;&nbsp;&nbsp;
									<select name="frstar" id="frstar">

										<option id="frstar" name="frstar" value="4">★★★★</option>
										<option id="frstar" name="frstar" value="3">★★★</option>
										<option id="frstar" name="frstar" value="2">★★</option>
										<option id="frstar" name="frstar" value="5">★★★★★</option>
										<option id="frstar" name="frstar" value="1">★</option>
										<option id="frstar" name="frstar" value="0">별이 아깝네요</option>
									</select>
								</div>

								<div class="form-group">
									<label for="message">Message</label>
									<textarea name="frcontent" id="frcontent" cols="30" rows="5"
										class="form-control"></textarea>
								</div>
								<div class="form-group">
									<input type="submit" value="Post Comment"	class="btn py-3 px-4 btn-primary" id="btnAddReview">
								</div>

							</div>
						</div>
						
						</c:if>

					</div>
				</div>
			</div>
		</div>
	</div>

</section>
<!-- .section -->

<input type="hidden" id="fno" name="fno" value="${detailFood.fno}">
<input type="hidden" id="fstar" name=""  value="${detailFood.fstar}">
	
	
<jsp:include page="../footer.jsp" />

<script>
	var fno = '<c:out value="${detailFood.fno}"/>';
	
	$(document).ready(function(){
		console.log("ready..");
		list();
	});
	
	function list() {
		$.getJSON("/review/foodreview/all/" + fno, function(data) {
			var str = "";
			$(data).each(
					function() {
						var dateObj = new Date(this.upindate);
			  		var yy = dateObj.getFullYear();
						var mm = dateObj.getMonth() + 1;
						var dd = dateObj.getDate();
						var hh = dateObj.getHours();
						var mi = dateObj.getMinutes();
						var ss = dateObj.getSeconds();
						mm = mm < 10 ? "0"+mm : mm;
						dd = dd < 10 ? "0"+dd : dd;
						hh = hh < 10 ? "0"+hh : hh;
						mi = mi < 10 ? "0"+mi : mi;
						ss = ss < 10 ? "0"+ss : ss;
						
						var stars="";
						var frstar = this.frstar;
				
						if(frstar=="0"){
							stars = "별점이 아깝네요";
						}else if(frstar=="1"){
							stars="<i class='icon-star'></i>"
						}else if(frstar=="2"){
							stars="<i class='icon-star'></i><i class='icon-star'></i>"
						}else if(frstar=="3"){
							stars="<i class='icon-star'></i><i class='icon-star'></i><i class='icon-star'></i>"
						}else if(frstar=="4"){
							stars="<i class='icon-star'></i><i class='icon-star'></i><i class='icon-star'></i><i class='icon-star'></i>"
						}else if(frstar=="5"){
							stars="<i class='icon-star'></i><i class='icon-star'></i><i class='icon-star'></i><i class='icon-star'></i><i class='icon-star'></i>"
						}
						
						str += "<ul class='comment-list'><li class='comment' data-frno='"+this.frno+"'><h6>"+this.mid+"</h6>"
									+"<div class='meta'>"+yy+"-"+mm+"-"+dd+" "+hh+":"+mi+":"+ss+"</div>"
									+"<p class='frcontentArea'>"+this.frcontent+"</p><span>"+stars+"</span><br>"
										+"<p class='frbuttonArea'><button type='submit' class='btn btn-primary btnModReview'>수정</button>&nbsp;&nbsp;&nbsp;&nbsp;"
										/* +"<button type='submit' class='btn btn-primary' id='btndelReview'>삭제</button></p></li></ul>"; */
										+"<button type='submit' class='btn btn-primary btndelReview'>삭제</button></p></li></ul>";
					});

// 			<button type='submit' class='btn btn-primary' id='btndelReview'>삭제</button>
// data-frno= HTML 5이상 식별키 저장
			$("#foodReviewList").html(str);
		});
	}


	//댓글 쓰기
	$("#btnAddReview").on("click", function() {

		var mid = $("#mid").val();
		var frstar = $("#frstar").val();
		var frcontent = $("#frcontent").val();
		$.ajax({
			type : 'post',
			url : '/review/foodreview/',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'text',
			data : JSON.stringify({
				fno : fno,
				mid : mid,
				frstar : frstar,
				frcontent : frcontent
			}),
			success : function(result) {
				if (result == 'SUCCESS') {
					alert("등록 되었습니다.");
					list();
				}
			}
		});
	});
	
//댓글 삭제	
$("#foodReviewList").on("click", ".btndelReview", function() {
			
		//var frno = $(".comment").html();//태크 포함?
		var frno =$(this).closest("li").data("frno");
		var frcontent = $("#frcontent").val();

		$.ajax({
			type : 'delete',
			url : '/review/foodreview/' + frno,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "DELETE"
			},
			dataType : 'text',
			success : function(result) {
				if (result == 'SUCCESS') {
					alert("삭제 되었습니다.");
					list();
				}
			}
		});
		
	});
	//댓글 수정폼 부르기
	$("#foodReviewList").on("click", ".btnModReview", function(e){
		e.preventDefault();
		console.log("modify button clicked...");
		
		$(this).closest("li").find("p[class='frcontentArea']").html("<textarea></textarea>");
		/*
			"<p class='frbuttonArea'><button type='submit' class='btn btn-primary btnModReview'>수정</button>&nbsp;&nbsp;&nbsp;&nbsp;"
										
										+"<button type='submit' class='btn btn-primary btndelReview'>삭제</button></p>
		*/
		var str="<button type='submit' class='btn btn-primary completeModReview'>제출</button>&nbsp;&nbsp;&nbsp;&nbsp;";
		$(this).closest("li").find("p[class='frbuttonArea']").html(str);
	});
	
	//댓글수정 버튼 완료
	$("#foodReviewList").on("click", ".completeModReview", function(e){
		e.preventDefault();
		console.log("complete Modify button clicked....");
		
		var imsiTxt = $(this).closest("li").find("textarea").val();
		if(!imsiTxt){
			alert("수정할 내용을 입력하시오");
			return ;
		}
		var frno = $(this).closest("li").data("frno");
		console.log("frno : " + frno);
		
		modifyReply(frno, imsiTxt);
	});
	function modifyReply(frno, frcontent){
		$.ajax({
			type:"put",
			url:"/review/modify/"+frno,
			data:JSON.stringify({frcontent:frcontent}),
			contentType:"application/json; charset=utf-8",
			success:function(result, status, xhr){
				if(result == 'success'){
					console.log("complete modification");
					list();
				}else{
					consoel.log("fail to modify");
				}
			}
			
		});
	}
	
	function getPageList(page) {
		$.getJSON("/review/foodreview/" + fno + "/" + page, function(data) {
			console.log(data.list.length+"sdajk");
			var str = "";
			$(data.list).each(
					function() {
						str += "<li data-frno='"+this.frno+"' class='replyLi'>"
								+ this.frno + ":" + this.frcontent
								+ "<button>MOD</button></li>";
					});

			$("#replies").html(str);

			printPaging(data.pageMaker);

		});
	}

	function printPaging(pageMaker) {
		var str = "";
		if (pageMaker.prev) {
			str += "<li><a href='" + (pageMaker.startPage - 1)
					+ "'> << </a></li>";
		}

		for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
			var strClass = pageMaker.cri.page == i ? 'class=active' : '';
			str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
		}

		if (pageMaker.next) {
			str += "<li><a href='" + (pageMaker.endPage + 1)
					+ "'> >> </a></li>";
		}
		$('.pagination').html(str);
	}

	var replyPage = 1;

	$(".pagination").on("click", "li a", function(event) {
		event.preventDefault();
		replyPage = $(this).attr("href");
		getPageList(replyPage);

	});
</script>


