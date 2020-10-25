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
				<h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">BOOK DETAIL</h1>
			</div>
		</div>
	</div>
</div>

<section class="ftco-section ftco-degree-bg">
	<div class="container">
		<div class="row">
			<div class="col-md-8 ftco-animate">
				<h2 class="mb-3">${detailBook.bname}</h2>
				<h6 class="mb-3 icon icon-envelope">&nbsp;&nbsp;<font size=+2>${detailBook.mid}</font></h6>
				<br>

				<p>
					<img src="img/book/${detailBook.bimg}" alt="" class="img-fluid" width="50%">
				</p>
				<h4 class="mb-3">저자 : ${detailBook.bauthor}</h4>

				<p>${detailBook.bcontent}</p>
				<p>Odit voluptatibus, eveniet vel nihil cum ullam dolores
					laborum, quo velit commodi rerum eum quidem pariatur! Quia fuga
					iste tenetur, ipsa vel nisi in dolorum consequatur, veritatis porro
					explicabo soluta commodi libero voluptatem similique id quidem?
					Blanditiis voluptates aperiam non magni. Reprehenderit nobis odit
					inventore, quia laboriosam harum excepturi ea.</p>
				<br><br>
				
				<div align="center">
					<c:if test="${sessionScope.loginUser.mid != null and sessionScope.loginUser.mid == bookDTO.mid}">
						<a href="food.vw"><input type="button" class="btn btn-primary" value="목록으로"></a>
						<a href="bookDelete.vw?fno=${detailBook.bno}">
							&nbsp;&nbsp;&nbsp;
							<button type="submit" class="btn btn-primary">삭제</button>
						</a>
					</c:if>

					<c:if test="${sessionScope.loginUser.mid != null and sessionScope.loginUser.mid != bookDTO.mid}">
						<a href="book.vw"><input type="button" class="btn btn-primary" value="목록으로"></a>
					</c:if>

					<c:if test="${sessionScope.loginUser.mid == null}">
						<a href="book.vw"><input type="button" class="btn btn-primary" value="목록으로"></a>
					</c:if>
				</div>
				
						<h3 class="mb-5">${detailBook.bcnt} Comments</h3>

				<!-- 댓글라인 -->
				<div id="bookReviewList">
					등록된 댓글이 없습니다.
					<div class='text-center'>
						<ul id="pagination" class="pagination pagination-sm no-margin ">
						</ul>
					</div>
				</div>

				<div class="pt-5 mt-5">
			
				<!-- 리뷰쓰기 -->
					<div class="comment-form-wrap pt-5">
						<h3 class="mb-5">리뷰 쓰기</h3>
						<div class="p-5 bg-light" width="10%">
						
							<div class="form-group">
								<label for="name">Name *</label>
								<input type="text" class="form-control" id="mid" value="${sessionScope.loginUser.mid}">
							</div>

							<div class="form-group">
								<label for="message">Message</label>
								<textarea name="brcontent" id="brcontent" cols="30" rows="5" class="form-control"></textarea>
							</div>
							<div class="form-group">
								<input type="submit" value="Post Comment" class="btn py-3 px-4 btn-primary" id="btnAddReview">
							</div>

						</div>
					</div>
				</div>
			</div>

			<div class="col-md-4 sidebar ftco-animate">
				<div class="sidebar-box">
					<form action="#" class="search-form">
						<div class="form-group">
							<span class="icon fa fa-search"></span>
							<input type="text" class="form-control" placeholder="Keyword">
						</div>
					</form>
				</div>
				
				<div class="sidebar-box ftco-animate">
					<div class="categories">
						<h3>Categories</h3>
						<li><a href="#">추리 <span>(12)</span></a></li>
						<li><a href="#">에세이 <span>(22)</span></a></li>
					</div>
				</div>

				<div class="sidebar-box ftco-animate">
					<h3>Tag Cloud</h3>
					<div class="tagcloud">
						<a href="#" class="tag-cloud-link">Novel</a>
						<a href="#" class="tag-cloud-link">Essay</a>
						<a href="#" class="tag-cloud-link">Poem</a>
						<a href="#" class="tag-cloud-link">Mistery</a>
						<a href="#" class="tag-cloud-link">Fairy Tale</a>
						<a href="#" class="tag-cloud-link">Dictionary</a>
						<a href="#" class="tag-cloud-link">Comics</a>
						<a href="#"	class="tag-cloud-link">e-Book</a>
					</div>
				</div>
			</div>

		</div>
	</div>
</section>

<input type="hidden" id="bno" name="bno" value="${detailBook.bno}">
<jsp:include page="../footer.jsp" />

<script>
	var bno = '<c:out value="${detailBook.bno}"/>';
	
	$(document).ready(function(){
		console.log("ready..");
		list();
	});
	
	function list() {
		$.getJSON("/review/bookreview/all/" + bno, function(data) {
			var str = "";
			$(data).each(
					function() {
						var dateObj = new Date(this.indate);
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
			
						str += "<ul class='comment-list'><li class='comment' data-brno='"+this.brno+"'><h6>"+this.mid+"</h6>"
									+"<div class='meta'>"+yy+"-"+mm+"-"+dd+" "+hh+":"+mi+":"+ss+"</div>"
									+"<p>"+this.brcontent+"</p><br>"
										+"<p><button type='submit' class='btn btn-primary' id='btndReview'>수정</button>&nbsp;&nbsp;&nbsp;&nbsp;"
										+"<button type='submit' class='btn btn-primary btndelReview'>삭제</button></p></li></ul>";
					});

			$("#bookReviewList").html(str);
		});
	}


	//댓글 쓰기
	$("#btnAddReview").on("click", function() {
console.log("ready for add");
		var mid = $("#mid").val();
		var brcontent = $("#brcontent").val();
		$.ajax({
			type : 'post',
			url : '/review/bookreview/',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'text',
			data : JSON.stringify({
				bno : bno,
				mid : mid,
				brcontent : brcontent
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
$("#bookReviewList").on("click", ".btndelReview", function() {
			
		var brno =$(this).closest("li").data("brno");
		var brcontent = $("#brcontent").val();

		$.ajax({
			type : 'delete',
			url : '/review/bookreview/' + brno,
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